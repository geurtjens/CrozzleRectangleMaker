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
        
        let start = ["BULL", "SOLD", "UNITS", "TRUST", "LOSS", "SELL"]
        let end = WordCalculator.reverse(words: start)
        let len = WordCalculator.lengths(words: start)
        
        let result = PacmanCalculator.BottomRight(
            start: start,
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
        
        let (text, _) = ShapeCalculator.ToText(shape: shape, words: start)
        
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
        
        let start = ["TRUST", "TRUSTEE", "ASSETS", "TAX", "NOTES", "RESERVE"]
        let end = WordCalculator.reverse(words: start)
        let len = WordCalculator.lengths(words: start)
        
        let result = PacmanCalculator.TopLeft(
            start: start,
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
        
        let (text, _) = ShapeCalculator.ToText(shape: shape, words: start)
        
        XCTAssertEqual(138, shape.score)
        
        let expectedText = "      .     \n      N     \n      O.    \n     .TRUST.\n.TRUSTEE.   \n    .ASSETS.\n     X.E    \n     . R    \n       V    \n       E    \n       .    "
        
        XCTAssertEqual(expectedText, text)
        //print(text)
    }

    func test_bottomRight_Count8702() throws {
       
        let gamesList = GameList()
        if let game = gamesList.getGame(gameId: 8702) {
            let start = game.words
            let end = WordCalculator.reverse(words: start)
            let len = WordCalculator.lengths(words: start)
            
            let result = PacmanCalculator.BottomRight(
                start: start,
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
            let start = game.words
            let end = WordCalculator.reverse(words: start)
            let len = WordCalculator.lengths(words: start)
            
            let result = PacmanCalculator.TopRight(
                start: start,
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
            let start = game.words
            let end = WordCalculator.reverse(words: start)
            let len = WordCalculator.lengths(words: start)
            
            let result = PacmanCalculator.TopLeft(
                start: start,
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
    
    func test_topRight_Single() throws {
        
        let start = ["PARITY", "RESERVE", "DEBENTURE", "TRUST", "BUYER", "SELL"]
        let end = WordCalculator.reverse(words: start)
        let len = WordCalculator.lengths(words: start)
        
        let result = PacmanCalculator.TopRight(
            start: start,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        XCTAssertEqual(1, result.count)
        
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
        
        let (text, _) = ShapeCalculator.ToText(shape: shape, words: start)
        
        XCTAssertEqual(160, shape.score)
        
        let expectedText = "        .      \n        B      \n       .U      \n  .PARITY.     \n      .RESERVE.\n.DEBENTURE.    \n       S.L     \n       T L     \n       . .     "
        
        XCTAssertEqual(expectedText, text)
        //print(text)
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
