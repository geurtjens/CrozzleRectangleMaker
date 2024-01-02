//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 20/12/2023.
//

import Foundation
public struct BranchAndBoundInstruction {
    var lookaheadDepth: Int
    var beamWidth: Int
    var games: [Int]
    var rootShape: Int
    var rootWidth: Int
    var useGuidedScores: Bool
    var maxDepth: Int
}
