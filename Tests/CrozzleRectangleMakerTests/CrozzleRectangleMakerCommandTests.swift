//
//  CrozzleRectangleMakerCommandTests.swift
//  
//
//  Created by Michael Geurtjens on 24/8/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class CrozzleRectangleMakerCommandTests: XCTestCase {

    func testMergeWithOriginalShapesOnly() async throws {
        FeatureFlags.verbose = false
        FeatureFlags.mergeMethod = .async_arrayOfObjects
        FeatureFlags.findMatchesType = 1
        let startTime = DateTimeCalculator.now()
        //await StrategyCalculator.gamesThatHaventWonYet()

            let gamesWon_1000 = [ 8702,8703,
                8612, 8710, 8712, 8809, 8812, 8902, 8903, 8910, 9004, 9005,
                9007, 9008, 9103, 9108, 9110, 9111, 9112, 9201, 9202, 9203,
                9208, 9212, 9302, 9303, 9306, 9307, 9308, 9309, 9310, 9311,
                9312, 9404, 9502
            ]

            /// We added extra 8612 and 8710`
            let gamesWon_5000 = [
                8705, 8803, 8805, 8808, 8811, 8904, 8906, 8911, 8912, 9009,
                9102, 9105, 9207, 9210, 9401, 9407, 9408
            ]
            

            let gamesWon_10_000 = [
                8802, 8905, 8907, 8908, 8909, 9001, 9104, 9211, 9304, 9406,
                9409, 9508, 9509]

            let gamesWon_15_000 = [
                8704, 9006, 9011, 9206, 9603
            ]

            // These are winners obtained from running this program
            let gamesWon_20_000 = [
                8804, 9003, 9301, 9501
            ]
            
            let unknown = [
                //8702, 8703,
                8711, 8806, 8807, 8810, 9002, 9010, 9012, 9101,
                9106, 9107, 9109, 9204, 9209, 9305, 9402, 9403, 9410, 9411,
                9412, 9503, 9504, 9505, 9506, 9507, 9510, 9511, 9512, 9601,
                9602, 9604, 9605]

         
        
            let gameList = GameList()
            //var result = ""
            for game in gameList.games {
                let words = game.winningWords
                
                var queueLength = 0
                if gamesWon_1000.contains(game.gameId) { //}== false && newWinners.contains(game.gameId) == false && game.gameId >= 9412 {
                    queueLength = 1_000
                } else if gamesWon_5000.contains(game.gameId) {
                    //queueLength = 5_000
                } else if gamesWon_10_000.contains(game.gameId) {
                    //queueLength = 10_000
                } else if gamesWon_15_000.contains(game.gameId) {
                    //queueLength = 15_000
                } else if gamesWon_20_000.contains(game.gameId) {
                    //queueLength = 20_000
                } else if unknown.contains(game.gameId){
                    // Dont know why these are not working yet
                    //queueLength = 1000
                } else {
                    print(game.gameId)
                    //queueLength = 0
                }
                if queueLength > 0 {
                    print("## GAME: \(game.gameId), queue: \(queueLength)")
                    
                    let _ = await StrategyCalculator.mergeWithOriginalShapeOnly(game: game, words: words, queueLength: queueLength, highScore: game.winningScore, repeatTimes: 1)
                    print("")
                    print("")
                }
            }

        let finishTime = DateTimeCalculator.now()

        let duration = DateTimeCalculator.duration(start: startTime, finish: finishTime)
        print("TOTAL DURATION IS \(duration)")

    }

    func testOriginal() async throws {
        FeatureFlags.verbose = false
        FeatureFlags.mergeMethod = .async_arrayOfObjects
        FeatureFlags.findMatchesType = 1
        let startTime = DateTimeCalculator.now()
        //await StrategyCalculator.gamesThatHaventWonYet()

            let gamesWon_1000 = [
                8612, 8710, 8712, 8809, 8812, 8902, 8903, 8910, 9004, 9005,
                9007, 9008, 9103, 9108, 9110, 9111, 9112, 9201, 9202, 9203,
                9208, 9212, 9302, 9303, 9306, 9307, 9308, 9309, 9310, 9311,
                9312, 9404, 9502
            ]

            /// We added extra 8612 and 8710`
            let gamesWon_5000 = [
                8705, 8803, 8805, 8808, 8811, 8904, 8906, 8911, 8912, 9009,
                9102, 9105, 9207, 9210, 9401, 9407, 9408
            ]
            

            let gamesWon_10_000 = [
                8802, 8905, 8907, 8908, 8909, 9001, 9104, 9211, 9304, 9406,
                9409, 9508, 9509]

            let gamesWon_15_000 = [
                8704, 9006, 9011, 9206, 9603
            ]

            // These are winners obtained from running this program
            let gamesWon_20_000 = [
                8804, 9003, 9301, 9501
            ]
            
            let unknown = [
                //8702, 8703,
                8711, 8806, 8807, 8810, 9002, 9010, 9012, 9101,
                9106, 9107, 9109, 9204, 9209, 9305, 9402, 9403, 9410, 9411,
                9412, 9503, 9504, 9505, 9506, 9507, 9510, 9511, 9512, 9601,
                9602, 9604, 9605]

         
        
            let gameList = GameList()
            //var result = ""
            for game in gameList.games {
                let words = game.winningWords
                
                var queueLength = 0
                if gamesWon_1000.contains(game.gameId) { //}== false && newWinners.contains(game.gameId) == false && game.gameId >= 9412 {
                    queueLength = 1_000
                } else if gamesWon_5000.contains(game.gameId) {
                    //queueLength = 5_000
                } else if gamesWon_10_000.contains(game.gameId) {
                    //queueLength = 10_000
                } else if gamesWon_15_000.contains(game.gameId) {
                    //queueLength = 15_000
                } else if gamesWon_20_000.contains(game.gameId) {
                    //queueLength = 20_000
                } else if unknown.contains(game.gameId){
                    // Dont know why these are not working yet
                    //queueLength = 1000
                } else {
                    print(game.gameId)
                    //queueLength = 0
                }
                if queueLength > 0 {
                    print("## GAME: \(game.gameId), queue: \(queueLength)")
                    
                    let _ = await StrategyCalculator.TryMergeWithLowerOnly(game: game, words: words, queueLength: queueLength, highScore: game.winningScore, repeatTimes: 1)
                    print("")
                    print("")
                }
            }

        let finishTime = DateTimeCalculator.now()

        let duration = DateTimeCalculator.duration(start: startTime, finish: finishTime)
        print("TOTAL DURATION IS \(duration)")

    }

}
