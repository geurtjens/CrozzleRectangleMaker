//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 12/11/2023.
//

import Foundation
public class BranchAndBoundRunner {
    
    public static func WinningWords_NoGuidedScores() async {
        let instructions = BranchAndBound_GetInstructions.WinningWords_NoGuidedScores()
        await UseWinningWords(instructions: instructions)
    }
    
    
    public static func WinningWords_UseGuidedScores() async {
        let instructions = BranchAndBound_GetInstructions.WinningWords_UseGuidedScores()
        await UseWinningWords(instructions: instructions)
    }
    
    
    public static func AllWords_NoGuidedScores() async {
        let instructions = BranchAndBound_GetInstructions.AllWords_NoGuidedScores()
        await UseAllWords(instructions: instructions)
    }
    
    
    public static func UseWinningWords(instructions: [BranchAndBoundInstruction]) async {

        let overallStart = DateTimeCalculator.now()
        
        var solved: [Int] = []
        
        for instruction in instructions {
            solved += await BranchAndBoundV3.executeGamesWinningWords(
                games: instruction.games,
                lookaheadDepth: instruction.lookaheadDepth,
                beamWidth: instruction.beamWidth,
                maxDepth: instruction.maxDepth,
                rootWidth: instruction.rootWidth,
                useGuidedScores: instruction.useGuidedScores)
        }
        
        PrintResults(overallStart: overallStart, solved: solved)
    }
    
    public static func UseAllWords(instructions: [BranchAndBoundInstruction]) async {
        
        let overallStart = DateTimeCalculator.now()
        
        var solved: [Int] = []
        
        for instruction in instructions {
            solved += await BranchAndBoundV3.executeGamesAllWords(
                games: instruction.games,
                lookaheadDepth: instruction.lookaheadDepth,
                beamWidth: instruction.beamWidth,
                maxDepth: instruction.maxDepth,
                rootWidth: instruction.rootWidth,
                useGuidedScores: instruction.useGuidedScores)
        }
        
        PrintResults(overallStart: overallStart, solved: solved)
        
    }
    
    public static func PrintResults(overallStart: DispatchTime, solved: [Int]) {
        let gameList = GameList()
        var missing: [Int] = []
        for game in gameList.games {
            if solved.contains(game.gameId) == false {
                missing.append(game.gameId)
            }
        }
        var solved = solved
        solved.sort()
        missing.sort()
        print("Solved: \(solved)")
        print("Missing: \(missing)")

        print("Overall Duration: \(DateTimeCalculator.duration(start: overallStart))")
    }

}
