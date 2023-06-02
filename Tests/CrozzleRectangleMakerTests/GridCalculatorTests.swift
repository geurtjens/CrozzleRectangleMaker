//
//  GridCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 2/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class GridCalculatorTests: XCTestCase {

    func test_findWords_9205() throws {
        let gameList = GameList()
        if let game = gameList.getGame(gameId: 9205) {
            let (winning, nonWinning, unfound) = GridCalculator.FindWords(grid: game.winningGame, words: game.words())
            print("winningWords:\(winning),")
            print("nonWinningWords:\(nonWinning),")
            print("unfound:\(unfound)")
        }
    }
    
    func test_findWords_8812() throws {
        let gameList = GameList()
        if let game = gameList.getGame(gameId: 8812) {
            let (winning, nonWinning, unfound) = GridCalculator.FindWords(grid: game.winningGame, words: game.words())
            print("winningWords:\(winning),")
            print("nonWinningWords:\(nonWinning),")
            print("unfound:\(unfound)")
        }
    }
    
    func test_findWords_8705() throws {
        let gameList = GameList()
        if let game = gameList.getGame(gameId: 8705) {
            let (winning, nonWinning, unfound) = GridCalculator.FindWords(grid: game.winningGame, words: game.words())
            print("winningWords:\(winning),")
            print("nonWinningWords:\(nonWinning),")
            print("unfound:\(unfound)")
        }
    }
    
    
    func test_findWords_8702() throws {
        let gameList = GameList()
        if let game = gameList.getGame(gameId: 8702) {
            let (winning, nonWinning, unfound) = GridCalculator.FindWords(grid: game.winningGame, words: game.words())
            print("winningWords:\(winning),")
            print("nonWinningWords:\(nonWinning),")
            print("unfound:\(unfound)")
        }
    }
    
    func test_findWords_8612() throws {
        let gameList = GameList()
        if let game = gameList.getGame(gameId: 8612) {
            let (winning, nonWinning, unfound) = GridCalculator.FindWords(grid: game.winningGame, words: game.words())
            print("winningWords:\(winning),")
            print("nonWinningWords:\(nonWinning),")
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
