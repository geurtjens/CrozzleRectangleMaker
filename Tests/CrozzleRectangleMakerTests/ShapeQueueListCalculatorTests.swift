//
//  GpuShapeCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 23/5/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class ShapeQueueListCalculatorTests: XCTestCase {

    func test_execute() async throws {
        
        
        
        let scoresMin = Array(repeating: 1000, count: 40)
        let result = await ShapeQueueListCalculator.Execute(
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        XCTAssertEqual(words.count, result.wordCount)
        XCTAssertEqual(widthMax, result.widthMax)
        XCTAssertEqual(heightMax, result.heightMax)
        XCTAssertEqual(38, result.queues.count)
        for i in 2..<40 {
            if let queue = result.queues[i] {
                XCTAssertEqual(i, queue.stride)
                XCTAssertEqual(1000, queue.scoreMin)
            }
        }
    }
    
    
    func test_get_2_word_shapes() throws {
        
        let shapes = ShapeQueueListCalculator.get_2_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        XCTAssertEqual(2, shapes[0].placements.count)
        XCTAssertEqual(10757, shapes.count)
    }
    
    func test_get_4_word_shapes() async throws {
        
        let shapes = await ShapeQueueListCalculator.get_4_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        XCTAssertEqual(4, shapes[0].placements.count)
        XCTAssertEqual(4531541, shapes.count)
    }
    
    func test_get_5_word_shapes() throws {
        
        let shapes = ShapeQueueListCalculator.get_5_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        XCTAssertEqual(5, shapes[0].placements.count)
        XCTAssertEqual(292, shapes.count)
    }
    
    func test_get_6_word_shapes() throws {
        
        let shapes = ShapeQueueListCalculator.get_6_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        XCTAssertEqual(6, shapes[0].placements.count)
        XCTAssertEqual(52, shapes.count)
    }
    
    func test_get_7_word_shapes() throws {
        
        let shapes = ShapeQueueListCalculator.get_7_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        XCTAssertEqual(7, shapes[0].placements.count)
        XCTAssertEqual(6, shapes.count)
    }
    
    func test_get_8_word_shapes() throws {
        
        let shapes = ShapeQueueListCalculator.get_8_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        //XCTAssertEqual(8, gpuShapes.stride)
        XCTAssertEqual(0, shapes.count)
    }
    
    var words:[String] = []
    var lengths: [Int] = []
    override func setUpWithError() throws {
        words = WordData.words_8612()
        lengths = WordCalculator.lengths(words: words)
    }
    
    let widthMax = 17
    let heightMax = 12
    let scoreMin = 0
}
