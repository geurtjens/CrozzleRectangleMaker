//
//  StandardSearchAlgorithmsTests.swift
//  
//
//  Created by Michael Geurtjens on 15/9/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class StandardSearchAlgorithmsTests: XCTestCase {

    func testQueue() {
        var queue = SwiftQueue<Int>()
        
        for i in 0..<10 {
            queue.enqueue(i)
        }
        
        while queue.isEmpty() == false {
            let dequeue = queue.dequeue()!
            print("\(dequeue) ")
        }
    }
    
    
    func testDepthFirstSearchV1() throws {
        let (highestScoringShape, enqueueCount, dequeueCount, isWinner) = StandardSearchAlgorithms.depthFirstSearchV1(gameId: 8612)
        XCTAssertTrue(isWinner)
        print("enqueue count: \(enqueueCount), dequeueCount: \(dequeueCount)")
        print(highestScoringShape.mergeHistory)
    }
    
    func testDepthFirstSearchExtendedV1() throws {
        let (highestScoringShape, enqueueCount, dequeueCount, isWinner) = StandardSearchAlgorithms.depthFirstSearchExtendedV1(gameId: 8612)
        XCTAssertTrue(isWinner)
        print("enqueue count: \(enqueueCount), dequeueCount: \(dequeueCount)")
        print(highestScoringShape.mergeHistory)
    }
    
    func testHillClimingSearchExtendedV1() throws {
        let (highestScoringShape, enqueueCount, dequeueCount, isWinner) = StandardSearchAlgorithms.hillClimbingSearchExtendedV1(gameId: 8612)
        print("enqueue count: \(enqueueCount), dequeueCount: \(dequeueCount)")
        print(highestScoringShape.mergeHistory)
        XCTAssertTrue(isWinner)
    }
    
    func testBeamSearchOf2ExtendedAllV1() throws {
        
        let gameList = GameList()
        
        let successfulGames = [
            8705, 8710, 8802, 8808, 8812, 8911, 9002, 9006, 9008, 9103,
            9104, 9108, 9109, 9201, 9202, 9207, 9210, 9211, 9306, 9308,
            9312, 9406, 9411
            
        ]
        let breamStartTime = DateTimeCalculator.now()
        var winnerCount = 0
        for game in gameList.games {
            if successfulGames.contains(game.gameId) {
                let (highestScoringShape, enqueueCount, dequeueCount, isWinner) = StandardSearchAlgorithms.beamSearchExtendedV1(gameId: game.gameId, beamWidth: 2)
                if isWinner {
                    winnerCount += 1
                }
                print("enqueue count: \(enqueueCount), dequeueCount: \(dequeueCount)")
                print(highestScoringShape.mergeHistory)
            }
        }
        print("Winners = \(winnerCount)")
        let beamFinishTime = DateTimeCalculator.now()

        print("Beam Search Duration across \(successfulGames.count) games is \(DateTimeCalculator.duration(start: breamStartTime, finish: beamFinishTime))")
        
        //Beam Search Duration across 23 is 1 minutes 5 seconds
        XCTAssertEqual(successfulGames.count, winnerCount)
    }
    
    func testHillClimingSearchExtendedAllV1() throws {
        
        let gameList = GameList()
        
        let successfulGames = [
            8808, 9002, 9103, 9109, 9110, 9306, 9311, 9312
        ]
        
        var winnerCount = 0
        for game in gameList.games {
            if successfulGames.contains(game.gameId) {
                let (highestScoringShape, enqueueCount, dequeueCount, isWinner) = StandardSearchAlgorithms.hillClimbingSearchExtendedV1(gameId: game.gameId)
                if isWinner {
                    winnerCount += 1
                }
                print("enqueue count: \(enqueueCount), dequeueCount: \(dequeueCount)")
                print(highestScoringShape.mergeHistory)
            }
        }
        print("Winners = \(winnerCount)")
        XCTAssertEqual(successfulGames.count, winnerCount)
    }
    
    func testDepthFirstSearchV2() throws {
        let (highestScoringShape, enqueueCount, dequeueCount, isWinner) = StandardSearchAlgorithms.depthFirstSearchV2(gameId: 8612)
        XCTAssertTrue(isWinner)
        print("enqueue count: \(enqueueCount), dequeueCount: \(dequeueCount)")
        print(highestScoringShape.mergeHistory)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
