//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 21/12/2023.
//

import Foundation
/// Provides functions that returns BranchAndBoundInstructions that can then be used either on winning words or all words
public struct BranchAndBound_GetInstructions {
    
    public static func AllWords_NoGuidedScores() -> [BranchAndBoundInstruction]
    {
        
        var result: [BranchAndBoundInstruction] = []

        //2 seconds
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 25, games: [8802, 9306], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        
        //31 seconds
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 43, games: [9212], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        
        // 6.622475541 seconds
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 75, games: [8710], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        
        // 6.622475541 seconds, 0.340007792 seconds, 6.218686583 seconds
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 1, games: [9002, 9109, 9312], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        
        // 44 seconds, 1 minutes 41 seconds, 5 minutes 5 seconds, 12 minutes 13 seconds
        // 11 seconds, 3 minutes 43 seconds, 1 minutes 58 seconds, 26 seconds
        // 11 seconds, 5.604520625 seconds, 50 seconds, 8 minutes 17 seconds
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 50, games:
            [8612, 8704, 8809, 8910, 
             8912, 9104, 9105, 9108, 
             9207, 9310, 9311, 9412], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        
        // 5 minutes 43 seconds, 4 minutes 9 seconds
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 75, games:
            [8808, 9210], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        
        // 12 minutes 10 seconds
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 87, games: [9303], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        
        // 14 minutes 15 seconds, 5.675033375 seconds, 1 hours 26 minutes 3 seconds
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 1, games:
            [8712, 9007, 9008], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        
        //53 seconds, 45 minutes 38 seconds, 19 minutes 38 seconds
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 25, games:
            [8705, 8811, 9103], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        
        // 32 games full words so far
        
        let solvedGames = [
            8612, 
            8704, 8710, 8712,
            8802, 8808, 8809, 8910, 8811, 8912,
            9002, 9007, 9008,
            9103, 9104, 9105, 9108, 9109,
            9207, 9210, 9212,
            9303, 9306, 9310, 9311, 9312,
            9412]
        
        return result
        
    }
    
