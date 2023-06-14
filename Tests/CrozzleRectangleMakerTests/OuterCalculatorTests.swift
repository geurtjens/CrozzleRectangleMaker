//
//  OuterCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 14/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class OuterCalculatorTests: XCTestCase {

    func test_C2x3_LRL_MO_8807() {
        let words = ["ZSA","LIZA","CAINE","SIDNEY","ALAN"]
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        let result = OuterCalculator.C2x3_LRL_MO(start: words, end: end, len: len, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(1, result.count)
    }

    func test_C2x3_RLR_OM_8807() {
        let words = ["NOVAK","OMAR","MEL","STEVE","AL"]
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        let result = OuterCalculator.C2x3_RLR_OM(start: words, end: end, len: len, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(1, result.count)
    }
    
    func test_C2x3_LRL_OM_8907() {
        let words = ["PLYWOOD","TOYS","SAW","WAX","BOW"]
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        let result = OuterCalculator.C2x3_LRL_OM(start: words, end: end, len: len, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(1, result.count)
    }
    
    func test_C2x3_RLR_MO_8910() {
        let words = ["VET","VICAR","CRITIC","VALET","TILER"]
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        let result = OuterCalculator.C2x3_RLR_MO(start: words, end: end, len: len, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(1, result.count)
    }
    
    func test_C2x3_RLR_MO_9008() {
        let words = ["YAM","YACCA","EUCALYPTUS","CORAL","MYALL"]
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        let result = OuterCalculator.C2x3_RLR_MO(start: words, end: end, len: len, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(1, result.count)
    }
    
    func test_C2x3_LRL_MO_9507() {
        let words = ["ACT","VAN","GYMNAST","CAGE","ARTISTS"]
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        let result = OuterCalculator.C2x3_LRL_MO(start: words, end: end, len: len, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(1, result.count)
    }
    
    func test_C2x3_LRL_OM_9508() {
        let words = ["SLIVOVITZ","SPAIN","NOG","VODKA","GROG"]
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        let result = OuterCalculator.C2x3_LRL_OM(start: words, end: end, len: len, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(1, result.count)
    }
}
