//
//  OptimizeBranchAndBoundTests.swift
//  
//
//  Created by Michael Geurtjens on 23/12/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class OptimizeBranchAndBoundTests: XCTestCase {
    
    public func test_executeFailures() async {
        await OptimizeBranchAndBound.executeFailures()
    }
    
    public func test_optimizeBeamWidthAllWords() async {
        let _ = await OptimizeBranchAndBoundAllWords.optimizeBeamWidthAllWords(
            gameId: 8802,
            lookaheadDepth: 2,
            maxDepth: 30,
            minimumBeamWidth: 1,
            maximumBeamWidth: 25,
            rootWidth: 1,
            useGuidedScores: false)
    }
    

}