    public static func AllWords_UseGuidedScores() -> [BranchAndBoundInstruction]
    {
        
        var result: [BranchAndBoundInstruction] = []

        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 1, games: [8703], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 25, games: [8802, 9306], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 43, games: [9212], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 75, games: [8710], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 1, games: [9002, 9109, 9312], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 50, games: [8612, 8702, 8704, 8809, 8910, 8912, 9104, 9105, 9108, 9207, 9310, 9311, 9412], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 75, games: [8808, 9210], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 87, games: [9303], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 1, games: [8712, 9007, 9008], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 25, games: [8705, 8811, 9103, 9308], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 37, games: [8711], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        // 32 games full words so far
        
//        let solvedGames = [8703, 8802, 9306, 9212, 8710, 9002, 9109, 9312, 8612, 8702, 8704, 8809, 8910, 8912, 9104, 9105, 9108, 9207, 9310, 9311, 9412, 8808, 9210, 9303, 8712, 9007, 9008, 8705, 8811, 9103, 9308, 8711]
        
        return result
        
    }
    
    
    public static func WinningWords_NoGuidedScores() -> [BranchAndBoundInstruction]
    {

        var result: [BranchAndBoundInstruction] = []
        
        
        //game: 8807, rootShape: 1, lookaheadDepth: 1, beamWidth: 62, time: 0.133436333 seconds
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 62, games: [8807], rootShape: 1, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        // game: 9101, rootShape: 2, lookaheadDepth: 2, beamWidth: 2, time: 0.69246425 seconds,
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 2, games: [9101], rootShape: 2, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        //game: 9210, rootShape: 0, lookaheadDepth: 1, beamWidth: 38, time: 0.225481542 seconds
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 38, games: [9210], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        // game: 9301, rootShape: 4, lookaheadDepth: 1, beamWidth: 32, time: 0.127628875 seconds
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 32, games: [9301], rootShape: 4, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        // game: 9303, rootShape: 0, lookaheadDepth: 1, beamWidth: 42, time: 0.246056209 seconds
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 42, games: [9303], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        //game: 9508, rootShape: 1, lookaheadDepth: 1, beamWidth: 12, time: 0.1506745 seconds
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 12, games: [9508], rootShape: 1, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        //game: 9605, rootShape: 0, lookaheadDepth: 2, beamWidth: 30, time: 1.970560458 seconds
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 30, games: [9605], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 40, games: [9305], rootShape: 5, rootWidth: 1, useGuidedScores: false, maxDepth: 30))

        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 80, games: [9509], rootShape: 2, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 56, games: [9203], rootShape: 2, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 76, games: [9112], rootShape: 3, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 13, games: [8911], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        
        
        
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 1, games: [8703, 8802, 8808, 9104, 9212, 9306, 9406], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 2, games: [8710, 9311], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 3, games: [9412], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 5, games: [8711], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 8, games: [9108], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 17, games: [9510], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 27, games: [9503], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 1, games: [8612, 8809, 9002, 9109, 9201, 9211, 9310, 9312], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 2, games: [8702, 8704, 8910, 9105, 9207], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 3, games: [
            8911,9004, 9408], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 4, games: [8912], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 5, games: [9409], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 6, games: [9511], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 7, games: [9208], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 8, games: [9411], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 10, games: [9401], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 13, games: [9410], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 36, games: [8906], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 1, games: [8705, 8712, 8811, 9007, 9008, 9103, 9110, 9111, 9206, 9302, 9308, 9309, 9404, 9502], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 2, games: [8812, 8903, 8910, 9006, 9204, 9304, 9402], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 3, games: [9009, 9407], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 4, games: [8810, 9003], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 5, games: [9005, 9512], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 6, games: [8907], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 7, games: [9106], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 9, games: [9307], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 10, games: [9506, 9604], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 11, games: [8902, 9202, 9501], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 18, games: [9001, 9011], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 19, games: [9601], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 21, games: [8908], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 22, games: [9012], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 36, games: [9102], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 66, games: [9403], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 98, games: [8909], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 107, games: [9203], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 124, games: [9603], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 153, games: [9010, 9209], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 193, games: [8905], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 454, games: [9507], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        
        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 8, games: [9509], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 23, games: [9107], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 35, games: [9112], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 68, games: [8805], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 82, games: [8904], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 140, games: [8904], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        

        // These are the stranger instructions that do not start with the highest scoring starting shape same as other winning word result
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 4, games: [8804], rootShape: 2, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 22, games: [9602], rootShape: 1, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 28, games: [8803], rootShape: 1, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 40, games: [9305], rootShape: 5, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 51, games: [9505], rootShape: 6, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 77, games: [8806], rootShape: 8, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 87, games: [9504], rootShape: 3, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 87, games: [9507], rootShape: 5, rootWidth: 1, useGuidedScores: false, maxDepth: 30))

        return result
    }
    
    
    public static func WinningWords_UseGuidedScores_NotWorking() -> [BranchAndBoundInstruction] {
        
        var result: [BranchAndBoundInstruction] = []
        
    
    
    
    // No solution found for 9305
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 40, games: [9305], rootShape: 5, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        
        
        return result
    }
    public static func WinningWords_UseGuidedScores() -> [BranchAndBoundInstruction] {
        
        var result: [BranchAndBoundInstruction] = []
        
        //game: 9605, rootShape: 0, lookaheadDepth: 2, beamWidth: 30, timeToProcess: 23 seconds
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 30, games: [9605], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        //game: 9508, rootShape: 1, lookaheadDepth: 1, beamWidth: 12, timeToProcess: 3.276351833 seconds
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 12, games: [9508], rootShape: 1, rootWidth: 1, useGuidedScores: true, maxDepth: 30))

        //game: 9305, rootShape: 5, lookaheadDepth: 3, beamWidth: 40, timeToProcess: 3 minutes 3 seconds
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 40, games: [9305], rootShape: 5, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        
        //game: 9303, rootShape: 0, lookaheadDepth: 1, beamWidth: 42, timeToProcess: 2.696548833 seconds
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 42, games: [9303], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        
        //game: 9301, rootShape: 4, lookaheadDepth: 1, beamWidth: 32, timeToProcess: 1.511229042 seconds
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 32, games: [9301], rootShape: 4, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        
        //game: 9210, rootShape: 0, lookaheadDepth: 1, beamWidth: 38, timeToProcess: 2.649913667 seconds
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 38, games: [9210], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        
        //game: 9201, rootShape: 0, lookaheadDepth: 1, beamWidth: 3, time: 0.332093416 seconds
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 3, games: [9201], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        
        //game: 9101, rootShape: 2, lookaheadDepth: 4, beamWidth: 1, timeToProcess: 11 seconds
        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 1, games: [9101], rootShape: 2, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 90, games: [9203], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 62, games: [8807], rootShape: 1, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 1, games: [8802, 8808, 9104, 9212, 9306, 9406], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 2, games: [8710, 9311], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 3, games: [9412], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 5, games: [8711], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 8, games: [9108], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 17, games: [9510], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 27, games: [9503], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 50, games: [8911], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 87, games: [9509], rootShape: 2, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 1, games: [8612, 8809, 9002, 9109, 9211, 9310, 9312], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 2, games: [8702, 8704, 8910, 9105, 9207, 9210], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 3, games: [9004, 9408], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 4, games: [8912], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 5, games: [9409], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 6, games: [9511], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 7, games: [9208], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 8, games: [9411], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 10, games: [9401], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 13, games: [9410], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 36, games: [8906], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 99, games: [8805], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 1, games: [9112], rootShape: 3, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 1, games: [8705, 8712, 8811, 9007, 9008, 9103, 9110, 9111, 9206, 9302, 9308, 9309, 9404, 9502], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 2, games: [8812, 8903, 8910, 9006, 9204, 9304, 9402], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 3, games: [9009, 9407], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 4, games: [8810, 9003], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 5, games: [9005, 9512], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 6, games: [8907], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 7, games: [9106], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 9, games: [9307], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 10, games: [9506, 9604], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 11, games: [8902, 9202, 9501], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 14, games: [9010], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 16, games: [9209], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 18, games: [9001, 9011], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 19, games: [9601], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 21, games: [8908], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 22, games: [9012], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 36, games: [9102], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 49, games: [9603], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 66, games: [9403], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 98, games: [8909], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 193, games: [8905], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 23, games: [9107], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 82, games: [8904], rootShape: 0, rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 4, games: [8804], rootShape: 2, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 22, games: [9602], rootShape: 1, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 28, games: [8803], rootShape: 1, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 51, games: [9505], rootShape: 6, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 77, games: [8806], rootShape: 8, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 87, games: [9504], rootShape: 3, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 87, games: [9507], rootShape: 5, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        
        return result
    }
    
}
