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
            game: 8612, root: 0, depth: 1, width: 459, size: 11_371, time: "9.274728542 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8704, root: 0, depth: 1, width: 271, size: 4871, time: "9.795405542 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8710, root: 0, depth: 1, width: 53, size: 21_592, time: "00:00:04.49"))
        result.append(BranchAndBoundInstruction(
            game: 8711, root: 3, depth: 1, width: 32, size: 11_511, time: "00:00:03.16"))
        result.append(BranchAndBoundInstruction(
            game: 8712, root: 4, depth: 1, width: 27, size: 23_752, time: "00:00:07.01"))
        result.append(BranchAndBoundInstruction(
            game: 8802, root: 0, depth: 1, width: 796, size: 3_445, time: "8.567226416 seconds"))
        // 8803
        result.append(BranchAndBoundInstruction(
            game: 8804, root: 9, depth: 2, width: 47, size: 16_617, time: "00:19:33"))
        //game: 8805, root: 2, depth: 3, width: 65, size: 1_077, time: "00:00:44"
        result.append(BranchAndBoundInstruction(
            game: 8805, root: 2, depth: 1, width: 1351, size: 1077, time: "9.29237075 seconds"))
        // 8806
        result.append(BranchAndBoundInstruction(
            game: 8807, root: 1, depth: 2, width: 64, size: 8_055, time: "00:03:30"))
        result.append(BranchAndBoundInstruction(
            game: 8808, root: 3, depth: 1, width: 6, size: 18_693, time: "00:00:01.47"))
        // game: 8809, root: 0, depth: 2, width: 7, size: 37_461, time: "00:00:48"
        result.append(BranchAndBoundInstruction(
            game: 8809, root: 0, depth: 1, width: 710, size: 37461, time: "54 seconds"))
        // 8810
        //game: 8811, root: 0, depth: 2, width: 9, size: 51_793, time: "00:03:20"
        result.append(BranchAndBoundInstruction(
            game: 8811, root: 0, depth: 1, width: 596, size: 51793, time: "2 minutes 19 seconds"))
        // 8812
        result.append(BranchAndBoundInstruction(
            game: 8902, root: 1, depth: 3, width: 75, size: 8_330, time: "00:01:46"))
       // 8903, 8904, 8905, 
        result.append(BranchAndBoundInstruction(
            game: 8906, root: 4, depth: 1, width: 2003, size: 7104, time: "3 minutes 18 seconds"))
        //game: 8907, root: 1, depth: 2, width: 25, size: 22_896, time: "00:09:00"
        result.append(BranchAndBoundInstruction(
            game: 8907, root: 6, depth: 1, width: 283, size: 22896, time: "1 minutes 18 seconds"))
        //game: 8908, root: 3, depth: 2, width: 22, size: 6_315, time: "00:01:33"
        result.append(BranchAndBoundInstruction(
            game: 8908, root: 4, depth: 1, width: 485, size: 6315, time: "32 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8909, root: 3, depth: 2, width: 48, size: 7_529, time: "00:00:47"))
        // game: 8910, root: 0, depth: 2, width: 4, size: 66_323, time: "00:01:09"
        // we only found the first possible root and stopped after that
        result.append(BranchAndBoundInstruction(
            game: 8910, root: 0, depth: 1, width: 6831, size: 66323, time: "13 minutes 42 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8911, root: 2, depth: 1, width: 445, size: 16641, time: "24 seconds"))
        //game: 8912, root: 0, depth: 2, width: 31, size: 2_909, time: "00:00:06.58"
        result.append(BranchAndBoundInstruction(
            game: 8912, root: 0, depth: 1, width: 618, size: 2909, time: "4.891724625 seconds"))
        // 9001
        result.append(BranchAndBoundInstruction(
            game: 9002, root: 2, depth: 1, width: 7, size: 10_194, time: "00:00:00.30"))
        // 9003,
        result.append(BranchAndBoundInstruction(
            game: 9004, root: 4, depth: 1, width: 2801, size: 7444, time: "4 minutes 50 seconds"))
        //game: 9005, root: 2, depth: 2, width: 7, size: 10_136, time: "00:00:52"
        result.append(BranchAndBoundInstruction(
            game: 9005, root: 1, depth: 1, width: 689, size: 10136, time: "49 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9006, root: 2, depth: 1, width: 33, size: 30_422, time: "00:00:06.63"))
        result.append(BranchAndBoundInstruction(
            game: 9007, root: 0, depth: 1, width: 68, size: 22_974, time: "00:00:01.37"))
        result.append(BranchAndBoundInstruction(
            game: 9008, root: 5, depth: 1, width: 17, size: 177_720, time: "00:00:23"))
        result.append(BranchAndBoundInstruction(
            game: 9009, root: 3, depth: 1, width: 28, size: 19_776, time: "00:00:07.54"))
        // game: 9010, root: 1, depth: 2, width: 9, size: 12_622, time: "00:00:13"
        result.append(BranchAndBoundInstruction(
            game: 9010, root: 1, depth: 1, width: 207, size: 12622, time: "6.993196417 seconds"))
        // 9011
        
        // game: 9012, root: 1, depth: 2, width: 7, size: 7_961, time: "00:00:13"
        //game: 9012, root: 6, depth: 1, width: 5417, size: 7961, time: "2 minutes 53 seconds"
        result.append(BranchAndBoundInstruction(
            game: 9012, root: 7, depth: 1, width: 8731, size: 7961, time: "3 minutes 3 seconds"))
        /*
         game: 9101, root: 4, depth: 2, width: 28, time: "7 minutes 35 seconds", useGuidedScores: false, overallProcessTime: 1 hours 17 minutes 36 seconds
         game: 9101, root: 2, depth: 2, width: 1, timeToProcess: 26 seconds
         game: 9101, root: 4, depth: 2, width: 28, timeToProcess: 1 hours 17 minutes 36 seconds

         */
        result.append(BranchAndBoundInstruction(
            game: 9101, root: 4, depth: 2, width: 28, size: 11_934, time: "00:07:53"))
        
        //game: 9102, root: 5, depth: 2, width: 7, size: 5_049, time: "00:00:27"
        result.append(BranchAndBoundInstruction(
            game: 9102, root: 4, depth: 1, width: 9516, size: 5049, time: "7 minutes 3 seconds"))
        // game: 9103, root: 0, depth: 2, width: 26, size: 48_600, time: "00:04:24"
        result.append(BranchAndBoundInstruction(
            game: 9103, root: 0, depth: 1, width: 878, size: 48600, time: "2 minutes 31 seconds"))
        //game: 9104, root: 0, depth: 2, width: 49, size: 7_741, time: "00:03:00"
        //game: 9104, root: 0, depth: 1, width: 391, size: 7741, time: "20 seconds"
        //game: 9104, root: 1, depth: 1, width: 112, size: 7741, time: "8.636549791 seconds"
        //game: 9104, root: 2, depth: 1, width: 104, size: 7741, time: "8.45871 seconds"
        result.append(BranchAndBoundInstruction(
            game: 9104, root: 2, depth: 1, width: 104, size: 7741, time: "8.45871 seconds"))
        
        //game: 9105, root: 0, depth: 2, width: 19, size: 15_557, time: "00:00:42"
        //game: 9105, root: 3, depth: 1, width: 356, size: 15557, time: "7.874201834 seconds"
        //game: 9105, root: 4, depth: 1, width: 632, size: 15557, time: "31 seconds"
        result.append(BranchAndBoundInstruction(
            game: 9105, root: 3, depth: 1, width: 356, size: 15557, time: "7.874201834 seconds"))
        // game: 9106, lookaheadDepth: 1, rootShape: 2, lower: 9531, upper: 9687, currentWidth: 9609
        result.append(BranchAndBoundInstruction(
            game: 9106, root: 2, depth: 1, width: 9687, size: 401560, time: "3 hours 43 minutes 18 seconds"))
        // 9107
        result.append(BranchAndBoundInstruction(
            game: 9108, root: 3, depth: 1, width: 37, size: 2_120, time: "00:00:00.46"))
        result.append(BranchAndBoundInstruction(
            game: 9109, root: 0, depth: 1, width: 13, size: 6_108, time: "00:00:00.15"))
        result.append(BranchAndBoundInstruction(
            game: 9110, root: 0, depth: 1, width: 40, size: 124_822, time: "00:00:06.44"))
        result.append(BranchAndBoundInstruction(
            game: 9111, root: 4, depth: 1, width: 736, size: 361294, time: "1 hours 1 minutes 45 seconds"))
        // 9112
        //game: 9201, lookaheadDepth: 1, rootShape: 2, lower: 5937, upper: 5956, currentWidth: 5946
        result.append(BranchAndBoundInstruction(
            game: 9201, root: 2, depth: 1, width: 5956, size: 346878, time: "2 hours 18 minutes 25 seconds"))
        // 9202
        result.append(BranchAndBoundInstruction(
            game: 9203, root: 2, depth: 2, width: 52, size: 7_143, time: "00:01:59"))
        
        // bulk end
        result.append(BranchAndBoundInstruction(game: 9204, root: 2, depth: 1, width: 423, size: 8_567, time: "13 seconds"))
        
        
        //game: 9206, root: 3, depth: 1, width: 387, size: 38824, time: "1 minutes 1 seconds"
        //game: 9206, root: 4, depth: 1, width: 158, size: 38824, time: "49 seconds"
        //game: 9206, root: 0, depth: 2, width: 31, size: 38_824, time: "00:09:42"
        result.append(BranchAndBoundInstruction(
            game: 9206, root: 4, depth: 1, width: 158, size: 38824, time: "49 seconds"))
        // game: 9207, root: 0, depth: 2, width: 6, size: 8_246, time: "00:00:01.47"
        result.append(BranchAndBoundInstruction(
            game: 9207, root: 1, depth: 1, width: 122, size: 8246, time: "1.050155458 seconds"))
        //game: 9208, root: 1, depth: 2, width: 53, size: 54_832, time: "00:06:15"
        // only tried the first two words
        result.append(BranchAndBoundInstruction(
            game: 9208, root: 1, depth: 1, width: 8961, size: 54832, time: "11 minutes 20 seconds"))
        // game: 9209, root: 1, depth: 2, width: 70, size: 110_485, time: "01:08:32"
        // game: 9209, root: 4, depth: 2, width: 41, size: 110_485, time: "01:32:17"
        result.append(BranchAndBoundInstruction(
            game: 9209, root: 1, depth: 2, width: 70, size: 110_485, time: "01:08:28"))
        
        //game: 9210, root: 0, depth: 2, width: 64, size: 15_796, time: "00:02:59"
        //game: 9210, root: 2, depth: 1, width: 651, size: 15796, time: "54 seconds"
        
        result.append(BranchAndBoundInstruction(
            game: 9210, root: 4, depth: 1, width: 810, size: 15796, time: "36 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9211, root: 5, depth: 1, width: 14, size: 29_841, time: "00:00:02"))
        result.append(BranchAndBoundInstruction(
            game: 9212, root: 0, depth: 1, width: 43, size: 93_289, time: "00:00:27"))
        // 9301,
        //game: 9302, root: 3, depth: 1, width: 4614, size: 25750, time: "5 minutes 34 seconds"
        result.append(BranchAndBoundInstruction(
            game: 9302, root: 4, depth: 1, width: 1354, size: 25750, time: "2 minutes 2 seconds"))
        
        
        result.append(BranchAndBoundInstruction(
            game: 9303, root: 0, depth: 2, width: 73, size: 22_191, time: "00:08:29"))
        // 9304, 9305
        result.append(BranchAndBoundInstruction(
            game: 9306, root: 0, depth: 1, width: 3, size: 23_324, time: "00:00:01"))
        // 9307
        result.append(BranchAndBoundInstruction(
            game: 9308, root: 1, depth: 1, width: 54, size: 74_167, time: "00:00:18"))
        //game: 9309, root: 3, depth: 2, width: 5, size: 203_809, time: "00:04:56"
        result.append(BranchAndBoundInstruction(
            game: 9309, root: 5, depth: 1, width: 344, size: 203809, time: "1 minutes 15 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9310, root: 0, depth: 1, width: 32, size: 20_612, time: "00:00:01"))
        result.append(BranchAndBoundInstruction(
            game: 9311, root: 4, depth: 1, width: 16, size: 8_249, time: "00:00:01"))
        result.append(BranchAndBoundInstruction(
            game: 9312, root: 2, depth: 1, width: 5, size: 14_610, time: "00:00:01"))
        result.append(BranchAndBoundInstruction(
            game: 9401, root: 4, depth: 1, width: 110, size: 3415, time: "6.202643166 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9402, root: 0, depth: 2, width: 4, size: 17_894, time: "00:00:39"))
        // 9403,
        //game: 9404, root: 4, depth: 1, width: 3747, size: 31337, time: "6 minutes 35 seconds"
        //game: 9404, root: 5, depth: 1, width: 1762, size: 31337, time: "5 minutes 14 seconds"
        //game: 9404, root: 8, depth: 1, width: 9855, size: 31337, time: "23 minutes 7 seconds"
        result.append(BranchAndBoundInstruction(
            game: 9404, root: 6, depth: 1, width: 420, size: 31337, time: "1 minutes 17 seconds"))
        
        result.append(BranchAndBoundInstruction(
            game: 9406, root: 3, depth: 1, width: 64, size: 40_556, time: "00:00:51"))
        //game: 9407, root: 2, depth: 2, width: 37, size: 19_968, time: "00:12:58"
        result.append(BranchAndBoundInstruction(
            game: 9407, root: 1, depth: 1, width: 5548, size: 19968, time: "13 minutes 10 seconds"))
        //game: 9408, lookaheadDepth: 1, rootShape: 4, lower: 9843, upper: 10000, currentWidth: 9921
        result.append(BranchAndBoundInstruction(
            game: 9408, root: 4, depth: 1, width: 10000, size: 86687, time: "2 hours 22 minutes 27 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9409, root: 7, depth: 1, width: 3049, size: 58235, time: "16 minutes 22 seconds"))
        // 9410
        result.append(BranchAndBoundInstruction(
            game: 9411, root: 2, depth: 1, width: 9828, size: 51893, time: "47 minutes 14 seconds"))
        
        //game: 9412, root: 0, depth: 2, width: 5, size: 11_089, time: "00:00:39"
        result.append(BranchAndBoundInstruction(
            game: 9412, root: 8, depth: 1, width: 6654, size: 11089, time: "9 minutes 1 seconds"))
        // game: 9501, root: 1, depth: 1, width: 9588, size: 8404, time: "7 minutes 34 seconds"
        result.append(BranchAndBoundInstruction(
            game: 9501, root: 4, depth: 1, width: 1974, size: 8404, time: "2 minutes 32 seconds"))
        /*
         game: 9501, root: 0, depth: 2, width: 20, size: 8_404, time: "00:00:42"
         game: 9501, root: 1, depth: 2, width: 61, size: 8_404, time: "00:04:54"
         game: 9501, root: 2, depth: 2, width: 21, size: 8_404, time: "00:01:24"
         game: 9501, root: 4, depth: 2, width: 11, size: 8_404, time: "00:01:36"
         game: 9501, root: 6, depth: 2, width: 20, size: 8_404, time: "00:01:16"
         */
        //result.append(BranchAndBoundInstruction(
            //game: 9501, root: 2, depth: 2, width: 74, size: 8_404, time: "00:01:42"))
        
        result.append(BranchAndBoundInstruction(
            game: 9502, root: 1, depth: 1, width: 4130, size: 55590, time: "20 minutes 32 seconds"))
            //game: 9502, root: 2, depth: 2, width: 43, size: 55_590, time: "00:39:40"))
        // game: 9506, root: 4, depth: 1, width: 1995, size: 17876, time: "2 minutes 24 seconds"
        // game: 9506, root: 5, depth: 1, width: 162, size: 17876, time: "25 seconds"
        // game: 9506, root: 6, depth: 1, width: 2932, size: 17876, time: "4 minutes 9 seconds"
    //game: 9506, root: 7, depth: 1, width: 210, size: 17876, time: "18 seconds"
        //game: 9506, root: 5, depth: 2, width: 26, size: 17_876, time: "00:04:50"
        result.append(BranchAndBoundInstruction(
            game: 9506, root: 7, depth: 1, width: 210, size: 17876, time: "18 seconds"))
        
    //game: 9507, root: 4, depth: 1, width: 879, size: 31319, time: "10 minutes 25 seconds" This came out again so strange it doesnt calculate correctly
        result.append(BranchAndBoundInstruction(
            game: 9507, root: 4, depth: 1, width: 879, size: 31319, time: "10 minutes 18 seconds"))
        
        //game: 9508, root: 1, depth: 1, width: 284, size: 5426, time: "17 seconds"
        //game: 9508, root: 2, depth: 1, width: 6452, size: 5426, time: "6 minutes 3 seconds"
        //game: 9508, root: 4, depth: 1, width: 1694, size: 5426, time: "1 minutes 13 seconds"
        result.append(BranchAndBoundInstruction(
            game: 9508, root: 1, depth: 1, width: 284, size: 5426, time: "17 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9509, root: 2, depth: 1, width: 6500, size: 9263, time: "13 minutes 40 seconds"))
        
        
        //game: 9511, root: 0, depth: 1, width: 3385, size: 35324, time: "24 minutes 7 seconds"
        result.append(BranchAndBoundInstruction(
            game: 9511, root: 3, depth: 1, width: 1517, size: 35324, time: "11 minutes 21 seconds"))
        
        result.append(BranchAndBoundInstruction(
            game: 9605, root: 0, depth: 1, width: 1784, size: 29185, time: "1 minutes 26 seconds"))
        
        
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
        
        result.append(BranchAndBoundInstruction(
            game: 8612, root: 0, depth: 1, width: 6, size: 380, time: "0.022560042 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8704, root: 3, depth: 1, width: 11, size: 560, time: "0.12260275 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8705, root: 1, depth: 1, width: 9, size: 430, time: "0.038857 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8710, root: 0, depth: 1, width: 2, size: 269, time: "0.005559667 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8711, root: 0, depth: 1, width: 5, size: 646, time: "0.038124625 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8712, root: 0, depth: 1, width: 3, size: 575, time: "0.037246375 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8802, root: 2, depth: 1, width: 2, size: 289, time: "0.013008583 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8803, root: 5, depth: 1, width: 984, size: 574, time: "1.734951458 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8804, root: 2, depth: 1, width: 3, size: 794, time: "0.043701917 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8805, root: 2, depth: 1, width: 148, size: 350, time: "0.481831167 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8806, root: 3, depth: 1, width: 1929, size: 973, time: "10 seconds"))
            //game: 8806, root: 0, depth: 1, width: 4173, size: 973, time: "20 seconds"))
            //game: 8806, root: 2, depth: 3, width: 237, size: 973, time: "1 minutes 24 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8807, root: 1, depth: 1, width: 62, size: 491, time: "0.110292875 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8808, root: 3, depth: 1, width: 4, size: 363, time: "0.011489917 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8809, root: 0, depth: 1, width: 3, size: 592, time: "0.029253 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8810, root: 4, depth: 2, width: 41, size: 404, time: "0.887075416 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8811, root: 0, depth: 1, width: 5, size: 334, time: "0.018934667 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8812, root: 0, depth: 1, width: 21, size: 353, time: "0.028274459 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8902, root: 0, depth: 1, width: 16, size: 391, time: "0.02214775 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8903, root: 0, depth: 1, width: 18, size: 440, time: "0.063684708 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8904, root: 5, depth: 2, width: 71, size: 546, time: "4.464412209"))
        result.append(BranchAndBoundInstruction(
            game: 8905, root: 3, depth: 2, width: 56, size: 509, time: "1.60301775 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8906, root: 1, depth: 1, width: 32, size: 507, time: "0.244678458 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8907, root: 4, depth: 1, width: 11, size: 805, time: "0.096315583 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8908, root: 4, depth: 1, width: 21, size: 412, time: "0.193136958 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8909, root: 4, depth: 1, width: 13, size: 449, time: "0.015801833 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8910, root: 0, depth: 1, width: 7, size: 296, time: "0.004192333 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8911, root: 0, depth: 1, width: 13, size: 564, time: "0.052504459 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 8912, root: 0, depth: 1, width: 20, size: 300, time: "0.028271917 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9001, root: 0, depth: 2, width: 44, size: 370, time: "0.9243595 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9002, root: 0, depth: 1, width: 15, size: 530, time: "0.040843584 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9003, root: 4, depth: 1, width: 59, size: 483, time: "0.168063167 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9004, root: 0, depth: 1, width: 11, size: 443, time: "0.065071417 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9005, root: 0, depth: 1, width: 7, size: 621, time: "0.036946375 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9006, root: 0, depth: 1, width: 18, size: 748, time: "0.148016167 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9007, root: 0, depth: 1, width: 9, size: 172, time: "0.004497916 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9008, root: 0, depth: 1, width: 4, size: 561, time: "0.026045084 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9009, root: 0, depth: 1, width: 10, size: 838, time: "0.115713416 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9010, root: 1, depth: 1, width: 16, size: 541, time: "0.049530208 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9011, root: 5, depth: 1, width: 13, size: 645, time: "0.047603541 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9012, root: 1, depth: 1, width: 26, size: 573, time: "0.071231708 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9101, root: 1, depth: 2, width: 90, size: 847, time: "2.885720292 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9102, root: 0, depth: 2, width: 145, size: 529, time: "2.029116875 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9103, root: 0, depth: 1, width: 3, size: 423, time: "0.029701458 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9104, root: 1, depth: 1, width: 2, size: 611, time: "0.01812625 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9105, root: 0, depth: 1, width: 11, size: 397, time: "0.015341625 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9106, root: 2, depth: 1, width: 2, size: 705, time: "0.0137495 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9107, root: 6, depth: 1, width: 665, size: 830, time: "3.677144042 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9108, root: 0, depth: 1, width: 5, size: 396, time: "0.023386541 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9109, root: 0, depth: 1, width: 3, size: 342, time: "0.006872666 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9110, root: 0, depth: 1, width: 5, size: 440, time: "0.019498208 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9111, root: 0, depth: 1, width: 9, size: 1123, time: "0.071672292 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9112, root: 3, depth: 1, width: 76, size: 227, time: "0.053546625 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9201, root: 0, depth: 1, width: 3, size: 590, time: "0.013429542 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9202, root: 0, depth: 1, width: 64, size: 344, time: "0.101803416 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9203, root: 3, depth: 2, width: 29, size: 442, time: "2.846914041 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9204, root: 0, depth: 1, width: 18, size: 606, time: "0.08828675 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9206, root: 2, depth: 1, width: 3, size: 734, time: "0.020905708 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9207, root: 1, depth: 1, width: 4, size: 211, time: "0.003326375 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9208, root: 1, depth: 1, width: 39, size: 493, time: "0.055554125 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9209, root: 2, depth: 2, width: 42, size: 721, time: "2.224871875 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9210, root: 1, depth: 1, width: 5, size: 480, time: "0.036032208 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9211, root: 0, depth: 1, width: 3, size: 571, time: "0.015520292 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9212, root: 1, depth: 1, width: 3, size: 611, time: "0.035063708 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9301, root: 4, depth: 1, width: 32, size: 417, time: "0.093058625 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9302, root: 0, depth: 1, width: 3, size: 409, time: "0.016908709 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9303, root: 3, depth: 1, width: 13, size: 595, time: "0.05672475 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9304, root: 0, depth: 2, width: 131, size: 779, time: "4.39994325 seconds"))
        result.append(BranchAndBoundInstruction(
            //game: 9305, root: 5, depth: 3, width: 221, size: 660, time: "59 seconds"))
            game: 9305, root: 5, depth: 2, width: 214, size: 660, time: "17 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9306, root: 3, depth: 1, width: 2, size: 323, time: "0.005314667 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9307, root: 2, depth: 1, width: 13, size: 502, time: "0.069256708 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9308, root: 0, depth: 1, width: 11, size: 259, time: "0.016403625 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9309, root: 0, depth: 1, width: 14, size: 476, time: "0.041151792 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9310, root: 0, depth: 1, width: 2, size: 193, time: "0.001198833 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9311, root: 0, depth: 1, width: 2, size: 373, time: "0.006902625 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9312, root: 0, depth: 1, width: 2, size: 430, time: "0.010346417 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9401, root: 0, depth: 1, width: 15, size: 471, time: "0.11513975 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9402, root: 0, depth: 1, width: 22, size: 871, time: "0.352913875 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9403, root: 5, depth: 1, width: 16, size: 2537, time: "0.140990917 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9404, root: 0, depth: 1, width: 8, size: 977, time: "0.07449775 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9406, root: 3, depth: 1, width: 19, size: 745, time: "0.12596325 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9407, root: 2, depth: 1, width: 138, size: 751, time: "1.0098385 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9408, root: 6, depth: 1, width: 5, size: 1647, time: "0.265014917 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9409, root: 1, depth: 1, width: 6, size: 1062, time: "0.094503667 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9410, root: 4, depth: 1, width: 29, size: 857, time: "0.286432584 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9411, root: 1, depth: 1, width: 44, size: 1007, time: "0.364863709 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9412, root: 0, depth: 1, width: 10, size: 898, time: "0.12021775 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9501, root: 6, depth: 1, width: 51, size: 1005, time: "0.422995417 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9502, root: 4, depth: 1, width: 6, size: 1554, time: "0.177569291 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9503, root: 0, depth: 1, width: 5, size: 709, time: "0.069847625 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9504, root: 4, depth: 2, width: 20, size: 836, time: "4.007026917 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9505, root: 6, depth: 2, width: 19, size: 1554, time: "6.001396792 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9506, root: 7, depth: 1, width: 22, size: 1042, time: "0.136309875 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9507, root: 4, depth: 1, width: 44, size: 964, time: "1.537195875 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9508, root: 1, depth: 1, width: 12, size: 580, time: "0.106046292 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9509, root: 2, depth: 1, width: 80, size: 833, time: "1.347020875 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9510, root: 0, depth: 1, width: 8, size: 583, time: "0.037865916 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9511, root: 5, depth: 1, width: 6, size: 1186, time: "0.149049792 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9512, root: 1, depth: 2, width: 19, size: 1214, time: "4.644721125 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9601, root: 6, depth: 1, width: 10, size: 685, time: "0.140657125 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9602, root: 5, depth: 1, width: 115, size: 721, time: "1.000661291 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9603, root: 3, depth: 2, width: 51, size: 1523, time: "14 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9604, root: 6, depth: 1, width: 54, size: 927, time: "0.254214917 seconds"))
        result.append(BranchAndBoundInstruction(
            game: 9605, root: 3, depth: 1, width: 143, size: 1219, time: "0.731943959 seconds"))

        //Overall Duration: 1 minutes 21 seconds
        
        // Missing games [8803]
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 62, games: [8807], rootShape: 1, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        // game: 9101, rootShape: 2, lookaheadDepth: 2, beamWidth: 2, time: 0.69246425 seconds,
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 2, games: [9101], rootShape: 2, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        //game: 9210, rootShape: 0, lookaheadDepth: 1, beamWidth: 38, time: 0.225481542 seconds
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 38, games: [9210], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        // game: 9301, rootShape: 4, lookaheadDepth: 1, beamWidth: 32, time: 0.127628875 seconds
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 32, games: [9301], rootShape: 4, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        // game: 9303, rootShape: 0, lookaheadDepth: 1, beamWidth: 42, time: 0.246056209 seconds
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 42, games: [9303], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        //game: 9508, rootShape: 1, lookaheadDepth: 1, beamWidth: 12, time: 0.1506745 seconds
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 12, games: [9508], rootShape: 1, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        //game: 9605, rootShape: 0, lookaheadDepth: 2, beamWidth: 30, time: 1.970560458 seconds
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 30, games: [9605], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 40, games: [9305], rootShape: 5, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 80, games: [9509], rootShape: 2, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 56, games: [9203], rootShape: 2, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 76, games: [9112], rootShape: 3, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 13, games: [8911], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        
//        
//        
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 1, games: [8703, 8802, 8808, 9104, 9212, 9306, 9406], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 2, games: [8710, 9311], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 3, games: [9412], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 5, games: [8711], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 8, games: [9108], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 17, games: [9510], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 1, beamWidth: 27, games: [9503], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 1, games: [8612, 8809, 9002, 9109, 9201, 9211, 9310, 9312], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 2, games: [8702, 8704, 8910, 9105, 9207], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 3, games: [
//            8911,9004, 9408], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 4, games: [8912], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 5, games: [9409], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 6, games: [9511], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 7, games: [9208], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 8, games: [9411], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 10, games: [9401], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 13, games: [9410], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 2, beamWidth: 36, games: [8906], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 1, games: [8705, 8712, 8811, 9007, 9008, 9103, 9110, 9111, 9206, 9302, 9308, 9309, 9404, 9502], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 2, games: [8812, 8903, 8910, 9006, 9204, 9304, 9402], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 3, games: [9009, 9407], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 4, games: [8810, 9003], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 5, games: [9005, 9512], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 6, games: [8907], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 7, games: [9106], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 9, games: [9307], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 10, games: [9506, 9604], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 11, games: [8902, 9202, 9501], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 18, games: [9001, 9011], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 19, games: [9601], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 21, games: [8908], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 22, games: [9012], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 36, games: [9102], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 66, games: [9403], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 98, games: [8909], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 107, games: [9203], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 124, games: [9603], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 153, games: [9010, 9209], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 193, games: [8905], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 454, games: [9507], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 8, games: [9509], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 23, games: [9107], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 35, games: [9112], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 68, games: [8805], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 82, games: [8904], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 4, beamWidth: 140, games: [8904], rootShape: 0, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        
//
//        // These are the stranger instructions that do not start with the highest scoring starting shape same as other winning word result
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 4, games: [8804], rootShape: 2, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 22, games: [9602], rootShape: 1, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 28, games: [8803], rootShape: 1, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 40, games: [9305], rootShape: 5, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 51, games: [9505], rootShape: 6, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 77, games: [8806], rootShape: 8, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 87, games: [9504], rootShape: 3, rootWidth: 1, useGuidedScores: false, maxDepth: 30))
//        result.append(BranchAndBoundInstruction(lookaheadDepth: 3, beamWidth: 87, games: [9507], rootShape: 5, rootWidth: 1, useGuidedScores: false, maxDepth: 30))

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
