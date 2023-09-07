//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 7/9/2023.
//

import Foundation
public class JeanCharlesFileConverter {
    
    public static let path = "/Users/michaelgeurtjens/Downloads/Solutions"
    
    public static func execute() {
        
        let gameList = GameList()
        
        let processedList = processFiles()
        
        for processed in processedList {
            
            let info = processed.0
            let grid = processed.1
            let gameId = processed.2
            
            
            let words = gameList.getGame(gameId: gameId)!.words
            
            let placementsAsText = executeOne(info: info, grid: grid, words: words)
            var placements: [PlacementModel] = []
            for placementAsText in placementsAsText {
                let word = placementAsText.0
                let y = placementAsText.1
                let x = placementAsText.2
                let z = placementAsText.3
                
                let w = WordCalculator.extractWordId(search: word, words: words)
                placements.append(PlacementModel(w: UInt8(w), x: UInt8(x), y: UInt8(y), z: z, l: UInt8(word.count)))
                
                let shape = placements.toShape(score: 0)
                print(shape.ToText(words: words))
            }
            
            
            
           
        }
    }
    
    public static func executeOne(info: String, grid: String, words: [String]) -> [(String,Int,Int, Bool)] {
        let grid = grid.split(separator: "\n")
        
        var gridList: [String] = []
        for item in grid {
            gridList.append(String(item))
        }
        
        
        let boardered = ConvertMarksFilesToShapes.createBoarder(grid: gridList, words: words)
        
        var result: [(String,Int,Int, Bool)] = []
        
        let height = boardered.count
        let width = boardered[0].count
        
        
        var word = ""
        var startX = 0
        for y in 1..<height-1 {
            startX = 0
            for x in 1..<width {
                let letter = boardered[y][x]
                
                if letter >= "A" && letter <= "Z" {
                    word += String(letter)
                } else if letter == "." || letter == " " {
                    
                    if word.count > 1 {
                        result.append((word, y, startX, true))
                    }
                    word = ""
                    startX = x
                }
            }
        }

        var startY = 0
        
        for x in 1..<width-1 {
            startY = 0
            for y in 1..<height {
                let letter = boardered[y][x]
                
                if letter >= "A" && letter <= "Z" {
                    word += String(letter)
                } else if letter == "." || letter == " " {
                    
                    if word.count > 1 {
                        result.append((word, startY, x, false))
                    }
                    word = ""
                    startY = y
                }
            }
        }
        return result
    }
    
    public static func processFiles() -> [(String, String, Int)] {
        let contents = loadFilenames()
        let names = getFilenames()
        var result: [(String,String,Int)] = []
        for i in 0..<contents.count {
            
            let name = names[i].replacingOccurrences(of: ".txt", with: "")
            
            let id: Int = Int(name)!
            
            let content = contents[i].replacingOccurrences(of: "\r", with: "")
            
            let lines = content.split(separator:"\n")
            
            
            
            var game = ""
            var info = ""
            for line in lines {
                if line.starts(with: "(") {
                    info = String(line)
                    result.append((info,game,id))
                    game = ""
                } else {
                    if game != "" {
                        game += "\n"
                    }
                    game += line
                }
            }
        }
        return result
    }
    
    
    public static func loadFilenames() -> [String] {
        
        var result: [String] = []
        
        let filenames = getFilenames()
        
        for filename in filenames {
            
            let name = path + "/" + filename
            
            let contents = try! String(contentsOfFile: name)
            result.append(contents)
            
        }
        
        return result
    }
    
    public static func getFilenames() ->  [String] {
        
        
        
        let fileManager = FileManager()
        
        return try! fileManager.contentsOfDirectory(atPath: path)
    }
    
}
