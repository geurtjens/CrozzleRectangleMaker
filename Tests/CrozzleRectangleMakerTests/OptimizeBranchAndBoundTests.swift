//
//  OptimizeBranchAndBoundTests.swift
//  
//
//  Created by Michael Geurtjens on 23/12/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class OptimizeBranchAndBoundTests: XCTestCase {
    
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
