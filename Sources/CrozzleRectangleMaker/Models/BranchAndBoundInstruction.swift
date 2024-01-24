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
    let useShapeScoreLimits: Bool
    let maxDepth: Int
    let time: String
    
    init(lookaheadDepth: Int, beamWidth: Int, games: [Int], rootShape: Int, rootWidth: Int, useGuidedScores: Bool, useShapeScoreLimits: Bool, maxDepth: Int) {
        self.lookaheadDepth = lookaheadDepth
        self.beamWidth = beamWidth
        self.games = games
        self.rootShape = rootShape
        self.rootWidth = rootWidth
        self.useGuidedScores = useGuidedScores
        self.useShapeScoreLimits = useShapeScoreLimits
        self.maxDepth = maxDepth
        self.time = ""
    }
    
    init(game: Int, rootShape: Int, lookaheadDepth: Int, beamWidth: Int, time: String, useGuidedScores: Bool = false, useShapeScoreLimits: Bool = false) {
        self.games = [game]
        self.rootShape = rootShape
        self.lookaheadDepth = lookaheadDepth
        self.beamWidth = beamWidth
        self.time = time
        self.rootWidth = 1
        self.maxDepth = 30
        self.useGuidedScores = useGuidedScores
        self.useShapeScoreLimits = useShapeScoreLimits
        
    }
}
