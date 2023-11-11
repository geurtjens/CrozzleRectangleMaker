//
//  PacmanCalculatorV3_Tests.swift
//  
//
//  Created by Michael Geurtjens on 13/9/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class PacmanCalculatorV3Tests: XCTestCase {

    let scoreMin = 0
    let widthMax = 17
    let heightMax = 15
    
    func test8710() {
        
        /// GIVEN we have used the words found in a Pacman3x3 shape on game 8710
        let words = ["LORY", "SPARROW", "OWLET", "ROC", "SWALLOW", "OWL"]
        /// WHEN we calculate pacmans for these words
        let result = PacmanCalculatorV3.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        /// THEN we find that two entries are returned
        XCTAssertEqual(2, result.count)
        
        let expectedText0 =
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

        let expectedText1 =
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
        
        let actualText0 = result[0].ToShape().ToText(words: words)
        let actualText1 = result[1].ToShape().ToText(words: words)
        
        let expectedScore0 = ScoreCalculator.scoreGrid(text: actualText0, words: words)
        let expectedScore1 = ScoreCalculator.scoreGrid(text: actualText1, words: words)
        
        /// /// AND the actual text is the same as the expected text
        XCTAssertEqual(expectedText0, actualText0)
        XCTAssertEqual(expectedText1, actualText1)
        
        /// AND actual score is same as expected score
        XCTAssertEqual(expectedScore0, result[0].score)
        XCTAssertEqual(expectedScore1, result[1].score)
    }

    func test8803() throws {
        
        /// GIVEN we have used the words found in a Pacman3x3 shape on game 8803
        let words = ["DELHI", "OMSK", "BOMBAY", "HOBART", "LIMA", "SYDNEY"]
        
        ///WHEN we calculate pacmans for these words
        let result = PacmanCalculatorV3.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
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
        
        let actualText = result[0].ToShape().ToText(words: words)
        let expectedScore = ScoreCalculator.scoreGrid(text: actualText, words: words)
        
        /// THEN one entry is returned
        XCTAssertEqual(1, result.count)

        /// AND the actual text is the same as the expected text
        XCTAssertEqual(expectedText, actualText)
        
        /// AND actual score is same as expected score
        XCTAssertEqual(expectedScore, result[0].score)
    }

    
    func test_CSharpImplementationOf_pacman3x3_TopRight(){
        
        let game = GameList().getGame(gameId:8803)!;
        let words = game.winningWords
        let wordsInt = WordCalculator.WordsToInt(words: words)
        let letterIndex = LetterIndexModel(words: words)
        let end = WordCalculator.reverse(words: words)
        let endInt = WordCalculator.WordsToInt(words: end)
        let len = WordCalculator.lengths(words: words)
        
        let pacman3x3_TopRight = ShapeCalculator.toShapes(pacmans: PacmanCalculatorV3.TopRight(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 136,
            widthMax: 10,
            heightMax: 9))
        
        let pacman = pacman3x3_TopRight[0]
        print(pacman.ToSwiftCode(words: words))
// This is what the correct and swift version produced but the cSharp is wrong
//        let placements = [
//                PlacementModel(w: 2, x: 2, y: 6, z: true, l:6),
//                PlacementModel(w: 8, x: 4, y: 0, z: false, l:6),
//                PlacementModel(w: 9, x: 3, y: 3, z: false, l:4),
//                PlacementModel(w: 13, x: 1, y: 4, z: true, l:6),
//                PlacementModel(w: 22, x: 0, y: 5, z: true, l:4),
//                PlacementModel(w: 23, x: 2, y: 0, z: false, l:5)
//            ]
//        let shape = ShapeModel(score: 136, width: 10, height: 9, placements: placements)
        let placements = [
                PlacementModel(w: 2, x: 1, y: 4, z: true, l:6),
                PlacementModel(w: 8, x: 4, y: 1, z: false, l:6),
                PlacementModel(w: 9, x: 3, y: 0, z: false, l:4),
                PlacementModel(w: 13, x: 2, y: 2, z: true, l:6),
                PlacementModel(w: 22, x: 0, y: 3, z: true, l:4),
                PlacementModel(w: 23, x: 2, y: 2, z: false, l:5)
            ]
        let shape = ShapeModel(score: 136, width: 10, height: 9, placements: placements)

        let result = shape.ToTextDebug(words: game.winningWords)
        XCTAssertFalse(result.contains("#"))
        print(result)
    }
    func test8907() {
        
        /// GIVEN we have used the words found in a Pacman3x3 shape on game 8907
        let words = ["SHAPE", "RULE", "QUARTZ", "ART", "PUZZLE", "EASEL"]
        
        ///WHEN we calculate pacmans for these words
        let result = PacmanCalculatorV3.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
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
        
        let actualText = result[0].ToShape().ToText(words: words)
        let expectedScore = ScoreCalculator.scoreGrid(text: actualText, words: words)
        
        /// THEN one entry is returned
        XCTAssertEqual(1, result.count)
        
        /// AND the actual text is the same as the expected text
        XCTAssertEqual(expectedText, actualText)
        
        /// AND actual score is same as expected score
        XCTAssertEqual(expectedScore, result[0].score)
    }

    func test8911() {
        /// GIVEN we have used the words found in a Pacman3x3 shape on game 8911
        let words = ["HATS", "TUESDAY", "TRAINER", "GATE", "TURF", "COURSE"]
        
        ///WHEN we calculate pacmans for these words
        let result = PacmanCalculatorV3.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
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
        
        let actualText = result[0].ToShape().ToText(words: words)
        let expectedScore = ScoreCalculator.scoreGrid(text: actualText, words: words)
        
        /// THEN one entry is returned
        XCTAssertEqual(1, result.count)
        
        /// AND the actual text is the same as the expected text
        XCTAssertEqual(expectedText, actualText)
        
        /// AND actual score is same as expected score
        XCTAssertEqual(expectedScore, result[0].score)
    }
    
    func test9209() {
        
        /// GIVEN we have used the words found in a Pacman3x3 shape on game 9209
        let words = ["PATROL", "ENEMY", "SMUTS", "TURRET", "ONSET", "RIFLE"]
        
        ///WHEN we calculate pacmans for these words
        let result = PacmanCalculatorV3.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
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
        
        let actualText = result[0].ToShape().ToText(words: words)
        let expectedScore = ScoreCalculator.scoreGrid(text: actualText, words: words)
        
        /// THEN one entry is returned
        XCTAssertEqual(1, result.count)
        
        /// AND the actual text is the same as the expected text
        XCTAssertEqual(expectedText, actualText)
        
        /// AND actual score is same as expected score
        XCTAssertEqual(expectedScore, result[0].score)
    }
    
    func test9410() {
        
        /// GIVEN we have used the words found in a Pacman3x3 shape on game 9410
        let words = ["TRESPASS", "SUSPECT", "FORGER", "CASE", "SURTAX", "WITNESS"]
        
        ///WHEN we calculate pacmans for these words
        let result = PacmanCalculatorV3.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
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
        
        let actualText = result[0].ToShape().ToText(words: words)
        let expectedScore = ScoreCalculator.scoreGrid(text: actualText, words: words)
        
        /// THEN one entry is returned
        XCTAssertEqual(1, result.count)
        
        /// AND the actual text is the same as the expected text
        XCTAssertEqual(expectedText, actualText)
        
        /// AND actual score is same as expected score
        XCTAssertEqual(expectedScore, result[0].score)
    }
    
    func test9511() {
        
        /// GIVEN we have used the words found in a Pacman3x3 shape on game 9511
        let words = ["SEAMS", "CUT", "SLEEVES", "LACE", "MUSLIN", "ADJUST"]
        
        ///WHEN we calculate pacmans for these words
        let result = PacmanCalculatorV3.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
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
        
        let actualText = result[0].ToShape().ToText(words: words)
        let expectedScore = ScoreCalculator.scoreGrid(text: actualText, words: words)
        
        /// THEN one entry is returned
        XCTAssertEqual(1, result.count)
        
        /// AND the actual text is the same as the expected text
        XCTAssertEqual(expectedText, actualText)
        
        /// AND actual score is same as expected score
        XCTAssertEqual(expectedScore, result[0].score)
    }

}
