//
//  DonutCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 14/8/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class RectangleCalculatorTests: XCTestCase {

   

    func testExample() throws {
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE"]
        
        let lengths = WordCalculator.lengths(words: words)
        
        let index = LetterIndexModel(words: words)
        
        let result = Rectangle2Calculator.Rectangle(letterIndex: index, words: words, interlockWidth: 2, interlockHeight: 3, lengths: lengths, scoreMin: 0, widthMax: 17, heightMax: 12)
        
        XCTAssertEqual(80, result.count)
        
        
        // Seems like our new way of doing it causes more items to be accepted and that might be wrong
        let otherResult = RectangleCalculator.Rectangle(interlockWidth: 2, interlockHeight: 3, words: words, lengths: lengths, scoreMin: 0, widthMax:   17, heightMax: 12)
        XCTAssertEqual(80, otherResult.count)
    }

    func testPerformanceNew() throws {
        // This is an example of a performance test case.
        
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
        
        let lengths = WordCalculator.lengths(words: words)
        
        let index = LetterIndexModel(words: words)
        self.measure {

            
            let result = Rectangle2Calculator.Rectangle(letterIndex: index, words: words, interlockWidth: 2, interlockHeight: 3, lengths: lengths, scoreMin: 0, widthMax: 17, heightMax: 12)
            
            XCTAssertEqual(201499, result.count)
            
            
        }
    }
    func testPerformanceOld() throws {
        // This is an example of a performance test case.
        self.measure {
            let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
            
            let lengths = WordCalculator.lengths(words: words)
            
            // Seems like our new way of doing it causes more items to be accepted and that might be wrong
            let otherResult = RectangleCalculator.Rectangle(interlockWidth: 2, interlockHeight: 3, words: words, lengths: lengths, scoreMin: 0, widthMax:   17, heightMax: 12)
            XCTAssertEqual(201499, otherResult.count)
            
            
        }
    }

}
