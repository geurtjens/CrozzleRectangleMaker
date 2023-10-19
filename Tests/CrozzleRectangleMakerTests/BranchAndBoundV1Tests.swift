//
//  BranchAndBoundStrategyTests.swift
//  
//
//  Created by Michael Geurtjens on 1/9/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class BranchAndBoundV1Tests: XCTestCase {
    
    func test_execute8802() async throws {
    
        let gameId = 8802
        let game = GameList().getGame(gameId: gameId)!
        let words = game.winningWords
        let wordsInt = WordCalculator.WordsToInt(words: words)
        let shape = await BranchAndBoundV1.execute(
            gameId: gameId,
            words: words,
            wordsInt: wordsInt,
            repeatTimes: 4,
            lookahead: 3,
            backtrackCount: 2,
            queueDepth: 500)
        
        XCTAssertEqual(game.winningScore, Int(shape.score))
    }
    
    func test_executeAll() async throws {
        let _ = await BranchAndBoundV1.executeAll()
    }
}
