//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 20/12/2023.
//

import Foundation
public struct BranchAndBoundInstruction {
    var depth: Int
    var width: Int
    var games: [Int]
    var rootWidth: Int
    var useGuidedScores: Bool
    var maxDepth: Int
}
