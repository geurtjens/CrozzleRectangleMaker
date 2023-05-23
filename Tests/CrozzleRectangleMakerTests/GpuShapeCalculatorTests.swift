//
//  GpuShapeCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 23/5/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class GpuShapeCalculatorTests: XCTestCase {

    func test_get_2_word_shapes() throws {
        
        let result = GpuShapeCalculator.get_2_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        XCTAssertEqual(2, result.wordCount)
        XCTAssertEqual(10757, result.count)
    }
    
    func test_get_4_word_shapes() async throws {
        
        let result = await GpuShapeCalculator.get_4_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        XCTAssertEqual(4, result.wordCount)
        XCTAssertEqual(4531541, result.count)
    }
    
    func test_get_5_word_shapes() throws {
        
        let result = GpuShapeCalculator.get_5_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        XCTAssertEqual(5, result.wordCount)
        XCTAssertEqual(292, result.count)
    }
    
    func test_get_6_word_shapes() throws {
        
        let result = GpuShapeCalculator.get_6_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        XCTAssertEqual(6, result.wordCount)
        XCTAssertEqual(52, result.count)
    }
    
    func test_get_7_word_shapes() throws {
        
        let result = GpuShapeCalculator.get_7_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        XCTAssertEqual(7, result.wordCount)
        XCTAssertEqual(6, result.count)
    }
    
    func test_get_8_word_shapes() throws {
        
        let result = GpuShapeCalculator.get_8_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        XCTAssertEqual(8, result.wordCount)
        XCTAssertEqual(0, result.count)
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
