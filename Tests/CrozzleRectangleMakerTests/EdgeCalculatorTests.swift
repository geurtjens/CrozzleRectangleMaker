//
//  EdgeCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 23/5/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class EdgeCalculatorTests: XCTestCase {

    func test_8612() throws {
        
        let result = EdgeCalculator.Execute(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        XCTAssertEqual(10_757, result.count)
        print("Edges = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    
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
