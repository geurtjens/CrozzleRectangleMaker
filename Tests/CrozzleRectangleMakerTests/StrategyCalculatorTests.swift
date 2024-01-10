//
//  StrategyCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 9/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class StrategyCalculatorTests: XCTestCase {

    
    func test_gamesThatHaventWonYet() async {
        await StrategyCalculator.gamesThatHaventWonYet()
    }

    func test_Next() async {
        await StrategyCalculator.BasicStrategy()
    }
    
    /// Lets discover if doing a mergeWithItself on the two word produces the same results or different results
    func test_MergeWithItselfMoreThanOnce() async {
        guard let game = GameList().getGame(gameId: 8612) else {
            return
        }
        
        let (winningShapes, words, _, _) = WinningShapesCalculatorV1.getShapesWinningWords(gameId: 8612)
        let scoresMin:[Int] = Array(repeating: 0, count: 40)
        let constraints = ConstraintsModel(words: words, scoresMin:scoresMin, queueLengthMax: 1000, priorityFunction: .score_area)
        var queues = QueueList(game: game, constraints: constraints)
        
        queues.add(shapes: winningShapes)
        
        // We initially have 15 shapes
        XCTAssertEqual(15,queues.size())
        XCTAssertEqual(0, queues.queues[3].shapes.count)
        
        // Then we merge with itself which produces some queues of 3 words
        await queues.mergeWithItselfAll()
        XCTAssertEqual(83, queues.size())
        XCTAssertEqual(8, queues.queues[3].shapes.count)
        
        // Merge with itself produces the same result the second time
        await queues.mergeWithItselfAll()
        XCTAssertEqual(83, queues.size())
        XCTAssertEqual(8, queues.queues[3].shapes.count)
        
        // Merge with itself produces the same result the third time
        await queues.mergeWithItselfAll()
        XCTAssertEqual(83, queues.size())
        XCTAssertEqual(8, queues.queues[3].shapes.count)
    }
    
//    func test_MergeWithItselfMoreThanOnce() async {
//        guard let game = GameList().getGame(gameId: 8612) else {
//            return
//        }
//
//        let (winningShapes, words, _, _) = GameList.getShapes(gameId: 8612)
//        let scoresMin:[Int] = Array(repeating: 0, count: 40)
//        let constraints = ConstraintsModel(words: words, scoresMin:scoresMin, queueLengthMax: 1000, priorityFunction: .score_area)
//        var queues = QueueList(game: game, constraints: constraints)
//
//        queues.add(shapes: winningShapes)
//
//        // We initially have 15 shapes
//        XCTAssertEqual(15,queues.size())
//        XCTAssertEqual(0, queues.queues[3].gpuShapes.count)
//
//        // Then we merge with itself which produces some queues of 3 words
//        await queues.mergeWithItselfAll()
//        XCTAssertEqual(83, queues.size())
//        XCTAssertEqual(8, queues.queues[3].gpuShapes.count)
//
//        // Merge with itself produces the same result the second time
//        await queues.mergeWithItselfAll()
//        XCTAssertEqual(83, queues.size())
//        XCTAssertEqual(8, queues.queues[3].gpuShapes.count)
//
//        // Merge with itself produces the same result the third time
//        await queues.mergeWithItselfAll()
//        XCTAssertEqual(83, queues.size())
//        XCTAssertEqual(8, queues.queues[3].gpuShapes.count)
//    }
    
    
//    func test_Shapes_8703_PacmanVariant4x3() {
//        // Cannot do as it has a different shape
////        let result = StrategyCalculator.Shapes_8703()
////        XCTAssertNotNil(result)
////        if let result = result {
////            XCTAssertEqual(758, result.score)
////        }
//        XCTFail("Not yet implemented PacmanVariant4x3")
//    }
//    
//
//

//    
//    func test_Shapes_8805_PacmanVariant4x3() {
//        // Has shapes I cannot make yet
//        XCTFail("Not yet implemented PacmanVariant4x3")
//    }
//    

//    func test_Shapes_8807_Outer2x3() {
//        // Has shapes I cannot make yet
//        XCTFail("Not yet implemented Outer2x3")
//    }
//    
   

//    func test_Shapes_8907_Outer2x3() {
//        /// this is impossible as we do not have the outer shape.
//        XCTFail("Not yet implemented Outer2x3")
//    }
//    

//    

//
//    /// cannot do as it has an outer 2x2
//    func test_Shapes_8910_Outer2x3() {
//        XCTFail("Not yet implemented Outer2x3")
//    }
//    

//    func test_Shapes_9002_TwoCrazyShapes() {
//        XCTFail("Not yet implemented TwoCrazyShapes")
//    }
//    
//    func test_Shapes_9008_Outer2x3() {
//        XCTFail("Not yet implemented Outer2x3")
//    }
//
//    func test_Shapes_9101_WontWork_OuterRequired() {
//        let result = StrategyCalculator.Shapes_9101()
//        XCTAssertNotNil(result)
//        if let result = result {
//            XCTAssertEqual(734, result.score)
//        }
//    }
//
//    func test_Shapes_9102_CannotSolve() {
//        XCTFail("Not yet implemented CannotSolve")
//    }
//    
//    func test_Shapes_9109_WontWork() {
//        XCTFail("Not yet implemented UniqueShape")
////        let result = StrategyCalculator.Shapes_9109()
////        XCTAssertNotNil(result)
////        if let result = result {
////            XCTAssertEqual(636, result.score)
////        }
//    }
//    
//    func test_Shapes_9204_Outer3x5() {
//        XCTFail("Not yet implemented Outer3x5")
//    }
//    
//    func test_Shapes_9209_Outer3x4() {
//        XCTFail("Not yet implemented Outer3x4")
//    }
//    
//    func test_Shapes_9407_Outer3x4() {
//        XCTFail("Not yet implemented Outer3x3")
//    }
//    
//    func test_Shapes_9507_Outer2x3() {
//        XCTFail("Not yet implemented Outer2x3")
//    }
//    
//    func test_Shapes_9508_Outer2x3() {
//        XCTFail("Not yet implemented Outer2x3")
//    }
//    func test_Shapes_9601_Outer2x4() {
//        XCTFail("Not yet implemented Outer2x4")
//    }
//    func test_Shapes_9604_Outer2x4() {
//        XCTFail("Not yet implemented Outer2x4")
//    }
//    
//    func test_Shapes_9605_UnknownShape() {
//        XCTFail("Not yet implemented UnknownShape")
//    }
//  
}
