//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 9/7/2023.
//

import Foundation
public class ConvertMarksFilesToShapes {
    
    public static func code(grids:[[String]], name: String) -> String {
        
        var names: [String] = []
        var result = ""
        for i in 0..<grids.count {
            let grid = grids[i]
            let gameId = name + "_" + String(i)
            
            names.append(gameId)
            result += MutationCalculatorCodeGen.code(grid:grid, gameId: gameId)
            
        }
        
        let executor = "" //codeExecutor()
        result += MutationCalculatorCodeGen.codeWordSequenceSwitch(names: names)
        result += MutationCalculatorCodeGen.codeMutationSwitch(names: names)
        
        result = "import Foundation\npublic class MutationCalculator {\n\n\(executor)\n\n\(result)\n}"
        
        return result
    }
    
    public static func generateCode(gameId: Int, directory: String, words: [String]) -> String {
        //let path = "\(directory)\(gameId).txt"
        let grids = execute(inputDirectory: directory, gameId: gameId, words: words)
        let code = code(grids: grids, name: String(gameId))
        return code
    }
    
    public static func execute(inputDirectory: String, gameId: Int, words: [String]) -> [[String]] {
        
        let path = "\(inputDirectory)\(gameId).txt"
        
        let gridsInDifferentOrientations = extractGrids(path: path)
        let unboarderedGrids = flipGridsIfRequired(grids: gridsInDifferentOrientations)
        
        // lets add the extra spaces at the end
        let unvalidatedGrids = createBoarders(grids: unboarderedGrids, words: words)
        
        let grids = getValidGrids(grids: unvalidatedGrids, words: words)
        
        
        //let duplicates1 = removeDuplicates(grids: grids)
        
        
        
        
        // Get the underlying pattern of the grid so we can remove duplicates
        //let gridAndPattern = getGridAndPattern(grids: grids)
        
        let duplicatesRemoved = removeDuplicates(grids: grids)
        
        let duplicateCount = grids.count - duplicatesRemoved.count
        
        print("* \(gameId) created \(duplicatesRemoved.count) unique shapes, removing \(duplicateCount) duplicates.")
        
        //let shapes = ShapeCalculator.toShapes(fromGrids: duplicatesRemoved, words: words)
        
        
        
        return duplicatesRemoved
    }
    
//    public static func getGridAndPattern(grids: [[String]]) -> [([String],[String])] {
//        var result: [([String],[String])] = []
//        
//        for grid in grids {
//            let pattern = extractPattern(grid: grid)
//            result.append((grid,pattern))
//        }
//        return result
//    }
    
    public static func getValidGrids(grids: [[String]], words: [String]) -> [[String]] {
        var result: [[String]] = []
        
        for grid in grids {
            if isValid(grid: grid, words: words) {
                result.append(grid)
            }
        }
        return result
    }
    
    public static func isValid(grid: [String], words: [String]) -> Bool {
        let (horizontal, vertical, _) = GridCalculator.FindWordsInGrid(grid: grid)
        
        let gridWords = horizontal + vertical
        
        for gridWord in gridWords {
            if words.contains(gridWord) == false {
                return false
            }
        }
        
        
        return true
    }
    
    public static func startsWith(line: String, words: [String]) -> Bool {
        for word in words {
            if line.starts(with: word) {
                return true
            }
        }
        return false
    }
    
    
    public static func getEndOfLine(line: String, length: Int) -> String {
        if line.count == length {
            return line
        } else if line.count < length {
            return ""
        }
        
        
        let startPos = line.count - length
        var result = ""
        for i in 0..<length {
            result += String(line[i + startPos])
        }
                
        return result
        
    }
    
    public static func endsWith(line: String, words: [String]) -> Bool {
        
        for word in words {
            
            let endOfLine = getEndOfLine(line: line, length: word.count)
            
            if word == endOfLine {
                return true
            }
        }
        return false
    }
    
    public static func createBoarders(grids:[[String]], words: [String]) -> [[String]] {
        var result:[[String]] = []
        for grid in grids {
            let boardered = createBoarder(grid: grid, words: words)
            result.append(boardered)
        }
        return result
    }
    
    public static func createBoarder(grid: [String], words: [String]) -> [String] {
        
        let horizontal = createBoarderHorizontal(grid: grid, words: words)
        
        let flipped = GridCalculator.rotate(grid: horizontal)
        
        let result = createBoarderHorizontal(grid: flipped, words: words)
        
        return result
        
    }
    
    public static func createBoarderHorizontal(grid:[String], words:[String]) -> [String] {
        var result:[String] = []
        for line in grid {
            var newLine = line
            if startsWith(line: newLine, words: words) {
                newLine = "." + newLine
            } else {
                newLine = " " + newLine
            }
            if endsWith(line: newLine, words: words) {
                newLine += "."
            } else {
                newLine += " "
            }
            result.append(newLine)
        }
        return result
    }
    
    
    
