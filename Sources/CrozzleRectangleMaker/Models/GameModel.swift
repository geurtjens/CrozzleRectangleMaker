//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 2/6/2023.
//

import Foundation
public struct GameModel {
    public let gameId: Int
    public let title: String
    /// number of words in the words collection
    public let wordCount: Int
    public let winningWordCount: Int
    /// these are the words that are used in all processing.  They must say in the same order / sequence throughout the game
    public let words: [String]
    /// when a shape is rendered as text, its width must be less than or equal to `widthMax` for it to comply with the games size.  Shapes can be flipped so the constraint is width x height or height x width
    public let widthMax: Int
    /// when a shape is rendered as text, its height must be less than or equal to `heightMax` for it to comply with the games size.  Shapes can be flipped so its width x height or height x width
    public let heightMax: Int
    public let winningScore: Int
    public let isValid: Bool
    public let tags: [String]
    public let winningWords: [String]
    public let nonWinningWords: [String]
    public let winningGame: [String]
    
    public init(gameId: Int, title: String, maxWidth: Int, maxHeight: Int, winningScore: Int, isValid: Bool, tags: [String], winningWords: [String], nonWinningWords: [String], winningGame: [String]) {
        self.gameId = gameId
        self.title = title
        self.widthMax = maxWidth
        self.heightMax = maxHeight
        self.winningScore = winningScore
        self.isValid = isValid
        self.tags = tags
        self.winningWords = winningWords
        self.nonWinningWords = nonWinningWords
        self.winningGame = winningGame
        
        let words = winningWords + nonWinningWords
        self.words = words
        self.wordCount = words.count
        self.winningWordCount = winningWords.count
        
    }
    
    public func wordsInt() -> [[Int]] {
        return WordCalculator.WordsToInt(words: self.words)
    }
    
    public func winningWordsInt() -> [[Int]] {
        return WordCalculator.WordsToInt(words: self.winningWords)
    }
    public func winningText() -> String {
        var text = ""
        for line in winningGame {
            if text != "" {
                text += "\n"
            }
            text += line
        }
        return text
    }
}
