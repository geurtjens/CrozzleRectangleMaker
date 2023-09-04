//
//  BranchAndBoundStrategyTests.swift
//  
//
//  Created by Michael Geurtjens on 1/9/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class BranchAndBoundStrategyTests: XCTestCase {
    
    func testExample() async throws {
    
        let game = GameList().getGame(gameId: 8802)!
        let words = game.winningWords
        
        let shape = await BranchAndBoundStrategyV1.execute(gameId: 8802, words: words, repeatTimes: 4)
        
        XCTAssertEqual(game.winningScore, Int(shape.score))
    }
    
    func testExample2() async throws {
        let gameId = 9407
        let game = GameList().getGame(gameId: gameId)!
        let words = game.winningWords
        
        // This is closer to how marks solution works in that it wipes out the search space.  We should make lookahead a parameter
        let shape = await BranchAndBoundStrategyV2.execute(gameId: gameId, words: words, repeatTimes: 18, lookahead:3)
        XCTAssertEqual(game.winningScore, Int(shape.score))
    }
}
