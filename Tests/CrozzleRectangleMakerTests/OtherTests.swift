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
        
        let result = await RectangleCalculator.Execute(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        XCTAssertEqual(4530742, result.count)
        // 463 MB and 57 seconds
        // 160 MB and 55.9 seconds if we make the size smaller
    }
    
    
    func test_ExecuteSortByScoreAndArea() async throws {
        
        let result = await RectangleCalculator.ExecuteAndSortByScoreAndArea(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        XCTAssertEqual(4530742, result.count)
        //4314774
        //4790949
        let item = result[0]
        XCTAssertEqual(176, item.score)
        // 463 MB and 57 seconds
        // 160 MB and 55.9 seconds if we make the size smaller
    }
    
    
    func test_ExecuteSerial() throws {
        
        let result = RectangleCalculator.ExecuteSerial(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        XCTAssertEqual(4530742, result.count)
        // 463 MB and 57 seconds
        // 160 MB and 55.9 seconds if we make the size smaller
    }
    
    
    func test_ExecuteSortByScoreAndAreaAndSaveToCSV() async throws {
        
        let result = await RectangleCalculator.ExecuteAndSortByScoreAndArea(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let filename = "8612_Rectangles.csv"
        
        ToCsv.Save(filename: filename, rectangles: result)
    }
    
    
    func test_BottomRight4x6_Repeats() throws {
        
        let result = RectangleCalculator.BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)

        var text:[String] = []
        for item in result {
            text.append(item.ToText(words: words))
        }
        text.sort()
        
        var repeats = 0
        for i in 1..<text.count {
            if text[i] == text[i-1] {
                repeats += 1
            }
        }
        XCTAssertEqual(0,repeats)
    }

    
    func test_BottomRight3x5() throws {
        
        let o4x6_BottomLeft = RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let o4x6_BottomRight = RectangleCalculator.BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)

        let o4x6_TopLeft = RectangleCalculator.TopLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let o4x6_TopRight = RectangleCalculator.TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        var result: [(RectangleModel, String)] = []
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
    

    func test_ToTextFlipped() throws {
        
        let result = RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let first = result[0]
        
        let text = first.ToText(words: words)
        let flipped = first.ToTextFlipped(words: words)
        
        let expectedText = "   .    \n   A .  \n  .ZION.\n   U P  \n.TURKEY.\n   E N  \n   . H  \n     O  \n     U  \n     S  \n     E  \n     .  "
        let expectedFlipped = "    .       \n    T       \n  . U       \n.AZURE.     \n  I K       \n .OPENHOUSE.\n  N Y       \n  . .       "
        
        XCTAssertEqual(expectedText, text)
        XCTAssertEqual(expectedFlipped, flipped)
    }
    
    
    /// standard values for all tests
    let wordsMax = 0
    let widthMax = 17
    let heightMax = 12
    let scoreMin = 0
    var words:[String] = []
    var lengths: [Int] = []
    override func setUpWithError() throws {
        words = WordData.words_8612()
        lengths = WordCalculator.lengths(words: words)
    }
}
