//
//  OuterCalculatorV3Tests.swift
//  
//
//  Created by Michael Geurtjens on 14/9/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class OuterCalculatorV3Tests: XCTestCase {
    
    let scoreMin = 0
    let widthMax = 17
    let heightMax = 15
    
    func test8807_1() {
        /// GIVEN we have used the words found in a Pacman3x3 shape on game 8710
        let words = ["ZSA", "CAINE", "LIZA", "SIDNEY", "ALAN"]
        /// WHEN we calculate outer for these words
        let result = OuterCalculatorV3.Execute(words: words, scoreMin: 146, widthMax: 10, heightMax: 7)
        
        let expectedText =
        "    .     \n" +
        "   .C     \n" +
        ".LIZA.    \n" +
        "  .SIDNEY.\n" +
        ".ALAN.    \n" +
        "   .E     \n" +
        "    .     "
        
        let shape = result[0].ToShape()
        
        let actualText = shape.ToText(words: words)
        
        let expectedScore = ScoreCalculator.scoreGrid(text: actualText, words: words)
        
        /// THEN we find that one answer is given
        XCTAssertEqual(1, result.count)
        /// /// AND the actual text is the same as the expected text
        XCTAssertEqual(expectedText, actualText)
        
        /// AND actual score is same as expected score
        XCTAssertEqual(expectedScore, shape.score)
        XCTAssertEqual(10, shape.width)
        XCTAssertEqual(7, shape.height)
        
        XCTAssertEqual(146, result[0].score)
    }
    
    func test8807_2() {
        /// GIVEN we have used the words found in a Pacman3x3 shape on game 8710
        let words = ["NOVAK", "MEL", "OMAR", "STEVE", "AL"]
        /// WHEN we calculate outer for these words
        let result = OuterCalculatorV3.Execute(words: words, scoreMin: 90, widthMax: 9, heightMax: 7)
        
        let expectedText =
        "    .    \n" +
        "    N.   \n" +
        "   .OMAR.\n" +
        ".STEVE.  \n" +
        "   .AL.  \n" +
        "    K.   \n" +
        "    .    "
        
        let shape = result[0].ToShape()
        
        let actualText = shape.ToText(words: words)
        
        let expectedScore = ScoreCalculator.scoreGrid(text: actualText, words: words)
        
        /// THEN we find that one answer is given
        XCTAssertEqual(1, result.count)
        /// /// AND the actual text is the same as the expected text
        XCTAssertEqual(expectedText, actualText)
        
        XCTAssertEqual(9, shape.width)
        XCTAssertEqual(7, shape.height)
        
        
        /// AND actual score is same as expected score
        XCTAssertEqual(expectedScore, result[0].score)
        XCTAssertEqual(90, result[0].score)
    }
    
    func test8907() {
        /// GIVEN we have used the words found in a Pacman3x3 shape on game 8710
        let words = ["SAW", "PLYWOOD", "TOYS", "WAX", "BOW"]
        /// WHEN we calculate outer for these words
        let result = OuterCalculatorV3.Execute(words: words, scoreMin: 140, widthMax: 9, heightMax: 7)
        
        let expectedText =
        "   .   \n" +
        "   P   \n" +
        "   L.  \n" +
        ".TOYS. \n" +
        "  .WAX.\n" +
        " .BOW. \n" +
        "   O.  \n" +
        "   D   \n" +
        "   .   "
        
        let shape = result[0].ToShape()
        
        let actualText = shape.ToText(words: words)
        
        let expectedScore = ScoreCalculator.scoreGrid(text: actualText, words: words)
        
        /// THEN we find that one answer is given
        XCTAssertEqual(1, result.count)
        /// /// AND the actual text is the same as the expected text
        XCTAssertEqual(expectedText, actualText)
        
        /// AND actual score is same as expected score
        XCTAssertEqual(expectedScore, shape.score)
        XCTAssertEqual(7, shape.width)
        XCTAssertEqual(9, shape.height)
        
        XCTAssertEqual(140, result[0].score)
    }
    
    func test8910() {
        /// GIVEN we have used the words found in a Pacman3x3 shape on game 8710
        let words = ["VET", "CRITIC", "VICAR", "VALET", "TILER"]
        /// WHEN we calculate outer for these words
        let result = OuterCalculatorV3.Execute(words: words, scoreMin: 108, widthMax: 10, heightMax: 8)
        
        let expectedText =
        "     .    \n" +
        "     C    \n" +
        "    .R    \n" +
        "   .VICAR.\n" +
        ".VALET.   \n" +
        "   .TILER.\n" +
        "    .C    \n" +
        "     .    "
        
        let shape = result[0].ToShape()
        
        let actualText = shape.ToText(words: words)
        
        let expectedScore = ScoreCalculator.scoreGrid(text: actualText, words: words)
        
        /// THEN we find that one answer is given
        XCTAssertEqual(1, result.count)
        /// /// AND the actual text is the same as the expected text
        XCTAssertEqual(expectedText, actualText)
        
        /// AND actual score is same as expected score
        XCTAssertEqual(expectedScore, shape.score)
        XCTAssertEqual(10, shape.width)
        XCTAssertEqual(8, shape.height)
        
        XCTAssertEqual(108, result[0].score)
    }
    
    func test9008() {
        /// GIVEN we have used the words found in a Pacman3x3 shape on game 8710
        let words = ["YAM", "EUCALYPTUS", "YACCA", "CORAL", "MYALL"]
        /// WHEN we calculate outer for these words
        let result = OuterCalculatorV3.Execute(words: words, scoreMin: 130, widthMax: 12, heightMax: 10)
        
        let expectedText =
        "     .    \n" +
        "     E    \n" +
        "     U    \n" +
        "    .C    \n" +
        "   .YACCA.\n" +
        ".CORAL.   \n" +
        "   .MYALL.\n" +
        "    .P    \n" +
        "     T    \n" +
        "     U    \n" +
        "     S    \n" +
        "     .    "
        
        let shape = result[0].ToShape()
        
        let actualText = shape.ToText(words: words)
        
        let expectedScore = ScoreCalculator.scoreGrid(text: actualText, words: words)
        
        /// THEN we find that one answer is given
        XCTAssertEqual(1, result.count)
        /// /// AND the actual text is the same as the expected text
        XCTAssertEqual(expectedText, actualText)
        
        /// AND actual score is same as expected score
        XCTAssertEqual(expectedScore, shape.score)
        XCTAssertEqual(10, shape.width)
        XCTAssertEqual(12, shape.height)
        
        XCTAssertEqual(130, result[0].score)
    }
    
    func test9508() {
        /// GIVEN we have used the words found in a Pacman3x3 shape on game 8710
        let words = ["NOG", "SLIVOVITZ", "SPAIN", "VODKA", "GROG"]
        /// WHEN we calculate outer for these words
        let result = OuterCalculatorV3.Execute(words: words, scoreMin: 98, widthMax: 11, heightMax: 10)
        
        let expectedText =
        "    .     \n" +
        "    S     \n" +
        "    L.    \n" +
        ".SPAIN.   \n" +
        "   .VODKA.\n" +
        " .GROG.   \n" +
        "    V.    \n" +
        "    I     \n" +
        "    T     \n" +
        "    Z     \n" +
        "    .     "
        
        let shape = result[0].ToShape()
        
        let actualText = shape.ToText(words: words)
        
        let expectedScore = ScoreCalculator.scoreGrid(text: actualText, words: words)
        
        /// THEN we find that one answer is given
        XCTAssertEqual(1, result.count)
        /// /// AND the actual text is the same as the expected text
        XCTAssertEqual(expectedText, actualText)
        
        /// AND actual score is same as expected score
        XCTAssertEqual(expectedScore, shape.score)
        XCTAssertEqual(10, shape.width)
        XCTAssertEqual(11, shape.height)
        
        XCTAssertEqual(98, result[0].score)
    }
    
    func test9601() {
        /// GIVEN we have used the words found in a Pacman3x3 shape on game 8710
        let words = ["YAWL", "ARGOSY", "FERRY", "GALLEY", "SCOW", "SLAVER"]
        /// WHEN we calculate outer for these words
        let result = OuterCalculatorV3.Execute(words: words, scoreMin: 150, widthMax: 11, heightMax: 8)
        
        let expectedText =
        "    .      \n" +
        "    A.     \n" +
        ".FERRY.    \n" +
        "   .GALLEY.\n" +
        " .SCOW.    \n" +
        "   .SLAVER.\n" +
        "    Y.     \n" +
        "    .      "
        
        let shape = result[0].ToShape()
        
        let actualText = shape.ToText(words: words)
        
        let expectedScore = ScoreCalculator.scoreGrid(text: actualText, words: words)
        
        /// THEN we find that one answer is given
        XCTAssertEqual(1, result.count)
        /// /// AND the actual text is the same as the expected text
        XCTAssertEqual(expectedText, actualText)
        
        /// AND actual score is same as expected score
        XCTAssertEqual(expectedScore, shape.score)
        XCTAssertEqual(11, shape.width)
        XCTAssertEqual(8, shape.height)
        
        XCTAssertEqual(150, result[0].score)
    }
    
    func test9604() {
        /// GIVEN we have used the words found in a Pacman3x3 shape on game 8710
        let words = ["PLAN", "GALLERY", "PAGODA", "WALL", "ALETTE", "MEZZANINE"]
        /// WHEN we calculate outer for these words
        let result = OuterCalculatorV3.Execute(words: words, scoreMin: 94, widthMax: 15, heightMax: 9)
        
        let expectedText =
        "         .     \n" +
        "        .G     \n" +
        "       .PAGODA.\n" +
        "     .WALL.    \n" +
        "       .ALETTE.\n" +
        ".MEZZANINE.    \n" +
        "        .R     \n" +
        "         Y     \n" +
        "         .     "
        
        let shape = result[0].ToShape()
        
        let actualText = shape.ToText(words: words)
        
        let expectedScore = ScoreCalculator.scoreGrid(text: actualText, words: words)
        
        /// THEN we find that one answer is given
        XCTAssertEqual(1, result.count)
        /// /// AND the actual text is the same as the expected text
        XCTAssertEqual(expectedText, actualText)
        
        /// AND actual score is same as expected score
        XCTAssertEqual(expectedScore, shape.score)
        XCTAssertEqual(15, shape.width)
        XCTAssertEqual(9, shape.height)
        
        XCTAssertEqual(94, result[0].score)
    }
    
    func test9101() {
        // This is a huge overlap many features.
    }
    func test8805() {
        // huge overlap with more features than normal
    }
    func test9002() {
        //overlap that makes a pacman4x3
    }
    
    func test9209() {
        // overlap and its a 4x3 shape as well, overlap at the bottom
    }
}
