//
//  LadderMergedCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 8/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class ShapesFromMergesCalculatorTests: XCTestCase {

    func test_Glasses() throws {
        
        let gameList = GameList()
        if let game = gameList.getGame(gameId: 9011) {
            
            let words = game.words
            
            let result = ShapesFromMergesCalculator.Glasses(words: words, scoreMin: 104, widthMax: 17, heightMax: 12)
            
            XCTAssertEqual(50, result.count)
            
            for item in result {
                print(item.ToString(words: words))
            }
        }
    }
    
    func test_Glasses2() throws {
        
        /*
         score:106, width:12, height:9, words:6, area:70, density:1.5142857

                  .
              .   V
         .NARITA.FIN.
              I W E
           .ZIMBABWE.
              E L .
              . E
                S
                .
         */
        
        let gameList = GameList()
        if let game = gameList.getGame(gameId: 9011) {
            
            let words = WordCalculator.removeLastWords(words: game.words, countMax: game.winningWordCount)
            
            let result = ShapesFromMergesCalculator.Glasses2(words: words, scoreMin: 42, widthMax: 17, heightMax: 12)
            
            
            
            XCTAssertEqual(2070, result.count)
            
            let expectedWords = ["ZIMBABWE", "NARITA", "FIN", "WALES", "TIME", "VIEW"]
            let filtered = ShapeCalculator.filterInclude(shapes: result, containing: expectedWords, from: words)
            XCTAssertEqual(1, filtered.count)
            for item in filtered {
                print(item.ToString(words: words))
            }
        }
    }
    
    func test_Ladder_hAzElNUT_mErRy() throws {
        
        let gameList = GameList()
        if let game = gameList.getGame(gameId: 8612) {
            
            let words = game.words
            
            let result = ShapesFromMergesCalculator.Ladder2x2x2(words: words, scoreMin: 104, widthMax: 17, heightMax: 12)
            
            XCTAssertEqual(284, result.count)
            
            let searchFor = ["HAZELNUT", "MERRY", "HYMN", "NAZARETH", "JELLY"]
            let filtered = ShapeCalculator.filterInclude(shapes: result, containing: searchFor, from: words)
            
            for item in filtered {
                print(item.ToString(words: words))
            }
        }
    }
    
    func test_LadderPacman() throws {
        
        let gameList = GameList()
        if let game = gameList.getGame(gameId: 8612) {
            
            let words = WordCalculator.removeLastWords(words: game.words, countMax: game.winningWordCount)
            
            let result = ShapesFromMergesCalculator.LadderPacman(words: words, scoreMin: 104, widthMax: 17, heightMax: 12)
            
            XCTAssertEqual(11, result.count)
            
            print("LadderPacman = \(result.count)")
            
            for item in result {
                print(item.ToString(words: words))
            }
        }
    }
    
    func test_LadderLadderPacman() throws {
        
        let gameList = GameList()
        if let game = gameList.getGame(gameId: 8703) {
            
            let words = WordCalculator.removeLastWords(words: game.words, countMax: game.winningWordCount)
            
            let result = ShapesFromMergesCalculator.LadderLadderPacman(words: words, scoreMin: 0, widthMax: 17, heightMax: 12)
            
            XCTAssertEqual(4, result.count)
            
            print("LadderPacman = \(result.count)")
            
            for item in result {
                print(item.ToString(words: words))
            }
        }
    }
    
    
    func test_Ladder_nAzAReTh_sInG_beLls() throws {
        
        let gameList = GameList()
        if let game = gameList.getGame(gameId: 8612) {
            
            let words = game.winningWords
            
            let result = ShapesFromMergesCalculator.Execute2x3And2x2(words: words, scoreMin: 52, widthMax: 17, heightMax: 12)
            
            XCTAssertEqual(66, result.count)
            
            let searchFor = ["NUTS","ZION","EVE","NAZARETH","SING","BELLS"]
            let filtered = ShapeCalculator.filterInclude(shapes: result, containing: searchFor, from: words)
            
            XCTAssertEqual(1, filtered.count)
            
            let shape = filtered[0]
            let flipped = ShapeCalculator.Flip(shape: shape)
            
            print(flipped.ToString(words: words))

            /*
             score:178, width:11, height:7, words:7, area:45, density:3.9555554
             
             . .  . .
            .NAZARETH.
             U I  V O
             T O.BELLS.
            .SING.. L
             . .    Y
                    .
             */
        }
    }
}
