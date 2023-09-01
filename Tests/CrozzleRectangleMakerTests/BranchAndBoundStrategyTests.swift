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
        
        await BranchAndBoundStrategy.execute(gameId: 8612, words: words)
        
    }

    
}
