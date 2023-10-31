//
//  BranchAndBoundStrategy.swift
//  
//
//  Created by Michael Geurtjens on 1/9/2023.
//

import Foundation
public class BranchAndBoundV1 {
    
    public static func executeAll() async -> [Int] {
        let startTime = DateTimeCalculator.now()
        let successes = [
            8704, 8802, 8808, 8811, 9002, 9007, 9008, 9109, 9201, 9207,
            9209, 9210, 9302, 9306, 9307, 9311, 9312, 9406
        ]
        
        let gameList = GameList()
        var result: [Int] = []
        for game in gameList.games {
            if successes.contains(game.gameId) {
                let gameId = game.gameId
                
                let words = game.winningWords
                let wordsInt = WordCalculator.WordsToInt(words: words)
                
                // This is closer to how marks solution works in that it wipes out the search space.  We should make lookahead a parameter
                let shape = await BranchAndBoundV1.execute(
                    gameId: gameId,
                    words: words,
                    wordsInt: wordsInt,
                    repeatTimes: 4,
                    lookahead: 3,
                    backtrackCount: 2,
                    queueDepth: 500)
                //XCTAssertEqual(550, Int(shape.score))
                //XCTAssertEqual(game.winningScore, Int(shape.score))
                
                if shape.score == game.winningScore {
                    result.append(gameId)
                }
            }
        }
        print(result)
        print("Total Duration: \(DateTimeCalculator.duration(start: startTime))")
        return result
    }
    
    
    
    
    public static func execute(
        gameId: Int,
        words: [String],
        wordsInt: [[Int]],
        repeatTimes: Int,
        lookahead: Int,
        backtrackCount: Int,
        queueDepth: Int) async -> ShapeModel
    {
        let startTime = DateTimeCalculator.now()
        let game = GameList().getGame(gameId: gameId)!
        
        
        
        let searchShapes = getShapes(gameId: gameId, words: words)
        
        let wordIndex = WordIndexModelV2(shapes: searchShapes, wordCount: words.count)
        
        let scoresMin = StrategyCalculator.GetScoreMins(gameId: game.gameId)
        
        var sourceShapes = [searchShapes[0]]
        var bestShape = searchShapes[0]
        print(bestShape.ToStringExtended(words: words, gameId: gameId, winningScore: game.winningScore))
        
        var backtrackCount = backtrackCount
        
        
        for _ in 0..<repeatTimes {
            for _ in 0..<lookahead {
                var newShapes = await MergeCalculatorV2.ExecuteDifferentShapesAsync(sourceShapes: sourceShapes, searchShapes: searchShapes, searchWordIndex: wordIndex, sourceMax: sourceShapes.count, searchMax: searchShapes.count, words: words, wordsInt: wordsInt, scoresMin: scoresMin, widthMax: game.widthMax, heightMax: game.heightMax)
                if newShapes.count > 0 {
                    (newShapes, _) = RemoveDuplicatesCalculator.execute(shapes: newShapes)
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
            
            
            let historyToInclude = ShapeCalculator.getMergeHistory(shape: bestShape, count: backtrackCount)
            backtrackCount += 1
            
            var findBacktracks = ShapeCalculator.find(shapes: sourceShapes, mergeHistory: historyToInclude)
            
            ShapeCalculator.SortByScoreThenArea(shapes: &findBacktracks)
            
            // We are going to halve the number
            
            if findBacktracks.count > queueDepth {
                for i in queueDepth..<findBacktracks.count {
                    findBacktracks[i].isValid = false
                }
            }
                
            findBacktracks = findBacktracks.filter { $0.isValid == true}
            
            
            if findBacktracks.count != 0 {
                print("Backtrack Level: \(backtrackCount), shapes: \(findBacktracks.count)")
                sourceShapes = findBacktracks
            }
            if bestShape.score >= game.winningScore {
                return bestShape
            }
        }
        print("Duration: \(DateTimeCalculator.duration(start: startTime))")
        return bestShape
    }
    
    public static func getShapes(gameId: Int, words: [String]) -> [ShapeModel] {
        var shapes = WinningShapesAllCalculatorV3.execute(gameId: gameId, words: words)
        ShapeCalculator.SortByScoreThenArea(shapes: &shapes)
        ShapeCalculator.setMergeHistory(shapes: &shapes)
        return shapes
    }
}
