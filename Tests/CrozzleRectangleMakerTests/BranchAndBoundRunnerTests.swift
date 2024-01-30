//
//  BranchAndBoundRunnerTests.swift
//  
//
//  Created by Michael Geurtjens on 22/12/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class BranchAndBoundRunnerTests: XCTestCase {

    func test_WinningWords_UseGuidedScores() async throws {
        FeatureFlags.showGameText = false
        FeatureFlags.showCyclesText = false
        await BranchAndBoundRunner.WinningWords_UseGuidedScores()
    }
    
    func test_WinningWords_NoGuidedScores() async throws {
        FeatureFlags.showGameText = false
        FeatureFlags.showCyclesText = false
        await BranchAndBoundRunner.WinningWords_NoGuidedScores()
    }
    
    public func test_ExecuteGames8612() async {
        
        let games = [8612]
        
        let result = await BranchAndBoundRunner.executeGamesWinningWords(
            games: games,
            lookaheadDepth: 3,
            beamWidth: 2,
            maxDepth: 30,
            rootShape: 0,
            rootWidth: 18,
            useGuidedScores: false)
        
        XCTAssertEqual(1, result.count)
    }
}
