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

        result.append(BranchAndBoundInstruction(
            game: 8612, rootShape: 0, lookaheadDepth: 2, beamWidth: 9, time: "12 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8704, rootShape: 0, lookaheadDepth: 2, beamWidth: 24, time: "51 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8710, rootShape: 0, lookaheadDepth: 1, beamWidth: 53, time: "4.233728167 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8711, rootShape: 3, lookaheadDepth: 1, beamWidth: 32, time: "3.22003375 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8712, rootShape: 4, lookaheadDepth: 1, beamWidth: 27, time: "7.202269583 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8802, rootShape: 0, lookaheadDepth: 3, beamWidth: 3, time: "3.310953875 seconds"))
        // 8803
        result.append(BranchAndBoundInstruction(
            game: 8804, rootShape: 9, lookaheadDepth: 2, beamWidth: 47, time: "18 minutes 45 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8805, rootShape: 2, lookaheadDepth: 3, beamWidth: 65, time: "44 seconds"))
        // 8806
        result.append(BranchAndBoundInstruction(
            game: 8807, rootShape: 1, lookaheadDepth: 2, beamWidth: 64, time: "3 minutes 30 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8808, rootShape: 3, lookaheadDepth: 1, beamWidth: 6, time: "1.495145875 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8809, rootShape: 0, lookaheadDepth: 2, beamWidth: 7, time: "37 seconds"))
        // 8810
        result.append(BranchAndBoundInstruction(
            game: 8811, rootShape: 0, lookaheadDepth: 2, beamWidth: 9, time: "3 minutes 19 seconds"))
        // 8812
        result.append(BranchAndBoundInstruction(
            game: 8902, rootShape: 1, lookaheadDepth: 3, beamWidth: 75, time: "1 minutes 38 seconds"))
       // 8903, 8904, 8905, 8906
        result.append(BranchAndBoundInstruction(
            game: 8907, rootShape: 1, lookaheadDepth: 2, beamWidth: 25, time: "8 minutes 30 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8908, rootShape: 3, lookaheadDepth: 2, beamWidth: 22, time: "1 minutes 33 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8909, rootShape: 3, lookaheadDepth: 2, beamWidth: 48, time: "47 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8910, rootShape: 0, lookaheadDepth: 2, beamWidth: 4, time: "55 seconds"))
        // 8911
        result.append(BranchAndBoundInstruction(
            game: 8912, rootShape: 0, lookaheadDepth: 2, beamWidth: 31, time: "6.669359916 seconds"))
        // 9001
        result.append(BranchAndBoundInstruction(
            game: 9002, rootShape: 2, lookaheadDepth: 1, beamWidth: 7, time: "0.356288167 seconds"))
        // 9003, 9004, 9005
        result.append(BranchAndBoundInstruction(
            game: 9006, rootShape: 2, lookaheadDepth: 1, beamWidth: 33, time: "5.611807625 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9007, rootShape: 0, lookaheadDepth: 1, beamWidth: 68, time: "1.420469708 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9008, rootShape: 5, lookaheadDepth: 1, beamWidth: 17, time: "23 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9009, rootShape: 3, lookaheadDepth: 1, beamWidth: 28, time: "7.128777709 seconds"))
        // 9010, 9011
        result.append(BranchAndBoundInstruction(
            game: 9012, rootShape: 1, lookaheadDepth: 2, beamWidth: 7, time: "12 seconds"))
        // 9101
        result.append(BranchAndBoundInstruction(
            game: 9102, rootShape: 5, lookaheadDepth: 2, beamWidth: 7, time: "27 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9103, rootShape: 0, lookaheadDepth: 2, beamWidth: 26, time: "4 minutes 20 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9104, rootShape: 0, lookaheadDepth: 2, beamWidth: 49, time: "3 minutes 1 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9105, rootShape: 0, lookaheadDepth: 2, beamWidth: 19, time: "41 seconds"))
        // 9106, 9107
        result.append(BranchAndBoundInstruction(
            game: 9108, rootShape: 3, lookaheadDepth: 1, beamWidth: 37, time: "0.522908875 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9109, rootShape: 0, lookaheadDepth: 1, beamWidth: 13, time: "0.282506459 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9110, rootShape: 0, lookaheadDepth: 1, beamWidth: 40, time: "6.754729083 seconds"))
        // 9111, 9112
        // 9201, 9202
        result.append(BranchAndBoundInstruction(
            game: 9203, rootShape: 2, lookaheadDepth: 2, beamWidth: 52, time: "1 minutes 59 seconds"))
        // 9204
        result.append(BranchAndBoundInstruction(
            game: 9206, rootShape: 0, lookaheadDepth: 2, beamWidth: 31, time: "9 minutes 28 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9207, rootShape: 0, lookaheadDepth: 2, beamWidth: 6, time: "1.555885958 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9208, rootShape: 1, lookaheadDepth: 2, beamWidth: 53, time: "5 minutes 59 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9209, rootShape: 1, lookaheadDepth: 2, beamWidth: 70, time: "1 hours 8 minutes 28 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9210, rootShape: 0, lookaheadDepth: 2, beamWidth: 64, time: "2 minutes 59 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9211, rootShape: 5, lookaheadDepth: 1, beamWidth: 14, time: "2.02044375 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9212, rootShape: 0, lookaheadDepth: 1, beamWidth: 43, time: "27 seconds"))
        // 9301, 9302
        result.append(BranchAndBoundInstruction(
            game: 9303, rootShape: 0, lookaheadDepth: 2, beamWidth: 73, time: "8 minutes 29 seconds"))
        // 9304, 9305
        result.append(BranchAndBoundInstruction(
            game: 9306, rootShape: 0, lookaheadDepth: 1, beamWidth: 3, time: "0.270897958 seconds"))
        // 9307
        result.append(BranchAndBoundInstruction(
            game: 9308, rootShape: 1, lookaheadDepth: 1, beamWidth: 54, time: "18 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9309, rootShape: 3, lookaheadDepth: 2, beamWidth: 5, time: "4 minutes 56 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9310, rootShape: 0, lookaheadDepth: 1, beamWidth: 32, time: "0.529367709 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9311, rootShape: 4, lookaheadDepth: 1, beamWidth: 16, time: "0.843562125 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9312, rootShape: 2, lookaheadDepth: 1, beamWidth: 5, time: "0.584330167 seconds"))
        // 9401
        result.append(BranchAndBoundInstruction(
            game: 9402, rootShape: 0, lookaheadDepth: 2, beamWidth: 4, time: "39 seconds"))
        // 9403, 9404
        result.append(BranchAndBoundInstruction(
            game: 9406, rootShape: 3, lookaheadDepth: 1, beamWidth: 64, time: "51 seconds"))
        // 9407, 9408, 9409, 9410, 9411
        result.append(BranchAndBoundInstruction(
            game: 9412, rootShape: 0, lookaheadDepth: 2, beamWidth: 5, time: "39 seconds"))
        
        // 9501, 9502, 9503, 9504, 9505, 9506, 9507, 9508, 9509, 9510, 9511, 9512
        // 9601, 9602, 9603, 9604, 9605
        
        // We have 49 solutions now.
        
        let _ = [
            8612,
            8704, 8705, 8710, 8711, 8712,
            8802, 8804, 8807, 8808, 8809, 8910, 8811,
            8902, 8907, 8908, 8909, 8912,
            9002, 9006, 9007, 9008, 9009, 9010, 9012,
            9102, 9103, 9104, 9105, 9108, 9109,
            9203, 9206, 9207, 9208, 9210, 9212,
            9303, 9306, 9308, 9309, 9310, 9311, 9312,
            9402, 9406, 9412]
        
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
