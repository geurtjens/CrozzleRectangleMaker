//
//  ClusterCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 21/5/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class ClusterCalculatorTests: XCTestCase {

    func test_Execute_8612() throws {
        let words = WordData.words_8612()
        let result = ClusterCalculator.Execute(words:words,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
        
        XCTAssertEqual(1149,result.count)
        XCTAssertEqual(170, result[0].score)
        print(result[0].ToText(words:words))
    }
    
    
    func test_Execute_8702() throws {
        let words = WordData.words_8702()
        let result = ClusterCalculator.Execute(words:words,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
        
        XCTAssertEqual(7853,result.count)
        XCTAssertEqual(220, result[0].score)
        print(result[0].ToText(words:words))
    }
    
    
    func test_Execute_8705() throws {
        let words = WordData.words_8705()
        let result = ClusterCalculator.Execute(words:words,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
        
        XCTAssertEqual(13596,result.count)
        XCTAssertEqual(182, result[0].score)
        print(result[0].ToText(words:words))
    }
    
    
    func test_Execute_8710() throws {
        let words = WordData.words_8710()
        let result = ClusterCalculator.Execute(words:words,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
        
        XCTAssertEqual(15269,result.count)
        XCTAssertEqual(186, result[0].score)
        print(result[0].ToText(words:words))
    }
    
    
    func test_Execute_8711() throws {
        let words = WordData.words_8711()
        let result = ClusterCalculator.Execute(words:words,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
        
        XCTAssertEqual(24231,result.count)
        XCTAssertEqual(220, result[0].score)
        print(result[0].ToText(words:words))
    }
    
    
    func test_Execute_8802() throws {
        let words = WordData.words_8802()
        let result = ClusterCalculator.Execute(words:words,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
        
        XCTAssertEqual(9802,result.count)
        XCTAssertEqual(226, result[0].score)
        print(result[0].ToText(words:words))
    }
    
    
    func test_Execute_8803() throws {
        let words = WordData.words_8803()
        let result = ClusterCalculator.Execute(words:words,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
        
        XCTAssertEqual(11750,result.count)
        XCTAssertEqual(192, result[0].score)
        print(result[0].ToText(words:words))
    }
    
    
    func test_Execute_8804() throws {
        let words = WordData.words_8804()
        let result = ClusterCalculator.Execute(words:words,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
        
        XCTAssertEqual(24757,result.count)
        XCTAssertEqual(322, result[0].score)
        print(result[0].ToText(words:words))
    }
    
    
    func testC2x2_LR_UD_Example() throws {
        let words = ["SNOW","NAZARETH","ZION","WALNUT"]
        let reversed = WordCalculator.reverse(words: words)
        let lengths = WordCalculator.lengths(words: words)
        
        let result = ClusterCalculator.C2x2_LR_UD(start: words, end: reversed, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(1, result.count)
        
        let item = result[0]
        XCTAssertEqual(10, item.width)
        XCTAssertEqual(12, item.height)
        
        let shape = item.ToShape()
        
        // The order of placements is based on the sequence or order of the words are we are sorting by wordId
        let up1 = shape.placements[0]
        XCTAssertEqual(0, up1.y)
        XCTAssertEqual(3, up1.x)
        XCTAssertFalse(up1.h)
        
        let down2 = shape.placements[1]
        XCTAssertEqual(2, down2.y)
        XCTAssertEqual(4, down2.x)
        XCTAssertFalse(up1.h)
        
        
        let left1 = shape.placements[2]
        XCTAssertEqual(3, left1.y)
        XCTAssertEqual(0, left1.x)
        XCTAssertTrue(left1.h)
        
        let right2 = shape.placements[3]
        XCTAssertEqual(4, right2.y)
        XCTAssertEqual(2, right2.x)
        XCTAssertTrue(right2.h)
        
        let text = item.ToText(words: words)
        let textExpected = "   .      \n   S      \n   N.     \n.ZION.    \n  .WALNUT.\n   .Z     \n    A     \n    R     \n    E     \n    T     \n    H     \n    .     "
        XCTAssertEqual(textExpected,text)
        print(text)
        /*
         .
         Z
         I
      .SNOW.
        .NAZARETH.
          L
          N
          U
          T
          .
         */
    }
    
    
    func testC2x2_LR_UD() throws {
        let result = ClusterCalculator.C2x2_LR_UD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(256, result.count)
        
        print("C2x2_LR_UD")
        print(result[0].ToText(words: words))
    }

    
    func testC2x2_RL_DU() throws {
        let result = ClusterCalculator.C2x2_RL_DU(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(446, result.count)
        
        var textArray:[String] = []
        for item in result {
            textArray.append(item.ToText(words: words))
            //textArray.append(item.ToTextFlipped(words: words))
        }
        textArray.sort()
        
        var duplicates = 0
        for i in 1..<textArray.count {
            let textBefore = textArray[i - 1]
            let textCurrent = textArray[i]
            if textBefore == textCurrent {
                duplicates += 1
            }
        }
        XCTAssertEqual(0, duplicates)
    }
    
    
    func testC2x2_RL_UD() throws {
        let result = ClusterCalculator.C2x2_RL_UD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(97, result.count)
        
        print("C2x2_RL_UD")
        print(result[0].ToText(words: words))
    }
    
    
    func testC2x3_LRL_DU() throws {
        let result = ClusterCalculator.C2x3_LRL_DU(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(64, result.count)
        
        print("C2x3_LRL_DU")
        print(result[0].ToText(words: words))
    }
    
    
    func testC2x3_LRL_UD() throws {
        let result = ClusterCalculator.C2x3_LRL_UD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(152, result.count)
        
        print("C2x3_LRL_UD")
        print(result[0].ToText(words: words))
    }
    
    
    func testC2x3_RLR_DU() throws {
        let result = ClusterCalculator.C2x3_RLR_DU(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(56, result.count)
        
        print("C2x3_RLR_DU")
        print(result[0].ToText(words: words))
    }
    
    
    func testC2x3_RLR_UD() throws {
        let result = ClusterCalculator.C2x3_RLR_UD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(20, result.count)
        
        print("C2x3_RLR_UD")
        print(result[0].ToText(words: words))
    }
    
    
    func testC2x4_RLRL_DU_8804() throws {
        let words = WordData.words_8804()
        let reversedWords = WordCalculator.reverse(words: words)
        let lengths = WordCalculator.lengths(words: words)
        let result = ClusterCalculator.C2x4_RLRL_DU(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)

        XCTAssertEqual(1468, result.count)
        
        print("C2x4_RLRL_DU")
        print(result[0].ToText(words: words))
    }
    
    
    func testC2x4_RLRL_UD_8804() throws {
        let words = WordData.words_8804()
        let reversedWords = WordCalculator.reverse(words: words)
        let lengths = WordCalculator.lengths(words: words)
        let result = ClusterCalculator.C2x4_RLRL_UD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(699, result.count)
        
        print("C2x4_RLRL_UD")
        print(result[0].ToText(words: words))
    }
    
    
    func testC2x4_LRLR_DU_8804() throws {
        let words = WordData.words_8804()
        let reversedWords = WordCalculator.reverse(words: words)
        let lengths = WordCalculator.lengths(words: words)
        let result = ClusterCalculator.C2x4_LRLR_DU(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(473, result.count)
        
        print("C2x4_LRLR_DU")
        print(result[0].ToText(words: words))
    }
    
    
    func testC2x4_LRLR_UD_8804() throws {
        let words = WordData.words_8804()
        let reversedWords = WordCalculator.reverse(words: words)
        let lengths = WordCalculator.lengths(words: words)
        let result = ClusterCalculator.C2x4_LRLR_UD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(580, result.count)
        
        print("C2x4_LRLR_UD")
        print(result[0].ToText(words: words))
    }
    
    
    func testC2x5_RLRLR_DU_8804() throws {
        let words = WordData.words_8804()
        let reversedWords = WordCalculator.reverse(words: words)
        let lengths = WordCalculator.lengths(words: words)
        let result = ClusterCalculator.C2x5_RLRLR_DU(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
                
        XCTAssertEqual(171, result.count)
        
        print("C2x5_RLRLR_DU")
        print(result[0].ToText(words: words))
    }
    
    
    func testC2x5_RLRLR_UD_8804() throws {
        let words = WordData.words_8804()
        let reversedWords = WordCalculator.reverse(words: words)
        let lengths = WordCalculator.lengths(words: words)
        let result = ClusterCalculator.C2x5_RLRLR_UD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(130, result.count)
        
        print("C2x5_RLRLR_UD")
        print(result[0].ToText(words:words))
        
    }
    
    
    func testC2x5_LRLRL_DU_8804() throws {
        let words = WordData.words_8804()
        let reversedWords = WordCalculator.reverse(words: words)
        let lengths = WordCalculator.lengths(words: words)
        let result = ClusterCalculator.C2x5_LRLRL_DU(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(133, result.count)
        
        print("C2x5_LRLRL_DU")
        print(result[0].ToText(words:words))
    }
    
    
    func testC2x5_LRLRL_UD_8804() throws {
        let words = WordData.words_8804()
        let reversedWords = WordCalculator.reverse(words: words)
        let lengths = WordCalculator.lengths(words: words)
        let result = ClusterCalculator.C2x5_LRLRL_UD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(117, result.count)
        
        print("C2x5_LRLRL_UD")
        print(result[0].ToText(words: words))
    }
    

    func testC2x6_LRLRLR_DU_8804() throws {
        let words = WordData.words_8804()
        let reversedWords = WordCalculator.reverse(words: words)
        let lengths = WordCalculator.lengths(words: words)
        let result = ClusterCalculator.C2x6_LRLRLR_DU(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(12, result.count)
        
        print("C2x6_LRLRLR_DU")
        print(result[0].ToText(words:words))
    }
    
    
    func testC2x6_LRLRLR_UD() throws {
        let result = ClusterCalculator.C2x6_LRLRLR_UD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(0, result.count)
    }
    
    
    func testC2x6_RLRLRL_DU_8802() throws {
        let words = WordData.words_8802()
        let reversedWords = WordCalculator.reverse(words: words)
        let lengths = WordCalculator.lengths(words: words)
        let result = ClusterCalculator.C2x6_RLRLRL_DU(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(288, result.count)
        
        print("C2x6_RLRLRL_DU")
        print(result[0].ToText(words:words))
    }
    
    
    func testC2x6_RLRLRL_UD_8802() throws {
        let words = WordData.words_8802()
        let reversedWords = WordCalculator.reverse(words: words)
        let lengths = WordCalculator.lengths(words: words)
        let result = ClusterCalculator.C2x6_RLRLRL_UD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(0, result.count)
    }
    

    func testC3x3_LRL_UDU() throws {
        let result = ClusterCalculator.C3x3_LRL_UDU(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(4, result.count)
        
        print("C3x3_LRL_UDU")
        print(result[0].ToText(words: words))
    }
    
    
    func testC3x3_RLR_DUD() throws {
        let result = ClusterCalculator.C3x3_RLR_DUD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)

        XCTAssertEqual(5, result.count)
        
        print("C3x3_RLR_DUD")
        print(result[0].ToText(words: words))
    }
    
    
    // this one does not require duplicate checking as it flips to become LRL_DUD
    func testC3x3_RLR_UDU_8702() throws {
        let words = WordData.words_8702()
        let reversedWords = WordCalculator.reverse(words: words)
        let lengths = WordCalculator.lengths(words: words)
        let result = ClusterCalculator.C3x3_RLR_UDU(start: words, end: reversedWords, len: lengths,scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(2, result.count)
        
        print("C3x3_RLR_UDU")
        print(result[0].ToText(words: words))
    }
    
    
    func testC3x4_RLRL_DUD_8705() throws {
        let words = WordData.words_8705()
        
        let reversedWords = WordCalculator.reverse(words: words)
        let lengths = WordCalculator.lengths(words: words)
        let result = ClusterCalculator.C3x4_RLRL_DUD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(1, result.count)
        
        print("C3x4_RLRL_DUD")
        print(result[0].ToText(words: words))
    }
    
    
    func testC3x4_RLRL_DUD_8705_Example() throws {
        let words = ["TAP","CALENDULA","BONSAI","TREES", "TUBER", "ALOE", "PANSY"]
        
        let reversedWords = WordCalculator.reverse(words: words)
        let lengths = WordCalculator.lengths(words: words)
        let result = ClusterCalculator.C3x4_RLRL_DUD(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)

        XCTAssertEqual(1, result.count)
        
        print("C3x4_RLRL_DUD")
        print(result[0].ToText(words: words))
    }
    
    
    func testC3x4_LRLR_UDU_8710() throws {
        let words = WordData.words_8710()
        
        let reversedWords = WordCalculator.reverse(words: words)
        let lengths = WordCalculator.lengths(words: words)
        let result = ClusterCalculator.C3x4_LRLR_UDU(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(4, result.count)
        
        print("C3x4_LRLR_UDU")
        print(result[0].ToText(words: words))
    }
    
    
    func testC3x4_RLRL_UDU_8711() throws {
        let words = WordData.words_8711()
        
        let reversedWords = WordCalculator.reverse(words: words)
        let lengths = WordCalculator.lengths(words: words)
        let result = ClusterCalculator.C3x4_RLRL_UDU(start: words, end: reversedWords, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(2, result.count)
        
        print("C3x4_RLRL_UDU")
        print(result[0].ToText(words: words))
    }
    
    /// standard values for all tests
    let widthMax = 17
    let heightMax = 12
    let scoreMin = 0
    var words:[String] = []
    var reversedWords:[String] = []
    var lengths: [Int] = []
    var wordCount: Int = 0
    override func setUpWithError() throws {
        words = WordData.words_8612()
        wordCount = words.count
        lengths = WordCalculator.lengths(words: words)
        reversedWords = WordCalculator.reverse(words:words)
    }
}
