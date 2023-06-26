//
//  MutationCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 24/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class WordSwapMutationCalculatorTests: XCTestCase {

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
        
        let words = [ "ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW",
                      "MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK",
                      "TREE","EVE","INN","BELLS","CAKE"]
        let result = WordSwapMutationCalculator.FindPathAndInterlocks(grid: grid)
        XCTAssertEqual(25, result.count)
        
        var textStuff = ""
        for item in result {
            if textStuff != "" {
                textStuff += ",\n"
            }
            var text = ""
           
            for interlock in item.1 {
                if text != "" {
                    text += ","
                }
                text += interlock.toString()
            }
            textStuff += "(\(item.0),[\(text)])"
        }
        textStuff = "[\(textStuff)]"
        print(textStuff)
    }
    
    
    func setWordsToPosition(words: [String], wordOrder: [UInt8]) -> [String] {
        var result: [String] = []
        
        for _ in 0..<words.count {
            result.append("")
        }
        
        for i in 0..<words.count {
            let position = wordOrder[i]
            
            let word = words[i]
            
            result[Int(position)] = word
        }
        return result
    }
    
    
    func test_mutation8612() {
        let gameList = GameList()
        
        
        
        if let sourceGame = gameList.getGame(gameId: 8612) {
            
            let wordOrder = WordSwapMutationCalculator.wordOrder8612()
            let positions = WordCalculator.extractPositions(ofWords: wordOrder, from: sourceGame.words)
            
            let (placements, _) = PlacementCalculator.fromTextToPlacements(grid: sourceGame.winningGame, words: sourceGame.winningWords)
            
            
            
            let shape = placements.toShape(score: 0)
            
            for game in gameList.games {
                
                let result = WordSwapMutationCalculator.mutate8612(words: game.words)
                
                for item in result {
                    print(item)
                }
                
                for wordList in result {
                    
                    let newWordList = setWordsToPosition(words: wordList, wordOrder: positions)
                    
                    let (text, score) = ShapeCalculator.ToText(shape: shape, words: newWordList)
                    print("gameId:\(game.gameId), score:\(score)\n\(text)")
                }
                
                
            }
           
        }
    }

}
