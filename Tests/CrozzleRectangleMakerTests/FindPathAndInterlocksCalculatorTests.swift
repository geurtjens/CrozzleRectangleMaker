//
//  MutationCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 24/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class FindPathAndInterlocksCalculatorTests: XCTestCase {

    func test_WinningGameScoresAreCorrect() {
        let gameList = GameList()
        
        for game in gameList.games {
            
            let winningWords = game.winningWords
            
            let (placements, _) = PlacementCalculator.fromTextToPlacements(grid: game.winningGame, words: game.winningWords)
            
            let shape = placements.toShape(score: 800)
            
            let (_, score) = ShapeCalculator.ToText(shape: shape, words: game.winningWords)
            
            if score != game.winningScore {
                print("game \(game.gameId) winning score of \(game.winningScore) should be \(score)")
            }
            
            
            let (words, _) = FindPathAndInterlocksCalculator.execute(grid: game.winningGame)
            
            for word in words {
                if winningWords.contains(word) == false {
                    print("Doesnt Work")
                }
            }
            
        }
    }
    
    
    
    
    func test_findPath() {
        let grid = [
        " . . . . .  . .  ",
        " S F C.NAZARETH. ",
        " N A A U I  V O  ",
        " O M K T O.BELLS.",
        ".WHITE.SING.. L  ",
        " . L..P. ...JOY. ",
        ".TOYS.O . A E .S ",
        " O .A R.HAZELNUT.",
        " A.TURKEY.U L  A ",
        " S  C ..MERRY. R ",
        ".TREE.INN.E .  . ",
        " .  .   . .      "]
        
       
        let (words, interlocks) = FindPathAndInterlocksCalculator.execute(grid: grid)
        XCTAssertEqual(25, words.count)
        XCTAssertEqual(25, interlocks.count)
        
        //print(words)
        //print(interlocks)
//        var textStuff = ""
//        for item in result {
//            if textStuff != "" {
//                textStuff += ",\n"
//            }
//            var text = ""
//
//            for interlock in item.1 {
//                if text != "" {
//                    text += ","
//                }
//                text += interlock.toString()
//            }
//            textStuff += "(\(item.0),[\(text)])"
//        }
//        textStuff = "[\(textStuff)]"
//        print(textStuff)
    }

}