    public static func gridToString(grid:[String]) -> String {
        var result = ""
        for line in grid {
            if result != "" {
                result += "\n"
            }
            result += line
        }
        return result
    }
    
    public static func removeDuplicates(gridsArray:[[[String]]]) -> [[String]] {
        
        var textSet: Set<String> = []
        
        var result: [[String]] = []
        for grids in gridsArray {
            for grid in grids {
                let pattern = ConvertMarksFilesToShapes.extractPattern(grid: grid)
                let patternText = ConvertMarksFilesToShapes.gridToString(grid: pattern)
                if textSet.contains(patternText) == false {
                    textSet.insert(patternText)
                    result.append(grid)
                }
            }
        }
        
        return result
    }
    
    
    
    
//    public static func removeDuplicates(gridsAndShapes:[([String],[String])]) -> [[String]] {
//
//        var textSet: Set<String> = []
//
//        var result: [[String]] = []
//        for item in gridsAndShapes {
//            let shapeText = gridToString(grid:item.1)
//
//            if textSet.contains(shapeText) == false {
//                textSet.insert(shapeText)
//                result.append(item.0)
//            }
//        }
//        return result
//    }
    public static func removeDuplicates(grids:[[String]]) -> [[String]] {
        
        var patterns: Set<String> = []
        
        var result:[[String]] = []
        for grid in grids {
            
            let pattern = ConvertMarksFilesToShapes.extractPattern(grid: grid)
            
            let shapeText = gridToString(grid:pattern)
            
            if patterns.contains(shapeText) == false {
                patterns.insert(shapeText)
                result.append(grid)
            }
        }
        return result
    }
    
    public static func flipGridsIfRequired(grids:[[String]]) -> [[String]] {
        var result:[[String]] = []
        for grid in grids {
            let height = grid.count
            let width = grid[0].count
            if width < height {
                let rotatedGrid = GridCalculator.rotate(grid: grid)
                result.append(rotatedGrid)
            } else {
                result.append(grid)
            }
        }
        return result
    }
    
    
    public static func extractGrids(path: String) -> [[String]] {
        let text = loadFile(path: path )
        
        let lines = text.split(separator: "\n")
        var header = false
        var captureContent = false
        var result: [[String]] = []
        var grid: [String] = []
        for line in lines {
            if line.contains("COUNT=") {
                header = true
            } else if line == "------------------------" {
                if header == true {
                    captureContent = true
                    header = false
                    grid = []
                } else {
                    if grid.count > 0 {
                        result.append(grid)
                        grid = []
                        captureContent = false
                    }
                }
            } else if captureContent {
                grid.append(String(line))
            }
            
            
        }
                
        
        
        
        return result
    }
    
    
    public static func extractPattern(grid: [String]) -> [String] {
        var result:[String] = []
        for line in grid {
            var text = line.replacingOccurrences(of: ".", with: " ")
            
            text = text.replacingOccurrences(of: "A", with: ".")
            text = text.replacingOccurrences(of: "B", with: ".")
            text = text.replacingOccurrences(of: "C", with: ".")
            text = text.replacingOccurrences(of: "D", with: ".")
            text = text.replacingOccurrences(of: "E", with: ".")
            text = text.replacingOccurrences(of: "F", with: ".")
            text = text.replacingOccurrences(of: "G", with: ".")
            text = text.replacingOccurrences(of: "H", with: ".")
            text = text.replacingOccurrences(of: "I", with: ".")
            text = text.replacingOccurrences(of: "J", with: ".")
            text = text.replacingOccurrences(of: "K", with: ".")
            text = text.replacingOccurrences(of: "L", with: ".")
            text = text.replacingOccurrences(of: "M", with: ".")
            text = text.replacingOccurrences(of: "N", with: ".")
            text = text.replacingOccurrences(of: "O", with: ".")
            text = text.replacingOccurrences(of: "P", with: ".")
            text = text.replacingOccurrences(of: "Q", with: ".")
            text = text.replacingOccurrences(of: "R", with: ".")
            text = text.replacingOccurrences(of: "S", with: ".")
            text = text.replacingOccurrences(of: "T", with: ".")
            text = text.replacingOccurrences(of: "U", with: ".")
            text = text.replacingOccurrences(of: "V", with: ".")
            text = text.replacingOccurrences(of: "W", with: ".")
            text = text.replacingOccurrences(of: "X", with: ".")
            text = text.replacingOccurrences(of: "Y", with: ".")
            text = text.replacingOccurrences(of: "Z", with: ".")
            result.append(text)
        }
        return result
    }
    
    
    // load a file into memory
    public static func loadFile(path: String) -> String {
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: path) {
            do {
                var contents = try String(contentsOfFile: path, encoding: .utf8).uppercased()
                contents = contents.replacingOccurrences(of: "\r\n", with:"\n")
                contents = contents.replacingOccurrences(of: "#", with: ".")

                return contents
            } catch {
                print("File Read Error for file \(path)")
                return ""
            }
        } else {
            print("File does not exist at path \(path)")
            return ""
        }
    }

}
