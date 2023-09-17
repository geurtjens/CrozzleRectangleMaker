//
//  BranchAndBoundStrategyV2.swift
//  
//
//  Created by Michael Geurtjens on 1/9/2023.
//

import Foundation
public class BranchAndBoundStrategyV2 {
    public static func execute(gameId: Int, words: [String], repeatTimes: Int, lookahead: Int = 5) async -> ShapeModel {
        let game = GameList().getGame(gameId: gameId)!
        let wordsInt = WordCalculator.WordsToInt(words: words)
        var searchShapes = getShapes(gameId: gameId, words: words)
        
        
        
        let bestShapeExample = getBestWinningShape(gameId: gameId)
        
        var bestShapePos = getShapeBySequence(shapes: searchShapes, sequence: bestShapeExample.wordSequence)
        
        if bestShapePos == -1 {
            searchShapes = [bestShapeExample] + searchShapes
            bestShapePos = 0
        }
        
        
        let wordIndex = WordIndexModelV2(shapes: searchShapes, wordCount: words.count)
        
        var bestShape = searchShapes[bestShapePos]
        
        let scoresMin = StrategyCalculator.GetScoreMins(gameId: game.gameId)
        
        var sourceShapes = [searchShapes[0]]
        
        print(bestShape.ToStringExtended(words: words, gameId: gameId, winningScore: game.winningScore))
        print(bestShape.mergeHistory)
        
        var backtrackCount = 2
        
        
        for _ in 0..<repeatTimes {
            for _ in 0..<lookahead {
                let newShapes = await MergeCalculatorV2.ExecuteDifferentShapesAsync(sourceShapes: sourceShapes, searchShapes: searchShapes, searchWordIndex: wordIndex, sourceMax: sourceShapes.count, searchMax: searchShapes.count, words: words, wordsInt: wordsInt, scoresMin: scoresMin, widthMax: game.maxWidth, heightMax: game.maxHeight)
                if newShapes.count > 0 {
                    let (newShapes,_) = RemoveDuplicatesCalculator.execute(shapes:newShapes)
                    sourceShapes = newShapes
                    ShapeCalculator.SortByScoreThenArea(shapes: &sourceShapes)
                    if bestShape.score < sourceShapes[0].score {
                        bestShape = sourceShapes[0]
                        print(bestShape.ToStringExtended(words: words, gameId: gameId, winningScore: game.winningScore))
                        print(bestShape.mergeHistory)
                    }
                } else {
                    return bestShape
                }
            }
            
            ShapeCalculator.SortByScoreThenArea(shapes: &sourceShapes)
            
            // What do we do when the best shape cannot provide enough backtrackCount, that is its mergeHistory is shorter than the backtrackCount we want to have.
            if bestShape.mergeHistory.count >= backtrackCount {
                let shapeIds = ShapeCalculator.getMergeHistory(shape: bestShape, count: backtrackCount)
                backtrackCount += 1
                
                let backtrackShape = ShapeCalculator.mergeShapesByIndex(shapes: searchShapes, shapeIds: shapeIds, words: words)
                if backtrackShape != nil {
                    sourceShapes = [backtrackShape!]
                } else {
                    return bestShape
                }
            }
            
            
            
            
            // We are going to halve the number
            
           
            if bestShape.score >= game.winningScore {
                return bestShape
            }
        }
        return bestShape
    }
    
    public static func getShapes(gameId: Int, words: [String]) -> [ShapeModel] {
        var shapes = WinningShapesAllCalculatorV3.execute(gameId: gameId, words: words)
        ShapeCalculator.SortByScoreThenArea(shapes: &shapes)
        ShapeCalculator.SetMergeHistory(shapes: &shapes)
        return shapes
    }
    public static func getBestWinningShape(gameId: Int) -> ShapeModel {
        
        var (shapes, _,_,_) = WinningShapesCalculatorV1.getShapes(gameId: gameId)
        
        ShapeCalculator.SortByScoreThenArea(shapes: &shapes)
        
        let bestShape = shapes[0]
        
        return bestShape
    }
    
    public static func getShapeBySequence(shapes: [ShapeModel], sequence: String) -> Int {
        for shapeId in 0..<shapes.count {
            if shapes[shapeId].wordSequence == sequence {
                return shapeId
            }
        }
        return -1
    }
}