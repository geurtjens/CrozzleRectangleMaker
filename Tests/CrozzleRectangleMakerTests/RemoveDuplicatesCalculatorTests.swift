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
        
        var rectangles = await RectangleCalculator.Execute(words: words, scoreMin: 104, widthMax: widthMax, heightMax: heightMax)
        
        var shapes = ShapeCalculator.toShapes(rectangles: rectangles)
        
        
        ShapeCalculator.SortWithWordSequence(shapes: &shapes)
        
        let duplicateCount = RemoveDuplicatesCalculator.findDuplicates(shapes: &shapes)
        
        let duplicates = shapes.filter { $0.isValid == false}
        
        for duplicate in duplicates {
            print(duplicate.ToString(words: words))
        }
        
        // There are 296 duplicates from 17144 values when scoreMin: 104 and it takes 60 seconds for this to run
        XCTAssertEqual(0, duplicateCount)
        XCTAssertEqual(17144, rectangles.count)
    }
    
    func test_Find_0() throws {
        
        let result = EdgeCalculator.Execute(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let a = result[0].ToShape()
        let b = result[1].ToShape()
        
        var shapes = [a, b]
        
        let duplicateCount = RemoveDuplicatesCalculator.findDuplicates(shapes: &shapes)
        
        XCTAssertEqual(0, duplicateCount)
        XCTAssertTrue(shapes[0].isValid)
        XCTAssertTrue(shapes[1].isValid)
    }
    
    
    func test_Find_1() throws {
        
        let result = EdgeCalculator.Execute(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let a = result[0].ToShape()
        let b = result[0].ToShape()
        
        var shapes = [a, b]
        
        let duplicateCount = RemoveDuplicatesCalculator.findDuplicates(shapes: &shapes)
        
        XCTAssertEqual(1, duplicateCount)
        XCTAssertTrue(shapes[0].isValid)
        XCTAssertFalse(shapes[1].isValid)
    }
    
    
    func test_Find_1_Flipped() throws {
        
        let result = EdgeCalculator.Execute(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let a = result[0].ToShape()
        let b = result[0].ToShape()
        
        let b2 = ShapeCalculator.Flip(shape: b)
        
        var shapes = [a, b2]
        
        let duplicateCount = RemoveDuplicatesCalculator.findDuplicates(shapes: &shapes)
        
        XCTAssertEqual(1, duplicateCount)
        XCTAssertTrue(shapes[0].isValid)
        XCTAssertFalse(shapes[1].isValid)
    }
    
    
    func test_Find_2() throws {
        
        let edges = EdgeCalculator.Execute(
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
        var shapes = [a, b, c, d, e, f]
        
        let duplicateCount = RemoveDuplicatesCalculator.findDuplicates(shapes: &shapes)
        
        XCTAssertEqual(2, duplicateCount)
        XCTAssertTrue(shapes[0].isValid)
        XCTAssertFalse(shapes[1].isValid)
        XCTAssertTrue(shapes[2].isValid)
        XCTAssertTrue(shapes[3].isValid)
        XCTAssertTrue(shapes[4].isValid)
        XCTAssertFalse(shapes[5].isValid)
       
        let noduplicates = shapes.filter { $0.isValid }
        
        XCTAssertEqual(4,noduplicates.count)
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
