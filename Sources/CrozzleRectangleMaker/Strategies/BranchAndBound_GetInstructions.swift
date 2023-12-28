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

        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 1, games: [8703], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 25, games: [8802, 9306], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 43, games: [9212], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 75, games: [8710], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 1, games: [9002, 9109, 9312], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 50, games: [8612, 8702, 8704, 8809, 8910, 8912, 9104, 9105, 9108, 9207, 9310, 9311, 9412], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 75, games: [8808, 9210], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 87, games: [9303], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 1, games: [8712, 9007, 9008], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 25, games: [8705, 8811, 9103, 9308], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 37, games: [8711], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        // 32 games full words so far
        
//        let solvedGames = [8703, 8802, 9306, 9212, 8710, 9002, 9109, 9312, 8612, 8702, 8704, 8809, 8910, 8912, 9104, 9105, 9108, 9207, 9310, 9311, 9412, 8808, 9210, 9303, 8712, 9007, 9008, 8705, 8811, 9103, 9308, 8711]
        
        return result
        
    }
    
    public static func AllWords_UseGuidedScores() -> [BranchAndBoundInstruction]
    {
        
        var result: [BranchAndBoundInstruction] = []

        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 1, games: [8703], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 25, games: [8802, 9306], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 43, games: [9212], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 75, games: [8710], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 1, games: [9002, 9109, 9312], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 50, games: [8612, 8702, 8704, 8809, 8910, 8912, 9104, 9105, 9108, 9207, 9310, 9311, 9412], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 75, games: [8808, 9210], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 87, games: [9303], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 1, games: [8712, 9007, 9008], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 25, games: [8705, 8811, 9103, 9308], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 37, games: [8711], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        // 32 games full words so far
        
//        let solvedGames = [8703, 8802, 9306, 9212, 8710, 9002, 9109, 9312, 8612, 8702, 8704, 8809, 8910, 8912, 9104, 9105, 9108, 9207, 9310, 9311, 9412, 8808, 9210, 9303, 8712, 9007, 9008, 8705, 8811, 9103, 9308, 8711]
        
        return result
        
    }
    
    
    public static func WinningWords_NoGuidedScores() -> [BranchAndBoundInstruction]
    {

        var result: [BranchAndBoundInstruction] = []

        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 1, games: [8703, 8802, 8808, 9104, 9212, 9306, 9406], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 2, games: [8710, 9311], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 3, games: [9412], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 5, games: [8711], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 8, games: [9108], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 17, games: [9510], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 27, games: [9503], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 1, games: [8612, 8809, 9002, 9109, 9201, 9211, 9303, 9310, 9312], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 2, games: [8702, 8704, 8910, 9105, 9207, 9210], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 3, games: [8911, 9004, 9408], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 4, games: [8912], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 5, games: [9409], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 6, games: [9511], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 7, games: [9208], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 8, games: [9411], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 10, games: [9401], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 13, games: [9410], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 36, games: [8906], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 37, games: [9301], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 1, games: [8705, 8712, 8811, 9007, 9008, 9103, 9110, 9111, 9206, 9302, 9308, 9309, 9404, 9502], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 2, games: [8812, 8903, 8910, 9006, 9204, 9304, 9402, 9508], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 3, games: [9009, 9407], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 4, games: [8810, 9003], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 5, games: [9005, 9512], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 6, games: [8907], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 7, games: [9106], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 9, games: [9307], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 10, games: [9506, 9604], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 11, games: [8807, 8902, 9202, 9501], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 18, games: [9001, 9011], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 19, games: [9601, 9605], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 21, games: [8908], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 22, games: [9012], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 36, games: [9102], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 66, games: [9403], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 98, games: [8909], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 107, games: [9203], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 124, games: [9603], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 153, games: [9010, 9209], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 193, games: [8905], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 454, games: [9507], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        
        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 7, games: [9101], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 8, games: [9509], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 23, games: [9107], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 35, games: [9112], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 68, games: [8805], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 82, games: [8904], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 140, games: [8904], rootWidth: 1, useGuidedScores: false, maxDepth: 30))
        

        // These are the stranger instructions that do not start with the highest scoring starting shape same as other winning word result
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 4, games: [8804], rootWidth: -2, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 22, games: [9602], rootWidth: -1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 28, games: [8803], rootWidth: -1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 40, games: [9305], rootWidth: -5, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 51, games: [9505], rootWidth: -6, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 77, games: [8806], rootWidth: -8, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 87, games: [9504], rootWidth: -3, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 87, games: [9507], rootWidth: -5, useGuidedScores: false, maxDepth: 30))

        return result
    }
    
    
    
    public static func WinningWords_UseGuidedScores() -> [BranchAndBoundInstruction] {
        
        var result: [BranchAndBoundInstruction] = []

        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 1, games: [
            //8802, 8808, 9104, this one works perfectly so lets concentrate on the next one
            9212, 9306, 9406], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 2, games: [8710, 9311], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 3, games: [9412], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 5, games: [8711], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 8, games: [9108], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 17, games: [9510], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 27, games: [9503], rootWidth: 1, useGuidedScores: true, maxDepth: 30))

        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 1, games: [8612, 8809, 9002, 9109, 9201, 9211, 9303, 9310, 9312], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 2, games: [8702, 8704, 8910, 9105, 9207, 9210], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 3, games: [8911, 9004, 9408], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 4, games: [8912], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 5, games: [9409], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 6, games: [9511], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 7, games: [9208], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 8, games: [9411], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 10, games: [9401], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 13, games: [9410], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 36, games: [8906], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 37, games: [9301], rootWidth: 1, useGuidedScores: true, maxDepth: 30))

        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 1, games: [8705, 8712, 8811, 9007, 9008, 9103, 9110, 9111, 9206, 9302, 9308, 9309, 9404, 9502], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 2, games: [8812, 8903, 8910, 9006, 9204, 9304, 9402, 9508], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 3, games: [9009, 9407], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 4, games: [8810, 9003], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 5, games: [9005, 9512], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 6, games: [8907], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 7, games: [9106], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 9, games: [9307], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 10, games: [9506, 9604], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 11, games: [8807, 8902, 9202, 9501], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 14, games: [9010], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 16, games: [9209], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 18, games: [9001, 9011], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 19, games: [9601, 9605], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 21, games: [8908], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 22, games: [9012], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 36, games: [9102], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 49, games: [9603], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 66, games: [9403], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 74, games: [9203], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 98, games: [8909], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 193, games: [8905], rootWidth: 1, useGuidedScores: true, maxDepth: 30))

        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 7, games: [9101], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 8, games: [9509], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 23, games: [9107], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 35, games: [9112], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 68, games: [8805], rootWidth: 1, useGuidedScores: true, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 82, games: [8904], rootWidth: 1, useGuidedScores: true, maxDepth: 30))

        // These are the stranger instructions that do not start with the highest scoring starting shape
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 4, games: [8804], rootWidth: -2, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 22, games: [9602], rootWidth: -1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 28, games: [8803], rootWidth: -1, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 40, games: [9305], rootWidth: -5, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 51, games: [9505], rootWidth: -6, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 77, games: [8806], rootWidth: -8, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 87, games: [9504], rootWidth: -3, useGuidedScores: false, maxDepth: 30))
        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 87, games: [9507], rootWidth: -5, useGuidedScores: false, maxDepth: 30))
        
        return result
    }
    
}
