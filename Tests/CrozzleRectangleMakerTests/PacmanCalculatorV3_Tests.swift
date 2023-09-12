//
//  PacmanCalculatorV3_Tests.swift
//  
//
//  Created by Michael Geurtjens on 13/9/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class PacmanCalculatorV3_Tests: XCTestCase {

    let scoreMin = 0
    let widthMax = 17
    let heightMax = 15
    
    func test8710() {
        let words = ["LORY", "SPARROW", "OWLET", "ROC", "SWALLOW", "OWL"]
        let result = PacmanCalculatorV3.ExecuteSerial(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        XCTAssertEqual(2, result.count)
        
       
        let sut1 =
        "      .    \n" +
        "      S    \n" +
        "      W    \n" +
        "      A    \n" +
        "      L.   \n" +
        "     .LORY.\n" +
        ".SPARROW.  \n" +
        "    .OWL.  \n" +
        "     C.E   \n" +
        "     . T   \n" +
        "       .   "

        let sut2 =
        "      .    \n" +
        "      S    \n" +
        "      W    \n" +
        "      A    \n" +
        "      L.   \n" +
        "     .LORY.\n" +
        ".SPARROW.  \n" +
        "    .OWLET.\n" +
        "     C..   \n" +
        "     .     "
        
        let text0 = result[0].ToShape().ToText(words: words)
        let text1 = result[1].ToShape().ToText(words: words)
        
        XCTAssertEqual(sut1, text0)
        XCTAssertEqual(sut2, text1)
        
        let score0 = ScoreCalculator.scoreGrid(text: text0, words: words)
        let score1 = ScoreCalculator.scoreGrid(text: text1, words: words)
        
        
        
        XCTAssertEqual(score0, result[0].score)
        XCTAssertEqual(score1, result[1].score)
        
    }

    func test8803() throws {
        let words = ["DELHI", "OMSK", "BOMBAY", "HOBART", "LIMA", "SYDNEY"]
        let result = PacmanCalculatorV3.ExecuteSerial(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        XCTAssertEqual(1, result.count)
        
       
        let expectedText =
        "     .   \n" +
        "    .L   \n" +
        ".DELHI.  \n" +
        "   .OMSK.\n" +
        ".BOMBAY. \n" +
        "    A.D  \n" +
        "    R N  \n" +
        "    T E  \n" +
        "    . Y  \n" +
        "      .  "
        
        XCTAssertEqual(1,result.count)
        
        let actualText = result[0].ToShape().ToText(words: words)
        XCTAssertEqual(expectedText, actualText)
        
        let expectedScore = ScoreCalculator.scoreGrid(text: actualText, words: words)
        XCTAssertEqual(expectedScore, result[0].score)
        
    }

    func test8907() {
        let words = ["SHAPE", "RULE", "QUARTZ", "ART", "PUZZLE", "EASEL"]
        
        let result = PacmanCalculatorV3.ExecuteSerial(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        XCTAssertEqual(1, result.count)
        
        let expectedText =
        "       .  \n" +
        "       E  \n" +
        "       A  \n" +
        "     ..S  \n" +
        "  .SHAPE. \n" +
        "    .RULE.\n" +
        ".QUARTZ.  \n" +
        "     .Z   \n" +
        "      L   \n" +
        "      E   \n" +
        "      .   "
        
        XCTAssertEqual(1,result.count)
        
        let actualText = result[0].ToShape().ToText(words: words)
        XCTAssertEqual(expectedText, actualText)
        
        let expectedScore = ScoreCalculator.scoreGrid(text: actualText, words: words)
        XCTAssertEqual(expectedScore, result[0].score)
    }

    func test8911() {
        let words = ["HATS", "TUESDAY", "TRAINER", "GATE", "TURF", "COURSE"]
        
        let result = PacmanCalculatorV3.ExecuteSerial(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        XCTAssertEqual(1, result.count)
        
        let expectedText =
        "        .     \n" +
        "        C     \n" +
        "        O     \n" +
        "      . U     \n" +
        "      G.R     \n" +
        "    .HATS.    \n" +
        "     .TUESDAY.\n" +
        ".TRAINER.     \n" +
        "      .F      \n" +
        "       .      "
        
        XCTAssertEqual(1,result.count)
        
        let actualText = result[0].ToShape().ToText(words: words)
        XCTAssertEqual(expectedText, actualText)
        
        let expectedScore = ScoreCalculator.scoreGrid(text: actualText, words: words)
        XCTAssertEqual(expectedScore, result[0].score)
    }
    
    func test9209() {
        let words = ["PATROL", "ENEMY", "SMUTS", "TURRET", "ONSET", "RIFLE"]
        
        let result = PacmanCalculatorV3.ExecuteSerial(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        XCTAssertEqual(1, result.count)
        
        let expectedText =
        "    . .   \n" +
        "    T R   \n" +
        "    U I   \n" +
        "    R.F   \n" +
        ".PATROL.  \n" +
        "   .ENEMY.\n" +
        ".SMUTS.   \n" +
        "    .E    \n" +
        "     T    \n" +
        "     .    "
        
        XCTAssertEqual(1,result.count)
        
        let actualText = result[0].ToShape().ToText(words: words)
        XCTAssertEqual(expectedText, actualText)
        
        let expectedScore = ScoreCalculator.scoreGrid(text: actualText, words: words)
        XCTAssertEqual(expectedScore, result[0].score)
    }
    
    func test9410() {
        let words = ["TRESPASS", "SUSPECT", "FORGER", "CASE", "SURTAX", "WITNESS"]
        
        let result = PacmanCalculatorV3.ExecuteSerial(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        XCTAssertEqual(1, result.count)
        
        let expectedText =
        "        .     \n" +
        "        W     \n" +
        "        I     \n" +
        "        T     \n" +
        "      . N     \n" +
        "      C.E     \n" +
        ".TRESPASS.    \n" +
        "     .SUSPECT.\n" +
        " .FORGER.     \n" +
        "      .T      \n" +
        "       A      \n" +
        "       X      \n" +
        "       .      "
        
        XCTAssertEqual(1,result.count)
        
        let actualText = result[0].ToShape().ToText(words: words)
        XCTAssertEqual(expectedText, actualText)
        
        let expectedScore = ScoreCalculator.scoreGrid(text: actualText, words: words)
        XCTAssertEqual(expectedScore, result[0].score)
    }
    
    func test9511() {
        let words = ["SEAMS", "CUT", "SLEEVES", "LACE", "MUSLIN", "ADJUST"]
        
        let result = PacmanCalculatorV3.ExecuteSerial(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        XCTAssertEqual(1, result.count)
        
        let expectedText =
        "        . \n" +
        "        A \n" +
        "        D \n" +
        "      . J \n" +
        "      L.U \n" +
        "   .SEAMS.\n" +
        "     .CUT.\n" +
        ".SLEEVES. \n" +
        "      .L  \n" +
        "       I  \n" +
        "       N  \n" +
        "       .  "
        
        XCTAssertEqual(1,result.count)
        
        let actualText = result[0].ToShape().ToText(words: words)
        XCTAssertEqual(expectedText, actualText)
        
        let expectedScore = ScoreCalculator.scoreGrid(text: actualText, words: words)
        XCTAssertEqual(expectedScore, result[0].score)
    }

}
