//
//  GridCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 2/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class GridCalculatorTests: XCTestCase {

    func test_findWords() throws {
        let gameList = GameList()
        if let game = gameList.getGame(gameId: 8612) {
            let (winning, nonWinning, unfound) = GridCalculator.FindWords(grid: game.winningGame, words: game.words())
            print("winning:\(winning)")
            print("notwinning:\(nonWinning)")
            print("unfound:\(unfound)")
        }
    }
    
    
    func test_findWordsInGridOne() throws {
        let gameList = GameList()
        if let game = gameList.getGame(gameId: 8612) {
            let horizontalWords = GridCalculator.FindWordsInGridOne(grid: game.winningGame)
            print(horizontalWords)
            for line in game.winningGame {
                print(line)
            }
        }
    }
    
    func test_findWordsInGrid() throws {
        let gameList = GameList()
        if let game = gameList.getGame(gameId: 8612) {
            let (horizontal,vertical, flippedGrid) = GridCalculator.FindWordsInGrid(grid: game.winningGame)
            print(horizontal)
            
            for line in game.winningGame {
                print(line)
            }
            
            print(vertical)
            for line in flippedGrid {
                print(line)
            }
        }
    }
}
