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
    
    public func test_BulkExecute() async {
        //result.append(BranchAndBoundInstruction(game: 9204, root: 2, depth: 1, width: 423, size: 8_567, time: "13 seconds"))
        
        let games = [9204]
        
        let result = await BranchAndBoundRunner.executeGamesAllWords(
            games: games,
            lookaheadDepth: 1,
            beamWidth: 423,
            maxDepth: 30,
            rootShape: 2,
            rootWidth: 1,
            useGuidedScores: false)
    }
    
    public func test_ExecuteGamesAllWords8612() async {
        
        let games = [8612]
        
        let result = await BranchAndBoundRunner.executeGamesAllWords(
            games: games,
            lookaheadDepth: 2,
            beamWidth: 9,
            maxDepth: 30,
            rootShape: 0,
            rootWidth: 18,
            useGuidedScores: false)
        
        XCTAssertEqual(1, result.count)
    }
}
