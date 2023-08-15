//
//  DonutCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 14/8/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class RectangleCalculatorTests: XCTestCase {

    func test_Performance_Serial()  {
        measure {
            let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
            
            let result = Rectangle2Calculator.ExecuteSerial(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            XCTAssertEqual(4_457_026, result.count)
            
            /// It takes approximately `15.093` seconds running in serial
        }
    }
    
    func test_Performance_Serial_Old()  {
        measure {
            let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
            
            let result = RectangleCalculator.ExecuteSerial(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            XCTAssertEqual(4_457_026, result.count)
            
            /// It takes approximately `151.881` seconds running in serial
        }
    }
    
    func test_AsyncNew() async {
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
        
        let result = await Rectangle2Calculator.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        XCTAssertEqual(4457026, result.count)
    }
    
    func test_AsyncOld() async {
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
        
        let result = await RectangleCalculator.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        XCTAssertEqual(4457026, result.count)
    }
    
    /// The strategy is find the ones that are missing from our new way of doing it and fix it so they appear again
    func test_MERRY_STAR_SAUCE_AZURE_BottomRight() {
        let words = ["MERRY","STAR","SAUCE","AZURE"]
        /// AND we have calculated all lengths
        let lengths = WordCalculator.lengths(words: words)
        
        /// AND we have calculated the `LetterIndexModel`
        let index = LetterIndexModel(words: words)
        
        /// WHEN we calculate `BottomRightRectangle` using `index`
        let newResults = Rectangle2Calculator.BottomRightRectangle(interlockWidth: 2, interlockHeight: 3, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `1` records returned
        XCTAssertEqual(1, newResults.count)
    }
    
    func test_BottomRightRectangle() {
        //let words = ["TREE","WHITE","ZION","INN"]
        // GIVEN we use the winning words from 8612
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE"]
      
        /// AND we have calculated all lengths
        let lengths = WordCalculator.lengths(words: words)
        
        /// AND we have calculated the `LetterIndexModel`
        let index = LetterIndexModel(words: words)
        
        /// WHEN we calculate `Square` using `index`
        let newResults = Rectangle2Calculator.BottomRightRectangle(interlockWidth: 2, interlockHeight: 3, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `315` records returned
        XCTAssertEqual(315, newResults.count)
        
        // WHEN we calculate `Square` without using index
        let oldResults = RectangleCalculator.BottomRightRectangle(interlockWidth: 2, interlockHeight: 3, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `315` records returned
        XCTAssertEqual(315, oldResults.count)
        
        /// AND the old way returns the same records as the new way
        XCTAssertEqual(newResults.count, oldResults.count)
        
        //compareShapes(oldResults: oldResults, newResults: newResults, words: words)
    }
    
    
    func test_BottomLeftRectangle() {

        // GIVEN we use the winning words from 8612
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE"]
      
        /// AND we have calculated all lengths
        let lengths = WordCalculator.lengths(words: words)
        
        /// AND we have calculated the `LetterIndexModel`
        let index = LetterIndexModel(words: words)
        
        /// WHEN we calculate `Square` using `index`
        let newResults = Rectangle2Calculator.BottomLeftRectangle(interlockWidth: 2, interlockHeight: 3, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `315` records returned
        XCTAssertEqual(175, newResults.count)
        
        // WHEN we calculate `Square` without using index
        let oldResults = RectangleCalculator.BottomLeftRectangle(interlockWidth: 2, interlockHeight: 3, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `315` records returned
        XCTAssertEqual(175, oldResults.count)
        
        /// AND the old way returns the same records as the new way
        XCTAssertEqual(newResults.count, oldResults.count)
        
        //compareShapes(oldResults: oldResults, newResults: newResults, words: words)
    }
    
    
    func test_BottomRightSquare() {
        
        // GIVEN we use the winning words from 8612
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE"]
      
        
        /// AND we have calculated all lengths
        let lengths = WordCalculator.lengths(words: words)
        
        /// AND we have calculated the `LetterIndexModel`
        let index = LetterIndexModel(words: words)
        
        /// WHEN we calculate `Square` using `index`
        let newResults = Rectangle2Calculator.BottomRightSquare(interlockWidth: 2, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `315` records returned
        XCTAssertEqual(198, newResults.count)
        
        // WHEN we calculate `Square` without using index
        let oldResults = RectangleCalculator.BottomRightSquare(interlockWidth: 2, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `315` records returned
        XCTAssertEqual(198, oldResults.count)
        
        /// AND the old way returns the same records as the new way
        XCTAssertEqual(newResults.count, oldResults.count)
        
        //compareShapes(oldResults: oldResults, newResults: newResults, words: words)
    }
    
    
    func test_Performance_BottomRightRectangle_OLD() {
        measure {
            // GIVEN we use the words from 8612
            let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
            
            /// AND we have calculated all lengths
            let lengths = WordCalculator.lengths(words: words)
            
            // WHEN we calculate `BottomRightRectangle` without using index
            let oldResults = RectangleCalculator.BottomRightRectangle(interlockWidth: 2, interlockHeight: 3, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            /// THEN we get `206_706` records returned
            XCTAssertEqual(206_706, oldResults.count)
            
            /// It takes an average of `2.178` seconds to complete
        }
    }
    
    func test_Performance_BottomRightRectangle_NEW() {
        measure {
            // GIVEN we use the words from 8612
            let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
            /// AND we have calculated all lengths
            let lengths = WordCalculator.lengths(words: words)
            
            /// AND we have calculated the `LetterIndexModel`
            let index = LetterIndexModel(words: words)
            
            /// WHEN we calculate `BottomRightRectangle` using `index`
            let newResults = Rectangle2Calculator.BottomRightRectangle(interlockWidth: 2, interlockHeight: 3, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            /// THEN we get `206_706` records returned
            XCTAssertEqual(206_706, newResults.count)
            
            /// It takes on average `0.492` seconds to complete
        }
  
    }
    
    
    
    func test_TopLeftRectangle() throws {
        // GIVEN we use the winning words from 8612
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE"]
        
        /// AND we have calculated all lengths
        let lengths = WordCalculator.lengths(words: words)
        
        /// AND we have calculated the `LetterIndexModel`
        let index = LetterIndexModel(words: words)
        
        /// WHEN we calculate `Square` using `index`
        let newResults = Rectangle2Calculator.TopLeftRectangle(interlockWidth: 2, interlockHeight: 3, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `352` records returned
        XCTAssertEqual(352, newResults.count)
        
        // WHEN we calculate `Square` without using index
        let oldResults = RectangleCalculator.TopLeftRectangle(interlockWidth: 2, interlockHeight: 3, words: words, lengths: lengths, scoreMin: 0, widthMax:   17, heightMax: 12)
        
        /// THEN we get `352` records returned
        XCTAssertEqual(352, oldResults.count)
        
        /// AND the old way returns the same records as the new way
        XCTAssertEqual(newResults.count, oldResults.count)
    }
    
    func test_TopLeftSquare() throws {
        // GIVEN we use the winning words from 8612
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE"]
        
        /// AND we have calculated all lengths
        let lengths = WordCalculator.lengths(words: words)
        
        /// AND we have calculated the `LetterIndexModel`
        let index = LetterIndexModel(words: words)
        
        /// WHEN we calculate `Square` using `index`
        let newResults = Rectangle2Calculator.TopLeftSquare(interlockWidth: 2, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `288` records returned
        XCTAssertEqual(288, newResults.count)
        
        // WHEN we calculate `Square` without using index
        let oldResults = RectangleCalculator.TopLeftSquare(interlockWidth: 2, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `288` records returned
        XCTAssertEqual(288, oldResults.count)
        
        /// AND the old way returns the same records as the new way
        XCTAssertEqual(newResults.count, oldResults.count)
    }
    
    
    func test_TopRightRectangle() throws {
        // GIVEN we use the winning words from 8612
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE"]
        
        /// AND we have calculated all lengths
        let lengths = WordCalculator.lengths(words: words)
        
        /// AND we have calculated the `LetterIndexModel`
        let index = LetterIndexModel(words: words)
        
        /// WHEN we calculate `Square` using `index`
        /// You have to choose a matching direction because this will flip to another kind of shape otherwise as topRight is flipped to bottomLeft
        let newResults = Rectangle2Calculator.TopRightRectangle(interlockWidth: 2, interlockHeight: 3, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `352` records returned
        XCTAssertEqual(223, newResults.count)
        
        // WHEN we calculate `Square` without using index
        let oldResults = RectangleCalculator.TopRightRectangle(interlockWidth: 2, interlockHeight: 3, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `352` records returned
        XCTAssertEqual(223, oldResults.count)
        
        /// AND the old way returns the same records as the new way
        XCTAssertEqual(newResults.count, oldResults.count)
        
        //compareShapes(oldResults: oldResults, newResults: newResults, words: words)
    }
    
    func test_Performance_TopRightRectangle_Old() throws {
        measure {
            // GIVEN we use the words from 8612
            let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
            
            /// AND we have calculated all lengths
            let lengths = WordCalculator.lengths(words: words)
            
            // WHEN we calculate `TopRightRectangle` without using index
            let oldResults = RectangleCalculator.TopRightRectangle(interlockWidth: 2, interlockHeight: 3, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            /// THEN we get `203487` records returned
            XCTAssertEqual(203487, oldResults.count)
            
            /// AND it took on average `2.153` to complete
        }
    }
    
    func test_Performance_TopRightRectangle_New() throws {
        measure {
            // GIVEN we use the words from 8612
            let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
            
            /// AND we have calculated all lengths
            let lengths = WordCalculator.lengths(words: words)
            
            /// AND we have calculated the `LetterIndexModel`
            let index = LetterIndexModel(words: words)
            
            /// WHEN we calculate `TopRightRectangle` using `index`
            /// You have to choose a matching direction because this will flip to another kind of shape otherwise as topRight is flipped to bottomLeft
            let newResults = Rectangle2Calculator.TopRightRectangle(interlockWidth: 2, interlockHeight: 3, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            /// THEN we get `203487` records returned
            XCTAssertEqual(203487, newResults.count)
            
            /// AND it took on average `0.474` to complete
        }
    }
    
    func test_TopRightSquare() throws {
        // GIVEN we use the winning words from 8612
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE"]
        
        /// AND we have calculated all lengths
        let lengths = WordCalculator.lengths(words: words)
        
        /// AND we have calculated the `LetterIndexModel`
        let index = LetterIndexModel(words: words)
        
        /// WHEN we calculate `Square` using `index`
        /// You have to choose a matching direction because this will flip to another kind of shape otherwise as topRight is flipped to bottomLeft
        let newResults = Rectangle2Calculator.TopRightSquare(interlockWidth: 2, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `352` records returned
        XCTAssertEqual(508, newResults.count)
        
        // WHEN we calculate `Square` without using index
        let oldResults = RectangleCalculator.TopRightSquare(interlockWidth: 2, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `352` records returned
        XCTAssertEqual(508, oldResults.count)
        
        /// AND the old way returns the same records as the new way
        XCTAssertEqual(newResults.count, oldResults.count)
        
        //compareShapes(oldResults: oldResults, newResults: newResults, words: words)
    }
    
    /// The strategy is find the ones that are missing from our new way of doing it and fix it so they appear again
    func test_ExampleWords() {
        let words = ["ZION","TOAST","TOYS","JOY"]
        /// AND we have calculated all lengths
        let lengths = WordCalculator.lengths(words: words)
        
        /// AND we have calculated the `LetterIndexModel`
        let index = LetterIndexModel(words: words)
        
        /// WHEN we calculate `Square` using `index`
        let newResults = Rectangle2Calculator.TopRightRectangle(interlockWidth: 2, interlockHeight: 3, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `1` records returned
        XCTAssertEqual(1, newResults.count)
    }
    
    
    func test_Performance_TopLeftRectangle_Old() throws {
        measure {
            
            /// GIVEN words containing all words from 8612
            let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
           
            /// AND we have calculated all lengths
            let lengths = WordCalculator.lengths(words: words)
            
            // WHEN we calculate `Square` without using index
            let oldResult = RectangleCalculator.TopLeftRectangle(interlockWidth: 2, interlockHeight: 3, words: words, lengths: lengths, scoreMin: 0, widthMax:   17, heightMax: 12)
            
            /// THEN we get `352` records returned
            XCTAssertEqual(220148, oldResult.count)
            
            /// AND it takes on average `2.367` seconds to complete
        }
    }
    
    
    func test_Performance_TopLeftRectangle_New() throws {
        measure {
            
            /// GIVEN words containing all words from 8612
            let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
           
            /// AND we have calculated all lengths
            let lengths = WordCalculator.lengths(words: words)
            
            /// AND we have calculated the `LetterIndexModel`
            let index = LetterIndexModel(words: words)
            
            /// WHEN we calculate `TopLeftRectangle` using `index`
            let result = Rectangle2Calculator.TopLeftRectangle(interlockWidth: 2, interlockHeight: 3, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            /// THEN we get `220148` records returned
            XCTAssertEqual(220148, result.count)
            
            /// AND it takes on average `0.503` seconds to complete
        }
    }
    
    
    func test_TopLeftRectangleOld() throws {
        // GIVEN we use the winning words from 8612
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE"]
        
        /// AND we have calculated all lengths
        let lengths = WordCalculator.lengths(words: words)
        
        // WHEN we calculate `Square` without using index
        let oldResult = RectangleCalculator.TopLeftRectangle(interlockWidth: 2, interlockHeight: 3, words: words, lengths: lengths, scoreMin: 0, widthMax:   17, heightMax: 12)
        
        /// THEN we get `352` records returned
        XCTAssertEqual(352, oldResult.count)
    }
    
    
    func testSquare() throws {
        
        // GIVEN we use the winning words from 8612
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE"]
        
        /// AND we have calculated all lengths
        let lengths = WordCalculator.lengths(words: words)
        
        /// AND we have calculated the `LetterIndexModel`
        let index = LetterIndexModel(words: words)
        
        /// WHEN we calculate `Square` using `index`
        let result = Rectangle2Calculator.Square( interlockWidth: 2, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `106` records returned
        XCTAssertEqual(106, result.count)
        
        // WHEN we calculate `Square` without using index
        let oldResult = RectangleCalculator.Square(interlockWidth: 2, words: words, lengths: lengths, scoreMin: 0, widthMax:   17, heightMax: 12)
        
        /// THEN we get `106` records returned
        XCTAssertEqual(106, oldResult.count)
        
        /// AND the old way returns the same records as the new way
        XCTAssertEqual(result.count, oldResult.count)
    }

    
    func testRectangle() throws {
        
        // GIVEN we use the winning words from 8612
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE"]
        
        /// AND we have calculated all lengths
        let lengths = WordCalculator.lengths(words: words)
        
        /// AND we have calculated the `LetterIndexModel`
        let index = LetterIndexModel(words: words)
        
        /// WHEN we calculate `Rectangle`s using the `index`
        let result = Rectangle2Calculator.Rectangle(interlockWidth: 2, interlockHeight: 3, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `80` records returned
        XCTAssertEqual(80, result.count)
        
        /// WHEN we calculate `Rectangle` without using index
        let oldResult = RectangleCalculator.Rectangle(interlockWidth: 2, interlockHeight: 3, words: words, lengths: lengths, scoreMin: 0, widthMax:   17, heightMax: 12)
        
        /// THEN we still get `80` records returned
        XCTAssertEqual(80, oldResult.count)
        
        /// AND the old way returns the same records as the new way
        XCTAssertEqual(result.count, oldResult.count)
    }

    
    func testRectanglePerformanceNew() throws {
        
        self.measure {

            /// GIVEN words containing all words from 8612
            let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
            
            /// AND we have calculated all lengths
            let lengths = WordCalculator.lengths(words: words)
            
            /// AND we have calculated the `LetterIndexModel`
            let index = LetterIndexModel(words: words)
            
            /// WHEN we calculate `Rectangle`s using the `index`
            let result = Rectangle2Calculator.Rectangle(interlockWidth: 2, interlockHeight: 3, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            /// THEN we get 201,499 records returned
            XCTAssertEqual(201_499, result.count)
            
            /// AND it takes on average `1.461` seconds to complete
        }
    }
    
    
    func testPerformanceCreateIndex() throws {
        
        self.measure {

            /// GIVEN words containing all words from 8612
            let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
            
            /// WHEN we calculate the lengths of the words
            let lengths = WordCalculator.lengths(words: words)
            
            /// THEN the lengths will have the same number of elements as there are words
            XCTAssertEqual(words.count, lengths.count)
            
            /// WHEN we calculate the index for all letters
            let index = LetterIndexModel(words: words)
            
            /// THEN the index will cover all 26 letters of the alphabet
            XCTAssertEqual(26, index.index.count)
            
            /// AND it takes on average `0.001` seconds to complete
        }
    }
    
    
    func testRectanglePerformanceOld() throws {
        self.measure {
            
            /// GIVEN words containing all words from 8612
            let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
            
            /// AND we have calculated all lengths
            let lengths = WordCalculator.lengths(words: words)
            
            /// WHEN we calculate `Rectangle`s without using index
            let otherResult = RectangleCalculator.Rectangle(interlockWidth: 2, interlockHeight: 3, words: words, lengths: lengths, scoreMin: 0, widthMax:   17, heightMax: 12)
            
            /// THEN we get 201,499 records returned
            XCTAssertEqual(201_499, otherResult.count)
            
            /// AND it takes about `28.6` seconds to complete
        }
    }
    
    
    func testSquarePerformanceNew() throws {
        
        self.measure {

            /// GIVEN words containing all words from 8612
            let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
            
            /// AND we have calculated all `lengths`
            let lengths = WordCalculator.lengths(words: words)
            
            /// AND we have calculated the `LetterIndexModel`
            let index = LetterIndexModel(words: words)
            
            /// WHEN we calculate `Square`s using the `index`
            let result = Rectangle2Calculator.Square(interlockWidth: 2, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            /// THEN we get `174,370` records returned
            XCTAssertEqual(174_370, result.count)
            
            /// AND it takes on average `1.227` seconds to complete
        }
    }
    
    
    func testSquarePerformanceOld() throws {
        
        self.measure {
            /// GIVEN words containing `all words` from `8612`
            let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
            
            /// AND we have calculated all `lengths`
            let lengths = WordCalculator.lengths(words: words)
            
            /// WHEN we calculate `Square`s without using index
            let result = RectangleCalculator.Square(interlockWidth: 2, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            /// THEN we get `174,370` records returned
            XCTAssertEqual(174_370, result.count)
            
            /// AND it takes an average of `23.536` seconds to complete
        }
    }
    
    
    func compareShapes(oldResults: [RectangleModel], newResults: [RectangleModel], words: [String]) {
        
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
    
    let scoreMin = 0
    let widthMax = 17
    let heightMax = 12
}
