//
//  BranchAndBoundStrategyV2Tests.swift
//  
//
//  Created by Michael Geurtjens on 29/9/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class BranchAndBoundV2Tests: XCTestCase {

    func test_execute8612() async throws {
        let gameId = 8612
        let game = GameList().getGame(gameId: gameId)!
        let words = game.winningWords
        
        // This is closer to how marks solution works in that it wipes out the search space.  We should make lookahead a parameter
        let shape = await BranchAndBoundV2.execute(
            gameId: gameId,
            words: words,
            depthMax: 30,
            lookaheadDepth:3,
            backtrackCount: 2)
        //XCTAssertEqual(550, Int(shape.score))
        XCTAssertEqual(game.winningScore, Int(shape.score))
    }

    func test_executeAll() async throws {
        
        let successes = [8612, 8705, 8712, 8802, 8808, 8809, 8902, 8908, 9002, 9004,
                         9005, 9007, 9008, 9104, 9109, 9111, 9201, 9204, 9207, 9210,
                         9211, 9212, 9302, 9303, 9306, 9310, 9312
        
        ]
        
        let gameList = GameList()
        var result: [Int] = []
        for game in gameList.games {
            if successes.contains(game.gameId) {
                let gameId = game.gameId
                
                let words = game.winningWords
                
                // This is closer to how marks solution works in that it wipes out the search space.  We should make lookahead a parameter
                let shape = await BranchAndBoundV2.execute(
                    gameId: gameId,
                    words: words,
                    depthMax: 30,
                    lookaheadDepth:3,
                    backtrackCount: 2)
                //XCTAssertEqual(550, Int(shape.score))
                //XCTAssertEqual(game.winningScore, Int(shape.score))
                
                if shape.score == game.winningScore {
                    result.append(gameId)
                }
            }
        }
        print(result)
    }
}
