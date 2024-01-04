//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 23/12/2023.
//

import Foundation
public class OptimizeBranchAndBound {
    
    // We want to first optimize by starting word
    // and for each starting word we find the winning game
    // and then we can compare the effort for each starting word.
    // But we also want to see how many beam per depth
    // so we steadily increase the depth too
    
    public static func executeFailuresUsingGuidedScores() async {
        let games: [Int] = []
        await executeWinningGames(
            games: games,
            maxLookaheadDepth: 4,
            maxBeamWidth: 150,
            maxDepth: 30,
            useGuidedScores: true)
                     
    }
    
    public static func executeFailuresNoGuidedScores() async {
        let games: [Int] = []
                    
        await executeWinningGames(
            games: games,
            maxLookaheadDepth: 4,
            maxBeamWidth: 100,
            maxDepth: 30,
            useGuidedScores: false)
                     
    }
    
    public static func executeWinningGames(
        games: [Int], // = [8805, 8807, 8911, 9112, 9203, 9305, 9509]
        maxLookaheadDepth: Int,
        maxBeamWidth: Int,
        maxDepth: Int,
        useGuidedScores: Bool) async
    {
        var result: [String] = []
        for gameId in games {
            let results = await executeWinningGame(
                gameId: gameId,
                maxLookaheadDepth: maxLookaheadDepth,
                maxBeamWidth: maxBeamWidth,
                maxDepth: maxDepth,
                useGuidedScores: useGuidedScores)
            
            result += results
        }
        for item in result {
            print(item)
        }
        
    }
    public static func getWinningShapesToTest(gameId: Int) -> [Int] {
        let winningShapes = GetStartingData.getWinningShapes(gameId: gameId)
        
        // Lets work out the average scores amoungst the winning games and only use the ones that have a score higher than average
        let averageScore = ShapeCalculator.findAverageScore(shapes: winningShapes)
        
        var result: [Int] = []
        
        for i in 0..<winningShapes.count {
            if winningShapes[i].score > averageScore {
                result.append(i)
            }
        }
        return result
    }
    
    public static func executeWinningGame(
        gameId: Int,
        minLookaheadDepth: Int = 1,
        maxLookaheadDepth: Int,
        minBeamWidth: Int = 1,
        maxBeamWidth: Int,
        maxDepth: Int = 30,
        useGuidedScores: Bool) async -> [String]
    {
        var result: [String] = []
        
        // First we find out how many starting shapes are going to be considered
        let startingShapesToTest = getWinningShapesToTest(gameId: gameId)
        
        print("game: \(gameId), numberOfStartingShapesToTest: \(startingShapesToTest.count)")
        
        for lookaheadDepth in minLookaheadDepth..<(maxLookaheadDepth+1) {
            for rootShapeId in 0..<startingShapesToTest.count {
            
                let rootShape = startingShapesToTest[rootShapeId]
                
                let overallStart = DateTimeCalculator.now()
                
                let winningWidth = await optimizeBeamWidth(
                    gameId: gameId,
                    lookaheadDepth: lookaheadDepth,
                    maxDepth: maxDepth,
                    minimumBeamWidth: minBeamWidth,
                    maximumBeamWidth: maxBeamWidth,
                    rootShape: rootShape,
                    rootWidth: 1,
                    useGuidedScores: useGuidedScores)
                
                if winningWidth != -1 {
                    result.append("game: \(gameId), rootShape: \(rootShape), lookaheadDepth: \(lookaheadDepth), beamWidth: \(winningWidth), timeToProcess: \(DateTimeCalculator.duration(start: overallStart))")
                }
            }
        }
        for item in result {
            print(item)
        }
        return result
    }
    
    
    public static func optimizeBeamWidth(
        gameId: Int,
        lookaheadDepth: Int,
        maxDepth: Int,
        minimumBeamWidth: Int,
        maximumBeamWidth: Int,
        rootShape: Int,
        rootWidth: Int,
        useGuidedScores: Bool) async -> Int
    {
        var timeToProcessOneConfiguration = ""

        let overallStart = DateTimeCalculator.now()

        var lowerWidth = minimumBeamWidth
        var upperWidth = maximumBeamWidth
        var currentWidth = 0
        
        let lowerWidthShouldFail = await BranchAndBoundRunner.executeGamesWinningWords(
            games: [gameId],
            lookaheadDepth: lookaheadDepth,
            beamWidth: lowerWidth,
            maxDepth: maxDepth,
            rootShape: rootShape,
            rootWidth: rootWidth,
            useGuidedScores: useGuidedScores)
        
        if lowerWidthShouldFail.count > 0 {
            
            print("game \(gameId) lower width of \(minimumBeamWidth) should not produce a winning game.  Skipping this game.")
            return lowerWidth
            
        } else {
        
            let upperWidthShouldSucceed = await BranchAndBoundRunner.executeGamesWinningWords(
                games: [gameId],
                lookaheadDepth: lookaheadDepth,
                beamWidth: upperWidth,
                maxDepth: maxDepth,
                rootShape: rootShape,
                rootWidth: rootWidth,
                useGuidedScores: useGuidedScores)
        
            if upperWidthShouldSucceed.count == 0
            {
                print("game \(gameId) upper width of \(maximumBeamWidth) should produce a winning game.  Skipping this game.")
                return -1
            } else {
                
                while lowerWidth != upperWidth {
                    
                    currentWidth = Int((Double(lowerWidth) + Double(upperWidth) + 0.5) / 2.0)
                    print ("game: \(gameId), lookaheadDepth: \(lookaheadDepth), rootShape: \(rootShape), lower: \(lowerWidth), upper: \(upperWidth), currentWidth: \(currentWidth)")
                    
                    let testOneConfigurationStart = DateTimeCalculator.now()
                    
                    let winnersForCurrent = await BranchAndBoundRunner.executeGamesWinningWords(
                        games: [gameId],
                        lookaheadDepth: lookaheadDepth,
                        beamWidth: currentWidth,
                        maxDepth: maxDepth,
                        rootShape: rootShape,
                        rootWidth: rootWidth,
                        useGuidedScores: useGuidedScores)
                    timeToProcessOneConfiguration = DateTimeCalculator.duration(start: testOneConfigurationStart)
                    if winnersForCurrent.count == 0 {
                        if currentWidth == lowerWidth {
                            // There is no point trying the lower width again as that was unsuccessful last time too
                            // So we do this one and we will be successful next time
                            lowerWidth += 1
                            currentWidth += 1
                        } else {
                            // currentWidth was unsuccessful so now we set lowerWidth to currentWidth
                            lowerWidth = currentWidth
                        }
                        
                    } else {
                        // current width was successful
                        upperWidth = currentWidth
                        if (currentWidth == (lowerWidth + 1)) {
                            // This will make us exit
                            lowerWidth = upperWidth
                        }
                    }
                }
                
                
                print("FINAL SIZE\ngame: \(gameId), rootShape: \(rootShape), lookaheadDepth: \(lookaheadDepth), beamWidth: \(currentWidth), time: \(timeToProcessOneConfiguration), overallProcessTime: \(DateTimeCalculator.duration(start: overallStart))")
                return currentWidth
            }
        }
    }
}
