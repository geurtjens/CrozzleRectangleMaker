//
//  DonutCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 14/8/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class RectangleCalculatorV1Tests: XCTestCase {
    
    
    func test_Compare() {
        let count3 = RectangleCalculatorV3.ExecuteAllSerial(scoreMin: 0)
        let count2 = RectangleCalculatorV2.ExecuteAllSerial(scoreMin: 0)
        XCTAssertEqual(count2, count3)
        
        let count1 = RectangleCalculatorV1.ExecuteAllSerial(scoreMin: 0)
        XCTAssertEqual(count2, count1)
        
    }
    
    
    func test_AsyncNew() async {
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
        
        let result = await RectangleCalculatorV2.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        XCTAssertEqual(4457026, result.count)
    }
    
    func test_ExecuteAll() async {
        let gameList = GameList()
        for game in gameList.games {
            let words = game.words
            
            let newResults = await RectangleCalculatorV2.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            let oldResults = await RectangleCalculatorV2.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            XCTAssertEqual(oldResults.count, newResults.count)
            
            print("Execute: \(game.gameId), old: \(oldResults.count), new: \(newResults.count)")
        }
    }
    
    func test_ExecuteAll_Old() async {
        /// We want to only test old so we can see how long it takes
        let gameList = GameList()
        for game in gameList.games {
            let words = game.words
            
            let oldResults = await RectangleCalculatorV2.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            print("Execute: \(game.gameId), old: \(oldResults.count)")
        }
    }
    
    func test_RectangleCalculatorV2_ExecuteParallel() async {
        await RectangleCalculatorV2.ExecuteAllParallel(scoreMin: 0)
    }
    
    func test_RectangleCalculatorV3_ExecuteParallel() async {
        await RectangleCalculatorV3.ExecuteAllParallel(scoreMin: 0)
    }
    
    func test_AsyncOld() async {
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
        
        let result = await RectangleCalculatorV1.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
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
        let newResults = RectangleCalculatorV2.BottomRightRectangle(interlockWidth: 2, interlockHeight: 3, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
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
        
        /// WHEN we calculate `BottomRightRectangle` using `index`
        let newResults = RectangleCalculatorV2.BottomRightRectangle(interlockWidth: 2, interlockHeight: 3, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `315` records returned
        XCTAssertEqual(315, newResults.count)
        
        // WHEN we calculate `Square` without using index
        let oldResults = RectangleCalculatorV1.BottomRightRectangle(interlockWidth: 2, interlockHeight: 3, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
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
        let newResults = RectangleCalculatorV2.BottomLeftRectangle(interlockWidth: 2, interlockHeight: 3, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `315` records returned
        XCTAssertEqual(175, newResults.count)
        
        // WHEN we calculate `Square` without using index
        let oldResults = RectangleCalculatorV1.BottomLeftRectangle(interlockWidth: 2, interlockHeight: 3, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
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
        let newResults = RectangleCalculatorV2.BottomRightSquare(interlockWidth: 2, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `315` records returned
        XCTAssertEqual(198, newResults.count)
        
        // WHEN we calculate `Square` without using index
        let oldResults = RectangleCalculatorV1.BottomRightSquare(interlockWidth: 2, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `315` records returned
        XCTAssertEqual(198, oldResults.count)
        
        /// AND the old way returns the same records as the new way
        XCTAssertEqual(newResults.count, oldResults.count)
        
        //compareShapes(oldResults: oldResults, newResults: newResults, words: words)
    }
    
    
    
    
    
    func test_TopLeftRectangle() throws {
        // GIVEN we use the winning words from 8612
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE"]
        
        /// AND we have calculated all lengths
        let lengths = WordCalculator.lengths(words: words)
        
        /// AND we have calculated the `LetterIndexModel`
        let index = LetterIndexModel(words: words)
        
        /// WHEN we calculate `Square` using `index`
        let newResults = RectangleCalculatorV2.TopLeftRectangle(interlockWidth: 2, interlockHeight: 3, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `352` records returned
        XCTAssertEqual(352, newResults.count)
        
        // WHEN we calculate `Square` without using index
        let oldResults = RectangleCalculatorV1.TopLeftRectangle(interlockWidth: 2, interlockHeight: 3, words: words, lengths: lengths, scoreMin: 0, widthMax:   17, heightMax: 12)
        
        /// THEN we get `352` records returned
        XCTAssertEqual(352, oldResults.count)
        
        /// AND the old way returns the same records as the new way
        XCTAssertEqual(newResults.count, oldResults.count)
    }
    
    func test_TopRightRectangle2() throws {
        // GIVEN we use the winning words from 8612
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
        
        /// AND we have calculated all lengths
        let lengths = WordCalculator.lengths(words: words)
        
        /// AND we have calculated the `LetterIndexModel`
        let index = LetterIndexModel(words: words)
        
        /// WHEN we calculate `Square` using `index`
        let newResults = RectangleCalculatorV2.TopRightRectangle(interlockWidth: 2, interlockHeight: 3, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `203487` records returned
        XCTAssertEqual(203487, newResults.count)
        
        // WHEN we calculate `Square` without using index
        let oldResults = RectangleCalculatorV1.TopRightRectangle(interlockWidth: 2, interlockHeight: 3, words: words, lengths: lengths, scoreMin: 0, widthMax:   17, heightMax: 12)
        
        /// THEN we get `203487` records returned
        XCTAssertEqual(203487, oldResults.count)
        
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
        let newResults = RectangleCalculatorV2.TopLeftSquare(interlockWidth: 2, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `288` records returned
        XCTAssertEqual(288, newResults.count)
        
        // WHEN we calculate `Square` without using index
        let oldResults = RectangleCalculatorV1.TopLeftSquare(interlockWidth: 2, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
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
        let newResults = RectangleCalculatorV2.TopRightRectangle(interlockWidth: 2, interlockHeight: 3, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `352` records returned
        XCTAssertEqual(223, newResults.count)
        
        // WHEN we calculate `Square` without using index
        let oldResults = RectangleCalculatorV1.TopRightRectangle(interlockWidth: 2, interlockHeight: 3, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `352` records returned
        XCTAssertEqual(223, oldResults.count)
        
        /// AND the old way returns the same records as the new way
        XCTAssertEqual(newResults.count, oldResults.count)
        
        //compareShapes(oldResults: oldResults, newResults: newResults, words: words)
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
        let newResults = RectangleCalculatorV2.TopRightSquare(interlockWidth: 2, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `352` records returned
        XCTAssertEqual(508, newResults.count)
        
        // WHEN we calculate `Square` without using index
        let oldResults = RectangleCalculatorV1.TopRightSquare(interlockWidth: 2, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
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
        let newResults = RectangleCalculatorV2.TopRightRectangle(interlockWidth: 2, interlockHeight: 3, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `1` records returned
        XCTAssertEqual(1, newResults.count)
    }
    
    
    
    
    
    func test_TopLeftRectangleOld() throws {
        // GIVEN we use the winning words from 8612
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE"]
        
        /// AND we have calculated all lengths
        let lengths = WordCalculator.lengths(words: words)
        
        // WHEN we calculate `Square` without using index
        let oldResult = RectangleCalculatorV1.TopLeftRectangle(interlockWidth: 2, interlockHeight: 3, words: words, lengths: lengths, scoreMin: 0, widthMax:   17, heightMax: 12)
        
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
        let result = RectangleCalculatorV2.Square( interlockWidth: 2, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `106` records returned
        XCTAssertEqual(106, result.count)
        
        // WHEN we calculate `Square` without using index
        let oldResult = RectangleCalculatorV1.Square(interlockWidth: 2, words: words, lengths: lengths, scoreMin: 0, widthMax:   17, heightMax: 12)
        
        /// THEN we get `106` records returned
        XCTAssertEqual(106, oldResult.count)
        
        /// AND the old way returns the same records as the new way
        XCTAssertEqual(result.count, oldResult.count)
    }

    func testSquareNew() throws {
        
        // GIVEN we use the winning words from 8612
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
        
        /// AND we have calculated all lengths
        let lengths = WordCalculator.lengths(words: words)
        
        /// AND we have calculated the `LetterIndexModel`
        let index = LetterIndexModel(words: words)
        
        /// WHEN we calculate `Square` using `index`
        let result = RectangleCalculatorV2.Square( interlockWidth: 2, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `174370` records returned
        XCTAssertEqual(174370, result.count)
        
        // WHEN we calculate `Square` without using index
        let oldResult = RectangleCalculatorV1.Square(interlockWidth: 2, words: words, lengths: lengths, scoreMin: 0, widthMax:   17, heightMax: 12)
        
        /// THEN we get `174370` records returned
        XCTAssertEqual(174370, oldResult.count)
        
        /// AND the old way returns the same records as the new way
        XCTAssertEqual(result.count, oldResult.count)
    }
    
    func testRectangle2() throws {
        
        // GIVEN we use the winning words from 8612
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
        
        /// AND we have calculated all lengths
        let lengths = WordCalculator.lengths(words: words)
        
        /// AND we have calculated the `LetterIndexModel`
        let index = LetterIndexModel(words: words)
        
        /// WHEN we calculate `Rectangle`s using the `index`
        let result = RectangleCalculatorV2.Rectangle(interlockWidth: 2, interlockHeight: 3, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `201499` records returned
        XCTAssertEqual(201499, result.count)
        
        /// WHEN we calculate `Rectangle` without using index
        let oldResult = RectangleCalculatorV1.Rectangle(interlockWidth: 2, interlockHeight: 3, words: words, lengths: lengths, scoreMin: 0, widthMax:   17, heightMax: 12)
        
        /// THEN we still get `201499` records returned
        XCTAssertEqual(201499, oldResult.count)
        
        /// AND the old way returns the same records as the new way
        XCTAssertEqual(result.count, oldResult.count)
    }
    
    func testTopLeftRectangle2() throws {
        
        // GIVEN we use the winning words from 8612
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
        
        /// AND we have calculated all lengths
        let lengths = WordCalculator.lengths(words: words)
        
        /// AND we have calculated the `LetterIndexModel`
        let index = LetterIndexModel(words: words)
        
        /// WHEN we calculate `TopLeftRectangle`s using the `index`
        let result = RectangleCalculatorV2.TopLeftRectangle(interlockWidth: 2, interlockHeight: 3, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `220148` records returned
        XCTAssertEqual(220148, result.count)
        
        /// WHEN we calculate `TopLeftRectangle` without using index
        let oldResult = RectangleCalculatorV1.TopLeftRectangle(interlockWidth: 2, interlockHeight: 3, words: words, lengths: lengths, scoreMin: 0, widthMax:   17, heightMax: 12)
        
        /// THEN we still get `220148` records returned
        XCTAssertEqual(220148, oldResult.count)
        
        /// AND the old way returns the same records as the new way
        XCTAssertEqual(result.count, oldResult.count)
    }
    
    func testTopLeftSquares2() throws {
        
        // GIVEN we use the winning words from 8612
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
        
        /// AND we have calculated all lengths
        let lengths = WordCalculator.lengths(words: words)
        
        /// AND we have calculated the `LetterIndexModel`
        let index = LetterIndexModel(words: words)
        
        /// WHEN we calculate `TopLeftRectangle`s using the `index`
        let result = RectangleCalculatorV2.TopLeftSquare(interlockWidth: 2, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `153820` records returned
        XCTAssertEqual(153820, result.count)
        
        /// WHEN we calculate `TopLeftRectangle` without using index
        let oldResult = RectangleCalculatorV1.TopLeftSquare(interlockWidth: 2, words: words, lengths: lengths, scoreMin: 0, widthMax:   17, heightMax: 12)
        
        /// THEN we still get `153820` records returned
        XCTAssertEqual(153820, oldResult.count)
        
        /// AND the old way returns the same records as the new way
        XCTAssertEqual(result.count, oldResult.count)
    }
    
    func testBottomRightRectangle2() throws {
        
        // GIVEN we use the winning words from 8612
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
        
        /// AND we have calculated all lengths
        let lengths = WordCalculator.lengths(words: words)
        
        /// AND we have calculated the `LetterIndexModel`
        let index = LetterIndexModel(words: words)
        
        /// WHEN we calculate `BottomRightRectangle`s using the `index`
        let result = RectangleCalculatorV2.BottomRightRectangle(interlockWidth: 2, interlockHeight: 3, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `206706` records returned
        XCTAssertEqual(206706, result.count)
        
        /// WHEN we calculate `BottomRightRectangle` without using index
        let oldResult = RectangleCalculatorV1.BottomRightRectangle(interlockWidth: 2, interlockHeight: 3, words: words, lengths: lengths, scoreMin: 0, widthMax:   17, heightMax: 12)
        
        /// THEN we still get `206706` records returned
        XCTAssertEqual(206706, oldResult.count)
        
        /// AND the old way returns the same records as the new way
        XCTAssertEqual(result.count, oldResult.count)
    }
    
    func testBottomRightSquare2() throws {
        
        // GIVEN we use the winning words from 8612
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
        
        /// AND we have calculated all lengths
        let lengths = WordCalculator.lengths(words: words)
        
        /// AND we have calculated the `LetterIndexModel`
        let index = LetterIndexModel(words: words)
        
        /// WHEN we calculate `BottomRightRectangle`s using the `index`
        let result = RectangleCalculatorV2.BottomRightSquare(interlockWidth: 2, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `160216` records returned
        XCTAssertEqual(160216, result.count)
        
        /// WHEN we calculate `BottomRightRectangle` without using index
        let oldResult = RectangleCalculatorV1.BottomRightSquare(interlockWidth: 2, words: words, lengths: lengths, scoreMin: 0, widthMax:   17, heightMax: 12)
        
        /// THEN we still get `160216` records returned
        XCTAssertEqual(160216, oldResult.count)
        
        /// AND the old way returns the same records as the new way
        XCTAssertEqual(result.count, oldResult.count)
    }
    
    func testRectangle() throws {
        
        // GIVEN we use the winning words from 8612
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
      
        
        /// AND we have calculated all lengths
        let lengths = WordCalculator.lengths(words: words)
        
        /// AND we have calculated the `LetterIndexModel`
        let index = LetterIndexModel(words: words)
        
        /// WHEN we calculate `Rectangle`s using the `index`
        let result = RectangleCalculatorV2.Rectangle(interlockWidth: 2, interlockHeight: 3, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `201499` records returned
        XCTAssertEqual(201499, result.count)
        
        /// WHEN we calculate `Rectangle` without using index
        let oldResult = RectangleCalculatorV1.Rectangle(interlockWidth: 2, interlockHeight: 3, words: words, lengths: lengths, scoreMin: 0, widthMax:   17, heightMax: 12)
        
        /// THEN we still get `201499` records returned
        XCTAssertEqual(201499, oldResult.count)
        
        /// AND the old way returns the same records as the new way
        XCTAssertEqual(result.count, oldResult.count)
        
        for i in 0..<10 {
            print(result[i].ToShape().ToTextDebug(words: words))
        }
    }

    
    func testBottomLeftRectangle() throws {
        
        // GIVEN we use the winning words from 8612
        let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]
      
        
        /// AND we have calculated all lengths
        let lengths = WordCalculator.lengths(words: words)
        
        /// AND we have calculated the `LetterIndexModel`
        let index = LetterIndexModel(words: words)
        
        /// WHEN we calculate `Rectangle`s using the `index`
        let result = RectangleCalculatorV2.BottomLeftRectangle(interlockWidth: 2, interlockHeight: 3, letterIndex: index, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /// THEN we get `186873` records returned
        XCTAssertEqual(186873, result.count)
        
        /// WHEN we calculate `Rectangle` without using index
        let oldResult = RectangleCalculatorV1.BottomLeftRectangle(interlockWidth: 2, interlockHeight: 3, words: words, lengths: lengths, scoreMin: 0, widthMax:   17, heightMax: 12)
        
        /// THEN we still get `186873` records returned
        XCTAssertEqual(186873, oldResult.count)
        
        /// AND the old way returns the same records as the new way
        XCTAssertEqual(result.count, oldResult.count)
        
//        for i in 0..<10 {
//            print(result[i].ToShape().ToTextDebug(words: words))
//        }
//        for i in 0..<10 {
//            print(oldResult[i].ToShape().ToTextDebug(words: words))
//        }
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
            let otherResult = RectangleCalculatorV1.Rectangle(interlockWidth: 2, interlockHeight: 3, words: words, lengths: lengths, scoreMin: 0, widthMax:   17, heightMax: 12)
            
            /// THEN we get 201,499 records returned
            XCTAssertEqual(201_499, otherResult.count)
            
            /// AND it takes about `28.6` seconds to complete
        }
    }
    
    
    
    
    
    func compareShapes(oldResults: [RectangleModel], newResults: [RectangleModel], words: [String]) {
        
        var oldShapes:[String] = []
        for oldResult in oldResults {
            let oldShape = oldResult.ToShape()
            if oldShape.width < oldShape.height {
                let text = oldShape.FlipToTextDebug(words: words)
                oldShapes.append(text)
            } else {
                let text = oldShape.ToTextDebug(words: words)
                oldShapes.append(text)
            }
        }
        
        var newShapes:[String] = []
        for newResult in newResults {
            let newShape = newResult.ToShape()
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
