//
//  RectangleCalculatorPerformanceTests.swift
//  
//
//  Created by Michael Geurtjens on 16/8/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class RectangleCalculatorPerformanceTests: XCTestCase {

    
    // By default, it returns [XCTClockMetric()]
    // XCTClockMetric() is to measure the number of seconds the block of code takes to execute.
    override class var defaultMetrics: [XCTMetric] {
        return [
            XCTClockMetric()
            ,XCTCPUMetric()
            ,XCTMemoryMetric()
            //,XCTStorageMetric()
        ]
    }
    
    
    func test_Performance_Serial_New()  {
        let options = XCTMeasureOptions()
        options.iterationCount = 2 /* Tweak this value on a test-by-test basis */
        //measure(metrics: [XCTCPUMetric(), XCTMemoryMetric()]) {
        measure(metrics: [XCTMemoryMetric(),XCTClockMetric()], options: options) {
            let result = Rectangle2Calculator.ExecuteSerial(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(4_457_026, result.count)
            
            /// It takes approximately `14.772 seconds`,  `Memory Physical` of `1,780 kb`, `Memory Peak Physical` of `650,000 kb`
        }
    }
    
    func test_Performance_Serial_Old()  {
        let options = XCTMeasureOptions()
        options.iterationCount = 2 /* Tweak this value on a test-by-test basis */
        
        measure(metrics: [XCTMemoryMetric(),XCTClockMetric()]) {
                        
            let result = RectangleCalculator.ExecuteSerial(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            XCTAssertEqual(4_457_026, result.count)
            
            /// It takes approximately `151.881` seconds running in serial
        }
    }

    func test_Performance_BottomRightRectangle_OLD() {
        measure {
              
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

    func test_Performance_TopRightRectangle_Old() throws {
        measure {
                        
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
    
    
    // GIVEN we use the words from 8612
    let words = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE","GLAZE","PARTYHATS","TWENTYFIFTH","WALNUT","PEANUTS","PRESENTS","FRUIT","NUTMEG","CUSTARD","CHRISTMAS","MISTLETOE","GIFTS","SANTACLAUS","FESTIVE","RAISINS","LIGHTS","WREATH","HOLIDAY","WISEMEN","CRANBERRY","OPENHOUSE","SILENTNIGHT","STOCKING","PUNCH","WINE","SHOPPING","PLUMPUDDING","WRAPPING","NEIGHBOURS","GREETINGS","DECORATIONS","ALMONDS","LANTERN","KRISSKRINGLE","SPICE","GOODWILL","BONBON","CHURCH","FRIENDS","PARCELS","CINNAMON","NICHOLAS","MINCEPIES","CHERRIES","SLEIGH","ALMOND","MANGER","RIBBON","CHOCOLATE","MIXEDPEEL","DRINK","CANDLES","FOOD","GINGER","BETHLEHEM","CAROL","REINDEER","GOODCHEER","CREAM","CORDIAL","CHILDREN","ICECREAM","CHICKEN","CARD","DECEMBER","PEACE"]

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
    
    let scoreMin = 0
    let widthMax = 17
    let heightMax = 12
}
