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
    func test_EdgesBasic3() throws {
        let words = ["CANDLES","EVE","STAR"]
        
        /*
         .   .
         S   E
         T   V
       .CANDLES.
         R   .
         .
         */
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
        
        let scoresMin = [0, 10, 22, 33, 44, 55, 66, 77, 88, 99, 100]
        
        let wordMatches = MergeCalculator.ExecuteSameShape(shapes:edgeShapes, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
        
        let wordMatchesFirst = wordMatches[0]
        // Interesting that we can have different numbers depending on the arrangement of words
        for items in wordMatches {
            for shape in items {
                let (newShape,text) = ShapeCalculator.ToValidShape(shape: shape, words:words)
                if newShape != nil {
                    print(text)
                }
            }
            //let edge = edges[items]
            //print(edge.ToText(words:words))
        }
        
        // There are 301 likely matches between the first and all other shapes
        //XCTAssertEqual(301, wordMatches[0].count)
    }
    func test_EdgesBasic2() throws {
        let words = ["CANDLES","STAR","EVE"]
        
        /*
         .   .
         S   E
         T   V
       .CANDLES.
         R   .
         .
         */
        
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
        
        let scoresMin = [0, 10, 22, 33, 44, 55, 66, 77, 88, 99, 100]
        
        let wordMatches = MergeCalculator.ExecuteSameShape(shapes:edgeShapes, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
        
        
        let wordMatchesFirst = wordMatches[0]
        // Interesting that we can have different numbers depending on the arrangement of words
        for items in wordMatches {
            for shape in items {
                let (newShape,text) = ShapeCalculator.ToValidShape(shape: shape, words:words)
                if newShape != nil {
                    print(text)
                }
            }
            //let edge = edges[items]
            //print(edge.ToText(words:words))
        }
        
        // There are 301 likely matches between the first and all other shapes
        //XCTAssertEqual(301, wordMatches[0].count)
    }
    func test_EdgesBasic() throws {
        let words = ["STAR","EVE","CANDLES"]
        
        /*
         .
         C
      .STAR.
         N
         D
         L
      .EVE.
         S
         .
         */
        
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
        
        let scoresMin = [0, 10, 22, 33, 44, 55, 66, 77, 88, 99, 100]
        
        let wordMatches = MergeCalculator.ExecuteSameShape(shapes:edgeShapes, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
        
        
        let wordMatchesFirst = wordMatches[0]
        // Interesting that we can have different numbers depending on the arrangement of words
        for items in wordMatches {
            for shape in items {
                let (newShape,text) = ShapeCalculator.ToValidShape(shape: shape, words:words)
                if newShape != nil {
                    print(text)
                }
            }
            //let edge = edges[items]
            //print(edge.ToText(words:words))
        }
        
        // There are 301 likely matches between the first and all other shapes
        //XCTAssertEqual(301, wordMatches[0].count)
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
        
        let scoresMin = [0, 10, 22, 33, 44, 55, 66, 77, 88, 99, 100]
        
        let wordMatches = MergeCalculator.ExecuteSameShape(shapes:edgeShapes, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
        
        var shapes: [ShapeModel] = []
        for items in wordMatches {
            for shape in items {
                shapes.append(shape)
            }
        }
        
        shapes.sort { $0.score > $1.score}
        for shape in shapes {
            let (text,score) = ShapeCalculator.ToText(shape: shape, words:words)
            print("score of \(score) using \(shape.placements.count) words")
            print(text)
        }
        
        
        // There are 301 likely matches between the first and all other shapes
        XCTAssertEqual(301, shapes.count)
    }
    
    func test_Execute2x2_2x3_From_8806() throws {
        
        /*
         ..
      .STAY.
        .HAWSER.
       .BOW.
      .GUY.
        O.
        Y
        .
         */
        
        
        let words = WordData.words_8806()
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        let c2x2 = ClusterCalculator.C2x2(
            start: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let c2x2Shapes = ShapeCalculator.toShape(fromClusters: c2x2)
        
//        let (C2x2Text,C2x2Score) = ShapeCalculator.ToText(shape:c2x2Shapes[0], words: words)
//        print("Shape A score: \(C2x2Score)")
//        print(C2x2Text)
        
        let c2x3 = ClusterCalculator.C2x3(
            start: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let c2x3Shapes = ShapeCalculator.toShape(fromClusters: c2x3)
//        let (C2x3Text,C2x3Score) = ShapeCalculator.ToText(shape:c2x3Shapes[0], words: words)
//        print("Shape B score: \(C2x3Score)")
//        print(C2x3Text)
        

        
        
        let c2x2Gpu = GpuShapeModel(shapes: c2x2Shapes, totalWords: words.count, wordCountInShapes: 4)
        let c2x3Gpu = GpuShapeModel(shapes: c2x3Shapes, totalWords: words.count, wordCountInShapes: 5)
        
       
        
        let scoresMin = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        let shapesCollection = MergeCalculator.ExecuteDifferentShapes(source: c2x2Gpu, search:c2x3Gpu, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
        
        var shapes: [ShapeModel] = []
        for items in shapesCollection {
            for shape in items {
                shapes.append(shape)
            }
        }
        
        shapes.sort { $0.score > $1.score}
        for shape in shapes {
            let (text,score) = ShapeCalculator.ToText(shape: shape, words:words)
            

            print("score of \(score) using \(shape.placements.count) words")
            print(text)
            
        }
        
        XCTAssertEqual(300, shapes.count)
       
    }
    
    func test_Execute2x2_2x3_From_8806_One() throws {
        
        /*
         ..
      .STAY.
        .HAWSER.
       .BOW.
      .GUY.
        O.
        Y
        .       
         */
        
        
        let words = ["AHOY", "YAW", "STAY", "HAWSER","BOW", "GUY", "BUOY"] // WordData.words_8806()
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        let c2x2 = ClusterCalculator.C2x2(
            start: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let c2x2Shapes = ShapeCalculator.toShape(fromClusters: c2x2)
        
        let (C2x2Text,C2x2Score) = ShapeCalculator.ToText(shape:c2x2Shapes[0], words: words)
        print("Shape A score: \(C2x2Score)")
        print(C2x2Text)
        
        let c2x3 = ClusterCalculator.C2x3(
            start: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let c2x3Shapes = ShapeCalculator.toShape(fromClusters: c2x3)
        let (C2x3Text,C2x3Score) = ShapeCalculator.ToText(shape:c2x3Shapes[0], words: words)
        print("Shape B score: \(C2x3Score)")
        print(C2x3Text)
        

        
        
        let c2x2Gpu = GpuShapeModel(shapes: c2x2Shapes, totalWords: words.count, wordCountInShapes: 4)
        let c2x3Gpu = GpuShapeModel(shapes: c2x3Shapes, totalWords: words.count, wordCountInShapes: 5)
        
       
        
        let scoresMin = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        let wordMatches = MergeCalculator.ExecuteDifferentShapes(source: c2x2Gpu, search:c2x3Gpu, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
        XCTAssertEqual(1, wordMatches.count)
        XCTAssertEqual(1, wordMatches[0].count)
        let shape = wordMatches[0][0]
        
        let expectedText = "   ..     \n.STAY.    \n  .HAWSER.\n .BOW.    \n.GUY.     \n  O.      \n  Y       \n  .       "
        let (text, score) = ShapeCalculator.ToText(shape: shape, words: words)
        
        XCTAssertEqual(184, score)
        
        XCTAssertEqual(expectedText, text)
        print("Result score: \(score)")
        print(text)
    }
    
    func test_EdgesAll() throws {
        
        let edgeShapes = GpuShapeCalculator.get_2_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        
        let scoresMin = [0, 10, 22, 62, 44, 55, 66, 77, 88, 99, 100]
        
        let wordMatches = MergeCalculator.ExecuteSameShape(shapes:edgeShapes, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
        
        var count = 0
        for i in 0..<wordMatches.count {
            
            count += wordMatches[i].count
        }
        XCTAssertEqual(210058, count) //2837626 // with 54 there where 24191
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
    
    func test_RectangleMergeBasic() async throws {
        let words = [ "AZURE", "GLAZE", "WISEMEN", "NUTMEG", "SILENTNIGHT", "SNOW" ]
        let lengths = WordCalculator.lengths(words: words)
        
        let items = RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(2, items.count)
        
        
        let aText = items[0].ToText(words: words)
        let a = items[0].ToShape()
        print(aText)
        print(a.placements)
        
        let bText = items[1].ToText(words: words)
        let b = items[1].ToShape()
        print(bText)
        print(b.placements)
        
        let shapes = [a, b]
        
        let gpuShapes = GpuShapeModel(shapes: shapes, totalWords:words.count, wordCountInShapes: 4)
        
        let scoresMin = [0, 10, 22, 33, 44, 55, 66, 77, 88, 99, 100]
        
        let result = MergeCalculator.ExecuteSameShape(shapes:gpuShapes, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
        
        // This result is actually wrong so we have more to do I think
        for items in result {
            for shape in items {
                let (newShape,text) = ShapeCalculator.ToValidShape(shape: shape, words:words)
                if newShape != nil {
                    print(text)
                }
            }
        }
        
        XCTAssertEqual(2, result.count)
        
        let resultA = result[0]
        let resultB = result[1]
        
        XCTAssertEqual(1,resultA.count)
        
        // The second shape has nothing to match with so its empty
        XCTAssertEqual(0, resultB.count)
    }
    
    /// We flip one of the shapes over to see if it passes as it should
    func test_RectangleMergeBasicReverseB() async throws {
        let words = [ "AZURE", "GLAZE", "WISEMEN", "NUTMEG", "SILENTNIGHT", "SNOW" ]
        let lengths = WordCalculator.lengths(words: words)
        
        let items = RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(2, items.count)
        
        let a = items[0].ToShape()
        let b = items[1].ToShape()
        
        let c = ShapeCalculator.Flip(shape: b)
        
        let shapes = [a, c]
        
        let gpuShapes = GpuShapeModel(shapes: shapes, totalWords:words.count, wordCountInShapes: 4)
        
        let scoresMin = [0, 10, 22, 33, 44, 55, 66, 77, 88, 99, 100]
        
        let result = MergeCalculator.ExecuteSameShape(shapes:gpuShapes, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
        
        
        
        for items in result {
            for shape in items {
                let (newShape,text) = ShapeCalculator.ToValidShape(shape: shape, words:words)
                //if text.contains("#") == false {
                    //print(text)
                //}
            }
            //let edge = edges[items]
            //print(edge.ToText(words:words))
        }
        
        
        XCTAssertEqual(2, result.count)
        
        let resultA = result[0]
        let resultB = result[1]
        
        // Looks like we fail if the two words are not in the same direction so need to handle that properly
        XCTAssertEqual(1,resultA.count)

        // The second shape has nothing to match with so its empty
        XCTAssertEqual(0, resultB.count)
    }
    
    func test_RectangleOne() async throws {
        
        let gpuShapes = await GpuShapeCalculator.get_4_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        print("found gpu shapes")
        
        let scoresMin = [0, 10, 22, 33, 44, 55, 66, 77, 88, 99, 100]
        
        let wordMatches = MergeCalculator.ExecuteSameShape(shapes:gpuShapes, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
        
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
        
        
        let gpuShapes = await GpuShapeCalculator.get_4_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let scoresMin = [0, 10, 22, 33, 44, 55, 66, 77, 88, 99, 100]
        
        let wordMatches = MergeCalculator.ExecuteSameShape(shapes:gpuShapes, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
        
        var count = 0
        for i in 0..<wordMatches.count {
            count += wordMatches[i].count
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
