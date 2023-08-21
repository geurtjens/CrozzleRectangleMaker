//
//  PacmanCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 6/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class PacmanCalculatorTests: XCTestCase {

    func test_bottomRight_Single() throws {
        
        let words = ["BULL", "SOLD", "UNITS", "TRUST", "LOSS", "SELL"]
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        let result = PacmanCalculator.BottomRight(
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
        
        let result = PacmanCalculator.TopLeft(
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
            
            let result = PacmanCalculator.BottomRight(
                words: words,
                end: end,
                len: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            XCTAssertEqual(609, result.count)
            
//            var shapes = ShapeCalculator.toShapes(pacmans: result)
//
//            ShapeCalculator.Sort(shapes: &shapes)
//
//            for shape in shapes {
//                print(shape.ToString(words: start))
//            }
        }
    }
    
    func test_topRight_Count8702() throws {
       
        let gamesList = GameList()
        if let game = gamesList.getGame(gameId: 8702) {
            let words = game.words
            let end = WordCalculator.reverse(words: words)
            let len = WordCalculator.lengths(words: words)
            
            let result = PacmanCalculator.TopRight(
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
            
            let result = PacmanCalculator.TopLeft(
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
            let end = WordCalculator.reverse(words: words)
            let len = WordCalculator.lengths(words: words)
            let letterIndex = LetterIndexModel(words: words)
            
            let oldResults = PacmanCalculator.Execute(
                words: words,
                end: end,
                len: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            let newResults = Pacman2Calculator.Execute(
                letterIndex: letterIndex,
                words: words,
                end: end,
                len: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)
            
            print("PacmanCalculator.Execute game: \(game.gameId), old:\(oldResults.count), new:\(newResults.count)")
        }
    }
    
    func test_PERF_ComparisonOLD() {
        let options = XCTMeasureOptions()
        options.iterationCount = 2 /* Tweak this value on a test-by-test basis */

        measure(metrics: [XCTClockMetric()], options: options) {
        let gameList = GameList()
        
            for game in gameList.games {
                let words = game.words
                let end = WordCalculator.reverse(words: words)
                let len = WordCalculator.lengths(words: words)
                //let letterIndex = LetterIndexModel(words: words)
                
                let oldResults = PacmanCalculator.Execute(
                    words: words,
                    end: end,
                    len: len,
                    scoreMin: scoreMin,
                    widthMax: widthMax,
                    heightMax: heightMax)
                
                
                print("PacmanCalculator.Execute game: \(game.gameId), old:\(oldResults.count)")
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
                
                let newResults = Pacman2Calculator.Execute(
                    letterIndex: letterIndex,
                    words: words,
                    end: end,
                    len: len,
                    scoreMin: scoreMin,
                    widthMax: widthMax,
                    heightMax: heightMax)
                
                print("PacmanCalculator.Execute game: \(game.gameId), new:\(newResults.count)")
            }
        }
    }
    
    func test_PERF_ComparisonNewest() {
        let options = XCTMeasureOptions()
        options.iterationCount = 2 /* Tweak this value on a test-by-test basis */

        measure(metrics: [XCTClockMetric()], options: options) {
            let gameList = GameList()
        
            for game in gameList.games {
                let words = game.words
                let end = WordCalculator.reverse(words: words)
                let len = WordCalculator.lengths(words: words)
                let letterIndex = LetterIndexModel(words: words)
                
                let newResults = Pacman4Calculator.Execute(
                    letterIndex: letterIndex,
                    words: words,
                    end: end,
                    len: len,
                    scoreMin: scoreMin,
                    widthMax: widthMax,
                    heightMax: heightMax)
                
                print("PacmanCalculator.Execute game: \(game.gameId), new:\(newResults.count)")
            }
        }
    }
    
    
    func test_ComparisonTopLeft() {
        let gameList = GameList()
        
        for game in gameList.games {
            let words = game.words
            let end = WordCalculator.reverse(words: words)
            let len = WordCalculator.lengths(words: words)
            let letterIndex = LetterIndexModel(words: words)
            
            let oldResults = PacmanCalculator.TopLeft(
                words: words,
                end: end,
                len: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            let newResults = Pacman2Calculator.TopLeft(
                letterIndex: letterIndex,
                words: words,
                end: end,
                len: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)
            
            print("PacmanCalculator.TopLeft game: \(game.gameId), old:\(oldResults.count), new:\(newResults.count)")
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
        
        let oldResults = PacmanCalculator.TopRight(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let newResults = Pacman2Calculator.TopRight(
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
            
            let oldResults = PacmanCalculator.TopRight(
                words: words,
                end: end,
                len: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            let newResults = Pacman2Calculator.TopRight(
                letterIndex: letterIndex,
                words: words,
                end: end,
                len: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)
            
            print("PacmanCalculator.TopRight game: \(game.gameId), old:\(oldResults.count), new:\(newResults.count)")
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
                oldShape = oldShape.Flip()
            }
            
            let text = oldShape.ToTextDebug(words: words)
            oldShapes.append(text)
        }
        
        var newShapes:[String] = []
        for newResult in newResults {
            var newShape = newResult.ToShape()
            if newShape.width < newShape.height {
                newShape = newShape.Flip()
            }
            let text = newShape.ToTextDebug(words: words)
            newShapes.append(text)
        }
        
        for oldResult in oldResults {
            
            let oldShape = oldResult.ToShape().ToTextDebug(words: words)
            let oldShapeFlipped = oldResult.ToShape().Flip().ToTextDebug(words: words)
            
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
            
            let oldResults = PacmanCalculator.BottomRight(
                words: words,
                end: end,
                len: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            let newResults = Pacman2Calculator.BottomRight(
                letterIndex: letterIndex,
                words: words,
                end: end,
                len: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)
            
            print("PacmanCalculator.TopLeft game: \(game.gameId), old:\(oldResults.count), new:\(newResults.count)")
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
        
        let oldResults = PacmanCalculator.TopRight(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let result = PacmanCalculator.TopRight(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        XCTAssertEqual(1, result.count)
        let letterIndex = LetterIndexModel(words: words)
        
        let newResults = Pacman2Calculator.TopRight(letterIndex: letterIndex, words: words, end: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
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
    let heightMax = 12
    let scoreMin = 0
    let interlockWidth = 3
    let interlockHeight = 3
}
