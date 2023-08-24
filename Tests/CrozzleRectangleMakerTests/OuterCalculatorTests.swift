//
//  OuterCalculatorV1Tests.swift
//  
//
//  Created by Michael Geurtjens on 14/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class OuterCalculatorV1Tests: XCTestCase {

    
    func test_Compare() {
        let count3 = OuterCalculatorV3.ExecuteAllSerial(scoreMin: 0)
        let count2 = OuterCalculatorV2.ExecuteAllSerial(scoreMin: 0)
        XCTAssertEqual(count3, count2)
        
        let count1 = OuterCalculatorV1.ExecuteAllSerial(scoreMin: 0)
        XCTAssertEqual(count2, count1)
    }
    
    func test_C2x3_LRL_MO_8807() {
        let words = ["ZSA","LIZA","CAINE","SIDNEY","ALAN"]
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        let result = OuterCalculatorV1.C2x3_LRL_MO(words: words, end: end, len: len, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(1, result.count)
        XCTAssertEqual(10, result[0].width)
        XCTAssertEqual(7, result[0].height)
        XCTAssertEqual(146, result[0].score)
        
        let text = result[0].ToText(words: words)
        let expectedText = "    .     \n   .C     \n.LIZA.    \n  .SIDNEY.\n.ALAN.    \n   .E     \n    .     "
        XCTAssertEqual(expectedText, text)
        print(text)
    }

    func test_C2x3_RLR_OM_8807() {
        let words = ["NOVAK","OMAR","MEL","STEVE","AL"]
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        let result = OuterCalculatorV1.C2x3_RLR_OM(words: words, end: end, len: len, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(1, result.count)
        XCTAssertEqual(9, result[0].width)
        XCTAssertEqual(7, result[0].height)
        XCTAssertEqual(90, result[0].score)
        
        let text = result[0].ToText(words: words)
        let expectedText = "    .    \n    N.   \n   .OMAR.\n.STEVE.  \n   .AL.  \n    K.   \n    .    "
        XCTAssertEqual(expectedText, text)
        print(text)
    }
    
    func test_C2x3_LRL_OM_8907() {
        let words = ["PLYWOOD","TOYS","SAW","WAX","BOW"]
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        let result = OuterCalculatorV1.C2x3_LRL_OM(words: words, end: end, len: len, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(1, result.count)
        XCTAssertEqual(7, result[0].width)
        XCTAssertEqual(9, result[0].height)
        XCTAssertEqual(140, result[0].score)
        
        let text = result[0].ToText(words: words)
        let expectedText = "   .   \n   P   \n   L.  \n.TOYS. \n  .WAX.\n .BOW. \n   O.  \n   D   \n   .   "
        XCTAssertEqual(expectedText, text)
        print(text)
    }
    
    func test_C2x3_RLR_MO_8910() {
        let words = ["VET","VICAR","CRITIC","VALET","TILER"]
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        let result = OuterCalculatorV1.C2x3_RLR_MO(words: words, end: end, len: len, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(1, result.count)
        XCTAssertEqual(10, result[0].width)
        XCTAssertEqual(8, result[0].height)
        XCTAssertEqual(108, result[0].score)
        
        let text = result[0].ToText(words: words)
        let expectedText = "     .    \n     C    \n    .R    \n   .VICAR.\n.VALET.   \n   .TILER.\n    .C    \n     .    "
        XCTAssertEqual(expectedText, text)
        print(text)
    }
    
    func test_C2x3_RLR_MO_9008() {
        let words = ["YAM","YACCA","EUCALYPTUS","CORAL","MYALL"]
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        let result = OuterCalculatorV1.C2x3_RLR_MO(words: words, end: end, len: len, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(1, result.count)
        XCTAssertEqual(10, result[0].width)
        XCTAssertEqual(12, result[0].height)
        XCTAssertEqual(130, result[0].score)
        
        let text = result[0].ToText(words: words)
        let expectedText = "     .    \n     E    \n     U    \n    .C    \n   .YACCA.\n.CORAL.   \n   .MYALL.\n    .P    \n     T    \n     U    \n     S    \n     .    "
        XCTAssertEqual(expectedText, text)
        print(text)
    }
    
    func test_C2x3_LRL_MO_9507() {
        let words = ["ACT","VAN","GYMNAST","CAGE","ARTISTS"]
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        let result = OuterCalculatorV1.C2x3_LRL_MO(words: words, end: end, len: len, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(1, result.count)
        XCTAssertEqual(11, result[0].width)
        XCTAssertEqual(9, result[0].height)
        XCTAssertEqual(96, result[0].score)
        
        let text = result[0].ToText(words: words)
        let expectedText = "       .   \n       G   \n       Y   \n      .M   \n    .VAN.  \n     .CAGE.\n.ARTISTS.  \n      .T   \n       .   "
        XCTAssertEqual(expectedText, text)
        print(text)
    }
    
    func test_C2x3_LRL_OM_9508() {
        let words = ["SLIVOVITZ","SPAIN","NOG","VODKA","GROG"]
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        let result = OuterCalculatorV1.C2x3_LRL_OM(words: words, end: end, len: len, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(1, result.count)
        XCTAssertEqual(10, result[0].width)
        XCTAssertEqual(11, result[0].height)
        XCTAssertEqual(98, result[0].score)
        
        let text = result[0].ToText(words: words)
        let expectedText = "    .     \n    S     \n    L.    \n.SPAIN.   \n   .VODKA.\n .GROG.   \n    V.    \n    I     \n    T     \n    Z     \n    .     "
        XCTAssertEqual(expectedText, text)
        print(text)
    }
    
    func test_C2x4_LRLR_OM_9601() {
        let words = ["ARGOSY","FERRY","YAWL","GALLEY","SCOW","SLAVER"]
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        let result = OuterCalculatorV1.C2x4_LRLR_OM(words: words, end: end, len: len, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(1, result.count)
        XCTAssertEqual(11, result[0].width)
        XCTAssertEqual(8, result[0].height)
        XCTAssertEqual(150, result[0].score)
        
        let text = result[0].ToText(words: words)
        let expectedText = "    .      \n    A.     \n.FERRY.    \n   .GALLEY.\n .SCOW.    \n   .SLAVER.\n    Y.     \n    .      "
        XCTAssertEqual(expectedText, text)
        print(text)
    }
    
    func test_C2x4_9601() {
        let words = ["FERRY", "GALLEY", "SCOW", "SLAVER", "ARGOSY", "YAWL"]
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        let result = OuterCalculatorV1.C2x4_LRLR_OM(words: words, end: end, len: len, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(1, result.count)
        XCTAssertEqual(11, result[0].width)
        XCTAssertEqual(8, result[0].height)
        XCTAssertEqual(150, result[0].score)
        
        let text = result[0].ToText(words: words)
        let expectedText = "    .      \n    A.     \n.FERRY.    \n   .GALLEY.\n .SCOW.    \n   .SLAVER.\n    Y.     \n    .      "
        XCTAssertEqual(expectedText, text)
        print(text)
    }
    
    func test_C2x4_9601_2x4() {
        let words = ["FERRY", "GALLEY", "SCOW", "SLAVER", "ARGOSY", "YAWL"]
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        let result = OuterCalculatorV1.C2x4(words: words, end: end, len: len, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(1, result.count)
        XCTAssertEqual(11, result[0].width)
        XCTAssertEqual(8, result[0].height)
        XCTAssertEqual(150, result[0].score)
        
        let text = result[0].ToText(words: words)
        let expectedText = "    .      \n    A.     \n.FERRY.    \n   .GALLEY.\n .SCOW.    \n   .SLAVER.\n    Y.     \n    .      "
        XCTAssertEqual(expectedText, text)
        print(text)
    }
    
    func test_C2x4_RLRL_MO_9604() {
        let words = ["PLAN","PAGODA","WALL","GALLERY","ALETTE","MEZZANINE"]
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        let result = OuterCalculatorV1.C2x4_RLRL_MO(words: words, end: end, len: len, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(1, result.count)
        XCTAssertEqual(15, result[0].width)
        XCTAssertEqual(9, result[0].height)
        XCTAssertEqual(94, result[0].score)
        
        let text = result[0].ToText(words: words)
        let expectedText = "         .     \n        .G     \n       .PAGODA.\n     .WALL.    \n       .ALETTE.\n.MEZZANINE.    \n        .R     \n         Y     \n         .     "
        XCTAssertEqual(expectedText, text)
        print(text)
    }

    /*
     A
     BCD
    ACD
     DEF
    AEF
     F
     */
    
    func test_C2x4_RLRL_OM() {
        let words = ["ABCDEF","BCD","CDEF","ACD","DEF","AEF"]
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        let result = OuterCalculatorV1.C2x4_RLRL_OM(words: words, end: end, len: len, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(1, result.count)
        XCTAssertEqual(6, result[0].width)
        XCTAssertEqual(8, result[0].height)
        XCTAssertEqual(76, result[0].score)
        
        let text = result[0].ToText(words: words)
        let expectedText = "  .   \n  A.  \n .BCD.\n.ACD. \n .DEF.\n.AEF. \n  F.  \n  .   "
        XCTAssertEqual(expectedText, text)
        print(text)
    }
    
    /*
      A
    BCD
     ACD
    DEF
     AEF
      F
     */
    
    func test_C2x4_LRLR_MO() {
        let words = ["CAEA","BCD","ADCFEF","ACD","DEF","AEF"]
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        let result = OuterCalculatorV1.C2x4_LRLR_MO(words: words, end: end, len: len, scoreMin: 0, widthMax: 17, heightMax: 12)
        XCTAssertEqual(1, result.count)
        XCTAssertEqual(6, result[0].width)
        XCTAssertEqual(8, result[0].height)
        XCTAssertEqual(76, result[0].score)
        
        let text = result[0].ToText(words: words)
        let expectedText = "   .  \n  .A  \n.BCD. \n .ACD.\n.DEF. \n .AEF.\n  .F  \n   .  "
        XCTAssertEqual(expectedText, text)
        print(text)
    }
}
