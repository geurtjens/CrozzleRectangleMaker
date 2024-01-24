//
//  OptimizeBranchAndBoundTests.swift
//  
//
//  Created by Michael Geurtjens on 23/12/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class OptimizeBranchAndBoundTests: XCTestCase {
    
    public func test_useShapeScoreLimits() async {
        FeatureFlags.showGameText = false
        FeatureFlags.showCyclesText = false
        
        let a = await OptimizeBranchAndBound.optimizeBeamWidth(gameId: 8802, lookaheadDepth: 1, maxDepth: 30, minimumBeamWidth: 1, maximumBeamWidth: 75, rootShape: 1, rootWidth: 1, useGuidedScores: false, useShapeScoreLimits: false)
        
        XCTAssertEqual(1, a)
        
        let b = await OptimizeBranchAndBound.optimizeBeamWidth(gameId: 8802, lookaheadDepth: 1, maxDepth: 30, minimumBeamWidth: 1, maximumBeamWidth: 75, rootShape: 4, rootWidth: 1, useGuidedScores: false, useShapeScoreLimits: true)
        // 4 works
        XCTAssertEqual(1, b)
        
    }
    
    public func test_executeFailuresUsingGuidedScores() async {
        FeatureFlags.showGameText = false
        FeatureFlags.showCyclesText = false
        await OptimizeBranchAndBound.executeFailuresUsingGuidedScores()
    }
    
    public func test_executeFailuresNoGuidedScores() async {
        FeatureFlags.showGameText = false
        FeatureFlags.showCyclesText = false
        await OptimizeBranchAndBound.executeFailuresNoGuidedScores()
    }
    
    public func test_optimizeBeamWidthAllWords() async {
        FeatureFlags.showGameText = false
        FeatureFlags.showCyclesText = false
        await OptimizeBranchAndBoundAllWords.executeFailuresNoGuidedScores()
    }
    

}
