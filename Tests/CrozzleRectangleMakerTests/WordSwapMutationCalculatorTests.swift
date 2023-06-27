//
//  MutationCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 24/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class WordSwapMutationCalculatorTests: XCTestCase {

    func test_WinningGameScoresAreCorrect() {
        let gameList = GameList()
        
        for game in gameList.games {
            
            let (placements, _) = PlacementCalculator.fromTextToPlacements(grid: game.winningGame, words: game.winningWords)
            
            let shape = placements.toShape(score: 800)
            
            let (_, score) = ShapeCalculator.ToText(shape: shape, words: game.winningWords)
            
            if score != game.winningScore {
                print("game \(game.gameId) winning score of \(game.winningScore) should be \(score)")
            }
        }
    }
    
    func test_mutation() {
        let gameList = GameList()
        
        for sourceGame in gameList.games {
            
            let wordSequence = getWordSequence(gameId: sourceGame.gameId)
            
            let (placements, _) = PlacementCalculator.fromTextToPlacements(grid: sourceGame.winningGame, words: wordSequence)
            
            let shape = placements.toShape(score: 0)
            
            var gameCount = 0
            for game in gameList.games {
                
                let result = getMutation(gameId: sourceGame.gameId, words: game.words)
                
                
                for wordList in result {
                    
                    let (text, score) = ShapeCalculator.ToText(shape: shape, words: wordList)
                    
                    if text != game.winningText() {
                        
                        if score == game.winningScore {
                            
                            gameCount += 1
                            
                            if sourceGame.gameId == game.gameId {
                                print("\(gameCount). gameId:\(game.gameId), score:\(score), humanScore:\(game.winningScore)\n\(text)")
                                
                            }
//                            else {
//                                print("\(gameCount). gameId:\(game.gameId), shapeGameId:\(sourceGame.gameId), score:\(score), humanScore:\(game.winningScore)\n\(text)")
//
//                            }
                            
                            if score > game.winningScore {
                                print("Winning Game")
                            }
//                            if sourceGame.gameId != game.gameId {
//                                print("Different Words for shape")
//                            }
                        }
                    }
                   
                    
                }
            }
            
           
        }
    }
    
    
    func test_code() {
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
        
        let code = WordSwapMutationCodeGenerator.code(grid: grid, gameId: 8612)
        print(code)
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
        
       
        let (words, interlocks) = WordSwapMutationCodeGenerator.FindPathAndInterlocks(grid: grid)
        XCTAssertEqual(25, words.count)
        XCTAssertEqual(25, interlocks.count)
        
        print(words)
        print(interlocks)
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
    
    func test_getWordSequenceSwitch() {
        print( WordSwapMutationCodeGenerator.getWordSequenceSwitch())
    }
    
    func test_getMutationsSwitch() {
        print( WordSwapMutationCodeGenerator.getMutationSwitch())
    }
    
    func test_execute9508() {
        let grid = GameList().getGame(gameId: 9508)!.winningGame
        let code = WordSwapMutationCodeGenerator.code(grid: grid, gameId: 9508 )
        print(code)
    }
    
    func test_execute() {
        let code = WordSwapMutationCodeGenerator.execute()
        print(code)
    }
    
    func getMutation(gameId: Int, words: [String]) -> [[String]] {
        switch gameId {
        case 8612:
            return MutationCalculator.mutation_8612(words: words)
        case 8702:
            return MutationCalculator.mutation_8702(words: words)
        case 8703:
            return MutationCalculator.mutation_8703(words: words)
        case 8704:
            return MutationCalculator.mutation_8704(words: words)
        case 8705:
            return MutationCalculator.mutation_8705(words: words)
        case 8710:
            return MutationCalculator.mutation_8710(words: words)
        case 8711:
            return MutationCalculator.mutation_8711(words: words)
        case 8712:
            return MutationCalculator.mutation_8712(words: words)
        case 8802:
            return MutationCalculator.mutation_8802(words: words)
        case 8803:
            return MutationCalculator.mutation_8803(words: words)
        case 8804:
            return MutationCalculator.mutation_8804(words: words)
        case 8805:
            return MutationCalculator.mutation_8805(words: words)
        case 8806:
            return MutationCalculator.mutation_8806(words: words)
        case 8807:
            return MutationCalculator.mutation_8807(words: words)
        case 8808:
            return MutationCalculator.mutation_8808(words: words)
        case 8809:
            return MutationCalculator.mutation_8809(words: words)
        case 8810:
            return MutationCalculator.mutation_8810(words: words)
        case 8811:
            return MutationCalculator.mutation_8811(words: words)
        case 8812:
            return MutationCalculator.mutation_8812(words: words)
        case 8902:
            return MutationCalculator.mutation_8902(words: words)
        case 8903:
            return MutationCalculator.mutation_8903(words: words)
        case 8904:
            return MutationCalculator.mutation_8904(words: words)
        case 8905:
            return MutationCalculator.mutation_8905(words: words)
        case 8906:
            return MutationCalculator.mutation_8906(words: words)
        case 8907:
            return MutationCalculator.mutation_8907(words: words)
        case 8908:
            return MutationCalculator.mutation_8908(words: words)
        case 8909:
            return MutationCalculator.mutation_8909(words: words)
        case 8910:
            return MutationCalculator.mutation_8910(words: words)
        case 8911:
            return MutationCalculator.mutation_8911(words: words)
        case 8912:
            return MutationCalculator.mutation_8912(words: words)
        case 9001:
            return MutationCalculator.mutation_9001(words: words)
        case 9002:
            return MutationCalculator.mutation_9002(words: words)
        case 9003:
            return MutationCalculator.mutation_9003(words: words)
        case 9004:
            return MutationCalculator.mutation_9004(words: words)
        case 9005:
            return MutationCalculator.mutation_9005(words: words)
        case 9006:
            return MutationCalculator.mutation_9006(words: words)
        case 9007:
            return MutationCalculator.mutation_9007(words: words)
        case 9008:
            return MutationCalculator.mutation_9008(words: words)
        case 9009:
            return MutationCalculator.mutation_9009(words: words)
        case 9010:
            return MutationCalculator.mutation_9010(words: words)
        case 9011:
            return MutationCalculator.mutation_9011(words: words)
        case 9012:
            return MutationCalculator.mutation_9012(words: words)
        case 9101:
            return MutationCalculator.mutation_9101(words: words)
        case 9102:
            return MutationCalculator.mutation_9102(words: words)
        case 9103:
            return MutationCalculator.mutation_9103(words: words)
        case 9104:
            return MutationCalculator.mutation_9104(words: words)
        case 9105:
            return MutationCalculator.mutation_9105(words: words)
        case 9106:
            return MutationCalculator.mutation_9106(words: words)
        case 9107:
            return MutationCalculator.mutation_9107(words: words)
        case 9108:
            return MutationCalculator.mutation_9108(words: words)
        case 9109:
            return MutationCalculator.mutation_9109(words: words)
        case 9110:
            return MutationCalculator.mutation_9110(words: words)
        case 9111:
            return MutationCalculator.mutation_9111(words: words)
        case 9112:
            return MutationCalculator.mutation_9112(words: words)
        case 9201:
            return MutationCalculator.mutation_9201(words: words)
        case 9202:
            return MutationCalculator.mutation_9202(words: words)
        case 9203:
            return MutationCalculator.mutation_9203(words: words)
        case 9204:
            return MutationCalculator.mutation_9204(words: words)
        case 9205:
            return MutationCalculator.mutation_9205(words: words)
        case 9206:
            return MutationCalculator.mutation_9206(words: words)
        case 9207:
            return MutationCalculator.mutation_9207(words: words)
        case 9208:
            return MutationCalculator.mutation_9208(words: words)
        case 9209:
            return MutationCalculator.mutation_9209(words: words)
        case 9210:
            return MutationCalculator.mutation_9210(words: words)
        case 9211:
            return MutationCalculator.mutation_9211(words: words)
        case 9212:
            return MutationCalculator.mutation_9212(words: words)
        case 9301:
            return MutationCalculator.mutation_9301(words: words)
        case 9302:
            return MutationCalculator.mutation_9302(words: words)
        case 9303:
            return MutationCalculator.mutation_9303(words: words)
        case 9304:
            return MutationCalculator.mutation_9304(words: words)
        case 9305:
            return MutationCalculator.mutation_9305(words: words)
        case 9306:
            return MutationCalculator.mutation_9306(words: words)
        case 9307:
            return MutationCalculator.mutation_9307(words: words)
        case 9308:
            return MutationCalculator.mutation_9308(words: words)
        case 9309:
            return MutationCalculator.mutation_9309(words: words)
        case 9310:
            return MutationCalculator.mutation_9310(words: words)
        case 9311:
            return MutationCalculator.mutation_9311(words: words)
        case 9312:
            return MutationCalculator.mutation_9312(words: words)
        case 9401:
            return MutationCalculator.mutation_9401(words: words)
        case 9402:
            return MutationCalculator.mutation_9402(words: words)
        case 9403:
            return MutationCalculator.mutation_9403(words: words)
        case 9404:
            return MutationCalculator.mutation_9404(words: words)
        case 9406:
            return MutationCalculator.mutation_9406(words: words)
        case 9407:
            return MutationCalculator.mutation_9407(words: words)
        case 9408:
            return MutationCalculator.mutation_9408(words: words)
        case 9409:
            return MutationCalculator.mutation_9409(words: words)
        case 9410:
            return MutationCalculator.mutation_9410(words: words)
        case 9411:
            return MutationCalculator.mutation_9411(words: words)
        case 9412:
            return MutationCalculator.mutation_9412(words: words)
        case 9501:
            return MutationCalculator.mutation_9501(words: words)
        case 9502:
            return MutationCalculator.mutation_9502(words: words)
        case 9503:
            return MutationCalculator.mutation_9503(words: words)
        case 9504:
            return MutationCalculator.mutation_9504(words: words)
        case 9505:
            return MutationCalculator.mutation_9505(words: words)
        case 9506:
            return MutationCalculator.mutation_9506(words: words)
        case 9507:
            return MutationCalculator.mutation_9507(words: words)
        case 9508:
            return MutationCalculator.mutation_9508(words: words)
        case 9509:
            return MutationCalculator.mutation_9509(words: words)
        case 9510:
            return MutationCalculator.mutation_9510(words: words)
        case 9511:
            return MutationCalculator.mutation_9511(words: words)
        case 9512:
            return MutationCalculator.mutation_9512(words: words)
        case 9601:
            return MutationCalculator.mutation_9601(words: words)
        case 9602:
            return MutationCalculator.mutation_9602(words: words)
        case 9603:
            return MutationCalculator.mutation_9603(words: words)
        case 9604:
            return MutationCalculator.mutation_9604(words: words)
        case 9605:
            return MutationCalculator.mutation_9605(words: words)
        default:
            return []
        }
    }
    
    func getWordSequence(gameId: Int) -> [String] {
        switch gameId {
        case 8612:
            return MutationCalculator.wordSequence_8612()
        case 8702:
            return MutationCalculator.wordSequence_8702()
        case 8703:
            return MutationCalculator.wordSequence_8703()
        case 8704:
            return MutationCalculator.wordSequence_8704()
        case 8705:
            return MutationCalculator.wordSequence_8705()
        case 8710:
            return MutationCalculator.wordSequence_8710()
        case 8711:
            return MutationCalculator.wordSequence_8711()
        case 8712:
            return MutationCalculator.wordSequence_8712()
        case 8802:
            return MutationCalculator.wordSequence_8802()
        case 8803:
            return MutationCalculator.wordSequence_8803()
        case 8804:
            return MutationCalculator.wordSequence_8804()
        case 8805:
            return MutationCalculator.wordSequence_8805()
        case 8806:
            return MutationCalculator.wordSequence_8806()
        case 8807:
            return MutationCalculator.wordSequence_8807()
        case 8808:
            return MutationCalculator.wordSequence_8808()
        case 8809:
            return MutationCalculator.wordSequence_8809()
        case 8810:
            return MutationCalculator.wordSequence_8810()
        case 8811:
            return MutationCalculator.wordSequence_8811()
        case 8812:
            return MutationCalculator.wordSequence_8812()
        case 8902:
            return MutationCalculator.wordSequence_8902()
        case 8903:
            return MutationCalculator.wordSequence_8903()
        case 8904:
            return MutationCalculator.wordSequence_8904()
        case 8905:
            return MutationCalculator.wordSequence_8905()
        case 8906:
            return MutationCalculator.wordSequence_8906()
        case 8907:
            return MutationCalculator.wordSequence_8907()
        case 8908:
            return MutationCalculator.wordSequence_8908()
        case 8909:
            return MutationCalculator.wordSequence_8909()
        case 8910:
            return MutationCalculator.wordSequence_8910()
        case 8911:
            return MutationCalculator.wordSequence_8911()
        case 8912:
            return MutationCalculator.wordSequence_8912()
        case 9001:
            return MutationCalculator.wordSequence_9001()
        case 9002:
            return MutationCalculator.wordSequence_9002()
        case 9003:
            return MutationCalculator.wordSequence_9003()
        case 9004:
            return MutationCalculator.wordSequence_9004()
        case 9005:
            return MutationCalculator.wordSequence_9005()
        case 9006:
            return MutationCalculator.wordSequence_9006()
        case 9007:
            return MutationCalculator.wordSequence_9007()
        case 9008:
            return MutationCalculator.wordSequence_9008()
        case 9009:
            return MutationCalculator.wordSequence_9009()
        case 9010:
            return MutationCalculator.wordSequence_9010()
        case 9011:
            return MutationCalculator.wordSequence_9011()
        case 9012:
            return MutationCalculator.wordSequence_9012()
        case 9101:
            return MutationCalculator.wordSequence_9101()
        case 9102:
            return MutationCalculator.wordSequence_9102()
        case 9103:
            return MutationCalculator.wordSequence_9103()
        case 9104:
            return MutationCalculator.wordSequence_9104()
        case 9105:
            return MutationCalculator.wordSequence_9105()
        case 9106:
            return MutationCalculator.wordSequence_9106()
        case 9107:
            return MutationCalculator.wordSequence_9107()
        case 9108:
            return MutationCalculator.wordSequence_9108()
        case 9109:
            return MutationCalculator.wordSequence_9109()
        case 9110:
            return MutationCalculator.wordSequence_9110()
        case 9111:
            return MutationCalculator.wordSequence_9111()
        case 9112:
            return MutationCalculator.wordSequence_9112()
        case 9201:
            return MutationCalculator.wordSequence_9201()
        case 9202:
            return MutationCalculator.wordSequence_9202()
        case 9203:
            return MutationCalculator.wordSequence_9203()
        case 9204:
            return MutationCalculator.wordSequence_9204()
        case 9205:
            return MutationCalculator.wordSequence_9205()
        case 9206:
            return MutationCalculator.wordSequence_9206()
        case 9207:
            return MutationCalculator.wordSequence_9207()
        case 9208:
            return MutationCalculator.wordSequence_9208()
        case 9209:
            return MutationCalculator.wordSequence_9209()
        case 9210:
            return MutationCalculator.wordSequence_9210()
        case 9211:
            return MutationCalculator.wordSequence_9211()
        case 9212:
            return MutationCalculator.wordSequence_9212()
        case 9301:
            return MutationCalculator.wordSequence_9301()
        case 9302:
            return MutationCalculator.wordSequence_9302()
        case 9303:
            return MutationCalculator.wordSequence_9303()
        case 9304:
            return MutationCalculator.wordSequence_9304()
        case 9305:
            return MutationCalculator.wordSequence_9305()
        case 9306:
            return MutationCalculator.wordSequence_9306()
        case 9307:
            return MutationCalculator.wordSequence_9307()
        case 9308:
            return MutationCalculator.wordSequence_9308()
        case 9309:
            return MutationCalculator.wordSequence_9309()
        case 9310:
            return MutationCalculator.wordSequence_9310()
        case 9311:
            return MutationCalculator.wordSequence_9311()
        case 9312:
            return MutationCalculator.wordSequence_9312()
        case 9401:
            return MutationCalculator.wordSequence_9401()
        case 9402:
            return MutationCalculator.wordSequence_9402()
        case 9403:
            return MutationCalculator.wordSequence_9403()
        case 9404:
            return MutationCalculator.wordSequence_9404()
        case 9406:
            return MutationCalculator.wordSequence_9406()
        case 9407:
            return MutationCalculator.wordSequence_9407()
        case 9408:
            return MutationCalculator.wordSequence_9408()
        case 9409:
            return MutationCalculator.wordSequence_9409()
        case 9410:
            return MutationCalculator.wordSequence_9410()
        case 9411:
            return MutationCalculator.wordSequence_9411()
        case 9412:
            return MutationCalculator.wordSequence_9412()
        case 9501:
            return MutationCalculator.wordSequence_9501()
        case 9502:
            return MutationCalculator.wordSequence_9502()
        case 9503:
            return MutationCalculator.wordSequence_9503()
        case 9504:
            return MutationCalculator.wordSequence_9504()
        case 9505:
            return MutationCalculator.wordSequence_9505()
        case 9506:
            return MutationCalculator.wordSequence_9506()
        case 9507:
            return MutationCalculator.wordSequence_9507()
        case 9508:
            return MutationCalculator.wordSequence_9508()
        case 9509:
            return MutationCalculator.wordSequence_9509()
        case 9510:
            return MutationCalculator.wordSequence_9510()
        case 9511:
            return MutationCalculator.wordSequence_9511()
        case 9512:
            return MutationCalculator.wordSequence_9512()
        case 9601:
            return MutationCalculator.wordSequence_9601()
        case 9602:
            return MutationCalculator.wordSequence_9602()
        case 9603:
            return MutationCalculator.wordSequence_9603()
        case 9604:
            return MutationCalculator.wordSequence_9604()
        case 9605:
            return MutationCalculator.wordSequence_9605()
        default:
            return []
        }
    }
    
    

}
