//
//  ScoreCalculator.swift
//  
//
//  Created by Michael Geurtjens on 17/5/2023.
//

import Foundation

/// Scoring of letters as per crozzle rules
public class ScoreCalculator {
    /// Score of one interlocked letter.  Always pass in a capital letter.  We should also calculate score for number of words so dont forget that elsewhere in the calling code
    /// - Parameter letter: A letter from "A" to "Z" which was interlocked
    /// - Returns: The score for interlocking that letter
    public static func score(forLetter letter: Character) -> Int {
        switch letter {
        case "A", "B", "C", "D", "E", "F":
            return 2
        case "G","H","I","J","K","L":
            return 4
        case "M","N","O","P","Q","R":
            return 8
        case "S","T","U","V","W","X":
            return 16
        case "Y":
            return 32
        case "Z":
            return 64
        default:
            return 0
        }
    }
    
    public static func score(forInt letter: Int) -> Int {
        if letter >= 65 && letter <= 70 {
            return 2
        } else if letter >= 71 && letter <= 76 {
            return 4
        } else if letter >= 77 && letter <= 82 {
            return 8
        } else if letter >= 83 && letter <= 88 {
            return 16
        } else if letter == 89 {
            return 32
        } else if letter == 90 {
            return 64
        } else {
            return 0
        }
    }
    
    /// convenience method for calculating the score of the `rectangle` shape
    public static func rectangle(topLeft: Character, topRight: Character, bottomLeft: Character, bottomRight: Character ) -> Int {
        let score = score(forLetter:topLeft) + score(forLetter:topRight) + score(forLetter:bottomLeft) + score(forLetter:bottomRight) + 40
        return score
    }
   
    public static func rectangleInt(topLeft: Int, topRight: Int, bottomLeft: Int, bottomRight: Int) -> Int {
        let score = score(forInt:topLeft) + score(forInt:topRight) + score(forInt:bottomLeft) + score(forInt:bottomRight) + 40
        return score
    }
 
    
    /// convenience method for calculating the score of the `topLeft` rectangle
    public static func topLeft(topRight: Character, bottomLeft: Character, bottomRight: Character ) -> Int {
        let score = score(forLetter:topRight) + score(forLetter:bottomLeft) + score(forLetter:bottomRight) + 40
        return score
    }
    
    public static func topLeftInt(topRight: Int, bottomLeft: Int, bottomRight: Int ) -> Int {
        let score = score(forInt:topRight) + score(forInt:bottomLeft) + score(forInt:bottomRight) + 40
        return score
    }
    
    public static func score(text: String) -> Int {
        var result = 0
        for letter in text {
            result += score(forLetter: letter)
        }
        return result
    }
    
    public static func scoreGrid(text: String, words: [String]) -> UInt16 {
        let grid = GridCalculator.stringToGrid(text: text)
        
        let (_,wordsFound,_) = GridCalculator.FindWords(grid: grid, words: words)
        
        let wordScore = wordsFound.count * 10
        
        let interlockLetters = GridCalculator.findInterlocksAsString(grid: grid)
        
        let letterScore = score(text: interlockLetters)
        
        let result = wordScore + letterScore
        
        return UInt16(result)
        
    }
    
    
    /// convenience method for calculating the score of the `topRight` rectangle
    public static func topRight(topLeft: Character, bottomLeft: Character, bottomRight: Character ) -> Int {
        let score = score(forLetter:topLeft) + score(forLetter:bottomLeft) + score(forLetter:bottomRight) + 40
        return score
    }
    
    public static func topRightInt(topLeft: Int, bottomLeft: Int, bottomRight: Int) -> Int {
        let score = score(forInt:topLeft) + score(forInt:bottomLeft) + score(forInt:bottomRight) + 40
        return score
    }
    
    /// convenience method for calculating the score of the `bottomRight` rectangle
    public static func bottomRight(topLeft: Character, topRight: Character, bottomLeft: Character) -> Int {
        let score = score(forLetter:topLeft) + score(forLetter:topRight) + score(forLetter:bottomLeft) + 40
        return score
    }
    
    /// convenience method for calculating the score of the `bottomRight` rectangle
    public static func bottomRightInt(topLeft: Int, topRight: Int, bottomLeft: Int) -> Int {
        let score = score(forInt:topLeft) + score(forInt:topRight) + score(forInt:bottomLeft) + 40
        return score
    }
}
