//
//  PacmanCalculatorV1Tests.swift
//  
//
//  Created by Michael Geurtjens on 6/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class PacmanCalculatorV1Tests: XCTestCase {

    func test8710() {
        
        /// GIVEN we have used the words found in a Pacman3x3 shape on game 8710
        let words = ["LORY", "SPARROW", "OWLET", "ROC", "SWALLOW", "OWL"]
        /// WHEN we calculate pacmans for these words
        let result = PacmanCalculatorV1.ExecuteSerial(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
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
        let result = PacmanCalculatorV1.ExecuteSerial(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
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

    func test8907() {
        
        /// GIVEN we have used the words found in a Pacman3x3 shape on game 8907
        let words = ["SHAPE", "RULE", "QUARTZ", "ART", "PUZZLE", "EASEL"]
        
        ///WHEN we calculate pacmans for these words
        let result = PacmanCalculatorV1.ExecuteSerial(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
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
        let result = PacmanCalculatorV1.ExecuteSerial(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
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
        let result = PacmanCalculatorV1.ExecuteSerial(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
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
        let result = PacmanCalculatorV1.ExecuteSerial(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
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
        let result = PacmanCalculatorV1.ExecuteSerial(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
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
    
    
    
    func test_bottomRight_Single() throws {
        
        let words = ["BULL", "SOLD", "UNITS", "TRUST", "LOSS", "SELL"]
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        let result = PacmanCalculatorV1.BottomRight(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        XCTAssertEqual(1, result.count)
        
        let resultFirst = result[0]
        
        XCTAssertEqual(9, resultFirst.width)
        XCTAssertEqual(8, resultFirst.height)
        
        let shapes = ShapeCalculator.toShapes(pacmans: result)
        
        let shape = shapes[0]
        

        /*
            . .
            T S
            R.E
          .BULL.
           .SOLD.
        .UNITS.
            .S
             .
         */
        
        XCTAssertEqual(2, shape.placements[0].x)
        XCTAssertEqual(3, shape.placements[1].x)
        XCTAssertEqual(0, shape.placements[2].x)
        XCTAssertEqual(4, shape.placements[3].x)
        XCTAssertEqual(5, shape.placements[4].x)
        XCTAssertEqual(6, shape.placements[5].x)
        
        XCTAssertEqual(3, shape.placements[0].y)
        XCTAssertEqual(4, shape.placements[1].y)
        XCTAssertEqual(5, shape.placements[2].y)
        XCTAssertEqual(0, shape.placements[3].y)
        XCTAssertEqual(2, shape.placements[4].y)
        XCTAssertEqual(0, shape.placements[5].y)
        
        let (text, _) = ShapeCalculator.ToText(shape: shape, words: words)
        
        XCTAssertEqual(144, shape.score)
        
        let expectedText = "    . .  \n    T S  \n    R.E  \n  .BULL. \n   .SOLD.\n.UNITS.  \n    .S   \n     .   "
        
        XCTAssertEqual(expectedText, text)
        //print(text)
        
        /*
              .
              U
            . N
            B.I
         .TRUST.
           .LOSS.
         .SELL.
            .D
             .
         */
        
    }
    func test_topLeft_Single() throws {
        
        let words = ["TRUST", "TRUSTEE", "ASSETS", "TAX", "NOTES", "RESERVE"]
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        let result = PacmanCalculatorV1.TopLeft(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        XCTAssertEqual(1, result.count)
        
        let resultFirst = result[0]
        
        XCTAssertEqual(12, resultFirst.width)
        XCTAssertEqual(11, resultFirst.height)
        
        let shapes = ShapeCalculator.toShapes(pacmans: result)
        
        let shape = shapes[0]
        
        /*
                .
                N
                O.
               .TRUST.
          .TRUSTEE.
              .ASSETS.
               X.E
               . R
                 V
                 E
                 .
        */
        
        
        XCTAssertEqual(5, shape.placements[0].x)
        XCTAssertEqual(0, shape.placements[1].x)
        XCTAssertEqual(4, shape.placements[2].x)
        XCTAssertEqual(5, shape.placements[3].x)
        XCTAssertEqual(6, shape.placements[4].x)
        XCTAssertEqual(7, shape.placements[5].x)
        
        XCTAssertEqual(3, shape.placements[0].y)
        XCTAssertEqual(4, shape.placements[1].y)
        XCTAssertEqual(5, shape.placements[2].y)
        XCTAssertEqual(3, shape.placements[3].y)
        XCTAssertEqual(0, shape.placements[4].y)
        XCTAssertEqual(2, shape.placements[5].y)
        
        let (text, _) = ShapeCalculator.ToText(shape: shape, words: words)
        
        XCTAssertEqual(138, shape.score)
        
        let expectedText = "      .     \n      N     \n      O.    \n     .TRUST.\n.TRUSTEE.   \n    .ASSETS.\n     X.E    \n     . R    \n       V    \n       E    \n       .    "
        
        XCTAssertEqual(expectedText, text)
        //print(text)
    }

    func test_bottomRight_Count8702() throws {
       
        let gamesList = GameList()
        if let game = gamesList.getGame(gameId: 8702) {
            let words = game.words
            let end = WordCalculator.reverse(words: words)
            let len = WordCalculator.lengths(words: words)
            
            let result = PacmanCalculatorV1.BottomRight(
                words: words,
                end: end,
                len: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            XCTAssertEqual(609, result.count)
        }
    }
    
    func test_topRight_Count8702() throws {
       
        let gamesList = GameList()
        if let game = gamesList.getGame(gameId: 8702) {
            let words = game.words
            let end = WordCalculator.reverse(words: words)
            let len = WordCalculator.lengths(words: words)
            
            let result = PacmanCalculatorV1.TopRight(
                words: words,
                end: end,
                len: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            XCTAssertEqual(26,result.count)
            
//            var shapes = ShapeCalculator.toShapes(pacmans: result)
//
//            ShapeCalculator.Sort(shapes: &shapes)
//
//            for shape in shapes {
//                print(shape.ToString(words: start))
//            }
        }
    }
    
    func test_topLeft_Count8702() throws {
       
        let gamesList = GameList()
        if let game = gamesList.getGame(gameId: 8702) {
            let words = game.words
            let end = WordCalculator.reverse(words: words)
            let len = WordCalculator.lengths(words: words)
            
            let result = PacmanCalculatorV1.TopLeft(
                words: words,
                end: end,
                len: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            XCTAssertEqual(7, result.count)
            
//            var shapes = ShapeCalculator.toShapes(pacmans: result)
//
//            ShapeCalculator.Sort(shapes: &shapes)
//
//
//            for shape in shapes {
//                print(shape.ToString(words: start))
//            }
        }
    }
    
    func test_Comparison() {
        let gameList = GameList()
        
        for game in gameList.games {
            let words = game.words
           
            let oldResults = PacmanCalculatorV1.ExecuteAllSerial(scoreMin: 0)
            
            let newResults = PacmanCalculatorV2.ExecuteAllSerial(scoreMin: 0)
            
            XCTAssertEqual(oldResults, newResults)
            
            print("PacmanCalculatorV1.Execute game: \(game.gameId), old:\(oldResults), new:\(newResults)")
        }
    }
    
    func test_PERF_ComparisonOLD() {
        let options = XCTMeasureOptions()
        options.iterationCount = 2 /* Tweak this value on a test-by-test basis */

        measure(metrics: [XCTClockMetric()], options: options) {
        let gameList = GameList()
        
            for game in gameList.games {
                let words = game.words
               
                
                let oldResults = PacmanCalculatorV1.ExecuteAllSerial(scoreMin: 0)
                
                print("PacmanCalculatorV1.Execute game: \(game.gameId), old:\(oldResults)")
            }
        }
    }
    
    func test_PERF_ComparisonNEW() {
        let options = XCTMeasureOptions()
        options.iterationCount = 2 /* Tweak this value on a test-by-test basis */

        measure(metrics: [XCTClockMetric()], options: options) {
            let gameList = GameList()
        
            for game in gameList.games {
                let words = game.words
                let end = WordCalculator.reverse(words: words)
                let len = WordCalculator.lengths(words: words)
                let letterIndex = LetterIndexModel(words: words)
                
                let newResults = PacmanCalculatorV2.Execute(
                    words: words,
                    scoreMin: scoreMin,
                    widthMax: widthMax,
                    heightMax: heightMax)
                
                print("PacmanCalculatorV1.Execute game: \(game.gameId), new:\(newResults.count)")
            }
        }
    }
    
    func test_PERF_ComparisonNewUInt8() {
        let options = XCTMeasureOptions()
        options.iterationCount = 2 /* Tweak this value on a test-by-test basis */

        measure(metrics: [XCTClockMetric()], options: options) {
            let gameList = GameList()
        
            for game in gameList.games {
                let words = game.words
                let end = WordCalculator.reverse(words: words)
                let len = WordCalculator.lengths(words: words)
                let letterIndex = LetterIndexModel(words: words)
                
                let newResults = PacmanCalculatorV4.Execute(
                    letterIndex: letterIndex,
                    words: words,
                    end: end,
                    len: len,
                    scoreMin: scoreMin,
                    widthMax: widthMax,
                    heightMax: heightMax)
                
                print("PacmanCalculatorV1.Execute game: \(game.gameId), new:\(newResults.count)")
            }
        }
    }
    
    func test_PacmanCalculatorV3_ExecuteAllGamesInSerial() {
        let totalCount = PacmanCalculatorV3.ExecuteAllSerial(scoreMin: 0)
        XCTAssertEqual(60864, totalCount)
    }
    
    func test_PacmanCalculatorV3_ExecuteAll_TopLeft() {
        let totalCount = PacmanCalculatorV3.ExecuteAll_TopLeft(scoreMin: 0)
        XCTAssertEqual(7853, totalCount)
    }
    
    func test_PacmanCalculatorV3_ExecuteAll_TopRight() {
        let totalCount = PacmanCalculatorV3.ExecuteAll_TopRight(scoreMin: 0)
        XCTAssertEqual(14918, totalCount)
    }
    
    func test_PacmanCalculatorV3_ExecuteAll_BottomRight() {
        let totalCount = PacmanCalculatorV3.ExecuteAll_BottomRight(scoreMin: 0)
        XCTAssertEqual(38093, totalCount)
    }
    
    func test_PERF_PacmanCalculatorV3_ExecuteAllGamesInSerial() {
        let options = XCTMeasureOptions()
        options.iterationCount = 2 /* Tweak this value on a test-by-test basis */

        measure(metrics: [XCTClockMetric()], options: options) {
            let totalCount = PacmanCalculatorV3.ExecuteAllSerial(scoreMin: 0)
            XCTAssertEqual(60864, totalCount)
        }
    }
    
    func test_CountAll() {
        
        let gameList = GameList()
        var result = 0
        for game in gameList.games {
            let words = game.words
            let end = WordCalculator.reverse(words: words)
            let len = WordCalculator.lengths(words: words)
            let letterIndex = LetterIndexModel(words: words)
            
            let newResults = PacmanCalculatorV2.BottomRight(
                letterIndex: letterIndex,
                words: words,
                end: end,
                len: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            result += newResults.count
            print("PacmanCalculatorV1.Execute game: \(game.gameId), new:\(newResults.count)")
        
        }
        print("Total = \(result)")
    }
    
    
    func test_ComparisonTopLeft() {
        let gameList = GameList()
        
        for game in gameList.games {
            let words = game.words
            let end = WordCalculator.reverse(words: words)
            let len = WordCalculator.lengths(words: words)
            let letterIndex = LetterIndexModel(words: words)
            
            let oldResults = PacmanCalculatorV1.TopLeft(
                words: words,
                end: end,
                len: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            let newResults = PacmanCalculatorV2.TopLeft(
                letterIndex: letterIndex,
                words: words,
                end: end,
                len: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)
            
            print("PacmanCalculatorV1.TopLeft game: \(game.gameId), old:\(oldResults.count), new:\(newResults.count)")
        }
    }
    func test_TopRightExample() {
        // CHIME is duplicated on the old shape so its an existing error
       /*
        C .
        H M
        I.O
       .MONTHLY.
  .MOVEMENT.
        .CHIME.
         E.
         .
        */
        
        let words = ["MONTHLY","MOVEMENT","CHIME","CHIME","ONCE","MONTH"]
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        let letterIndex = LetterIndexModel(words: words)
        
        let oldResults = PacmanCalculatorV1.TopRight(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let newResults = PacmanCalculatorV2.TopRight(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
    }
    func test_ComparisonTopRight() {
        let gameList = GameList()
        
        for game in gameList.games {
            let words = game.words
            let end = WordCalculator.reverse(words: words)
            let len = WordCalculator.lengths(words: words)
            let letterIndex = LetterIndexModel(words: words)
            
            let oldResults = PacmanCalculatorV1.TopRight(
                words: words,
                end: end,
                len: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            let newResults = PacmanCalculatorV2.TopRight(
                letterIndex: letterIndex,
                words: words,
                end: end,
                len: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)
            
            print("PacmanCalculatorV1.TopRight game: \(game.gameId), old:\(oldResults.count), new:\(newResults.count)")
            if oldResults.count != newResults.count {
                compareShapes(oldResults: oldResults, newResults: newResults, words: words);
            }
        }
    }
    
    func compareShapes(oldResults: [PacmanModel], newResults: [PacmanModel], words: [String]) {
        
        
        
        var oldShapes:[String] = []
        for oldResult in oldResults {
            var oldShape = oldResult.ToShape()
            if oldShape.width < oldShape.height {
                let text = oldShape.FlipToTextDebug(words: words)
                oldShapes.append(text)
            }
            else {
                let text = oldShape.ToTextDebug(words: words)
                oldShapes.append(text)
            }
        }
        
        var newShapes:[String] = []
        for newResult in newResults {
            var newShape = newResult.ToShape()
            if newShape.width < newShape.height {
                let text = newShape.FlipToTextDebug(words: words)
                newShapes.append(text)
            } else {
                let text = newShape.ToTextDebug(words: words)
                newShapes.append(text)
            }
        }
        
        for oldResult in oldResults {
            
            let oldShape = oldResult.ToShape().ToTextDebug(words: words)
            let oldShapeFlipped = oldResult.ToShape().FlipToTextDebug(words: words)
            
            XCTAssertNotEqual(oldShape, oldShapeFlipped)
            
            if newShapes.contains(oldShape) == false && newShapes.contains(oldShapeFlipped) == false {
                print(oldShape)
                print(oldShapeFlipped)
            }
        }
        
        
        // How many are in new and not in old
        print("NEW but not in OLD")
        for newShape in newShapes {
            if oldShapes.contains(newShape) == false {
                print(newShape)
            }
        }
    }
    
    func test_ComparisonBottomRight() {
        let gameList = GameList()
        
        for game in gameList.games {
            let words = game.words
            let end = WordCalculator.reverse(words: words)
            let len = WordCalculator.lengths(words: words)
            let letterIndex = LetterIndexModel(words: words)
            
            let oldResults = PacmanCalculatorV1.BottomRight(
                words: words,
                end: end,
                len: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            let newResults = PacmanCalculatorV2.BottomRight(
                letterIndex: letterIndex,
                words: words,
                end: end,
                len: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)
            
            print("PacmanCalculatorV1.TopLeft game: \(game.gameId), old:\(oldResults.count), new:\(newResults.count)")
        }
    }
    
    func test_topRight_Single() throws {
      /*
        .
        B
       .U
  .PARITY.
      .REsERVE.
.DEBENTURE.
       S.L
       T L
       . .
       
       */
        let words = ["PARITY", "TRUST", "BUYER", "RESERVE", "SELL", "DEBENTURE"]
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        let oldResults = PacmanCalculatorV1.TopRight(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let result = PacmanCalculatorV1.TopRight(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        XCTAssertEqual(1, result.count)
        let letterIndex = LetterIndexModel(words: words)
        
        let newResults = PacmanCalculatorV2.TopRight(letterIndex: letterIndex, words: words, end: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        XCTAssertEqual(1, newResults.count)
        
        
        let resultFirst = result[0]
        
        XCTAssertEqual(15, resultFirst.width)
        XCTAssertEqual(9, resultFirst.height)
        
        
        
        let shapes = ShapeCalculator.toShapes(pacmans: result)
        
        let shape = shapes[0]
        
        XCTAssertEqual(2, shape.placements[0].x)
        XCTAssertEqual(6, shape.placements[1].x)
        XCTAssertEqual(0, shape.placements[2].x)
        XCTAssertEqual(7, shape.placements[3].x)
        XCTAssertEqual(8, shape.placements[4].x)
        XCTAssertEqual(9, shape.placements[5].x)
        
        XCTAssertEqual(3, shape.placements[0].y)
        XCTAssertEqual(4, shape.placements[1].y)
        XCTAssertEqual(5, shape.placements[2].y)
        XCTAssertEqual(2, shape.placements[3].y)
        XCTAssertEqual(0, shape.placements[4].y)
        XCTAssertEqual(3, shape.placements[5].y)
        
        let (text, _) = ShapeCalculator.ToText(shape: shape, words: words)
        
        XCTAssertEqual(160, shape.score)
        
        let expectedText = "        .      \n        B      \n       .U      \n  .PARITY.     \n      .RESERVE.\n.DEBENTURE.    \n       S.L     \n       T L     \n       . .     "
        
        XCTAssertEqual(expectedText, text)
        print(text)
        /*
                 .
                 B
                .U
           .PARITY.
               .RESERVE.
         .DEBENTURE.
                S.L
                T L
                . .
         */
    }
    let widthMax = 17
    let heightMax = 15
    let scoreMin = 0
    let interlockWidth = 3
    let interlockHeight = 3
}
