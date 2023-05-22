//
//  OtherTests.swift
//  
//
//  Created by Michael Geurtjens on 22/5/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class OtherTests: XCTestCase {

  
    
    func test_Execute() async throws {
        
        let result = try await RectangleCalculator.Execute(
            words: words,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(4530742, result.count)
        // 463 MB and 57 seconds
        // 160 MB and 55.9 seconds if we make the size smaller
    }
    
    func test_ExecuteSortByScoreAndArea() async throws {
        
        let result = try await RectangleCalculator.ExecuteAndSortByScoreAndArea(
            words: words,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(4530742, result.count)
        //4314774
        //4790949
        let item = result[0]
        XCTAssertEqual(176, item.score)
        // 463 MB and 57 seconds
        // 160 MB and 55.9 seconds if we make the size smaller
    }
    
    
    func test_ExecuteSortByScoreAndAreaAndSaveToCSV() async throws {
        
        let result = try await RectangleCalculator.ExecuteAndSortByScoreAndArea(
            words: words,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        let filename = "8612_Rectangles.csv"
        
        ToCsv.Save(filename: filename, rectangles: result)
    }
    
    
    // Checks if there are any duplicates by rendering the text and also flipped text sorting and seeing if the one before is same as the current one and guess what.  No duplicates at all.  Goes up to 2.2 GB just for the text to render the shapes.
    func test_ExecuteCheckForDuplicates() async throws {
        
        let result = try await RectangleCalculator.ExecuteCheckForDuplicates(
            words: words,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        // 520414 duplicates detected
        XCTAssertEqual(0,result)
    }
    
    func test_BottomRight3x5() throws {
        
        let o4x6_BottomLeft = RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        let o4x6_BottomRight = RectangleCalculator.BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        let o4x6_TopLeft = RectangleCalculator.TopLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        let o4x6_TopRight = RectangleCalculator.TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        
        
        
        var result: [(TopLeftBottomRightModel, String)] = []
        for item in o4x6_BottomLeft {
            let text = item.ToText(words:words)
            result.append((item,text))
        }
        
        for item in o4x6_BottomRight {
            let text = item.ToText(words:words)
            result.append((item,text))
        }
        
        for item in o4x6_TopLeft {
            let text = item.ToText(words:words)
            result.append((item,text))
        }
        
        for item in o4x6_TopRight {
            let text = item.ToText(words:words)
            result.append((item,text))
        }
        
        
        result.sort {$0.1 > $1.1}
        for i in 1..<result.count {
            if result[i].1 == result[i - 1].1 {
                print(result[i])
            }
        }
        print(result.count)
    }
    
    func test_ExecuteCheckForDuplicates2() async throws {
        
        let result = try await RectangleCalculator.ExecuteCheckForDuplicates2(
            words: words,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(0,result.count)
        
        for i in result {
            print("\(i.0.type)\(i.0.interlockWidth)x\(i.0.interlockHeight):\(i.1.type)\(i.1.interlockWidth)x\(i.1.interlockHeight)")
        }
        print(result.count)
    }
    
    
    func test_ToTextFlipped() throws {
        let result = RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        let first = result[0]
        
        let text = first.ToText(words: words)
        let flipped = first.ToTextFlipped(words: words)
        
        let expectedText = "   .    \n   A .  \n  .ZION.\n   U P  \n.TURKEY.\n   E N  \n   . H  \n     O  \n     U  \n     S  \n     E  \n     .  "
        let expectedFlipped = "    .       \n    T       \n  . U       \n.AZURE.     \n  I K       \n .OPENHOUSE.\n  N Y       \n  . .       "
        
        XCTAssertEqual(expectedText, text)
        XCTAssertEqual(expectedFlipped, flipped)
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
    
    var words:[String] = []
    var lengths: [Int] = []
    override func setUpWithError() throws {
        words = getWords_8612()
        lengths = RectangleCalculator.WordListToLengths(words: words)
    }
    
    let widthMax = 15
    let heightMax = 10
    let scoreMin = 0
}
