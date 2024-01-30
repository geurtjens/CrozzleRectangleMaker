//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 20/12/2023.
//

import Foundation
public struct BranchAndBoundInstruction {
    let lookaheadDepth: Int
    let beamWidth: Int
    let games: [Int]
    let rootShape: Int
    let rootWidth: Int
    let useGuidedScores: Bool
    let maxDepth: Int
    let searchShapes: Int
    let time: String
    
    init(lookaheadDepth: Int, beamWidth: Int, games: [Int], rootShape: Int, rootWidth: Int, useGuidedScores: Bool, maxDepth: Int) {
        self.lookaheadDepth = lookaheadDepth
        self.beamWidth = beamWidth
        self.games = games
        self.rootShape = rootShape
        self.rootWidth = rootWidth
        self.useGuidedScores = useGuidedScores
        self.maxDepth = maxDepth
        self.time = ""
        self.searchShapes = 0
    }
    
    init(game: Int, root: Int, depth: Int, width: Int, size: Int, time: String, useGuidedScores: Bool = false) {
        self.games = [game]
        self.rootShape = root
        self.lookaheadDepth = depth
        self.beamWidth = width
        self.searchShapes = size
        self.time = time
        self.rootWidth = 1
        self.maxDepth = 30
        self.useGuidedScores = useGuidedScores
    }
}
