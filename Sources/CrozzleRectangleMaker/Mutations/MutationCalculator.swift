//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 12/7/2023.
//

import Foundation
public class MutationCalculator {
    
    
    public static func generateFiles() {
        let gameIds = [
            8702, 8703, 8705, 8803, 8804, 8805, 8812, 8902, 8908, 8910,
            8911, 9001, 9002, 9003, 9008, 9009, 9010, 9012, 9101, 9103,
            9106, 9110, 9111, 9209, 9302, 9304]


        let values = MutationCalculator.execute()
        
        for i in 0..<values.count {
            let value = values[i]
            let gameId = gameIds[i]
            
            let scores = extractScores(text: value)
            let scoresText = scoreSummaryText(scores: scores)
            
            
            let result = scoresText + "\n" + value
            
            saveGame(gameId: gameId, text: result)
        }
    }
    
    public static func saveGame(gameId: Int, text: String) {
        let url = getDocumentsDirectory().appendingPathComponent("mutationsFor_\(gameId).txt")
        
        do {
            try text.write(to: url, atomically: true, encoding: .utf8)
                    
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public static func scoreSummaryText(scores: [Int]) -> String {
        
        
        let scoresGroupBy = Dictionary(grouping: scores) {$0}
        
        var list: [(Int,Int)] = []
        for item in scoresGroupBy {
            list.append((item.0,item.1.count))
        }
        
        list.sort() { $0.0 > $1.0}

        var result = ""
        for item in list {
            
            result += "\(item.0) = \(item.1)\n"
        }
        
        return result
        
    }
    
    public static func extractScores(text: String) -> [Int] {
        var result: [Int] = []
        let lines = text.split(separator: "\n")
        for line in lines {
            if line.contains(" score=") {
                let spaceArray = line.split(separator: " ")
                let scoreText = spaceArray[1].replacingOccurrences(of: "score=", with: "")
                
                result.append(Int(scoreText) ?? 0)
                
            }
        }
        return result
    }
    
    public static func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        // just send back the first one, which ought to be the only one
        return paths[0]
    }
    
    // We will return a collection of grids for each of marks lists
    public static func execute() -> [String] {
        let gameList = GameList()
        let inputDirectory = "/Users/michaelgeurtjens/Downloads/mintarget/"
        //let outputdirectory = "/Users/michaelgeurtjens/Downloads/mintarget/result/"
        
        
        
        let gameIds = [
            8702, 8703, 8705, 8803, 8804, 8805, 8812, 8902, 8908, 8910,
            8911, 9001, 9002, 9003, 9008, 9009, 9010, 9012, 9101, 9103,
            9106, 9110, 9111, 9209, 9302, 9304] //, 9401, 9605]
        
        var result: [String] = []
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
            
            resultsForGame.sort() { $0 > $1 }
            
            var textResult = ""
            for i in 0..<resultsForGame.count {
                let gridText = resultsForGame[i]
                
                textResult += "count=\(i + 1) \(gridText)"
                
            }
            
            result.append(textResult)
        }
        return result
    }
    
    public static func executeGrid(grid: [String], words: [String]) -> [String] {
        var result: [String] = []
        
        let (originalWordSequence, _) = FindPathAndInterlocksCalculator.execute(grid: grid)
        
        if let shape = ShapeCalculator.toShape(fromGrid: grid, words: originalWordSequence) {
            
            
            
            
            // the word sequences that can be put into the shape
            let foundWordSequences = LockBreakerCalculator.execute(grid: grid, words: words)
            
            for wordSequence in foundWordSequences {
                //if matchingWordSequence(originalSequence: originalWordSequence, wordSequence: wordSequence) == false {
                    if shape.height < shape.width {
                        let shapeText = shape.ToMarkFormat(words: wordSequence)
                        result.append(shapeText)
                    } else {
                        let shapeText = shape.Flip().ToMarkFormat(words: wordSequence)
                        result.append(shapeText)
                    }
               // }
            }
        }
        return result
    }
    
    public static func matchingWordSequence(originalSequence: [String], wordSequence: [String]) -> Bool {
        if originalSequence.count != wordSequence.count {
            return false
        }
        
        for i in 0..<originalSequence.count {
            if originalSequence[i] != wordSequence[i] {
                return false
            }
        }
        return true
    }
}
