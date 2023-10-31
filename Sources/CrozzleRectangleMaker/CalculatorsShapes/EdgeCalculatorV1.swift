//
//  EdgeCalculatorV1.swift
//  
//
//  Created by Michael Geurtjens on 23/5/2023.
//

import Foundation
/// calculates all instances when one word can interlock with another word
public class EdgeCalculatorV1 {
    public static func ExecuteAllSerial(scoreMin: Int, includeBreakdown: Bool = true) -> Int {
        
        let startTime = DateTimeCalculator.now()
        
        var shapesFromWordsCount = 0;
        var shapesFromWinningWordsCount = 0;
        
        if includeBreakdown {
            print("Edge Shapes");
            print("GameId, WinningWordShapes, AllWordShapes");
        }
        
        let gameList = GameList()
        for game in gameList.games {
            
            var shapesFromWinningWords = Execute(words: game.winningWords, scoreMin: scoreMin, widthMax: game.widthMax, heightMax: game.heightMax)
            var shapesFromWords = Execute(words: game.words, scoreMin: scoreMin, widthMax: game.widthMax, heightMax:game.heightMax)
            
            if includeBreakdown {
                print("\(game.gameId), \(shapesFromWinningWords.count), \(shapesFromWords.count)")
            }
            
            shapesFromWordsCount += shapesFromWords.count
            shapesFromWinningWordsCount += shapesFromWinningWords.count;
        }
        let finishTime = DateTimeCalculator.now()
        let duration = DateTimeCalculator.duration(start: startTime, finish: finishTime)
        
        print("EdgeCalculatorV1.Execute produced \(shapesFromWinningWordsCount) winning word shapes and \(shapesFromWordsCount) words shapes in \(duration)")
        
        return shapesFromWordsCount
    }
    /// Finds all edges found within an array of words
    /// - Parameter wordList: A list of words
    /// - Returns: A list of valid edges
    public static func Execute(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [EdgeModel] {
        
        let wordCount = (wordsMax == 0) ? words.count : wordsMax
        
        var result: [EdgeModel] = []
        
        for horizontalWordId in 0..<wordCount {
            
            let horizontalWord = words[horizontalWordId]
            
            for horizontalLetter in 0..<horizontalWord.count {
                
                for verticalWordId in (horizontalWordId + 1)..<wordCount {
                    
                    let verticalWord = words[verticalWordId];
                    
                    for verticalLetter in 0..<verticalWord.count {
                        
                        if verticalWord[verticalLetter] == horizontalWord[horizontalLetter] {
                            
                            let score = ScoreCalculator.score(forLetter:horizontalWord[horizontalLetter]) + 20
                            
                            if score >= scoreMin {
                                
                                let width = horizontalWord.count + 2
                                
                                let height = verticalWord.count + 2
                            
                                if (width <= widthMax && height <= heightMax) || (width <= heightMax && height <= widthMax) {
                                    
                                    result.append(EdgeModel(
                                        horizontalWordId: UInt8(horizontalWordId),
                                        horizontalPosition: UInt8(horizontalLetter),
                                        horizontalLength: UInt8(horizontalWord.count),
                                        
                                        verticalWordId: UInt8(verticalWordId),
                                        verticalPosition: UInt8(verticalLetter),
                                        verticalLength: UInt8(verticalWord.count),
                                        
                                        width: UInt8(width),
                                        height: UInt8(height),
                                        score: UInt16(score)))
                                }
                            }
                        }
                    }
                }
            }
        }
        return result
    }
}
