//
//  MergeCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 24/5/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class MergeCalculatorTests: XCTestCase {

    func test_FindAnyRectangleMerge() throws {
        
    }
    
    func test_Edges() throws {
        
        var edges = EdgeCalculator.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        edges.sort {
            if $0.score == $1.score {
                return $0.width * $0.height < $1.width * $1.height
            } else {
                return $0.score > $1.score
            }
        }
        
        
        let gpuShapes = GpuShapeCalculator.get_2_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let wordMatches = MergeCalculator.Execute(gpuShapeModel: gpuShapes, searchMax: gpuShapes.count, shapePosition: 0)
        
        for items in wordMatches {
            let edge = edges[items]
            print(edge.ToText(words:words))
        }
        
        // There are 301 likely matches between the first and all other shapes
        XCTAssertEqual(301, wordMatches.count)
    }
    
    
    func test_EdgesAll() throws {
        
        let gpuShapes = GpuShapeCalculator.get_2_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        var count = 0
        for i in 0..<gpuShapes.count {
            let wordMatches = MergeCalculator.Execute(gpuShapeModel: gpuShapes, searchMax: gpuShapes.count, shapePosition: i)
           
            count += wordMatches.count
        }
        XCTAssertEqual(2837626, count) //2837626
        print(gpuShapes.count)
        print(count)
        
        //        var edges = EdgeCalculator.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        //
        //        edges.sort {
        //            if $0.score == $1.score {
        //                return $0.width * $0.height < $1.width * $1.height
        //            } else {
        //                return $0.score > $1.score
        //            }
        //        }
                
                
                
    }
    
    func test_RectangleOne() async throws {
        
        
        
        
        let gpuShapes = await GpuShapeCalculator.get_4_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        print("found gpu shapes")
        var count = 0
        for i in 0..<gpuShapes.count {
            let wordMatches = MergeCalculator.Execute(gpuShapeModel: gpuShapes, searchMax: gpuShapes.count, shapePosition: i)
           
            count += wordMatches.count
            
//            let shape1 = rectangles[0]
//            print(shape1.ToText(words: words))
//
//            let shape2 = rectangles[3]
//            print(shape2.ToText(words: words))
        }
        XCTAssertEqual(2854550,count)
        print(gpuShapes.count)
        print(count)
        
//        var rectangles = await RectangleCalculator.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
//
//        rectangles.sort() {
//            if $0.score == $1.score {
//                return $0.width * $0.height < $1.width * $1.height
//            } else {
//                return $0.score > $1.score
//            }
//        }
    }
    func test_RectangleAll() async throws {
        
        var donuts = await RectangleCalculator.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        donuts.sort() {
            if $0.score == $1.score {
                return $0.width * $0.height < $1.width * $1.height
            } else {
                return $0.score > $1.score
            }
        }
        
        
        let gpuShapes = await GpuShapeCalculator.get_4_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        var count = 0
        for i in 0..<gpuShapes.count {
            let wordMatches = MergeCalculator.Execute(gpuShapeModel: gpuShapes, searchMax: gpuShapes.count, shapePosition: i)
           
            count += wordMatches.count
        }
        XCTAssertEqual(2854550,count)
        print(gpuShapes.count)
        print(count)
        
    }
    
    
    
    var words:[String] = []
    var lengths: [Int] = []
    override func setUpWithError() throws {
        words = WordData.words_8612()
        lengths = WordCalculator.lengths(words: words)
    }
    
    let widthMax = 17
    let heightMax = 12
    let scoreMin = 0
}
