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
