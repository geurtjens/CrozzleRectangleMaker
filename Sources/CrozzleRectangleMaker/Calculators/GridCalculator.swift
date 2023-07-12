//
//  GridCalculator.swift
//  
//
//  Created by Michael Geurtjens on 2/6/2023.
//

import Foundation
public class GridCalculator {
    
    
    public static func FindWords(grid: [String], words: [String]) -> ([String],[String],[String]) {
        
        let (horizontal, vertical, _) = FindWordsInGrid(grid: grid)
        
        let combined = horizontal + vertical
        
        var unfoundWords: [String] = []
        var winningWords: [String] = []
        for item in combined {
            if words.contains(item) == false {
                unfoundWords.append(item)
            } else {
                winningWords.append(item)
            }
        }
        
        var notWinningWords: [String] = []
        for item in words {
            if winningWords.contains(item) == false {
                notWinningWords.append(item)
            }
        }

        
        return (winningWords, notWinningWords, unfoundWords)
        
    }
        
    public static func FindWordsInGrid(grid: [String]) -> ([String],[String],[String]) {
        let horizontal = FindWordsInGridOne(grid: grid)
        
        let flippedGrid = rotate(grid: grid)
        
        let vertical = FindWordsInGridOne(grid: flippedGrid)
        
        return (horizontal, vertical, flippedGrid)
        
        
        
    }
    
    
    public static func markAmabileFormat(text: String) -> String {
        
        let textChanged = text.lowercased().replacingOccurrences(of: ".", with: "#")
        
        let grid = textChanged.split(separator:"\n")
        var result = ""
        for y in 1..<(grid.count - 1) {
            if result != "" {
                result += "\n"
            }
            let line = grid[y]
            var newLine = ""
            for x in 1..<(line.count-1) {
                newLine += String(line[x])
            }
            result += newLine
        }
        return result
    }
    
    public static func rotate(grid: [String]) -> [String] {
        
        if grid.count == 0 {
            return []
        }

        var result: [String] = []
        
        let width = grid[0].count
        for j in 0..<width {
            var line = ""
            for i in 0..<grid.count {
                line += String(grid[i][j])
            }
            result.append(line)
        }
        
        return result
    }
    
    
    public static func findInterlocks(grid: [String]) -> [InterlockModel] {
        
        if grid.count == 0 {
            return []
        }
        
        var result: [InterlockModel] = []
        
        let positions = findInterlockPositions(grid: grid)
        
        for (y,x) in positions {
            
            let interlock = getInterlock(grid: grid, y: y, x: x)
            result.append(interlock)
        }
        
        return result
    }
    
    public static func getInterlock(grid: [String], y: Int, x: Int) -> InterlockModel {
        
        let xPos = getHorizontalInterlockPos(grid: grid, y: y, x: x)
        let yPos = getVerticalInterlockPos(grid: grid, y: y, x: x)
        
        let horizontalWord = getHorizontalWord(grid: grid, y: y, x: x - xPos)
        let verticalWord = getVerticalWord(grid: grid, y: y - yPos, x: x)
        
        let interlock = InterlockModel(x: x, y: y, horizontalWord: horizontalWord, verticalWord: verticalWord, horizontalPos: xPos, verticalPos: yPos)
        
        return interlock
        
        
    }
    public static func getHorizontalWord(grid:[String], y: Int, x: Int) -> String {
        var word = ""
        
        var i = 0
        
        while grid[y][x + i].isAlphabet() && x + i < grid[y].count {
            word += String(grid[y][x + i])
            i += 1
        }
        return word
    }
    public static func getVerticalWord(grid:[String], y: Int, x: Int) -> String {
        var word = ""
        
        var i = 0
        
        while grid[y + i][x].isAlphabet() && y + i < grid.count {
            word += String(grid[y + i][x])
            i += 1
        }
        return word
    }
    public static func getHorizontalInterlockPos(grid:[String], y: Int, x: Int) -> Int {
        var i = 0
        while x - i >= 0 {
            if grid[y][x - i].isAlphabet() == false {
                return i - 1
            }
            i += 1
        }
        return -1
    }
    
    public static func getVerticalInterlockPos(grid:[String], y: Int, x: Int) -> Int {
        var i = 0
        while y - i >= 0 {
            if grid[y - i][x].isAlphabet() == false {
                return i - 1
            }
            i += 1
        }
        return -1
    }
    
    public static func findInterlockPositions(grid: [String]) -> [(Int,Int)] {
        var result:[(Int,Int)] = []
        
        if grid.count == 0 {
            return []
        }
        
        let width = grid[0].count
        let height = grid.count
        
        for y in 1..<(height - 1) {
            for x in 1..<(width - 1) {
                
                if grid[y][x].isAlphabet() {
                    let isHorizontal = (grid[y][x-1].isAlphabet() || grid[y][x+1].isAlphabet())
                    let isVertical = (grid[y-1][x].isAlphabet() || grid[y+1][x].isAlphabet())
                    
                    if isHorizontal && isVertical {
                        result.append((y,x))
                    }
                }
            }
        }
        
        return result
    }
    
    public static func FindWordsInGridOne(grid: [String]) -> [String] {
        
        var words: [String] = []
        for line in grid {
            
            var previous = line[0]
            var current = previous
            var future = previous
            var word = ""
            var isWord = false
            for i in 1..<(line.count-1) {
                previous = line[i - 1]
                current = line[i]
                future = line[i + 1]
                
                if isWord {
                    if future == " " {
                        word += String(current)
                        words.append(word.uppercased())
                        isWord = false
                        word = ""
                    } else {
                        word += String(current)
                    }
                } else {
                    if previous == " " && ShapeCalculator.IsAlphabet(current) && ShapeCalculator.IsAlphabet(future) {
                        isWord = true
                        word = String(current)
                    }
                    else if i == 1 && ShapeCalculator.IsAlphabet(previous) && ShapeCalculator.IsAlphabet(current) && ShapeCalculator.IsAlphabet(future) {
                        isWord = true
                        word = String(previous) + String(current)
                    }
                }
                
            }
            if isWord {
                word += String(future)
                words.append(word.uppercased())
                isWord = false
                word = ""
            }
        }
        return words
        
        
    }
}
