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
    
        let words = GameList().getGame(gameId: 8612)!.winningWords
        
        let _ = await BranchAndBoundStrategyV1.execute(gameId: 8612, words: words, repeatTimes: 4)
    }
    
    func testExample2() async throws {
    
        let words = GameList().getGame(gameId: 8802)!.winningWords
        // This is closer to how marks solution works in that it wipes out the search space.  We should make lookahead a parameter
        let _ = await BranchAndBoundStrategyV2.execute(gameId: 8802, words: words, repeatTimes: 15, lookahead:5)
    }
}
