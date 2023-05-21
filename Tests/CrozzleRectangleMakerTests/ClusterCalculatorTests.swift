//
//  ClusterCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 21/5/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class ClusterCalculatorTests: XCTestCase {

   

    func testC2x2_LR_UD() throws {
        let result = ClusterCalculator.C2x2_LR_UD(start: words, end: reversedWords, len: lengths, wordCount: wordCount, scoreMin: scoreMin, widthMax: widthMax+2, heightMax: heightMax+2)
        
        XCTAssertEqual(256, result.count)
    }

    func testC2x2_RL_DU() throws {
        let result = ClusterCalculator.C2x2_RL_DU(start: words, end: reversedWords, len: lengths, wordCount: wordCount, scoreMin: scoreMin, widthMax: widthMax+2, heightMax: heightMax+2)
        
        XCTAssertEqual(446, result.count)
    }
    
    func testC2x2_RL_UD() throws {
        let result = ClusterCalculator.C2x2_RL_UD(start: words, end: reversedWords, len: lengths, wordCount: wordCount, scoreMin: scoreMin, widthMax: widthMax+2, heightMax: heightMax+2)
        
        XCTAssertEqual(97, result.count)
    }
    
    func testC2x3_LRL_DU() throws {
        let result = ClusterCalculator.C2x3_LRL_DU(start: words, end: reversedWords, len: lengths, wordCount: wordCount, scoreMin: scoreMin, widthMax: widthMax+2, heightMax: heightMax+2)
        
        XCTAssertEqual(64, result.count)
        for item in result {
            
            print(item.ToText(words:words))
            let a = item.toPlacements()
        }
    }
    
    func testC2x3_LRL_UD() throws {
        let result = ClusterCalculator.C2x3_LRL_UD(start: words, end: reversedWords, len: lengths, wordCount: wordCount, scoreMin: scoreMin, widthMax: widthMax+2, heightMax: heightMax+2)
        
        XCTAssertEqual(152, result.count)
    }
    
    func testC2x3_RLR_DU() throws {
        let result = ClusterCalculator.C2x3_RLR_DU(start: words, end: reversedWords, len: lengths, wordCount: wordCount, scoreMin: scoreMin, widthMax: widthMax+2, heightMax: heightMax+2)
        
        XCTAssertEqual(56, result.count)
    }
    
    func testC2x3_RLR_UD() throws {
        let result = ClusterCalculator.C2x3_RLR_UD(start: words, end: reversedWords, len: lengths, wordCount: wordCount, scoreMin: scoreMin, widthMax: widthMax+2, heightMax: heightMax+2)
        
        XCTAssertEqual(20, result.count)
    }
    
    
    func testC2x4_LRLR_DU() throws {
        let result = ClusterCalculator.C2x4_LRLR_DU(start: words, end: reversedWords, len: lengths, wordCount: wordCount, scoreMin: scoreMin, widthMax: widthMax+2, heightMax: heightMax+2)
        
        XCTAssertEqual(19, result.count)
    }
    
    func testC2x4_LRLR_UD() throws {
        let result = ClusterCalculator.C2x4_LRLR_UD(start: words, end: reversedWords, len: lengths, wordCount: wordCount, scoreMin: scoreMin, widthMax: widthMax+2, heightMax: heightMax+2)
        
        XCTAssertEqual(6, result.count)
    }
    
    func testC2x4_RLRL_DU() throws {
        let result = ClusterCalculator.C2x4_RLRL_DU(start: words, end: reversedWords, len: lengths, wordCount: wordCount, scoreMin: scoreMin, widthMax: widthMax+2, heightMax: heightMax+2)
        
        XCTAssertEqual(18, result.count)
    }
    
    func testC2x4_RLRL_UD() throws {
        let result = ClusterCalculator.C2x4_RLRL_UD(start: words, end: reversedWords, len: lengths, wordCount: wordCount, scoreMin: scoreMin, widthMax: widthMax+2, heightMax: heightMax+2)
        
        XCTAssertEqual(0, result.count)
    }
    
    
    func testC2x5_LRLRL_DU() throws {
        let result = ClusterCalculator.C2x5_LRLRL_DU(start: words, end: reversedWords, len: lengths, wordCount: wordCount, scoreMin: scoreMin, widthMax: widthMax+2, heightMax: heightMax+2)
        
        XCTAssertEqual(0, result.count)
    }
    func testC2x5_LRLRL_UD() throws {
        let result = ClusterCalculator.C2x5_LRLRL_UD(start: words, end: reversedWords, len: lengths, wordCount: wordCount, scoreMin: scoreMin, widthMax: widthMax+2, heightMax: heightMax+2)
        
        XCTAssertEqual(0, result.count)
    }
    func testC2x5_RLRLR_DU() throws {
        let result = ClusterCalculator.C2x5_RLRLR_DU(start: words, end: reversedWords, len: lengths, wordCount: wordCount, scoreMin: scoreMin, widthMax: widthMax+2, heightMax: heightMax+2)
        
        XCTAssertEqual(0, result.count)
    }
    func testC2x5_RLRLR_UD() throws {
        let result = ClusterCalculator.C2x5_RLRLR_UD(start: words, end: reversedWords, len: lengths, wordCount: wordCount, scoreMin: scoreMin, widthMax: widthMax+2, heightMax: heightMax+2)
        
        XCTAssertEqual(6, result.count)
        for item in result {
            print(item.ToText(words:words))
        }
    }
    
    
    
    func testC2x6_LRLRLR_DU() throws {
        let result = ClusterCalculator.C2x6_LRLRLR_DU(start: words, end: reversedWords, len: lengths, wordCount: wordCount, scoreMin: scoreMin, widthMax: widthMax+2, heightMax: heightMax+2)
        
        XCTAssertEqual(0, result.count)
    }
    func testC2x6_LRLRLR_UD() throws {
        let result = ClusterCalculator.C2x6_LRLRLR_UD(start: words, end: reversedWords, len: lengths, wordCount: wordCount, scoreMin: scoreMin, widthMax: widthMax+2, heightMax: heightMax+2)
        
        XCTAssertEqual(0, result.count)
    }
    func testC2x6_RLRLRL_DU() throws {
        let result = ClusterCalculator.C2x6_RLRLRL_DU(start: words, end: reversedWords, len: lengths, wordCount: wordCount, scoreMin: scoreMin, widthMax: widthMax+2, heightMax: heightMax+2)
        
        XCTAssertEqual(0, result.count)
    }
    func testC2x6_RLRLRL_UD() throws {
        let result = ClusterCalculator.C2x6_RLRLRL_UD(start: words, end: reversedWords, len: lengths, wordCount: wordCount, scoreMin: scoreMin, widthMax: widthMax+2, heightMax: heightMax+2)
        
        XCTAssertEqual(0, result.count)
    }
    
    
    func getWords_8612() -> [String] {
        let wordList = [
            "ZION", "AZURE", "TOYS", "JOY", "HAZELNUT", "NUTS", "NAZARETH", "HYMN", "TURKEY", "SNOW", "MERRY", "TOAST", "STAR", "HOLLY", "JELLY", "FAMILY", "WHITE", "SING", "SAUCE", "PORK", "TREE", "EVE", "INN", "BELLS", "CAKE",
            
            "GLAZE", "PARTYHATS", "TWENTYFIFTH", "WALNUT", "PEANUTS", "PRESENTS", "FRUIT", "NUTMEG", "CUSTARD", "CHRISTMAS", "MISTLETOE", "GIFTS", "SANTACLAUS", "FESTIVE", "RAISINS", "LIGHTS", "WREATH", "HOLIDAY", "WISEMEN", "CRANBERRY", "OPENHOUSE", "SILENTNIGHT", "STOCKING", "PUNCH", "WINE", "SHOPPING", "PLUMPUDDING", "WRAPPING", "NEIGHBOURS", "GREETINGS", "DECORATIONS", "ALMONDS", "LANTERN", "KRISSKRINGLE", "SPICE", "GOODWILL", "BONBON", "CHURCH", "FRIENDS", "PARCELS", "CINNAMON", "NICHOLAS", "MINCEPIES", "CHERRIES", "SLEIGH", "ALMOND", "MANGER", "RIBBON", "CHOCOLATE", "MIXEDPEEL", "DRINK", "CANDLES", "FOOD", "GINGER", "BETHLEHEM", "CAROL", "REINDEER", "GOODCHEER", "CREAM", "CORDIAL", "CHILDREN", "ICECREAM", "CHICKEN", "CARD", "DECEMBER", "PEACE"]
        return wordList
    }
    
    func getLengths() -> [Int] {
        let words = getWords_8612()
        let lengths = RectangleCalculator.WordListToLengths(words: words)
        return lengths
    }
    let widthMax = 15
    let heightMax = 10
    let scoreMin = 0
    var words:[String] = []
    var reversedWords:[String] = []
    var lengths: [Int] = []
    var wordCount: Int = 0
    override func setUpWithError() throws {
        words = getWords_8612()
        lengths = RectangleCalculator.WordListToLengths(words: words)
        wordCount = words.count
        
        reversedWords = []
        for word in words {
            let reversed = String(word.reversed())
            reversedWords.append(reversed)
        }
    }
}
