//
//  Cluster2CalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 18/8/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class Cluster2CalculatorTests: XCTestCase {
    
    func test_execute() {
        let words = WordData.words_8612()
        
        let newResults = Cluster2Calculator.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(1149, newResults.count)
        
        let oldResults = ClusterCalculator.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(1149, oldResults.count)
    }
    
    func test_PERFexecute() {
        measure {
            let words = WordData.words_8612()
            
            let newResults = Cluster2Calculator.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(1149, newResults.count)
        }
    }
    
    func test_PERF_execute_OLD() {
        let options = XCTMeasureOptions()
        options.iterationCount = 1
        
        measure(metrics: [XCTClockMetric()], options: options) {
            let gameList = GameList()
            
            for game in gameList.games {
                let words = game.words
                
                let oldResults = ClusterCalculator.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
                
                let shapes = ShapeCalculator.toShapes(clusters: oldResults)
                print("ClusterCalculator.Execute: \(game.gameId) old: \(shapes.count)")
            }
        }
    }
    
    func test_PERF_execute_NEW() {
        let options = XCTMeasureOptions()
        //options.iterationCount = 1
        
        //measure(metrics: [XCTClockMetric()], options: options) {
        measure {
            let gameList = GameList()
            
            for game in gameList.games {
                let words = game.words
                
                let newResults = Cluster2Calculator.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
                //let shapes = ShapeCalculator.toShapes(clusters: newResults)
                print("ClusterCalculator2.Execute: \(game.gameId) new: \(newResults.count)")
            }
        }
    }
    
    func test_ExecuteAll() {
        
        let gameList = GameList()
        
        for game in gameList.games {
            
            let words = game.words
            
            let newResults = Cluster2Calculator.Execute(words:words,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
            
            let oldResults = ClusterCalculator.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)
            
            print("Execute: \(game.gameId), old: \(oldResults.count), new: \(newResults.count)")
        }
    }
    
    func test_C2x2() {
        
        let gameList = GameList()
        
        for game in gameList.games {
            
            let (words, letterIndex, lengths, end) = getData(words: game.words)
            
            let newResults = Cluster2Calculator.C2x2(letterIndex: letterIndex,words:words,end:end,len: lengths,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
            
            let oldResults = ClusterCalculator.C2x2(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)
            
            print("C2x2: \(game.gameId), old: \(oldResults.count), new: \(newResults.count)")
        }
    }
    
    
    
    func test_C2x3() {
        
        let gameList = GameList()
        
        for game in gameList.games {
            
            let (words, letterIndex, lengths, end) = getData(words: game.words)
            
            let newResults = Cluster2Calculator.C2x3(letterIndex: letterIndex,words:words,end:end,len: lengths,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
            
            let oldResults = ClusterCalculator.C2x3(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)
             
            print("C2x3: \(game.gameId), old: \(oldResults.count), new: \(newResults.count)")
        }
    }
    
    func test_C2x4() {
        
        let gameList = GameList()
        
        for game in gameList.games {
            
            let (words, letterIndex, lengths, end) = getData(words: game.words)
        
            let newResults = Cluster2Calculator.C2x4(letterIndex: letterIndex,words:words,end:end,len: lengths,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
            
            let oldResults = ClusterCalculator.C2x4(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)
            
            print("C2x4: \(game.gameId), old: \(oldResults.count), new: \(newResults.count)")
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    func test_C2x5_LRLRL_DU() {
        
        let gameList = GameList()
        
        for game in gameList.games {
  
            let (words, letterIndex, lengths, end) = getData(words: game.words)
            
            let newResults = Cluster2Calculator.C2x5_LRLRL_DU(letterIndex: letterIndex,words:words,end:end,len: lengths,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
            
            let oldResults = ClusterCalculator.C2x5_LRLRL_DU(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)
            print("C2x5_LRLRL_DU: \(game.gameId), old: \(oldResults.count), new: \(newResults.count)")
        }
    }
    
    func test_C2x5_LRLRL_UD() {
        
        let gameList = GameList()
        
        for game in gameList.games {
  
            let (words, letterIndex, lengths, end) = getData(words: game.words)
            
            let newResults = Cluster2Calculator.C2x5_LRLRL_UD(letterIndex: letterIndex,words:words,end:end,len: lengths,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
            
            let oldResults = ClusterCalculator.C2x5_LRLRL_UD(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)
            print("C2x5_LRLRL_UD: \(game.gameId), old: \(oldResults.count), new: \(newResults.count)")
        }
    }
    
    func test_C2x5_RLRLR_DU() {
        
        let gameList = GameList()
        
        for game in gameList.games {
  
            let (words, letterIndex, lengths, end) = getData(words: game.words)
            
            let newResults = Cluster2Calculator.C2x5_RLRLR_DU(letterIndex: letterIndex,words:words,end:end,len: lengths,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
            
            let oldResults = ClusterCalculator.C2x5_RLRLR_DU(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)
            print("C2x5_RLRLR_DU: \(game.gameId), old: \(oldResults.count), new: \(newResults.count)")
        }
    }
    
    func test_C2x5_RLRLR_UD() {
        
        let gameList = GameList()
        
        for game in gameList.games {
  
            let (words, letterIndex, lengths, end) = getData(words: game.words)
            
            let newResults = Cluster2Calculator.C2x5_RLRLR_UD(letterIndex: letterIndex,words:words,end:end,len: lengths,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
            
            let oldResults = ClusterCalculator.C2x5_RLRLR_UD(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)
            print("C2x5_RLRLR_UD: \(game.gameId), old: \(oldResults.count), new: \(newResults.count)")
        }
    }
    
    func test_C2x5() {
        
        let gameList = GameList()
        
        for game in gameList.games {
  
            let (words, letterIndex, lengths, end) = getData(words: game.words)
            
            let newResults = Cluster2Calculator.C2x5(letterIndex: letterIndex,words:words,end:end,len: lengths,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
            
            let oldResults = ClusterCalculator.C2x5(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)
            print("C2x5: \(game.gameId), old: \(oldResults.count), new: \(newResults.count)")
        }
    }
    
    
    
    
    
    func test_C2x6_LRLRLR_DU_Example() {
        
  /*
          .
         .H
   .PICASSO.
        .CLARET.
      .DRAB.
        .RED.
.BOTTICELLI.
        .ENAMEL.
         T.
         .
    */
        // down1,left1,up2,right2,left3,right4,left5,right6
        
        let example = ["SCARLET","PICASSO","HOLBEIN","CLARET","DRAB","RED","BOTTICELLI","ENAMEL"]
        
        let (words, letterIndex, lengths, end) = getData(words: example)
        
        let newResults = Cluster2Calculator.C2x6_LRLRLR_DU(letterIndex: letterIndex,words:words,end:end,len: lengths,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
        
        XCTAssertEqual(1, newResults.count)
        
        let oldResults = ClusterCalculator.C2x6_LRLRLR_DU(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(1, oldResults.count)
    }
    
    
    
    
    func test_C2x6_LRLRLR_DU() {
        
        let gameList = GameList()
        
        for game in gameList.games {
            
            let (words, letterIndex, lengths, end) = getData(words: game.words)
            
            let newResults = Cluster2Calculator.C2x6_LRLRLR_DU(letterIndex: letterIndex,words:words,end:end,len: lengths,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
            
            let oldResults = ClusterCalculator.C2x6_LRLRLR_DU(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)
            
            print("C2x6_LRLRLR_DU: \(game.gameId), old: \(oldResults.count), new: \(newResults.count)")
            //print(oldResults[0].ToShape().ToText(words: words))
        }
    }
    
    func test_C2x6_LRLRLR_UD() {
        
        let gameList = GameList()
        
        for game in gameList.games {
            
            let (words, letterIndex, lengths, end) = getData(words: game.words)
        
            let newResults = Cluster2Calculator.C2x6_LRLRLR_UD(letterIndex: letterIndex,words:words,end:end,len: lengths,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
            
            let oldResults = ClusterCalculator.C2x6_LRLRLR_UD(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)

            print("C2x6_LRLRLR_UD: \(game.gameId), old: \(oldResults.count), new: \(newResults.count)")
        }
    }
    
    func test_C2x6_RLRLRL_DU() {
        
        let gameList = GameList()
        
        for game in gameList.games {
            
            let (words, letterIndex, lengths, end) = getData(words: game.words)
        
            let newResults = Cluster2Calculator.C2x6_RLRLRL_DU(letterIndex: letterIndex,words:words,end:end,len: lengths,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
            
            let oldResults = ClusterCalculator.C2x6_RLRLRL_DU(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)

            print("C2x6_RLRLRL_DU: \(game.gameId), old: \(oldResults.count), new: \(newResults.count)")
        }
    }
    
    func test_C2x6_RLRLRL_UD() {
        
        let gameList = GameList()
        
        for game in gameList.games {
            
            let (words, letterIndex, lengths, end) = getData(words: game.words)
        
            let newResults = Cluster2Calculator.C2x6_RLRLRL_UD(letterIndex: letterIndex,words:words,end:end,len: lengths,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
            
            let oldResults = ClusterCalculator.C2x6_RLRLRL_UD(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)

            print("C2x6_RLRLRL_UD: \(game.gameId), old: \(oldResults.count), new: \(newResults.count)")
        }
    }
    
    func test_C2x6() {
        
        let gameList = GameList()
        
        for game in gameList.games {
            
            let (words, letterIndex, lengths, end) = getData(words: game.words)
        
            let newResults = Cluster2Calculator.C2x6(letterIndex: letterIndex,words:words,end:end,len: lengths,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
            
            let oldResults = ClusterCalculator.C2x6(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)

            print("C2x6: \(game.gameId), old: \(oldResults.count), new: \(newResults.count)")
        }
    }
    
    
    func test_C3x3() {
        
        let gameList = GameList()
        
        for game in gameList.games {
            
            let (words, letterIndex, lengths, end) = getData(words: game.words)
        
            let newResults = Cluster2Calculator.C3x3(letterIndex: letterIndex,words:words,end:end,len: lengths,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
            
            let oldResults = ClusterCalculator.C3x3(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)
            print("C3x3: \(game.gameId), old: \(oldResults.count), new: \(newResults.count)")
        }
    }
    
    func test_C3x4() {
        
        let gameList = GameList()
        
        for game in gameList.games {
            
            let (words, letterIndex, lengths, end) = getData(words: game.words)
        
            let newResults = Cluster2Calculator.C3x4(letterIndex: letterIndex,words:words,end:end,len: lengths,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
            
            let oldResults = ClusterCalculator.C3x4(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)
       
            print("C3x4: \(game.gameId), old: \(oldResults.count), new: \(newResults.count)")
        }
    }
    
    func test_C3x5() {
        
        let gameList = GameList()
        
        for game in gameList.games {
            
            let (words, letterIndex, lengths, end) = getData(words: game.words)
        
            let newResults = Cluster2Calculator.C3x5(letterIndex: letterIndex,words:words,end:end,len: lengths,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
            
            let oldResults = ClusterCalculator.C3x5(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)
            print("C3x5: \(game.gameId), old: \(oldResults.count), new: \(newResults.count)")
        }
    }
    
    func test_C3x4_Example() {
        
        
 /*
        ...
       .TAP.
 .CALENDULA.
       .BONSAI.
     .TREES.
        R.Y
        . .
*/
        // down1, right1, up2, left2, down3, right3, left4
        
        // This is the sequence of words but I think it ignores
        let exampleWords = ["TUBER","TAP","ALOE","CALENDULA","PANSY","BONSAI","TREES"]
        let (words, letterIndex, lengths, end) = getData(words: exampleWords)
        
        let newResults = Cluster2Calculator.C3x4_RLRL_DUD(letterIndex: letterIndex,words:words,end:end,len: lengths,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
        
        let oldResults = ClusterCalculator.C3x4_RLRL_DUD(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
                
        //print(oldResults[0].ToShape().ToText(words: words))
        //print(oldResults[0].ToShape().Flip().ToText(words: words))
        
                XCTAssertEqual(oldResults.count, newResults.count)
                
                //print("3x4: \(game.gameId), old: \(oldResults.count), new: \(newResults.count)")
    }
    
    func test_C3x4_LRLR_DUD() {
        
        let gameList = GameList()
        
        for game in gameList.games {
            
            let (words, letterIndex, lengths, end) = getData(words: game.words)
        
            let newResults = Cluster2Calculator.C3x4_LRLR_DUD(letterIndex: letterIndex,words:words,end:end,len: lengths,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
            
            let oldResults = ClusterCalculator.C3x4_LRLR_DUD(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)
       
            print("C3x4_LRLR_DUD: \(game.gameId), old: \(oldResults.count), new: \(newResults.count)")
        }
    }
    
    func test_C3x4_LRLR_UDU_Example() {
        /*
         .
         R
         O
       ..S
    .SNIPE.
      .BELLBIRD.
.COCKATIEL.
      .SWAN.
       .I.
        T
        .
         */
        //up1,left1,down2,right2,up3,left3,right4
        let list = ["IBIS","SNIPE","PEEWIT","BELLBIRD","ROSELLA","COCKATIEL","SWAN"]
        
        let (words, letterIndex, lengths, end) = getData(words: list)
        
        let newResults = Cluster2Calculator.C3x4_LRLR_UDU(letterIndex: letterIndex,words:words,end:end,len: lengths,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
        XCTAssertEqual(1, newResults.count)
    }
    
    func test_C3x4_LRLR_UDU() {
        
        let gameList = GameList()
        
        for game in gameList.games {
            
            let (words, letterIndex, lengths, end) = getData(words: game.words)
        
            let newResults = Cluster2Calculator.C3x4_LRLR_UDU(letterIndex: letterIndex,words:words,end:end,len: lengths,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
            
            let oldResults = ClusterCalculator.C3x4_LRLR_UDU(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)
       
            print("C3x4_LRLR_UDU: \(game.gameId), old: \(oldResults.count), new: \(newResults.count)")
            
            if oldResults.count != newResults.count {
                print(oldResults[0].ToShape().ToText(words: words))
                print(oldResults[0].ToShape().Flip().ToText(words: words))
            }
        }
    }
    
    func test_C3x4_RLRL_DUD() {
        
        let gameList = GameList()
        
        for game in gameList.games {
            
            let (words, letterIndex, lengths, end) = getData(words: game.words)
        
            let newResults = Cluster2Calculator.C3x4_RLRL_DUD(letterIndex: letterIndex,words:words,end:end,len: lengths,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
            
            let oldResults = ClusterCalculator.C3x4_RLRL_DUD(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)
       
            print("C3x4_RLRL_DUD: \(game.gameId), old: \(oldResults.count), new: \(newResults.count)")

            
        }
    }
    
    func test_C3x4_RLRL_UDU() {
        
        let gameList = GameList()
        
        for game in gameList.games {
            
            let (words, letterIndex, lengths, end) = getData(words: game.words)
        
            let newResults = Cluster2Calculator.C3x4_RLRL_UDU(letterIndex: letterIndex,words:words,end:end,len: lengths,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
            
            let oldResults = ClusterCalculator.C3x4_RLRL_UDU(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(oldResults.count, newResults.count)
       
            print("C3x4_RLRL_UDU: \(game.gameId), old: \(oldResults.count), new: \(newResults.count)")
        }
    }
    
    

    
    
    func test_C3x5_9106_Example() {
        
        /*
         . .
         H.C
       .SETH.
        .CHARON.
    .JUPITER.
        .OSIRIS.
       .ARES.
         .U.
          S
          .
         */
        let inputWords = ["HECTOR","SETH","THESEUS","CHARON","CHARIS","JUPITER","OSIRIS","ARES"]
        let (words, letterIndex, lengths, end) = getData(words: inputWords)
        
        let newResults = Cluster2Calculator.C3x5_LRLRL_UDU(letterIndex: letterIndex,words:words,end:end,len: lengths,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
        XCTAssertEqual(1, newResults.count)
        let oldResults = ClusterCalculator.C3x5_LRLRL_UDU(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        XCTAssertEqual(1, oldResults.count)
        XCTAssertEqual(oldResults.count, newResults.count)
    }
    
    func test_C3x5_9106() {
        
        let gameList = GameList()
        
        for game in gameList.games {
            if game.gameId == 9106 {
                
                let (words, letterIndex, lengths, end) = getData(words: game.words)
                
                let newResults = Cluster2Calculator.C3x5(letterIndex: letterIndex,words:words,end:end,len: lengths,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
                
                let oldResults = ClusterCalculator.C3x5(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
                
                XCTAssertEqual(oldResults.count, newResults.count)
                print("3x5: \(game.gameId), old: \(oldResults.count), new: \(newResults.count)")
                compareShapes(oldResults: oldResults, newResults: newResults, words: words)
            }
        }
    }
    
    

    func test_PERF_C2x3_OLD() {
        measure {
            let words = WordData.words_8612()
            
            let lengths = WordCalculator.lengths(words: words)
            
            let end = WordCalculator.reverse(words: words)
            
            let oldResults = ClusterCalculator.C2x3(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(292, oldResults.count)
            
            /// Time took 0.425 seconds
        }
    }
    
    func test_PERF_C2x3_NEW() {
        measure {
            let words = WordData.words_8612()
            
            let letterIndex = LetterIndexModel(words: words)
            
            let lengths = WordCalculator.lengths(words: words)
            
            let end = WordCalculator.reverse(words: words)
            
            let newResults = Cluster2Calculator.C2x3(
                letterIndex: letterIndex,
                words:words,
                end:end,
                len: lengths,
                scoreMin:scoreMin,
                widthMax:widthMax,
                heightMax:heightMax)
            
            XCTAssertEqual(292, newResults.count)
            
            /// Time took `0.057 seconds` which is `7.4x` faster than existing `0.425 seconds`
        }
    }
    
    func test_C2x3_LRL_DU() {
        let words = WordData.words_8612()
        
        let lengths = WordCalculator.lengths(words: words)
        
        let end = WordCalculator.reverse(words: words)
        
        let letterIndex = LetterIndexModel(words: words)

        let newResults = Cluster2Calculator.C2x3_LRL_DU(letterIndex: letterIndex, words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(64, newResults.count)
        
        let oldResults = ClusterCalculator.C2x3_LRL_DU(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)

        XCTAssertEqual(64, oldResults.count)
//        for result in newResults {
//            print(result.ToShape().ToText(words: words))
//        }
    }
    
    func test_C2x3_LRL_UD() {
        let words = WordData.words_8612()
        
        let lengths = WordCalculator.lengths(words: words)
        
        let end = WordCalculator.reverse(words: words)
        
        let letterIndex = LetterIndexModel(words: words)

        let newResults = Cluster2Calculator.C2x3_LRL_UD(letterIndex: letterIndex, words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(152, newResults.count)
        
        let oldResults = ClusterCalculator.C2x3_LRL_UD(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)

        XCTAssertEqual(152, oldResults.count)
//        for result in newResults {
//            print(result.ToText(words: words))
//        }
    }
    
    func test_C2x3_RLR_DU() {
        let words = WordData.words_8612()
        
        let lengths = WordCalculator.lengths(words: words)
        
        let end = WordCalculator.reverse(words: words)
        
        let letterIndex = LetterIndexModel(words: words)

        let newResults = Cluster2Calculator.C2x3_RLR_DU(letterIndex: letterIndex, words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(56, newResults.count)
        
        let oldResults = ClusterCalculator.C2x3_RLR_DU(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)

        XCTAssertEqual(56, oldResults.count)
//        for result in newResults {
//            print(result.ToText(words: words))
//        }
    }
    
    func test_C2x3_RLR_UD() {
        let words = WordData.words_8612()
        
        let lengths = WordCalculator.lengths(words: words)
        
        let end = WordCalculator.reverse(words: words)
        
        let letterIndex = LetterIndexModel(words: words)

        let newResults = Cluster2Calculator.C2x3_RLR_UD(letterIndex: letterIndex, words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(20, newResults.count)
        
        let oldResults = ClusterCalculator.C2x3_RLR_UD(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)

        XCTAssertEqual(20, oldResults.count)
        for result in newResults {
            print(result.ToText(words: words))
        }
    }
    
    
    func test_PERF_C2x2_Old() {
        measure {
            let words = WordData.words_8612()
            
            let lengths = WordCalculator.lengths(words: words)
            
            let end = WordCalculator.reverse(words: words)

            let oldResults = ClusterCalculator.C2x2(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            // 256+446+97
            XCTAssertEqual(799, oldResults.count)
            
            /// Took 0.182
        }
    }
    
    func test_PERF_C2x2_New() {
        measure {
            let words = WordData.words_8612()
            
            let letterIndex = LetterIndexModel(words: words)
            
            let lengths = WordCalculator.lengths(words: words)
            
            let end = WordCalculator.reverse(words: words)
            
            let newResults = Cluster2Calculator.C2x2(
                letterIndex: letterIndex,
                words:words,
                end:end,
                len: lengths,
                scoreMin:scoreMin,
                widthMax:widthMax,
                heightMax:heightMax)
            
            // 256+446+97
            XCTAssertEqual(799, newResults.count)
            
            /// Took 0.037 seconds which is  4.9x faster than 0.182
        }
    }
    
    func test_C2x2_RL_DU_() {
    /*
       .
       F
      .O
     .TOYS.
.CUSTARD.
      E.
      E
     .
     */
    
        let words = ["TREE","TOYS","FOOD","CUSTARD"]
        let letterIndex = LetterIndexModel(words: words)
        
        let lengths = WordCalculator.lengths(words: words)
        
        let end = WordCalculator.reverse(words: words)
        
        let newResults = Cluster2Calculator.C2x2_RL_DU(
            letterIndex: letterIndex,
            words:words,
            end:end,
            len: lengths,
            scoreMin:scoreMin,
            widthMax:widthMax,
            heightMax:heightMax)
        
        XCTAssertEqual(1, newResults.count)
        print(newResults[0].ToText(words:words))
       
    }
    func test_C2x2_LR_UD_() {
        /*
        .
        G
        I
        F.
     .NUTS.
       .SILENTNIGHT.
        .N
         G
         .
         */
        let words = ["GIFTS","NUTS","SING","SILENTNIGHT"]
        
        let letterIndex = LetterIndexModel(words: words)
        
        let lengths = WordCalculator.lengths(words: words)
        
        let end = WordCalculator.reverse(words: words)
        
        let newResults = Cluster2Calculator.C2x2_LR_UD(
            letterIndex: letterIndex,
            words:words,
            end:end,
            len: lengths,
            scoreMin:scoreMin,
            widthMax:widthMax,
            heightMax:heightMax)
        
        XCTAssertEqual(2, newResults.count)
        print(newResults[0].ToText(words:words))
        print(newResults[1].ToText(words:words))
    }
    func test_C2x2_LR_UD() throws {
        let words = WordData.words_8612()
        
        let letterIndex = LetterIndexModel(words: words)
        
        let lengths = WordCalculator.lengths(words: words)
        
        let end = WordCalculator.reverse(words: words)
        
        let newResults = Cluster2Calculator.C2x2_LR_UD(
            letterIndex: letterIndex,
            words:words,
            end:end,
            len: lengths,
            scoreMin:scoreMin,
            widthMax:widthMax,
            heightMax:heightMax)
        
        XCTAssertEqual(256, newResults.count)
        
        let oldResults = ClusterCalculator.C2x2_LR_UD(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(256, oldResults.count)
        
        XCTAssertEqual(oldResults.count, newResults.count)
        //print(newResults[0].ToText(words:words))
        //compareShapes(oldResults: oldResults, newResults: newResults, words: words)
    }
    
    func test_C2x2_RL_DU() throws {
        let words = WordData.words_8612()
        
        let letterIndex = LetterIndexModel(words: words)
        
        let lengths = WordCalculator.lengths(words: words)
        
        let end = WordCalculator.reverse(words: words)
        
        let newResults = Cluster2Calculator.C2x2_RL_DU(
            letterIndex: letterIndex,
            words:words,
            end:end,
            len: lengths,
            scoreMin:scoreMin,
            widthMax:widthMax,
            heightMax:heightMax)
        
        XCTAssertEqual(446, newResults.count)
        
        let oldResults = ClusterCalculator.C2x2_RL_DU(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(446, oldResults.count)
        
        XCTAssertEqual(oldResults.count, newResults.count)
        //print(newResults[0].ToText(words:words))
        //compareShapes(oldResults: oldResults, newResults: newResults, words: words)
    }
    
    func test_C2x2_RL_UD() throws {
        let words = WordData.words_8612()
        
        let letterIndex = LetterIndexModel(words: words)
        
        let lengths = WordCalculator.lengths(words: words)
        
        let end = WordCalculator.reverse(words: words)
        
        let newResults = Cluster2Calculator.C2x2_RL_UD(
            letterIndex: letterIndex,
            words:words,
            end:end,
            len: lengths,
            scoreMin:scoreMin,
            widthMax:widthMax,
            heightMax:heightMax)
        
        XCTAssertEqual(97, newResults.count)
        
        let oldResults = ClusterCalculator.C2x2_RL_UD(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(97, oldResults.count)
        
        XCTAssertEqual(oldResults.count, newResults.count)
        //print(newResults[0].ToText(words:words))
        //compareShapes(oldResults: oldResults, newResults: newResults, words: words)
    }
    
    func test_GetBigShape() throws {
        let words = WordData.words_8612()
        
        let letterIndex = LetterIndexModel(words: words)
        
        let lengths = WordCalculator.lengths(words: words)
        
        let end = WordCalculator.reverse(words: words)
        
        let newResults = Cluster2Calculator.C3x3(
            letterIndex: letterIndex,
            words:words,
            end:end,
            len: lengths,
            scoreMin:scoreMin,
            widthMax:widthMax,
            heightMax:heightMax)
        
        let shape = newResults[0].ToShape()
        
        print(shape.ToCode(words: words))
        
    }
    
//    func test_OtherStuff() {
//
//        let words = ["WHITE","CREAM","REINDEER","SPICE","TREE","GOODCHEER"]
//
//        let grid = [
//            "        .   ",
//            "        G   ",
//            "        O   ",
//            "        O   ",
//            "      . D   ",
//            "      S C   ",
//            "      P.H   ",
//            "   .WHITE.  ",
//            "     .CREAM.",
//            ".REINDEER.  ",
//            "      .E.   ",
//            "       .    "]
//        let shape = ShapeCalculator.toShape(fromGrid: grid, words: words)!
//
//
//
//
//        let wordsInt = WordCalculator.WordsToInt(words: words)
//        for i in 0..<100 {
//            let (score1, shapeWithNumbers) = ShapeCalculator.getScoreAndText2(shape: shape, words2: wordsInt)
//            //let (score2, shapeWithText) = ShapeCalculator.getScoreAndText(shape: shape, words: words)
//            //XCTAssertEqual(score1,score2)
//            XCTAssertEqual(0,score1)
//        }
//
//    }
    func test_PERF_GetScoreAndText() {
        measure {
            let words = ["WHITE","CREAM","REINDEER","SPICE","TREE","GOODCHEER"]
            
            let grid = [
                "        .   ",
                "        G   ",
                "        O   ",
                "        O   ",
                "      . D   ",
                "      S C   ",
                "      P.H   ",
                "   .WHITE.  ",
                "     .CREAM.",
                ".REINDEER.  ",
                "      .E.   ",
                "       .    "]
            let shape = ShapeCalculator.toShape(fromGrid: grid, words: words)!
            
            //let wordsInt = WordCalculator.WordsToInt(words: words)
            for _ in 0..<30_000 {
                //let (score1, shapeWithNumbers) = ShapeCalculator.getScoreAndText2(shape: shape, words2: wordsInt)
                let (score2, _) = ShapeToTextConverter.getScoreAndText(shape: shape, words: words)
                XCTAssertEqual(106,score2)
            }
            /// Average time is `0.859` seconds per 30,000
        }
    }
    func test_PERF_GetScoreAndText2() {
        measure {
            let words = ["WHITE","CREAM","REINDEER","SPICE","TREE","GOODCHEER"]
            
            let grid = [
                "        .   ",
                "        G   ",
                "        O   ",
                "        O   ",
                "      . D   ",
                "      S C   ",
                "      P.H   ",
                "   .WHITE.  ",
                "     .CREAM.",
                ".REINDEER.  ",
                "      .E.   ",
                "       .    "]
            let shape = ShapeCalculator.toShape(fromGrid: grid, words: words)!

            let wordsInt = WordCalculator.WordsToInt(words: words)
            for _ in 0..<30_000 {
                let (score1, _) = ShapeCalculator.getScoreAndText2(shape: shape, words2: wordsInt)
                //let (score2, shapeWithText) = ShapeCalculator.getScoreAndText(shape: shape, words: words)
                XCTAssertEqual(score1,106)
            }
            /// average 0.641 per 30,000 which is 1.34 times faster.  And this is a fundamental operation so should be big impact.
        }
    }
    
    func test_PERF_GetScoreAndText3() {
        measure {
            let words = ["WHITE","CREAM","REINDEER","SPICE","TREE","GOODCHEER"]
            
            let grid = [
                "        .   ",
                "        G   ",
                "        O   ",
                "        O   ",
                "      . D   ",
                "      S C   ",
                "      P.H   ",
                "   .WHITE.  ",
                "     .CREAM.",
                ".REINDEER.  ",
                "      .E.   ",
                "       .    "]
            let shape = ShapeCalculator.toShape(fromGrid: grid, words: words)!

            var gridText = shape.getGridArray()
            
            let wordsInt = WordCalculator.WordsToInt(words: words)
            for _ in 0..<30_000 {
                /// This method is much slower
                let (score1, _) = ShapeCalculator.getScoreAndText3(shape: shape, words2: wordsInt, grid: &gridText)
                //let (score2, shapeWithText) = ShapeCalculator.getScoreAndText(shape: shape, words: words)
                XCTAssertEqual(score1,106)
            }
            /// average 0.641 per 30,000 which is 1.34 times faster.  And this is a fundamental operation so should be big impact.
        }
    }
    
    func test_PERF_C2x2_RL_UD_OLD() throws {
        measure {
            let words = WordData.words_8612()
            
            let lengths = WordCalculator.lengths(words: words)
            
            let end = WordCalculator.reverse(words: words)
            
            let oldResults = ClusterCalculator.C2x2_RL_UD(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(97, oldResults.count)
            
            /// Took 0.043 seconds
        }
    }
    
    func test_PERF_C2x2_RL_UD_NEW() throws {
        measure {
            let words = WordData.words_8612()
            
            let letterIndex = LetterIndexModel(words: words)
            
            let lengths = WordCalculator.lengths(words: words)
            
            let end = WordCalculator.reverse(words: words)
            
            let newResults = Cluster2Calculator.C2x2_RL_UD(
                letterIndex: letterIndex,
                words:words,
                end:end,
                len: lengths,
                scoreMin:scoreMin,
                widthMax:widthMax,
                heightMax:heightMax)
            
            XCTAssertEqual(97, newResults.count)
            
            /// Took 0.006 seconds which is 7.1x faster than 0.043 seconds
        }
    }
    
    func test_PERF_C2x2_RL_DU_OLD() throws {
        measure {
            let words = WordData.words_8612()
            
            let lengths = WordCalculator.lengths(words: words)
            
            let end = WordCalculator.reverse(words: words)
            
            let oldResults = ClusterCalculator.C2x2_RL_DU(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(446, oldResults.count)
            
            /// took 0.074 seconds
        }
    }
    
    func test_PERF_C2x2_RL_DU_NEW() throws {
        measure {
            let words = WordData.words_8612()
            
            let letterIndex = LetterIndexModel(words: words)
            
            let lengths = WordCalculator.lengths(words: words)
            
            let end = WordCalculator.reverse(words: words)
            
            let newResults = Cluster2Calculator.C2x2_RL_DU(
                letterIndex: letterIndex,
                words:words,
                end:end,
                len: lengths,
                scoreMin:scoreMin,
                widthMax:widthMax,
                heightMax:heightMax)
            
            XCTAssertEqual(446, newResults.count)
            
            /// took 0.020 seconds which is 3.7X faster than 0.074 seconds
        }
    }
    
    
    func test_PERF_C2x2_LR_UD_New() throws {
        //measureMetrics([XCTPerformanceMetric.wallClockTime], automaticallyStartMeasuring: false) {
        measure {
            let words = WordData.words_8612()
            
            let letterIndex = LetterIndexModel(words: words)
            
            let lengths = WordCalculator.lengths(words: words)
            
            let end = WordCalculator.reverse(words: words)
            //startMeasuring()
            let newResults = Cluster2Calculator.C2x2_LR_UD(
                letterIndex: letterIndex,
                words:words,
                end:end,
                len: lengths,
                scoreMin:scoreMin,
                widthMax:widthMax,
                heightMax:heightMax)
            //stopMeasuring()
            XCTAssertEqual(256, newResults.count)
            
            /// 0.014 seconds which is 5x faster than the old way which took 0.070
        }
    }
    
    func test_PERF_C2x2_LR_UD_Old() throws {
        measure {
            let words = WordData.words_8612()
            
            let lengths = WordCalculator.lengths(words: words)
            
            let end = WordCalculator.reverse(words: words)
            
            let oldResults = ClusterCalculator.C2x2_LR_UD(words: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
            XCTAssertEqual(256, oldResults.count)
            /// 0.070 seconds
        }
    }
    
    
    func compareShapes(oldResults: [ClusterModel], newResults: [ClusterModel], words: [String]) {
        
        var oldShapes:[String] = []
        for oldResult in oldResults {
            var oldShape = oldResult.ToShape()
            if oldShape.width < oldShape.height {
                oldShape = oldShape.Flip()
            }
            
            let text = oldShape.ToTextDebug(words: words)
            oldShapes.append(text)
        }
        
        var newShapes:[String] = []
        for newResult in newResults {
            var newShape = newResult.ToShape()
            if newShape.width < newShape.height {
                newShape = newShape.Flip()
            }
            let text = newShape.ToTextDebug(words: words)
            newShapes.append(text)
        }
        
        for oldResult in oldResults {
            
            let oldShape = oldResult.ToShape().ToTextDebug(words: words)
            let oldShapeFlipped = oldResult.ToShape().Flip().ToTextDebug(words: words)
            
            XCTAssertNotEqual(oldShape, oldShapeFlipped)
            
            if newShapes.contains(oldShape) == false && newShapes.contains(oldShapeFlipped) == false {
                print(oldShape)
            }
        }
        
        
        // How many are in new and not in old
        print("NEW but not in OLD")
        for newShape in newShapes {
            if oldShapes.contains(newShape) == false {
                print(newShape)
            }
        }
    }
    
    let scoreMin = 0
    let widthMax = 17
    let heightMax = 12
    
    func getData() -> ([String], LetterIndexModel, [Int], [String]) {
        let words = WordData.words_8612()
        let letterIndex = LetterIndexModel(words: words)
        let lengths = WordCalculator.lengths(words: words)
        let end = WordCalculator.reverse(words: words)
        
        return (words, letterIndex, lengths, end)
    }
        
    func getData(words: [String]) -> ([String], LetterIndexModel, [Int], [String]) {
        let letterIndex = LetterIndexModel(words: words)
        let lengths = WordCalculator.lengths(words: words)
        let end = WordCalculator.reverse(words: words)
        
        return (words, letterIndex, lengths, end)
    }
}
