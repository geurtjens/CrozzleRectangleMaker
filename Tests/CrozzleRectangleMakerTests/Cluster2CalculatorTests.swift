//
//  Cluster2CalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 18/8/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class Cluster2CalculatorTests: XCTestCase {
    
    func test_C2x2() {
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
        
        let oldResults = ClusterCalculator.C2x2(start: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(799, oldResults.count)
        
        XCTAssertEqual(oldResults.count, newResults.count)
        //print(newResults[0].ToText(words:words))
        //compareShapes(oldResults: oldResults, newResults: newResults, words: words)
    }
    
    func test_PERF_C2x2_Old() {
        measure {
            let words = WordData.words_8612()
            
            let lengths = WordCalculator.lengths(words: words)
            
            let end = WordCalculator.reverse(words: words)

            let oldResults = ClusterCalculator.C2x2(start: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
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
        
        let oldResults = ClusterCalculator.C2x2_LR_UD (start: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
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
        
        let oldResults = ClusterCalculator.C2x2_RL_DU (start: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
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
        
        let oldResults = ClusterCalculator.C2x2_RL_UD(start: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        XCTAssertEqual(97, oldResults.count)
        
        XCTAssertEqual(oldResults.count, newResults.count)
        //print(newResults[0].ToText(words:words))
        //compareShapes(oldResults: oldResults, newResults: newResults, words: words)
    }
    
    func test_PERF_C2x2_RL_UD_OLD() throws {
        measure {
            let words = WordData.words_8612()
            
            let lengths = WordCalculator.lengths(words: words)
            
            let end = WordCalculator.reverse(words: words)
            
            let oldResults = ClusterCalculator.C2x2_RL_UD(start: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
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
            
            let oldResults = ClusterCalculator.C2x2_RL_DU (start: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
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
            
            let oldResults = ClusterCalculator.C2x2_LR_UD (start: words, end: end, len: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
            
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
}
