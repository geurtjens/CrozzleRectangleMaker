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
        
        await BranchAndBoundStrategyV3.execute(
            gameId: 8612,
            words: game.winningWords,
            lookaheadDepth: 3,
            beamWidth: 4,
            repeatTimes: 20,
            winningScore: game.winningScore)
        //XCTAssertEqual(1, result.count)
    }
    
}
