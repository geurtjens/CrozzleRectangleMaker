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
            game: 8612, root: 0, depth: 2, width: 9, size: 11_371, time: "00:00:12"))
        result.append(BranchAndBoundInstruction(
            game: 8704, root: 0, depth: 2, width: 24, size: 4_871, time: "00:00:50"))
        result.append(BranchAndBoundInstruction(
            game: 8710, root: 0, depth: 1, width: 53, size: 21_592, time: "00:00:04"))
        result.append(BranchAndBoundInstruction(
            game: 8711, root: 3, depth: 1, width: 32, size: 11_511, time: "00:00:03"))
        result.append(BranchAndBoundInstruction(
            game: 8712, root: 4, depth: 1, width: 27, size: 23_752, time: "00:00:07"))
        result.append(BranchAndBoundInstruction(
            game: 8802, root: 0, depth: 3, width: 3, size: 3_445, time: "00:00:03"))
        // 8803
        result.append(BranchAndBoundInstruction(
            game: 8804, root: 9, depth: 2, width: 47, size: 16_617, time: "00:18:45"))
        result.append(BranchAndBoundInstruction(
            game: 8805, root: 2, depth: 3, width: 65, size: 1_077, time: "00:00:44"))
        // 8806
        result.append(BranchAndBoundInstruction(
            game: 8807, root: 1, depth: 2, width: 64, size: 8_055, time: "00:03:30"))
        result.append(BranchAndBoundInstruction(
            game: 8808, root: 3, depth: 1, width: 6, size: 18_693, time: "00:00:02"))
        
        result.append(BranchAndBoundInstruction(
            game: 8809, root: 0, depth: 2, width: 7, size: 37_461, time: "00:00:37"))
        // 8810
        result.append(BranchAndBoundInstruction(
            game: 8811, root: 0, depth: 2, width: 9, size: 51_793, time: "00:03:19"))
        // 8812
        result.append(BranchAndBoundInstruction(
            game: 8902, root: 1, depth: 3, width: 75, size: 8_330, time: "00:01:38"))
       // 8903, 8904, 8905, 8906
        result.append(BranchAndBoundInstruction(
            game: 8907, root: 1, depth: 2, width: 25, size: 22_896, time: "00:08:30"))
        result.append(BranchAndBoundInstruction(
            game: 8908, root: 3, depth: 2, width: 22, size: 6_315, time: "00:01:33"))
        result.append(BranchAndBoundInstruction(
            game: 8909, root: 3, depth: 2, width: 48, size: 7_529, time: "00:00:47"))
        result.append(BranchAndBoundInstruction(
            game: 8910, root: 0, depth: 2, width: 4, size: 66_323, time: "00:00:55"))
        // 8911
        result.append(BranchAndBoundInstruction(
            game: 8912, root: 0, depth: 2, width: 31, size: 2_909, time: "00:00:07"))
        // 9001
        result.append(BranchAndBoundInstruction(
            game: 9002, root: 2, depth: 1, width: 7, size: 10_194, time: "00:00:01"))
        // 9003, 9004
        result.append(BranchAndBoundInstruction(
            game: 9005, root: 2, depth: 2, width: 7, size: 10_136, time: "00:00:45"))
        
        result.append(BranchAndBoundInstruction(
            game: 9006, root: 2, depth: 1, width: 33, size: 30_422, time: "00:00:06"))
        result.append(BranchAndBoundInstruction(
            game: 9007, root: 0, depth: 1, width: 68, size: 22_974, time: "00:00:02"))
        result.append(BranchAndBoundInstruction(
            game: 9008, root: 5, depth: 1, width: 17, size: 177_720, time: "00:00:23"))
        result.append(BranchAndBoundInstruction(
            game: 9009, root: 3, depth: 1, width: 28, size: 19_776, time: "00:00:07"))
        result.append(BranchAndBoundInstruction(
            game: 9010, root: 1, depth: 2, width: 9, size: 12_622, time: "00:00:13"))
        // 9011
        result.append(BranchAndBoundInstruction(
            game: 9012, root: 1, depth: 2, width: 7, size: 7_961, time: "00:00:12"))
        
        /*
         game: 9101, root: 4, depth: 2, width: 28, time: "7 minutes 35 seconds", useGuidedScores: false, overallProcessTime: 1 hours 17 minutes 36 seconds
         game: 9101, root: 2, depth: 2, width: 1, timeToProcess: 26 seconds
         game: 9101, root: 4, depth: 2, width: 28, timeToProcess: 1 hours 17 minutes 36 seconds

         */
        result.append(BranchAndBoundInstruction(
            game: 9101, root: 4, depth: 2, width: 28, size: 11_934, time: "00:07:35"))
        result.append(BranchAndBoundInstruction(
            game: 9102, root: 5, depth: 2, width: 7, size: 5_049, time: "00:00:27"))
        result.append(BranchAndBoundInstruction(
            game: 9103, root: 0, depth: 2, width: 26, size: 48_600, time: "00:04:20"))
        result.append(BranchAndBoundInstruction(
            game: 9104, root: 0, depth: 2, width: 49, size: 7_741, time: "00:03:01"))
        
        result.append(BranchAndBoundInstruction(
            game: 9105, root: 0, depth: 2, width: 19, size: 15_557, time: "00:00:41"))
        // 9106, 9107
        result.append(BranchAndBoundInstruction(
            game: 9108, root: 3, depth: 1, width: 37, size: 2_120, time: "00:00:01"))
        result.append(BranchAndBoundInstruction(
            game: 9109, root: 0, depth: 1, width: 13, size: 6_108, time: "00:00:01"))
        result.append(BranchAndBoundInstruction(
            game: 9110, root: 0, depth: 1, width: 40, size: 124_822, time: "00:00:07"))
        // 9111, 9112
        // 9201, 9202
        result.append(BranchAndBoundInstruction(
            game: 9203, root: 2, depth: 2, width: 52, size: 7_143, time: "00:01:59"))
        // 9204
        result.append(BranchAndBoundInstruction(
            game: 9206, root: 0, depth: 2, width: 31, size: 38_824, time: "00:09:28"))
        result.append(BranchAndBoundInstruction(
            game: 9207, root: 0, depth: 2, width: 6, size: 8_246, time: "00:00:02"))
        result.append(BranchAndBoundInstruction(
            game: 9208, root: 1, depth: 2, width: 53, size: 54_832, time: "00:05:59"))
        result.append(BranchAndBoundInstruction(
            game: 9209, root: 1, depth: 2, width: 70, size: 110_485, time: "01:08:28"))
        result.append(BranchAndBoundInstruction(
            game: 9210, root: 0, depth: 2, width: 64, size: 15_796, time: "00:02:59"))
        
        result.append(BranchAndBoundInstruction(
            game: 9211, root: 5, depth: 1, width: 14, size: 29_841, time: "00:00:02"))
        result.append(BranchAndBoundInstruction(
            game: 9212, root: 0, depth: 1, width: 43, size: 93_289, time: "00:00:27"))
        // 9301, 9302
        result.append(BranchAndBoundInstruction(
            game: 9303, root: 0, depth: 2, width: 73, size: 22_191, time: "00:08:29"))
        // 9304, 9305
        result.append(BranchAndBoundInstruction(
            game: 9306, root: 0, depth: 1, width: 3, size: 23_324, time: "00:00:01"))
        // 9307
        result.append(BranchAndBoundInstruction(
            game: 9308, root: 1, depth: 1, width: 54, size: 74_167, time: "00:00:18"))
        result.append(BranchAndBoundInstruction(
            game: 9309, root: 3, depth: 2, width: 5, size: 203_809, time: "00:04:56"))
        result.append(BranchAndBoundInstruction(
            game: 9310, root: 0, depth: 1, width: 32, size: 20_612, time: "00:00:01"))
        result.append(BranchAndBoundInstruction(
            game: 9311, root: 4, depth: 1, width: 16, size: 8_249, time: "00:00:01"))
        result.append(BranchAndBoundInstruction(
            game: 9312, root: 2, depth: 1, width: 5, size: 14_610, time: "00:00:01"))
        result.append(BranchAndBoundInstruction(
            game: 9401, root: 3, depth: 2, width: 56, size: 3_415, time: "00:01:31"))
        result.append(BranchAndBoundInstruction(
            game: 9402, root: 0, depth: 2, width: 4, size: 17_894, time: "00:00:39"))
        
        // 9403, 9404
        result.append(BranchAndBoundInstruction(
            game: 9406, root: 3, depth: 1, width: 64, size: 40_556, time: "00:00:51"))
        result.append(BranchAndBoundInstruction(
            game: 9407, root: 2, depth: 2, width: 37, size: 19_968, time: "00:12:58"))
        
        // 9408, 9409, 9410, 9411
        result.append(BranchAndBoundInstruction(
            game: 9412, root: 0, depth: 2, width: 5, size: 11_089, time: "00:00:39"))
        
        
        /*
         game: 9501, root: 0, depth: 2, width: 20, size: 8_404, time: "00:00:42"
         game: 9501, root: 1, depth: 2, width: 61, size: 8_404, time: "00:04:54"
         game: 9501, root: 2, depth: 2, width: 21, size: 8_404, time: "00:01:24"
         game: 9501, root: 4, depth: 2, width: 11, size: 8_404, time: "00:01:36"
         game: 9501, root: 6, depth: 2, width: 20, size: 8_404, time: "00:01:16"
         */
        result.append(BranchAndBoundInstruction(
            game: 9501, root: 2, depth: 2, width: 74, size: 8_404, time: "00:01:42"))
        /*
        game: 9502, root: 2, depth: 2, width: 11, size: 55_590, time: "00:13:33"
        game: 9502, root: 5, depth: 2, width: 74, size: 55_590, time: "01:25:16"
        game: 9502, root: 6, depth: 2, width: 17, size: 55_590, time: "00:43:49"
        */
        result.append(BranchAndBoundInstruction(
            game: 9502, root: 2, depth: 2, width: 11, size: 55_590, time: "00:13:33"))
        
        /*
         game: 9506, root: 7, depth: 2, width: 9, size: 17_876, time: "00:01:11"
         game: 9506, root: 8, depth: 2, width: 64, size: 17_876, time: "00:22:55"
         */
        result.append(BranchAndBoundInstruction(
            game: 9506, root: 7, depth: 2, width: 9, size: 17_876, time: "00:01:11"))
        
        
        
        // 9503, 9504, 9505, 9507, 9508, 9509, 9510, 9511, 9512
        // 9601, 9602, 9603, 9604, 9605
        
        // We have 57 solutions now.
        
        // And 55 failures which are of the following searchShape size
    /*
    game: 8803, size: 120_174
    game: 8806, size: 29_081
    game: 8810, size: 4_198
    game: 8812, size: 15_721
    game: 8903, size: 43_461
    game: 8904, size: 10_225
    game: 8905, size: 3_368
    game: 8906, size: 7_104
    game: 8911, size: 16_641
    game: 9001, size: 4_830
    game: 9003, size: 5_315
    game: 9004, size: 74_44
    game: 9011, size: 77_173
    game: 9106, size: 401_560
    game: 9107, size: 35_366
    game: 9111, size: 361_294
    game: 9112, size: 2_902
    game: 9201, size: 346_878
    game: 9202, size: 16_384
    game: 9204, size: 8_567
    game: 9301, size: 13_835
    game: 9302, size: 25_750
    game: 9304, size: 52_376
    game: 9305, size: 9_000
    game: 9307, size: 20_928
    game: 9403, size: 125_552
    game: 9404, size: 31_337
    game: 9408, size: 86_687
    game: 9409, size: 58_235
    game: 9410, size: 18_237
    game: 9411, size: 51_893
    game: 9503, size: 8_026
    game: 9504, size: 15_943
    game: 9505, size: 14_570
    game: 9507, size: 31_319
    game: 9508, size: 5_426
    game: 9509, size: 9_263
    game: 9510, size: 20_793
    game: 9511, size: 35_324
    game: 9512, size: 145_937
    game: 9601, size: 16_215
    game: 9602, size: 26_884
    game: 9603, size: 51_628
    game: 9604, size: 75_081
    game: 9605, size: 29_185
*/
        
        
        
        
        let _ = [
            8612,
            8704, 8705, 8710, 8711, 8712,
            8802, 8804, 8807, 8808, 8809, 8910, 8811,
            8902, 8907, 8908, 8909, 8912,
            9002, 9005, 9006, 9007, 9008, 9009, 9010, 9012,
            9101, 9102, 9103, 9104, 9105, 9108, 9109, 9110,
            9203, 9206, 9207, 9208, 9210, 9212,
            9303, 9306, 9308, 9309, 9310, 9311, 9312,
            9401, 9402, 9406, 9407, 9412,
            9501, 9502, 9506]
        
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
