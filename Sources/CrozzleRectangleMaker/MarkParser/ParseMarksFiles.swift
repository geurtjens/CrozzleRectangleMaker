//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 9/7/2023.
//

import Foundation
public class ParseMarksFiles {
    
    public static func execute(path: String) -> [([String],[String])] {
        let gridsInDifferentOrientations = extractGrids(path: path)
        let grids = flipGridsIfRequired(grids: gridsInDifferentOrientations)
        
        let duplicates1 = removeDuplicates(grids: grids)
        
        
        var result: [([String],[String])] = []
        
        for grid in grids {
            let shape = extractShape(grid: grid)
            result.append((grid,shape))
        }
        
        let duplicatesRemoved = removeDuplicates(gridsAndShapes: result)
        
        
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
    public static func removeDuplicates(gridsAndShapes:[([String],[String])]) -> [([String],[String])] {
        
        var textSet: Set<String> = []
        
        var result:[([String],[String])] = []
        for item in gridsAndShapes {
            let shapeText = gridToString(grid:item.1)
            
            if textSet.contains(shapeText) == false {
                textSet.insert(shapeText)
                result.append(item)
            }
        }
        return result
    }
        public static func removeDuplicates(grids:[[String]]) -> [[String]] {
            
            var textSet: Set<String> = []
            
            var result:[[String]] = []
            for item in grids {
                let shapeText = gridToString(grid:item)
                
                if textSet.contains(shapeText) == false {
                    textSet.insert(shapeText)
                    result.append(item)
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
    
    
    public static func extractShape(grid: [String]) -> [String] {
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
