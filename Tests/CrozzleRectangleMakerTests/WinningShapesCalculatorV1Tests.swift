//
//  WinningShapesCalculatorV1Tests.swift
//  
//
//  Created by Michael Geurtjens on 22/9/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class WinningShapesCalculatorV1Tests: XCTestCase {

    
    func test_shapesToTextSwift() {
        let gameList = GameList()
        for game in gameList.games {
            let (shapes, words, _, _) = WinningShapesCalculatorV1.getShapesWinningWords(gameId: game.gameId)
            var result = ""
            for shape in shapes {
                let text = shape.ToTextBlock(words: words, spaces: 4)
                
                if result != "" {
                    result += ","
                }
                result += "[\n" + text + "\n]"
                
                
            }
            print("case \(game.gameId):\n")
            print("    return [\n\(result)\n]\n")
            
        }
    }
    
    func test_shapesToText_CSharp() {
        
        print("using System;")
        print("namespace ShapeMakerCSharp.Calculators")
        print("{")
        print("    public class WinningGameCalculator")
        print("    {")
        print("        public static List<List<string>> findWinningGame(int gameId)")
        print("        {")
        print("            switch (gameId) {")
         
        let gameList = GameList()
        for game in gameList.games {
            let (shapes, words, _, _) = WinningShapesCalculatorV1.getShapesWinningWords(gameId: game.gameId)
            var result = ""
            for shape in shapes {
                let text = shape.ToTextBlock(words: words, spaces: 24)
                
                if result != "" {
                    result += ","
                }
                result += "new List<string> {\n" + text + "\n                    }"
                
                
            }
            print("                case \(game.gameId):\n")
            print("                    return new List<List<string>> {\n")
            print("                    \(result)\n                };\n")
            
        }
        print("            default:")
        print("                return new List<List<string>>();")
        print("            }")
        print("        }")
        print("    }")
        print("}")
    }
    
    
    
    
    func test_testAllShapes() async throws {
        let gameList = GameList()
        for game in gameList.games {
            let shapes = WinningShapesAllCalculatorV3.execute(gameId:game.gameId, words: game.winningWords)
            let shapesAsync = await WinningShapesAllCalculatorV3Async.execute(gameId:game.gameId, words: game.winningWords)
            XCTAssertEqual(shapes.count, shapesAsync.count)
        }
        
    }
    
    

    func test_measureSync() throws {
        measure {
            let gameList = GameList()
            for game in gameList.games {
                let _ = WinningShapesAllCalculatorV3.execute(gameId:game.gameId, words: game.words)
            }
        }
    }

    func test_measure_Serial() throws {
        var result = 0
        
        let start = DateTimeCalculator.now()
        
        let gameList = GameList()
        for game in gameList.games {
            let r = WinningShapesAllCalculatorV3.execute(gameId:game.gameId, words: game.words)
            result += r.count
            print("\(game.gameId) produced \(r.count)")
        }
        print("Serial Time: \(DateTimeCalculator.duration(start: start)) produced \(result) shapes")
    }
    
    func test_measure_Parallel() async throws {
        var result = 0
        
        let start = DateTimeCalculator.now()
        
        let gameList = GameList()
        for game in gameList.games {
            let r = await WinningShapesAllCalculatorV3Async.execute(gameId:game.gameId, words: game.words)
            result += r.count
            print("\(game.gameId) produced \(r.count)")
        }
        print("Parallel Time: \(DateTimeCalculator.duration(start: start)) produced \(result) shapes")
    }
    
    func test_getShapes_8803() throws {
        let (shapes, words, _, _) = WinningShapesCalculatorV1.getShapesWinningWords(gameId: 8803)
        for shape in shapes {
            print(shape.ToText(words: words))
        }
    }

    
}
