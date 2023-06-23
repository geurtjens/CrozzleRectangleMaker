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
    public static func FindWordsInGridOne(grid: [String]) -> [String] {
        
        var words: [String] = []
        for line in grid {
            //print(line)
            var previous = line[0]
            var current = previous
            var future = previous
            var word = ""
            var isWord = false
            for i in 1..<(line.count-1) {
                previous = line[i - 1]
                current = line[i]
                future = line[i + 1]
                //print("\"\(previous)\(current)\(future)\"")
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
