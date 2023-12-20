//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 12/11/2023.
//

import Foundation
public class BranchAndBoundRunner {
    
    public static func executeGamesAllWords(
        games: [Int],
        lookaheadDepth: Int,
        beamWidth: Int,
        maxDepth: Int,
        rootWidth: Int,
        useGuidedScores: Bool) async -> [Int] 
    {
            return await BranchAndBoundV3.executeGamesAllWords(games: games, lookaheadDepth: lookaheadDepth, beamWidth: beamWidth, maxDepth: maxDepth, rootWidth: rootWidth, useGuidedScores: useGuidedScores)
    }
    
    public static func executeGamesWinningWords(
        games: [Int],
        lookaheadDepth: Int,
        beamWidth: Int,
        maxDepth: Int,
        rootWidth: Int,
        useGuidedScores: Bool) async -> [Int]
    {
            return await BranchAndBoundV3.executeGamesWinningWords(games: games, lookaheadDepth: lookaheadDepth, beamWidth: beamWidth, maxDepth: maxDepth, rootWidth: rootWidth, useGuidedScores: useGuidedScores)
    }
    
    public static func UseGuidedScores_WinningWords() async {
        var instructions = getBranchAndBoundInstruction_UseGuidedScores_WinningWords()
        
        let overallStart = DateTimeCalculator.now()
        
        var solved: [Int] = []
        
        for instruction in instructions {
            solved += await executeGamesWinningWords(
                games: instruction.games,
                lookaheadDepth: instruction.depth,
                beamWidth: instruction.width,
                maxDepth: instruction.maxDepth,
                rootWidth: instruction.rootWidth,
                useGuidedScores: instruction.useGuidedScores)
        }
        
        let gameList = GameList()
        var missing: [Int] = []
        for game in gameList.games {
            if solved.contains(game.gameId) == false {
                missing.append(game.gameId)
            }
        }
        solved.sort()
        missing.sort()
        print("Solved: \(solved)")
        print("Missing: \(missing)")

        print("Overall Duration: \(DateTimeCalculator.duration(start: overallStart))")
    }
    
