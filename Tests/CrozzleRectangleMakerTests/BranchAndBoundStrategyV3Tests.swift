//
//  BranchAndBoundStrategyV3Tests.swift
//  
//
//  Created by Michael Geurtjens on 21/9/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class BranchAndBoundStrategyV3Tests: XCTestCase {

    public func test_Execute() async {
        let game = GameList().getGame(gameId:8612)!
        let winningScore = game.winningScore
        let words = game.winningWords
        
        
        let result = await BranchAndBoundStrategyV3.execute(
            gameId: 8612,
            words: words,
            lookaheadDepth: 3,
            beamWidth: 4,
            repeatTimes: 20,
            winningScore: winningScore)
        
        XCTAssertEqual(winningScore, Int(result.score))
    }
    
    public func test_Execute8803() async {
        
        let gameId = 8803
        
        let game = GameList().getGame(gameId:gameId)!
        let winningScore = game.winningScore
        let words = game.winningWords
        
        
        let result = await BranchAndBoundStrategyV3.execute(
            gameId: gameId,
            words: words,
            lookaheadDepth: 3,
            beamWidth: 500,
            repeatTimes: 20,
            winningScore: winningScore)
        
        XCTAssertEqual(winningScore, Int(result.score))
    }
    
}
