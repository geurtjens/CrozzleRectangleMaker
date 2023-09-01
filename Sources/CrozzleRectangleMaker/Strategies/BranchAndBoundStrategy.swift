//
//  BranchAndBoundStrategy.swift
//  
//
//  Created by Michael Geurtjens on 1/9/2023.
//

import Foundation
public class BranchAndBoundStrategy {
    public static func execute(gameId: Int, words: [String]) async -> ShapeModel {
        let game = GameList().getGame(gameId: gameId)!
        let wordsInt = WordCalculator.WordsToInt(words: words)
        let searchShapes = getShapes(gameId: gameId, words: words)
        
        let wordIndex = WordIndexModelV2(shapes: searchShapes, wordCount: words.count)
        
        let scoresMin = StrategyCalculator.GetScoreMins(gameId: game.gameId)
        
        var sourceShapes = [searchShapes[0]]
        print(searchShapes[0].ToStringExtended(words: words, gameId: gameId, winningScore: game.winningScore))
        let lookahead = 3
        var backtrackCount = 2
        for _ in 0..<30 {
            for _ in 0..<lookahead {
                let newShapes = await MergeCalculatorV2.ExecuteDifferentShapesAsync(sourceShapes: sourceShapes, searchShapes: searchShapes, searchWordIndex: wordIndex, sourceMax: sourceShapes.count, searchMax: searchShapes.count, words: words, wordsInt: wordsInt, scoresMin: scoresMin, widthMax: game.maxWidth, heightMax: game.maxHeight)
                if newShapes.count > 0 {
                    sourceShapes = newShapes
                }
            }
            
            ShapeCalculator.SortByScoreThenArea(shapes: &sourceShapes)
            let winningShape = sourceShapes[0]
            
            let historyToInclude = ShapeCalculator.getMergeHistory(shape: winningShape, count: backtrackCount)
            backtrackCount += 1
            sourceShapes = ShapeCalculator.find(shapes: sourceShapes, mergeHistory: historyToInclude)
            
            print(winningShape.ToStringExtended(words: words, gameId: gameId, winningScore: game.winningScore))
            
            if winningShape.score >= game.winningScore {
                return winningShape
            }
        }
        return sourceShapes[0]
    }
    
    public static func getShapes(gameId: Int, words: [String]) -> [ShapeModel] {
        var shapes = WinningShapesAllCalculatorV3.execute(gameId: gameId, words: words)
        ShapeCalculator.SortByScoreThenArea(shapes: &shapes)
        ShapeCalculator.SetMergeHistory(shapes: &shapes)
        return shapes
    }
}
