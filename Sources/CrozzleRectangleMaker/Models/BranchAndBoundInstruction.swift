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
    var time: String
    
    init(lookaheadDepth: Int, beamWidth: Int, games: [Int], rootShape: Int, rootWidth: Int, useGuidedScores: Bool, maxDepth: Int) {
        self.lookaheadDepth = lookaheadDepth
        self.beamWidth = beamWidth
        self.games = games
        self.rootShape = rootShape
        self.rootWidth = rootWidth
        self.useGuidedScores = useGuidedScores
        self.maxDepth = maxDepth
        self.time = ""
    }
    
    init( game: Int, rootShape: Int, lookaheadDepth: Int, beamWidth: Int, time: String, useGuidedScores: Bool) {
        self.games = [game]
        self.rootShape = rootShape
        self.lookaheadDepth = lookaheadDepth
        self.beamWidth = beamWidth
        self.time = time
        self.rootWidth = 1
        self.maxDepth = 30
        self.useGuidedScores = useGuidedScores
        
    }
}