    public static func getBranchAndBoundInstruction_UseGuidedScores_WinningWords() -> [BranchAndBoundInstruction] {
        
        var result: [BranchAndBoundInstruction] = []

        result.append(BranchAndBoundInstruction(depth: 1, width: 1, games: [8703, 8802, 8808, 9104, 9212, 9306, 9406], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 1, width: 2, games: [8710, 9311], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 1, width: 3, games: [9412], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 1, width: 5, games: [8711], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 1, width: 8, games: [9108], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 1, width: 17, games: [9510], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 1, width: 27, games: [9503], rootWidth: 1, useGuidedScores: true, maxDepth: 30))

        result.append(BranchAndBoundInstruction(depth: 2, width: 1, games: [8612, 8809, 9002, 9109, 9201, 9211, 9303, 9310, 9312], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 2, width: 2, games: [8702, 8704, 8910, 9105, 9207, 9210], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 2, width: 3, games: [8911, 9004, 9408], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 2, width: 4, games: [8912], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 2, width: 5, games: [9409], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 2, width: 6, games: [9511], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 2, width: 7, games: [9208], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 2, width: 8, games: [9411], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 2, width: 10, games: [9401], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 2, width: 13, games: [9410], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 2, width: 36, games: [8906], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 2, width: 37, games: [9301], rootWidth: 1, useGuidedScores: true, maxDepth: 30))

        result.append(BranchAndBoundInstruction(depth: 3, width: 1, games: [8705, 8712, 8811, 9007, 9008, 9103, 9110, 9111, 9206, 9302, 9308, 9309, 9404, 9502], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 2, games: [8812, 8903, 8910, 9006, 9204, 9304, 9402, 9508], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 3, games: [9009, 9407], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 4, games: [8810, 9003], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 5, games: [9005, 9512], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 6, games: [8907], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 7, games: [9106], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 9, games: [9307], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 10, games: [9506, 9604], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 11, games: [8807, 8902, 9202, 9501], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 14, games: [9010], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 16, games: [9209], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 18, games: [9001, 9011], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 19, games: [9601, 9605], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 21, games: [8908], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 22, games: [9012], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 36, games: [9102], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 49, games: [9603], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 66, games: [9403], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 74, games: [9203], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 98, games: [8909], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 193, games: [8905], rootWidth: 1, useGuidedScores: true, maxDepth: 30))

        result.append(BranchAndBoundInstruction(depth: 4, width: 7, games: [9101], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 4, width: 8, games: [9509], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 4, width: 23, games: [9107], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 4, width: 35, games: [9112], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 4, width: 68, games: [8805], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 4, width: 82, games: [8904], rootWidth: 1, useGuidedScores: true, maxDepth: 30))

        // These are the stranger instructions that do not start with the highest scoring starting shape
        result.append(BranchAndBoundInstruction(depth: 3, width: 4, games: [8804], rootWidth: -2, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 22, games: [9602], rootWidth: -1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 28, games: [8803], rootWidth: -1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 40, games: [9305], rootWidth: -5, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 51, games: [9505], rootWidth: -6, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 77, games: [8806], rootWidth: -8, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 87, games: [9504], rootWidth: -3, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(depth: 3, width: 87, games: [9507], rootWidth: -5, useGuidedScores: false, maxDepth: 30))
        
        return result
    }
    
    
    public static func allShapesThatCanBeSolvedWithAllWords() async {
        
        let depth1_width1 =  [8703]
        let depth1_width25 = [8802, 9306]
        let depth1_width43 = [9212]
        let depth1_width75 = [8710]
        
        let depth2_width1 =  [9002, 9109, 9312]
        let depth2_width50 = [8612, 8702, 8704, 8809, 8910, 8912, 9104, 9105, 9108, 9207, 9310, 9311, 9412]
        let depth2_width75 = [8808, 9210]
        let depth2_width87 = [9303]
        
        let depth3_width1 = [8712, 9007, 9008]
        let depth3_width25 = [8705, 8811, 9103,9308]
        let depth3_width37 = [8711]
        // 32 games full words so far
        
        let solvedGames = [8703, 8802, 9306, 9212, 8710, 9002, 9109, 9312, 8612, 8702,
                      8704, 8809, 8910, 8912, 9104, 9105, 9108, 9207, 9310, 9311,
                      9412, 8808, 9210, 9303, 8712, 9007, 9008, 8705, 8811, 9103,
                      9308, 8711]
        
        let overallStart = DateTimeCalculator.now()
        
        var solved: [Int] = []
        
        solved += await executeGamesAllWords(games: depth1_width1, lookaheadDepth: 1, beamWidth: 1, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesAllWords(games: depth1_width25, lookaheadDepth: 1, beamWidth: 25, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesAllWords(games: depth1_width43, lookaheadDepth: 1, beamWidth: 43, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesAllWords(games: depth1_width75, lookaheadDepth: 1, beamWidth: 75, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        
        solved += await executeGamesAllWords(games: depth2_width1, lookaheadDepth: 2, beamWidth: 1, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesAllWords(games: depth2_width50, lookaheadDepth: 2, beamWidth: 50, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesAllWords(games: depth2_width75, lookaheadDepth: 2, beamWidth: 75, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesAllWords(games: depth2_width87, lookaheadDepth: 2, beamWidth: 87, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        
        solved += await executeGamesAllWords(games: depth3_width1, lookaheadDepth: 3, beamWidth: 1, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesAllWords(games: depth3_width25, lookaheadDepth: 3, beamWidth: 25, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesAllWords(games: depth3_width37, lookaheadDepth: 3, beamWidth: 37, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth3_width3, lookaheadDepth: 3, beamWidth: 3, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth2_width4, lookaheadDepth: 2, beamWidth: 4, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth3_width4, lookaheadDepth: 3, beamWidth: 4, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth1_width5, lookaheadDepth: 1, beamWidth: 5, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth2_width5, lookaheadDepth: 2, beamWidth: 5, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth3_width5, lookaheadDepth: 3, beamWidth: 5, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth2_width6, lookaheadDepth: 2, beamWidth: 6, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth3_width6, lookaheadDepth: 3, beamWidth: 6, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth2_width7, lookaheadDepth: 2, beamWidth: 7, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth3_width7, lookaheadDepth: 3, beamWidth: 7, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth1_width8, lookaheadDepth: 1, beamWidth: 8, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth2_width8, lookaheadDepth: 2, beamWidth: 8, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth3_width9, lookaheadDepth: 3, beamWidth: 9, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth2_width10, lookaheadDepth: 2, beamWidth: 10, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth3_width10, lookaheadDepth: 3, beamWidth: 10, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth3_width11, lookaheadDepth: 3, beamWidth: 11, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth2_width13, lookaheadDepth: 2, beamWidth: 13, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        // changed this one with 9010 and 2909
//        solved += await executeGamesAllWords(games: depth3_width153, lookaheadDepth: 3, beamWidth: 153, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth1_width17, lookaheadDepth: 1, beamWidth: 17, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth3_width18, lookaheadDepth: 3, beamWidth: 18, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth3_width19, lookaheadDepth: 3, beamWidth: 19, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth3_width21, lookaheadDepth: 3, beamWidth: 21, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth3_width22, lookaheadDepth: 3, beamWidth: 22, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth1_width27, lookaheadDepth: 1, beamWidth: 27, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth2_width36, lookaheadDepth: 2, beamWidth: 36, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth3_width36, lookaheadDepth: 3, beamWidth: 36, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth2_width37, lookaheadDepth: 2, beamWidth: 37, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//
//        solved += await executeGamesAllWords(games: depth3_width66, lookaheadDepth: 3, beamWidth: 66, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth3_width107, lookaheadDepth: 3, beamWidth: 107, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth3_width124, lookaheadDepth: 3, beamWidth: 124, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth3_width98, lookaheadDepth: 3, beamWidth: 98, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth3_width193, lookaheadDepth: 3, beamWidth: 193, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth4_width7, lookaheadDepth: 4, beamWidth: 7, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth4_width8, lookaheadDepth: 4, beamWidth: 8, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth4_width23, lookaheadDepth: 4, beamWidth: 23, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth4_width35, lookaheadDepth: 4, beamWidth: 35, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth4_width68, lookaheadDepth: 4, beamWidth: 68, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//        solved += await executeGamesAllWords(games: depth4_width140, lookaheadDepth: 4, beamWidth: 140, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
//
//
//        solved += await BranchAndBoundV3.executeGamesAllWords(
//            games: [8803],
//            lookaheadDepth: 3,
//            beamWidth: 28,
//            maxDepth: 30,
//            rootWidth: -1,
//            useGuidedScores: false)
//
//        // Start from winningWords[2]
//        solved += await BranchAndBoundV3.executeGamesAllWords(
//            games: [8804],
//            lookaheadDepth: 3,
//            beamWidth: 4,
//            maxDepth: 30,
//            rootWidth: -2,
//            useGuidedScores: false)
//
//        // Start from winningWords[8]
//        solved += await BranchAndBoundV3.executeGamesAllWords(
//            games: [8806],
//            lookaheadDepth: 3,
//            beamWidth: 77,
//            maxDepth: 30,
//            rootWidth: -8,
//            useGuidedScores: false)
//
//        // Start from winningWords[5]
//        solved += await BranchAndBoundV3.executeGamesAllWords(
//            games: [9305],
//            lookaheadDepth: 3,
//            beamWidth: 40,
//            maxDepth: 30,
//            rootWidth: -5,
//            useGuidedScores: false)
//
//        // Start from winningWords[3]
//        solved += await BranchAndBoundV3.executeGamesAllWords(
//            games: [9504],
//            lookaheadDepth: 3,
//            beamWidth: 87,
//            maxDepth: 30,
//            rootWidth: -3,
//            useGuidedScores: false)
//
//        // Start from winningWords[6]
//        solved += await BranchAndBoundV3.executeGamesAllWords(
//            games: [9505],
//            lookaheadDepth: 3,
//            beamWidth: 51,
//            maxDepth: 30,
//            rootWidth: -6,
//            useGuidedScores: false)
//
//        // Start from winningWords[6]
//        solved += await BranchAndBoundV3.executeGamesAllWords(
//            games: [9507],
//            lookaheadDepth: 3,
//            beamWidth: 87,
//            maxDepth: 30,
//            rootWidth: -5,
//            useGuidedScores: false)
//
//        // Start from winningWords[1]
//        solved += await BranchAndBoundV3.executeGamesAllWords(
//            games: [9602],
//            lookaheadDepth: 3,
//            beamWidth: 22,
//            maxDepth: 30,
//            rootWidth: -1,
//            useGuidedScores: false)
//
        
        let gameList = GameList()
        var missing: [Int] = []
        for game in gameList.games {
            if solved.contains(game.gameId) == false {
                missing.append(game.gameId)
            }
        }
        solved.sort()
        missing.sort()
        print("Solved: \(solved)")
        print("Missing: \(missing)")

        print("Overall Duration: \(DateTimeCalculator.duration(start: overallStart))")
    }
    
    public static func allShapesThatCanBeSolvedWithoutGuides() async {
        
        let depth1_width1 = [8703, 8802, 8808, 9104, 9212, 9306, 9406]
        let depth2_width1 = [8612, 8809, 9002, 9109, 9201, 9211, 9303, 9310, 9312]
        let depth3_width1 = [8705, 8712, 8811, 9007, 9008, 9103, 9110, 9111, 9206, 9302,
                             9308, 9309, 9404, 9502]
        let depth1_width2 = [8710, 9311]
        let depth2_width2 = [8702, 8704, 8910, 9105, 9207, 9210]
        let depth3_width2 = [8812, 8903, 8910, 9006, 9204, 9304, 9402, 9508]
        let depth1_width3 = [9412]
        let depth2_width3 = [8911, 9004, 9408]
        let depth3_width3 = [9009, 9407]
        let depth2_width4 = [8912]
        let depth3_width4 = [8810, 9003]
        let depth1_width5 = [8711]
        let depth2_width5 = [9409]
        let depth3_width5 = [9005, 9512]
        let depth2_width6 = [9511]
        let depth3_width6 = [8907]
        let depth2_width7 = [9208]
        let depth3_width7 = [9106]
        let depth1_width8 = [9108]
        let depth2_width8 = [9411]
        let depth3_width9 = [9307]
        let depth2_width10 = [9401]
        let depth3_width10 = [9506, 9604]
        let depth3_width11 = [8807, 8902, 9202, 9501]
        let depth2_width13 = [9410]
        
        
        let depth1_width17 = [9510]
        let depth3_width18 = [9001, 9011]
        let depth3_width19 = [9601, 9605]
        let depth3_width21 = [8908]
        let depth3_width22 = [9012]
        let depth1_width27 = [9503]
        let depth2_width36 = [8906]
        let depth3_width36 = [9102]
        let depth2_width37 = [9301]
        
        let depth3_width66 = [9403]
        
        let depth3_width98 = [8909]
        
        //let depth3_width74 = [9203] // only works with guided
        let depth3_width107 = [9203]
        
        
        //let depth3_width49 = [9603] // only works with guided
        let depth3_width124 = [9603]
        //let depth3_width14 = [9010] // only works with guided maxWidth of 100 failed
        //let depth3_width16 = [9209] // only works with guided
        let depth3_width153 = [9010, 9209]
        
        
        let depth3_width193 = [8905]
        let depth4_width7 = [9101]
        let depth4_width8 = [9509]
        let depth4_width23 = [9107]
        let depth4_width35 = [9112]
        let depth4_width68 = [8805]
        //let depth4_width82 = [8904] // only works with guided, last one to solve
        let depth4_width140 = [8904]

        //let depth3_width454 = [9507]
        
        let overallStart = DateTimeCalculator.now()
        
        var solved: [Int] = []
        
        solved += await executeGamesWinningWords(games: depth1_width1, lookaheadDepth: 1, beamWidth: 1, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth2_width1, lookaheadDepth: 2, beamWidth: 1, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth3_width1, lookaheadDepth: 3, beamWidth: 1, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth1_width2, lookaheadDepth: 1, beamWidth: 2, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth2_width2, lookaheadDepth: 2, beamWidth: 2, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth3_width2, lookaheadDepth: 3, beamWidth: 2, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth1_width3, lookaheadDepth: 1, beamWidth: 3, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth2_width3, lookaheadDepth: 2, beamWidth: 3, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth3_width3, lookaheadDepth: 3, beamWidth: 3, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth2_width4, lookaheadDepth: 2, beamWidth: 4, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth3_width4, lookaheadDepth: 3, beamWidth: 4, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth1_width5, lookaheadDepth: 1, beamWidth: 5, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth2_width5, lookaheadDepth: 2, beamWidth: 5, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth3_width5, lookaheadDepth: 3, beamWidth: 5, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth2_width6, lookaheadDepth: 2, beamWidth: 6, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth3_width6, lookaheadDepth: 3, beamWidth: 6, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth2_width7, lookaheadDepth: 2, beamWidth: 7, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth3_width7, lookaheadDepth: 3, beamWidth: 7, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth1_width8, lookaheadDepth: 1, beamWidth: 8, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth2_width8, lookaheadDepth: 2, beamWidth: 8, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth3_width9, lookaheadDepth: 3, beamWidth: 9, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth2_width10, lookaheadDepth: 2, beamWidth: 10, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth3_width10, lookaheadDepth: 3, beamWidth: 10, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth3_width11, lookaheadDepth: 3, beamWidth: 11, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth2_width13, lookaheadDepth: 2, beamWidth: 13, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        // changed this one with 9010 and 2909
        solved += await executeGamesWinningWords(games: depth3_width153, lookaheadDepth: 3, beamWidth: 153, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth1_width17, lookaheadDepth: 1, beamWidth: 17, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth3_width18, lookaheadDepth: 3, beamWidth: 18, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth3_width19, lookaheadDepth: 3, beamWidth: 19, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth3_width21, lookaheadDepth: 3, beamWidth: 21, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth3_width22, lookaheadDepth: 3, beamWidth: 22, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth1_width27, lookaheadDepth: 1, beamWidth: 27, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth2_width36, lookaheadDepth: 2, beamWidth: 36, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth3_width36, lookaheadDepth: 3, beamWidth: 36, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth2_width37, lookaheadDepth: 2, beamWidth: 37, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        
        solved += await executeGamesWinningWords(games: depth3_width66, lookaheadDepth: 3, beamWidth: 66, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth3_width107, lookaheadDepth: 3, beamWidth: 107, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth3_width124, lookaheadDepth: 3, beamWidth: 124, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth3_width98, lookaheadDepth: 3, beamWidth: 98, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth3_width193, lookaheadDepth: 3, beamWidth: 193, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth4_width7, lookaheadDepth: 4, beamWidth: 7, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth4_width8, lookaheadDepth: 4, beamWidth: 8, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth4_width23, lookaheadDepth: 4, beamWidth: 23, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth4_width35, lookaheadDepth: 4, beamWidth: 35, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth4_width68, lookaheadDepth: 4, beamWidth: 68, maxDepth: 30, rootWidth: 1, useGuidedScores: false)
        solved += await executeGamesWinningWords(games: depth4_width140, lookaheadDepth: 4, beamWidth: 140, maxDepth: 30, rootWidth: 1, useGuidedScores: false)

        
        solved += await BranchAndBoundV3.executeGamesWinningWords(
            games: [8803],
            lookaheadDepth: 3,
            beamWidth: 28,
            maxDepth: 30,
            rootWidth: -1,
            useGuidedScores: false)
        
        // Start from winningWords[2]
        solved += await BranchAndBoundV3.executeGamesWinningWords(
            games: [8804],
            lookaheadDepth: 3,
            beamWidth: 4,
            maxDepth: 30,
            rootWidth: -2,
            useGuidedScores: false)
        
        // Start from winningWords[8]
        solved += await BranchAndBoundV3.executeGamesWinningWords(
            games: [8806],
            lookaheadDepth: 3,
            beamWidth: 77,
            maxDepth: 30,
            rootWidth: -8,
            useGuidedScores: false)
        
        // Start from winningWords[5]
        solved += await BranchAndBoundV3.executeGamesWinningWords(
            games: [9305],
            lookaheadDepth: 3,
            beamWidth: 40,
            maxDepth: 30,
            rootWidth: -5,
            useGuidedScores: false)
        
        // Start from winningWords[3]
        solved += await BranchAndBoundV3.executeGamesWinningWords(
            games: [9504],
            lookaheadDepth: 3,
            beamWidth: 87,
            maxDepth: 30,
            rootWidth: -3,
            useGuidedScores: false)
        
        // Start from winningWords[6]
        solved += await BranchAndBoundV3.executeGamesWinningWords(
            games: [9505],
            lookaheadDepth: 3,
            beamWidth: 51,
            maxDepth: 30,
            rootWidth: -6,
            useGuidedScores: false)
        
        // Start from winningWords[6]
        solved += await BranchAndBoundV3.executeGamesWinningWords(
            games: [9507],
            lookaheadDepth: 3,
            beamWidth: 87,
            maxDepth: 30,
            rootWidth: -5,
            useGuidedScores: false)
        
        // Start from winningWords[1]
        solved += await BranchAndBoundV3.executeGamesWinningWords(
            games: [9602],
            lookaheadDepth: 3,
            beamWidth: 22,
            maxDepth: 30,
            rootWidth: -1,
            useGuidedScores: false)
        
        
        let gameList = GameList()
        var missing: [Int] = []
        for game in gameList.games {
            if solved.contains(game.gameId) == false {
                missing.append(game.gameId)
            }
        }
        solved.sort()
        missing.sort()
        print("Solved: \(solved)")
        print("Missing: \(missing)")

        print("Overall Duration: \(DateTimeCalculator.duration(start: overallStart))")
    }
    
    
    public static func allShapesThatCanBeSolved() async {
        
        let depth1_width1 = [8703, 8802, 8808, 9104, 9212, 9306, 9406]
        let depth2_width1 = [8612, 8809, 9002, 9109, 9201, 9211, 9303, 9310, 9312]
        let depth3_width1 = [8705, 8712, 8811, 9007, 9008, 9103, 9110, 9111, 9206, 9302, 9308, 9309, 9404, 9502]
        let depth1_width2 = [8710, 9311]
        let depth2_width2 = [8702, 8704, 8910, 9105, 9207, 9210]
        let depth3_width2 = [8812, 8903, 8910, 9006, 9204, 9304, 9402, 9508]
        let depth1_width3 = [9412]
        let depth2_width3 = [8911, 9004, 9408]
        let depth3_width3 = [9009, 9407]
        let depth2_width4 = [8912]
        let depth3_width4 = [8810, 9003]
        let depth1_width5 = [8711]
        let depth2_width5 = [9409]
        let depth3_width5 = [9005, 9512]
        let depth2_width6 = [9511]
        let depth3_width6 = [8907]
        let depth2_width7 = [9208]
        let depth3_width7 = [9106]
        let depth1_width8 = [9108]
        let depth2_width8 = [9411]
        let depth3_width9 = [9307]
        let depth2_width10 = [9401]
        let depth3_width10 = [9506, 9604]
        let depth3_width11 = [8807, 8902, 9202, 9501]
        let depth2_width13 = [9410]
        let depth3_width14 = [9010]
        let depth3_width16 = [9209]
        let depth1_width17 = [9510]
        let depth3_width18 = [9001, 9011]
        let depth3_width19 = [9601, 9605]
        let depth3_width21 = [8908]
        let depth3_width22 = [9012]
        let depth1_width27 = [9503]
        let depth2_width36 = [8906]
        let depth3_width36 = [9102]
        let depth2_width37 = [9301]
        let depth3_width49 = [9603]
        let depth3_width66 = [9403]
        let depth3_width74 = [9203]
        let depth3_width98 = [8909]
        let depth3_width193 = [8905]
        let depth4_width7 = [9101]
        let depth4_width8 = [9509]
        let depth4_width23 = [9107]
        let depth4_width35 = [9112]
        let depth4_width68 = [8805]
        let depth4_width82 = [8904]

        //let depth3_width454 = [9507]
        
        let overallStart = DateTimeCalculator.now()
        
        var solved: [Int] = []
        
        solved += await executeGamesWinningWords(games: depth1_width1, lookaheadDepth: 1, beamWidth: 1, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth2_width1, lookaheadDepth: 2, beamWidth: 1, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth3_width1, lookaheadDepth: 3, beamWidth: 1, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth1_width2, lookaheadDepth: 1, beamWidth: 2, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth2_width2, lookaheadDepth: 2, beamWidth: 2, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth3_width2, lookaheadDepth: 3, beamWidth: 2, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth1_width3, lookaheadDepth: 1, beamWidth: 3, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth2_width3, lookaheadDepth: 2, beamWidth: 3, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth3_width3, lookaheadDepth: 3, beamWidth: 3, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth2_width4, lookaheadDepth: 2, beamWidth: 4, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth3_width4, lookaheadDepth: 3, beamWidth: 4, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth1_width5, lookaheadDepth: 1, beamWidth: 5, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth2_width5, lookaheadDepth: 2, beamWidth: 5, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth3_width5, lookaheadDepth: 3, beamWidth: 5, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth2_width6, lookaheadDepth: 2, beamWidth: 6, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth3_width6, lookaheadDepth: 3, beamWidth: 6, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth2_width7, lookaheadDepth: 2, beamWidth: 7, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth3_width7, lookaheadDepth: 3, beamWidth: 7, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth1_width8, lookaheadDepth: 1, beamWidth: 8, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth2_width8, lookaheadDepth: 2, beamWidth: 8, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth3_width9, lookaheadDepth: 3, beamWidth: 9, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth2_width10, lookaheadDepth: 2, beamWidth: 10, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth3_width10, lookaheadDepth: 3, beamWidth: 10, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth3_width11, lookaheadDepth: 3, beamWidth: 11, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth2_width13, lookaheadDepth: 2, beamWidth: 13, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth3_width14, lookaheadDepth: 3, beamWidth: 14, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth3_width16, lookaheadDepth: 3, beamWidth: 16, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth1_width17, lookaheadDepth: 1, beamWidth: 17, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth3_width18, lookaheadDepth: 3, beamWidth: 18, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth3_width19, lookaheadDepth: 3, beamWidth: 19, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth3_width21, lookaheadDepth: 3, beamWidth: 21, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth3_width22, lookaheadDepth: 3, beamWidth: 22, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth1_width27, lookaheadDepth: 1, beamWidth: 27, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth2_width36, lookaheadDepth: 2, beamWidth: 36, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth3_width36, lookaheadDepth: 3, beamWidth: 36, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth2_width37, lookaheadDepth: 2, beamWidth: 37, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth3_width49, lookaheadDepth: 3, beamWidth: 49, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth3_width66, lookaheadDepth: 3, beamWidth: 66, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth3_width74, lookaheadDepth: 3, beamWidth: 74, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth3_width98, lookaheadDepth: 3, beamWidth: 98, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth3_width193, lookaheadDepth: 3, beamWidth: 193, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth4_width7, lookaheadDepth: 4, beamWidth: 7, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth4_width8, lookaheadDepth: 4, beamWidth: 8, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth4_width23, lookaheadDepth: 4, beamWidth: 23, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth4_width35, lookaheadDepth: 4, beamWidth: 35, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth4_width68, lookaheadDepth: 4, beamWidth: 68, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesWinningWords(games: depth4_width82, lookaheadDepth: 4, beamWidth: 82, maxDepth: 30, rootWidth: 1, useGuidedScores: true)

        
        solved += await BranchAndBoundV3.executeGamesWinningWords(
            games: [8803],
            lookaheadDepth: 3,
            beamWidth: 28,
            maxDepth: 30,
            rootWidth: -1,
            useGuidedScores: false)
        
        // Start from winningWords[2]
        solved += await BranchAndBoundV3.executeGamesWinningWords(
            games: [8804],
            lookaheadDepth: 3,
            beamWidth: 4,
            maxDepth: 30,
            rootWidth: -2,
            useGuidedScores: false)
        
        // Start from winningWords[8]
        solved += await BranchAndBoundV3.executeGamesWinningWords(
            games: [8806],
            lookaheadDepth: 3,
            beamWidth: 77,
            maxDepth: 30,
            rootWidth: -8,
            useGuidedScores: false)
        
        // Start from winningWords[5]
        solved += await BranchAndBoundV3.executeGamesWinningWords(
            games: [9305],
            lookaheadDepth: 3,
            beamWidth: 40,
            maxDepth: 30,
            rootWidth: -5,
            useGuidedScores: false)
        
        // Start from winningWords[3]
        solved += await BranchAndBoundV3.executeGamesWinningWords(
            games: [9504],
            lookaheadDepth: 3,
            beamWidth: 87,
            maxDepth: 30,
            rootWidth: -3,
            useGuidedScores: false)
        
        // Start from winningWords[6]
        solved += await BranchAndBoundV3.executeGamesWinningWords(
            games: [9505],
            lookaheadDepth: 3,
            beamWidth: 51,
            maxDepth: 30,
            rootWidth: -6,
            useGuidedScores: false)
        
        // Start from winningWords[6]
        solved += await BranchAndBoundV3.executeGamesWinningWords(
            games: [9507],
            lookaheadDepth: 3,
            beamWidth: 87,
            maxDepth: 30,
            rootWidth: -5,
            useGuidedScores: false)
        
        // Start from winningWords[1]
        solved += await BranchAndBoundV3.executeGamesWinningWords(
            games: [9602],
            lookaheadDepth: 3,
            beamWidth: 22,
            maxDepth: 30,
            rootWidth: -1,
            useGuidedScores: false)
        
        
        let gameList = GameList()
        var missing: [Int] = []
        for game in gameList.games {
            if solved.contains(game.gameId) == false {
                missing.append(game.gameId)
            }
        }
        solved.sort()
        missing.sort()
        print("Solved: \(solved)")
        print("Missing: \(missing)")

        print("Overall Duration: \(DateTimeCalculator.duration(start: overallStart))")
    }
    
    
    
    public static func executeGamesAllWords_TryAllWordsRatherThanWinningWordsWithGuidedScores() async {
        
        let depth1_width1 = [8703, 8802, 8808, 9104, 9212, 9306, 9406]
        let depth2_width1 = [8612, 8809, 9002, 9109, 9201, 9211, 9303, 9310, 9312]
        let depth3_width1 = [8705, 8712, 8811, 9007, 9008, 9103, 9110, 9111, 9206, 9302, 9308, 9309, 9404, 9502]
        let depth1_width2 = [8710, 9311]
        let depth2_width2 = [8702, 8704, 8910, 9105, 9207, 9210]
        let depth3_width2 = [8812, 8903, 8910, 9006, 9204, 9304, 9402, 9508]
        let depth1_width3 = [9412]
        let depth2_width3 = [8911, 9004, 9408]
        let depth3_width3 = [9009, 9407]
        let depth2_width4 = [8912]
        let depth3_width4 = [8810, 9003]
        let depth1_width5 = [8711]
        let depth2_width5 = [9409]
        let depth3_width5 = [9005, 9512]
        let depth2_width6 = [9511]
        let depth3_width6 = [8907]
        let depth2_width7 = [9208]
        let depth3_width7 = [9106]
        let depth1_width8 = [9108]
        let depth2_width8 = [9411]
        let depth3_width9 = [9307]
        let depth2_width10 = [9401]
        let depth3_width10 = [9506, 9604]
        let depth3_width11 = [8807, 8902, 9202, 9501]
        let depth2_width13 = [9410]
        let depth3_width14 = [9010]
        let depth3_width16 = [9209]
        let depth1_width17 = [9510]
        let depth3_width18 = [9001, 9011]
        let depth3_width19 = [9601, 9605]
        let depth3_width21 = [8908]
        let depth3_width22 = [9012]
        let depth1_width27 = [9503]
        let depth2_width36 = [8906]
        let depth3_width36 = [9102]
        let depth2_width37 = [9301]
        let depth3_width49 = [9603]
        let depth3_width66 = [9403]
        let depth3_width74 = [9203]
        let depth3_width98 = [8909]
        let depth3_width193 = [8905]
        let depth4_width7 = [9101]
        let depth4_width8 = [9509]
        let depth4_width23 = [9107]
        let depth4_width35 = [9112]
        let depth4_width68 = [8805]
        let depth4_width82 = [8904]

        //let depth3_width454 = [9507]
        
        let overallStart = DateTimeCalculator.now()
        
        var solved: [Int] = []
        
        solved += await executeGamesAllWords(games: depth1_width1, lookaheadDepth: 1, beamWidth: 1, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth2_width1, lookaheadDepth: 2, beamWidth: 1, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth3_width1, lookaheadDepth: 3, beamWidth: 1, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth1_width2, lookaheadDepth: 1, beamWidth: 2, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth2_width2, lookaheadDepth: 2, beamWidth: 2, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth3_width2, lookaheadDepth: 3, beamWidth: 2, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth1_width3, lookaheadDepth: 1, beamWidth: 3, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth2_width3, lookaheadDepth: 2, beamWidth: 3, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth3_width3, lookaheadDepth: 3, beamWidth: 3, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth2_width4, lookaheadDepth: 2, beamWidth: 4, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth3_width4, lookaheadDepth: 3, beamWidth: 4, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth1_width5, lookaheadDepth: 1, beamWidth: 5, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth2_width5, lookaheadDepth: 2, beamWidth: 5, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth3_width5, lookaheadDepth: 3, beamWidth: 5, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth2_width6, lookaheadDepth: 2, beamWidth: 6, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth3_width6, lookaheadDepth: 3, beamWidth: 6, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth2_width7, lookaheadDepth: 2, beamWidth: 7, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth3_width7, lookaheadDepth: 3, beamWidth: 7, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth1_width8, lookaheadDepth: 1, beamWidth: 8, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth2_width8, lookaheadDepth: 2, beamWidth: 8, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth3_width9, lookaheadDepth: 3, beamWidth: 9, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth2_width10, lookaheadDepth: 2, beamWidth: 10, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth3_width10, lookaheadDepth: 3, beamWidth: 10, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth3_width11, lookaheadDepth: 3, beamWidth: 11, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth2_width13, lookaheadDepth: 2, beamWidth: 13, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth3_width14, lookaheadDepth: 3, beamWidth: 14, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth3_width16, lookaheadDepth: 3, beamWidth: 16, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth1_width17, lookaheadDepth: 1, beamWidth: 17, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth3_width18, lookaheadDepth: 3, beamWidth: 18, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth3_width19, lookaheadDepth: 3, beamWidth: 19, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth3_width21, lookaheadDepth: 3, beamWidth: 21, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth3_width22, lookaheadDepth: 3, beamWidth: 22, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth1_width27, lookaheadDepth: 1, beamWidth: 27, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth2_width36, lookaheadDepth: 2, beamWidth: 36, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth3_width36, lookaheadDepth: 3, beamWidth: 36, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth2_width37, lookaheadDepth: 2, beamWidth: 37, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth3_width49, lookaheadDepth: 3, beamWidth: 49, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth3_width66, lookaheadDepth: 3, beamWidth: 66, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth3_width74, lookaheadDepth: 3, beamWidth: 74, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth3_width98, lookaheadDepth: 3, beamWidth: 98, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth3_width193, lookaheadDepth: 3, beamWidth: 193, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth4_width7, lookaheadDepth: 4, beamWidth: 7, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth4_width8, lookaheadDepth: 4, beamWidth: 8, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth4_width23, lookaheadDepth: 4, beamWidth: 23, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth4_width35, lookaheadDepth: 4, beamWidth: 35, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth4_width68, lookaheadDepth: 4, beamWidth: 68, maxDepth: 30, rootWidth: 1, useGuidedScores: true)
        solved += await executeGamesAllWords(games: depth4_width82, lookaheadDepth: 4, beamWidth: 82, maxDepth: 30, rootWidth: 1, useGuidedScores: true)

        
        solved += await executeGamesAllWords(
            games: [8803],
            lookaheadDepth: 3,
            beamWidth: 28,
            maxDepth: 30,
            rootWidth: -1,
            useGuidedScores: false)
        
        // Start from winningWords[2]
        solved += await executeGamesAllWords(
            games: [8804],
            lookaheadDepth: 3,
            beamWidth: 4,
            maxDepth: 30,
            rootWidth: -2,
            useGuidedScores: false)
        
        // Start from winningWords[8]
        solved += await executeGamesAllWords(
            games: [8806],
            lookaheadDepth: 3,
            beamWidth: 77,
            maxDepth: 30,
            rootWidth: -8,
            useGuidedScores: false)
        
        // Start from winningWords[5]
        solved += await executeGamesAllWords(
            games: [9305],
            lookaheadDepth: 3,
            beamWidth: 40,
            maxDepth: 30,
            rootWidth: -5,
            useGuidedScores: false)
        
        // Start from winningWords[3]
        solved += await executeGamesAllWords(
            games: [9504],
            lookaheadDepth: 3,
            beamWidth: 87,
            maxDepth: 30,
            rootWidth: -3,
            useGuidedScores: false)
        
        // Start from winningWords[6]
        solved += await executeGamesAllWords(
            games: [9505],
            lookaheadDepth: 3,
            beamWidth: 51,
            maxDepth: 30,
            rootWidth: -6,
            useGuidedScores: false)
        
        // Start from winningWords[6]
        solved += await executeGamesAllWords(
            games: [9507],
            lookaheadDepth: 3,
            beamWidth: 87,
            maxDepth: 30,
            rootWidth: -5,
            useGuidedScores: false)
        
        // Start from winningWords[1]
        solved += await executeGamesAllWords(
            games: [9602],
            lookaheadDepth: 3,
            beamWidth: 22,
            maxDepth: 30,
            rootWidth: -1,
            useGuidedScores: false)
        
        
        let gameList = GameList()
        var missing: [Int] = []
        for game in gameList.games {
            if solved.contains(game.gameId) == false {
                missing.append(game.gameId)
            }
        }
        solved.sort()
        missing.sort()
        print("Solved: \(solved)")
        print("Missing: \(missing)")

        print("Overall Duration: \(DateTimeCalculator.duration(start: overallStart))")
    }
    
    
}
