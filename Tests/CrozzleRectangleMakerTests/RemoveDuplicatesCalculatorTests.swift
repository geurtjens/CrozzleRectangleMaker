//
//  RemoveDuplicatesCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 30/5/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class RemoveDuplicatesCalculatorTests: XCTestCase {

    func test_DuplicatesInRectangle() async throws {
        
        let rectangles = await RectangleCalculatorV1.Execute(words: words, scoreMin: 104, widthMax: widthMax, heightMax: heightMax)
        
        let shapes = ShapeCalculator.toShapes(rectangles: rectangles)
        
        let (noDuplicates, duplicateCount) = RemoveDuplicatesCalculator.execute(shapes: shapes)
        
        // somehow everything O4x6 makes duplicates and I dont know why
        // There are 296 duplicates from 17144 values when scoreMin: 104 and it takes 60 seconds for this to run
        XCTAssertEqual(0, duplicateCount)
        XCTAssertEqual(17389, noDuplicates.count)
    }
    
    func test_Find_0() throws {
        
        let result = EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let a = result[0].ToShape()
        let b = result[1].ToShape()
        
        let shapes = [a, b]
        
        let (noDuplicates, duplicateCount) = RemoveDuplicatesCalculator.execute(shapes: shapes)
        
        XCTAssertEqual(0, duplicateCount)
        XCTAssertTrue(noDuplicates[0].isValid)
        XCTAssertTrue(noDuplicates[1].isValid)
    }
    
    
    func test_Find_1() throws {
        
        let result = EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let a = result[0].ToShape()
        let b = result[0].ToShape()
        
        let shapes = [a, b]
        
        let (noDuplicates, duplicateCount) = RemoveDuplicatesCalculator.execute(shapes: shapes)
        
        XCTAssertEqual(1, duplicateCount)
        XCTAssertEqual(1, noDuplicates.count)
        
    }
    
    // We no longer support things being flipped I guess
//    func test_Find_1_Flipped() throws {
//        
//        let result = EdgeCalculatorV1.Execute(
//            words: words,
//            scoreMin: scoreMin,
//            widthMax: widthMax,
//            heightMax: heightMax)
//        
//        let a = result[0].ToShape()
//        let b = result[0].ToShape()
//        
//        let b2 = ShapeCalculator.Flip(shape: b)
//        
//        var shapes = [a, b2]
//        
//        let duplicateCount = RemoveDuplicatesCalculator.findDuplicates(shapes: &shapes)
//        
//        XCTAssertEqual(1, duplicateCount)
//        XCTAssertTrue(shapes[0].isValid)
//        XCTAssertFalse(shapes[1].isValid)
//    }
    
    
    func test_Find_2() throws {
        
        let edges = EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        var result = ShapeCalculator.toShapes(edges: edges)
        
        // We have to sort them as remove duplicates also sorts them
        ShapeCalculator.Sort(shapes: &result)
        
        let a = result[0]
        let b = result[0]
        let c = result[1]
        let d = result[2]
        let e = result[3]
        let f = result[3]
        let shapes = [a, b, c, d, e, f]
        
        let (noDuplicates, duplicateCount) = RemoveDuplicatesCalculator.execute(shapes: shapes)
        
        XCTAssertEqual(2, duplicateCount)
        XCTAssertEqual(4,noDuplicates.count)
    }
    

    /// standard values for all tests
    let widthMax = 17
    let heightMax = 12
    let scoreMin = 0
    var words:[String] = []
    var reversedWords:[String] = []
    var lengths: [Int] = []
    override func setUpWithError() throws {
        words = WordData.words_8612()
        lengths = WordCalculator.lengths(words: words)
    }
}
