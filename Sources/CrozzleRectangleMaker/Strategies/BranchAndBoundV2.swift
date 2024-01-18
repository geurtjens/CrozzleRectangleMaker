//
//  BranchAndBoundStrategyV2.swift
//  
//
//  Created by Michael Geurtjens on 1/9/2023.
//

import Foundation
public class BranchAndBoundV2 {
    
    
    
    public static func execute(gameId: Int, words: [String], depthMax: Int, lookaheadDepth: Int, backtrackCount: Int) async -> ShapeModel {
        
        var backtrackCount = backtrackCount
        
        let (winningScore, wordsInt, searchShapes, wordIndex, startingShape, scoresMin, widthMax, heightMax) = getStartingData(gameId: gameId, words: words)
        
        var sourceShapes = [startingShape]
        
        var bestShape = startingShape
        
        print(bestShape.ToStringExtended(words: words, gameId: gameId, winningScore: winningScore))
        print(bestShape.mergeHistory)
        
        
        
        
        for _ in 0..<depthMax {
            for _ in 0..<lookaheadDepth {
                let newShapes = await MergeCalculatorV2.ExecuteDifferentShapesAsync(
                    sourceShapes: sourceShapes,
                    searchShapes: searchShapes,
                    searchWordIndex: wordIndex,
                    sourceMax: sourceShapes.count,
                    searchMax: searchShapes.count,
                    words: words,
                    wordsInt: wordsInt,
                    scoresMin: scoresMin,
                    widthMax: widthMax,
                    heightMax: heightMax)
                
                if newShapes.count > 0 {
                    let (newShapes,_) = RemoveDuplicatesCalculator.execute(shapes:newShapes)
                    sourceShapes = newShapes
                    //ShapeCalculator.SortByScoreThenArea(shapes: &sourceShapes)
                    
                    if bestShape.score < sourceShapes[0].score {
                        bestShape = sourceShapes[0]
                        print(bestShape.ToStringExtended(words: words, gameId: gameId, winningScore: winningScore))
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
                
                let backtrackShape = ShapeCalculator.mergeShapesByIndex(
                    shapes: searchShapes,
                    shapeIds: shapeIds,
                    words: words,
                    wordsInt: wordsInt)
                
                if backtrackShape != nil {
                    sourceShapes = [backtrackShape!]
                } else {
                    return bestShape
                }
            }
            
            
            
            
            // We are going to halve the number
            
           
            if bestShape.score >= winningScore {
                return bestShape
            }
        }
        return bestShape
    }
    
    public static func getShapes(gameId: Int, words: [String]) -> [ShapeModel] {
        var shapes = SearchShapesCalculator.execute(gameId: gameId, words: words)
        ShapeCalculator.SortByScoreThenArea(shapes: &shapes)
        ShapeCalculator.setMergeHistory(shapes: &shapes)
        return shapes
    }
    public static func getBestWinningShape(gameId: Int) -> ShapeModel {
        
        var shapes = SearchShapesCalculator.executeUsingWinningWords(gameId: gameId)
        
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
    
    public static func getStartingData(gameId: Int, words: [String]) -> (Int,[[Int]],[ShapeModel], WordIndexModelV2, ShapeModel, [Int], Int, Int){
        let game = GameList().getGame(gameId: gameId)!
        
        let winningScore = game.winningScore
        
        let wordsInt = WordCalculator.WordsToInt(words: words)
        
        var searchShapes = getShapes(gameId: gameId, words: words)
        
        
        let bestShapeExample = getBestWinningShape(gameId: gameId)
        
        var bestShapePos = getShapeBySequence(shapes: searchShapes, sequence: bestShapeExample.wordSequence)
        
        if bestShapePos == -1 {
            searchShapes = [bestShapeExample] + searchShapes
            bestShapePos = 0
        }
        
        let startingShape = searchShapes[bestShapePos]
        
        let wordIndex = WordIndexModelV2(shapes: searchShapes, wordCount: words.count)
        
        
        
        
        let scoresMin = StrategyCalculator.GetScoreMins(gameId: gameId)
        
        
        
        
        return (winningScore, wordsInt, searchShapes, wordIndex, startingShape, scoresMin, game.widthMax, game.heightMax)
    }
    
    
}
