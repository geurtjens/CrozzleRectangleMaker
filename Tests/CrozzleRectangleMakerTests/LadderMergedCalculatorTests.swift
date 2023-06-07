//
//  LadderMergedCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 8/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class LadderMergedCalculatorTests: XCTestCase {

    func test_Ladder_hAzElNUT_mErRy() throws {
        
        let gameList = GameList()
        if let game = gameList.getGame(gameId: 8612) {
            
            let words = game.words
            
            let result = LadderMergedCalculator.ExecuteLadder(words: words, scoreMin: 104, widthMax: 17, heightMax: 12)
            
            XCTAssertEqual(284, result.count)
            
            print("D3x3 = \(result.count)")
            
            for item in result {
                print(item.ToString(words: words))
            }
            //print(result[0].ToText(words:words))
        }
        
        
    }
    
    func test_Ladder_nAzAReTh_sInG_beLls() throws {
        
        let gameList = GameList()
        if let game = gameList.getGame(gameId: 8612) {
            
            // I would like to give winning words only
            let words = WordCalculator.removeLastWords(words: game.words, countMax: game.winningWordCount)
            
            let result = LadderMergedCalculator.Execute2x3And2x2(words: words, scoreMin: 52, widthMax: 17, heightMax: 12)
            
            XCTAssertEqual(69, result.count)
            
            print("D3x3 = \(result.count)")
            
            for item in result {
                print(item.ToString(words: words))
            }
            
            
            /*
             score:178, width:7, height:11, words:7, area:45, density:3.9555554

              .  .
             .NUTS.
              A  I
             .ZION.
              A .G
              R B.
             .EVE.
              T L
             .HOLLY.
              . S
                .
             
             */
            
            //print(result[0].ToText(words:words))
        }
        
        
    }

}
