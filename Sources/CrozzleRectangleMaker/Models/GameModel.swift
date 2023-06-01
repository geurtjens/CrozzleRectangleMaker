//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 2/6/2023.
//

import Foundation
public struct GameModel {
    public let gameId: Int
    
    public let maxWidth: Int
    public let maxHeight: Int
    public let winningScore: Int
    public let tags: [String]
    public let winningWords: [String]
    public let nonWinningWords: [String]
    public let winningGame: [String]
    
    public func words() -> [String] {
        return winningWords + nonWinningWords
    }
}
