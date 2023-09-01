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
        let searchShapes = getShapes(gameId: gameId, words: words)
        
        let wordIndex = WordIndexModelV2(shapes: searchShapes, wordCount: words.count)
        
        let scoresMin = StrategyCalculator.GetScoreMins(gameId: game.gameId)
        
        var sourceShapes = [searchShapes[0]]
        var bestShape = searchShapes[0]
        print(bestShape.ToStringExtended(words: words, gameId: gameId, winningScore: game.winningScore))
        
        var backtrackCount = 2
        
        
        for _ in 0..<repeatTimes {
            for _ in 0..<lookahead {
                let newShapes = await MergeCalculatorV2.ExecuteDifferentShapesAsync(sourceShapes: sourceShapes, searchShapes: searchShapes, searchWordIndex: wordIndex, sourceMax: sourceShapes.count, searchMax: searchShapes.count, words: words, wordsInt: wordsInt, scoresMin: scoresMin, widthMax: game.maxWidth, heightMax: game.maxHeight)
                if newShapes.count > 0 {
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
            
            
            let shapeIds = ShapeCalculator.getMergeHistory(shape: bestShape, count: backtrackCount)
            backtrackCount += 1
            
            var backtrackShape = ShapeCalculator.mergeShapesByIndex(shapes: searchShapes, shapeIds: shapeIds, words: words)
            
            sourceShapes = [backtrackShape!]
            
            
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
}
