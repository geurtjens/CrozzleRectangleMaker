//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 23/12/2023.
//

import Foundation
public class OptimizeBranchAndBound {
    public static func optimizeWithStartingWords(
        gameId: Int,
        lookaheadDepth: Int,
        beamWidth: Int,
        maxDepth: Int) async -> ([Int],[Int])
    {
        var beamWidthResults: [Int] = []
        
        let startingWords = await findValidStartingWords(
            gameId: gameId,
            lookaheadDepth: lookaheadDepth,
            beamWidth: beamWidth,
            maxDepth: maxDepth)
        
        
        for startingWord in startingWords {
            let beamWidthResult = await optimizeBeamWidth(
                gameId: gameId,
                lookaheadDepth: lookaheadDepth,
                maxDepth: maxDepth,
                minimumBeamWidth: 1,
                maximumBeamWidth: beamWidth,
                rootWidth: startingWord * -1,
                useGuidedScores: false)
            beamWidthResults.append(beamWidthResult)
            
        }
        
        for i in 0..<beamWidthResults.count {
            print("starting word \(startingWords[i]) has beam width of \(beamWidthResults[i])")
        }
        
        return (startingWords, beamWidthResults)
 
    }
    
    public static func optimizeBeamWidth(
        games: [Int],
        lookaheadDepth: Int,
        maxDepth: Int,
        minimumBeamWidth: Int,
        maximumBeamWidth: Int,
        rootWidth: Int,
        useGuidedScores: Bool) async -> [[Int]]
    {
        
        var lowerWidth = 0
        var upperWidth = 0
        var currentWidth = 0

        var result: [[Int]] = []
        for _ in 0..<maximumBeamWidth+1 {
            result.append([])
        }
        var failures: [Int] = []


        for gameId in games {
            
            lowerWidth = minimumBeamWidth
            upperWidth = maximumBeamWidth
            
            let lowerWidthShouldFail = await BranchAndBoundRunner.executeGamesWinningWords(
                games: [gameId],
                lookaheadDepth: lookaheadDepth,
                beamWidth: lowerWidth,
                maxDepth: maxDepth,
                rootWidth: rootWidth,
                useGuidedScores: useGuidedScores)
            
            if lowerWidthShouldFail.count > 0 {
                failures.append(gameId)
                print("game \(gameId) lower width of \(minimumBeamWidth) should not produce a winning game.  Skipping this game.")
                
                
            } else {
            
                let upperWidthShouldSucceed = await BranchAndBoundRunner.executeGamesWinningWords(
                    games: [gameId],
                    lookaheadDepth: lookaheadDepth,
                    beamWidth: upperWidth,
                    maxDepth: maxDepth,
                    rootWidth: rootWidth,
                    useGuidedScores: useGuidedScores)
            
                if upperWidthShouldSucceed.count == 0
                {
                    failures.append(gameId)
                    print("game \(gameId) upper width of \(maximumBeamWidth) should produce a winning game.  Skipping this game.")
                } else {
                    while lowerWidth != upperWidth {
                        
                        currentWidth = Int((Double(lowerWidth) + Double(upperWidth) + 0.5) / 2.0)
                        print ("GAME: \(gameId), LOWER: \(lowerWidth), UPPER: \(upperWidth), CURRENT WIDTH: \(currentWidth)")
                        
                        let winnersForCurrent = await BranchAndBoundRunner.executeGamesWinningWords(
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
                    result[currentWidth].append(gameId)
                }
            }
        }
        if failures.count > 0 {
            print("Failures because they started out of range: \(failures)")
        }
        
        for beamWidth in 0..<maximumBeamWidth+1 {
            if result[beamWidth].count > 0 {
                print("depth\(lookaheadDepth)_width\(beamWidth) = \(result[beamWidth])")
            }
        }
        return result
    }
    
    
    
    public static func findValidStartingWords(
        gameId: Int,
        lookaheadDepth: Int,
        beamWidth: Int,
        maxDepth: Int) async -> [Int]
    {
        
        let winningShapes = GetStartingData.getWinningShapes(gameId: gameId)
        var result: [Int] = []
        for i in 0..<winningShapes.count {
            let startingShape = i * -1

            
            // Using the winning words we find all games that are winning in this case there should be only one
            let winning = await BranchAndBoundRunner.executeGamesWinningWords(
                games: [gameId],
                lookaheadDepth: lookaheadDepth,
                beamWidth: beamWidth,
                maxDepth: maxDepth,
                rootWidth: startingShape,
                useGuidedScores: false)
            
            if winning.count == 1 {
                result.append(startingShape)
            }
        }

        return result
    }
    
    
    
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
    
    
    
    
    
    public static func optimizeBeamWidth(
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
        
        let lowerWidthShouldFail = await BranchAndBoundRunner.executeGamesWinningWords(
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
        
            let upperWidthShouldSucceed = await BranchAndBoundRunner.executeGamesWinningWords(
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
                    
                    let winnersForCurrent = await BranchAndBoundRunner.executeGamesWinningWords(
                        games: [gameId],
                        lookaheadDepth: lookaheadDepth,
                        beamWidth: lowerWidth,
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
