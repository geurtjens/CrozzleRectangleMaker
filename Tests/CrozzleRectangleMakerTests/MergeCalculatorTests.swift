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
        
        
        let edgeShapes = GpuShapeCalculator.get_2_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let wordMatches = MergeCalculator.ExecuteSameShape(shapes:edgeShapes)
        
        let wordMatchesFirst = wordMatches[0]
        
        for items in wordMatchesFirst {
            let edge = edges[items.shapeId]
            print(edge.ToText(words:words))
        }
        
        // There are 301 likely matches between the first and all other shapes
        XCTAssertEqual(301, wordMatches[0].count)
    }
    
    
    func test_EdgesAll() throws {
        
        let edgeShapes = GpuShapeCalculator.get_2_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        
        let wordMatches = MergeCalculator.ExecuteSameShape(shapes: edgeShapes)
        
        var count = 0
        for i in 0..<wordMatches.count {
            
            count += wordMatches[i].count
        }
        XCTAssertEqual(2837626, count) //2837626
        print(edgeShapes.count)
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
        
        let wordMatches = MergeCalculator.ExecuteSameShape(shapes: gpuShapes)
        var count = 0
        for i in 0..<wordMatches.count {
            
           
            count += wordMatches[i].count
            
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
        
        
        let rectangleShapes = await GpuShapeCalculator.get_4_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let wordMatches = MergeCalculator.ExecuteSameShape(shapes: rectangleShapes)
        var count = 0
        for i in 0..<wordMatches.count {
            count += wordMatches[i].count
        }
        XCTAssertEqual(2854550,count)
        print(rectangleShapes.count)
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
