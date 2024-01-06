//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 12/11/2023.
//

import Foundation
public class BranchAndBoundRunner {
    
    
    public static func AllWords_NoGuidedScores() async {
        let instructions = BranchAndBound_GetInstructions.AllWords_NoGuidedScores()
        await UseAllWords(instructions: instructions)
    }
    
    
    public static func AllWords_UseGuidedScores() async {
        let instructions = BranchAndBound_GetInstructions.AllWords_UseGuidedScores()
        await UseAllWords(instructions: instructions)
    }
    
    
    public static func WinningWords_NoGuidedScores() async {
        let instructions = BranchAndBound_GetInstructions.WinningWords_NoGuidedScores()
        await UseWinningWords(instructions: instructions)
    }
    
    
    public static func WinningWords_UseGuidedScores() async {
        let instructions = BranchAndBound_GetInstructions.WinningWords_UseGuidedScores()
        await UseWinningWords(instructions: instructions)
    }
    

    public static func UseWinningWords(instructions: [BranchAndBoundInstruction]) async {

        let overallStart = DateTimeCalculator.now()
        
        var solved: [Int] = []
        
        for instruction in instructions {
            solved += await executeGamesWinningWords(
                games: instruction.games,
                lookaheadDepth: instruction.lookaheadDepth,
                beamWidth: instruction.beamWidth,
                maxDepth: instruction.maxDepth,
                rootShape: instruction.rootShape,
                rootWidth: instruction.rootWidth,
                useGuidedScores: instruction.useGuidedScores)
        }
        
        PrintResults(overallStart: overallStart, solved: solved)
    }
    
    
    public static func UseAllWords(instructions: [BranchAndBoundInstruction]) async {
        
        let overallStart = DateTimeCalculator.now()
        
        var solved: [Int] = []
        
        for instruction in instructions {
            solved += await executeGamesAllWords(
                games: instruction.games,
                lookaheadDepth: instruction.lookaheadDepth,
                beamWidth: instruction.beamWidth,
                maxDepth: instruction.maxDepth,
                rootShape: instruction.rootShape,
                rootWidth: instruction.rootWidth,
                useGuidedScores: instruction.useGuidedScores)
        }
        
        PrintResults(overallStart: overallStart, solved: solved)
        
    }
    
    
    // Used by UseAllWords and optimizeBeamWidthAllWords
    public static func executeGamesAllWords(
        games: [Int],
        lookaheadDepth: Int,
        beamWidth: Int,
        maxDepth: Int,
        rootShape: Int,
        rootWidth: Int,
        useGuidedScores: Bool) async -> [Int]
    {
        
        let startTime = DateTimeCalculator.now()
        
        let gameList = GameList()
        
        var successfulGames: [Int] = []
        print("\"lookaheadDepth\": \(lookaheadDepth), \"beamWidth\": \(beamWidth), \"rootWidth\": \(rootWidth), \"maxDepth\": \(maxDepth), \"games\": \(games.count)")
        print(games)
        for game in gameList.games {
            if games.contains(game.gameId) {
                
                let bestShape = await BranchAndBoundV3.Execute(
                    gameId: game.gameId,
                    words: game.words,
                    lookaheadDepth: lookaheadDepth,
                    beamWidth: beamWidth,
                    maxDepth: maxDepth,
                    rootShape: rootShape,
                    rootWidth: rootWidth,
                    winningScore: game.winningScore,
                    useGuidedScores: useGuidedScores)
                
                if bestShape.score >= game.winningScore {
                    successfulGames.append(game.gameId)
                }
            }
        }
        //print(successfulGames)
        print("\"lookaheadDepth\": \(lookaheadDepth), \"beamWidth\": \(beamWidth), \"successes\": \(successfulGames.count), \"time\": \"\(DateTimeCalculator.duration(start: startTime))\"")
        if successfulGames.count == games.count {
            print("ALL GAMES SUCCEEDED")
            print("FOUND \(successfulGames)")
        } else {
            let missing = Array(Set(games).subtracting(Set(successfulGames))).sorted()
            print("MISSING \(missing)")
            print("FOUND \(successfulGames)")
        }
        return successfulGames
    }
    
    
    /// Executes all games according to the parameters give
    /// - Parameters:
    ///   - games: An array of game id's that we want to process with the given parameters
    ///   - lookaheadDepth: How deep we want to go down before deciding if that option is good
    ///   - beamWidth: The top K shapes that we will continue with according to beam search algorithm
    ///   - maxDepth: Maximum number of nodes down from the starting node to the last node visited
    ///   - rootWidth: how many shapes are included when we first begin
    ///   - useGuidedScores: limit the scores to what the human winning score was when it started with the highest scoring shape.  So it has a score for each number of words
    /// - Returns: list of game id's have have been solved, that is that we get human winning score
    // Used by UseWinningWords and optimizeBeamWidth
    public static func executeGamesWinningWords(
        games: [Int],
        lookaheadDepth: Int,
        beamWidth: Int,
        maxDepth: Int,
        rootShape: Int,
        rootWidth: Int,
        useGuidedScores: Bool) async -> [Int]
    {
        
        let startTime = DateTimeCalculator.now()
        
        let gameList = GameList()
        
        var successfulGames: [Int] = []
        print("{\"lookaheadDepth\": \(lookaheadDepth), \"beamWidth\": \(beamWidth), \"rootWidth\": \(rootWidth), \"maxDepth\": \(maxDepth), \"gameCount\": \(games.count), \"gameIds\": \(games), \"games\": [\n")
        
        for game in gameList.games {
            if games.contains(game.gameId) {
                
                let bestShape = await BranchAndBoundV3.Execute(
                    gameId: game.gameId,
                    words: game.winningWords,
                    lookaheadDepth: lookaheadDepth,
                    beamWidth: beamWidth,
                    maxDepth: maxDepth,
                    rootShape: rootShape,
                    rootWidth: rootWidth,
                    winningScore: game.winningScore,
                    useGuidedScores: useGuidedScores)
                
                if bestShape.score >= game.winningScore {
                    successfulGames.append(game.gameId)
                }
            }
        }
        //print(successfulGames)
        print("\"lookaheadDepth\": \(lookaheadDepth), \"beamWidth\": \(beamWidth), \"successes\": \(successfulGames.count), \"time\": \"\(DateTimeCalculator.duration(start: startTime))\"")
        if successfulGames.count == games.count {
            print("ALL GAMES SUCCEEDED")
            print("FOUND \(successfulGames)")
        } else {
            let missing = Array(Set(games).subtracting(Set(successfulGames))).sorted()
            print("MISSING \(missing)")
            print("FOUND \(successfulGames)")
        }
        return successfulGames
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
