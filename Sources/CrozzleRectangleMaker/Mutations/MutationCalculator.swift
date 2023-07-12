//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 12/7/2023.
//

import Foundation
public class MutationCalculator {
    
    
    
    // We will return a collection of grids for each of marks lists
    public static func execute() -> [[String]] {
        let gameList = GameList()
        let inputDirectory = "/Users/michaelgeurtjens/Downloads/mintarget/"
        //let outputdirectory = "/Users/michaelgeurtjens/Downloads/mintarget/result/"
        
        
        
        let gameIds = [
            8702, 8703, 8705, 8803, 8804, 8805, 8812, 8902, 8908, 8910,
            8911, 9001, 9002, 9003, 9008, 9009, 9010, 9012, 9101, 9103,
            9106, 9110, 9111, 9209, 9302, 9304] //, 9401, 9605]
        
        var result: [[String]] = []
        for gameId in gameIds {
            
            let game = gameList.getGame(gameId: gameId)!
            
            let words = game.words
            
            let grids = ConvertMarksFilesToShapes.execute(inputDirectory: inputDirectory, gameId: gameId, words: words)
            
            var resultsForGame: [String] = []
            for grid in grids {
                let gridTexts = executeGrid(grid: grid, words: words)
//                for gridText in gridTexts {
//                    print("gameId: \(gameId), maxScore:\(game.winningScore), \(gridText)")
//                }
                resultsForGame += gridTexts
            }
            
            resultsForGame.sort()
            
            var textResult = ""
            for i in 0..<resultsForGame.count {
                let gridText = resultsForGame[i]
                
                textResult += "\(i). gameId: \(gameId), maxScore:\(game.winningScore), \(gridText)\n"
                
            }
            
            result.append(resultsForGame)
        }
        return result
    }
    
    public static func executeGrid(grid: [String], words: [String]) -> [String] {
        var result: [String] = []
        
        let (wordSequence, _) = FindPathAndInterlocksCalculator.execute(grid: grid)
        
        if let shape = ShapeCalculator.toShape(fromGrid: grid, words: wordSequence) {
            
            
            
            
            // the word sequences that can be put into the shape
            let foundWordSequences = LockBreakerCalculator.execute(grid: grid, words: words)
            
            for wordSequence in foundWordSequences {
                if shape.height < shape.width {
                    let shapeText = shape.ToString(words: wordSequence)
                    result.append(shapeText)
                } else {
                    let shapeText = shape.Flip().ToString(words: wordSequence)
                    result.append(shapeText)
                }
               
            }
        }
        return result
    }
}
