//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 29/12/2023.
//

import Foundation
class OptimizeBranchAndBoundAllWords {
    public static func optimizeBeamWidthAllWords(
        gameId: Int,
        lookaheadDepth: Int,
        maxDepth: Int,
        minimumBeamWidth: Int,
        maximumBeamWidth: Int,
        rootWidth: Int,
        useGuidedScores: Bool) async -> Int
    {
        
        var lowerWidth = 0
        var upperWidth = 0
        var currentWidth = 0


            
        lowerWidth = minimumBeamWidth
        upperWidth = maximumBeamWidth
        
        let lowerWidthShouldFail = await BranchAndBoundRunner.executeGamesAllWords(
            games: [gameId],
            lookaheadDepth: lookaheadDepth,
            beamWidth: lowerWidth,
            maxDepth: maxDepth,
            rootWidth: rootWidth,
            useGuidedScores: useGuidedScores)
        
        if lowerWidthShouldFail.count > 0 {
            
            print("game \(gameId) lower width of \(minimumBeamWidth) should not produce a winning game.  Skipping this game.")
            return -1
            
        } else {
        
            let upperWidthShouldSucceed = await BranchAndBoundRunner.executeGamesAllWords(
                games: [gameId],
                lookaheadDepth: lookaheadDepth,
                beamWidth: upperWidth,
                maxDepth: maxDepth,
                rootWidth: rootWidth,
                useGuidedScores: useGuidedScores)
        
            if upperWidthShouldSucceed.count == 0
            {
                print("game \(gameId) upper width of \(maximumBeamWidth) should produce a winning game.  Skipping this game.")
                return -1
            } else {
                
                while lowerWidth != upperWidth {
                    
                    currentWidth = Int((Double(lowerWidth) + Double(upperWidth) + 0.5) / 2.0)
                    print ("GAME: \(gameId), LOWER: \(lowerWidth), UPPER: \(upperWidth), CURRENT WIDTH: \(currentWidth)")
                    
                    let winnersForCurrent = await BranchAndBoundRunner.executeGamesAllWords(
                        games: [gameId],
                        lookaheadDepth: lookaheadDepth,
                        beamWidth: currentWidth,
                        maxDepth: maxDepth,
                        rootWidth: rootWidth,
                        useGuidedScores: useGuidedScores)
                    
                    if winnersForCurrent.count == 0 {
                        if lowerWidth == currentWidth {
                            lowerWidth += 1
                            currentWidth = lowerWidth
                        } else {
                            lowerWidth = currentWidth
                        }
                        
                    } else {
                        upperWidth = currentWidth
                    }
                }
                print("FINAL SIZE for : \(gameId) is \(currentWidth)")
                return currentWidth
            }
        }
    }
}
