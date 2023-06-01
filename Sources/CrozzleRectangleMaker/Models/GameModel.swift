//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 2/6/2023.
//

import Foundation
public struct GameModel {
    public let gameId: Int
    
    
    
   
    /// when a shape is rendered as text, its width must be less than or equal to `widthMax` for it to comply with the games size.  Shapes can be flipped so the constraint is width x height or height x width
    public let maxWidth: Int
    /// when a shape is rendered as text, its height must be less than or equal to `heightMax` for it to comply with the games size.  Shapes can be flipped so its width x height or height x width
    public let maxHeight: Int
    public let winningScore: Int
    public let tags: [String]
    public let winningWords: [String]
    public let nonWinningWords: [String]
    public let winningGame: [String]
    /// these are the words that are used in all processing.  They must say in the same order / sequence throughout the game
    public func words() -> [String] {
        return winningWords + nonWinningWords
    }
    /// number of words in the words collection
    public func wordCount() -> Int {
        return words().count
    }
}
