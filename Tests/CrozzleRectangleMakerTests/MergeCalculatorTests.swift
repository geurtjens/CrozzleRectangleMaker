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
        
        let shapes = MergeCalculator.ExecuteSameShape(shapes:edgeShapes, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
        
        
        // Interesting that we can have different numbers depending on the arrangement of words
        for shape in shapes {
            print(ShapeCalculator.ToText(shape: shape, words: words).0)
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
        
        let shapes = MergeCalculator.ExecuteSameShape(shapes:edgeShapes, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
        
        
        // Interesting that we can have different numbers depending on the arrangement of words
            for shape in shapes {
                let (newShape,text) = ShapeCalculator.ToValidShape(shape: shape, words:words)
                if newShape != nil {
                    print(text)
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
        
        let shapes = MergeCalculator.ExecuteSameShape(shapes:edgeShapes, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)

        // Interesting that we can have different numbers depending on the arrangement of words

        for shape in shapes {
            let (newShape,text) = ShapeCalculator.ToValidShape(shape: shape, words:words)
            if newShape != nil {
                print(text)
            }
        }
            
            //let edge = edges[items]
            //print(edge.ToText(words:words))
      
        
        // There are 301 likely matches between the first and all other shapes
        //XCTAssertEqual(301, wordMatches[0].count)
    }
        
    func test_EdgesAllAsync() async throws {
        
        let edgeShapes = GpuShapeCalculator.get_2_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        
        let scoresMin = [0, 0, 0, 104, 0, 0, 0, 0, 0, 0, 0]

        
        let shapes = await MergeCalculator.ExecuteSameShapeAsync(shapes:edgeShapes, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
        
        let statistics = StatisticsCalculator.Execute(shapes: shapes)
        
        print(statistics)
        
        XCTAssertEqual(347, shapes.count) //2_837_626 // with 54 there where 24191 but now 53834 in 72 seconds
        print(edgeShapes.count)
        print(shapes.count)
    }
    
    func test_EdgesAll() throws {
        
        let edgeShapes = GpuShapeCalculator.get_2_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        
        let scoresMin = [0, 0, 0, 104, 0, 0, 0, 0, 0, 0, 0]
        
        let shapes = MergeCalculator.ExecuteSameShape(shapes:edgeShapes, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
        
        let histogram = StatisticsCalculator.Execute(shapes: shapes)
        print(histogram)
       
        XCTAssertEqual(347, shapes.count) //2837626 // with 54 there where 24191
        print(edgeShapes.count)
        print(shapes.count)
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
        
        var shapes = MergeCalculator.ExecuteSameShape(shapes:edgeShapes, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
        

        
        shapes.sort { $0.score > $1.score}
        for shape in shapes {
            let (text,score) = ShapeCalculator.ToText(shape: shape, words:words)
            print("score of \(score) using \(shape.placements.count) words")
            print(text)
        }
        
        
        // There are 301 likely matches between the first and all other shapes
        XCTAssertEqual(301, shapes.count)
    }
    
    func test_Execute_2x2_2x3_From_8806() throws {
        
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
        
        var shapes = MergeCalculator.ExecuteDifferentShapes(source: c2x2Gpu, search:c2x3Gpu, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
        
        
        
//        shapes.sort { $0.score > $1.score}
//        for shape in shapes {
//            let (text,score) = ShapeCalculator.ToText(shape: shape, words:words)
//
//
//            print("score of \(score) using \(shape.placements.count) words")
//            print(text)
//
//        }
        
        XCTAssertEqual(891360, shapes.count)
       
    }
    
    func test_Execute_2x2_2x3_From_8806_Async() async throws {
        
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
        
        var shapes = await MergeCalculator.ExecuteDifferentShapesAsync(source: c2x2Gpu, search:c2x3Gpu, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
        
        
        
//        shapes.sort { $0.score > $1.score}
//        for shape in shapes {
//            let (text,score) = ShapeCalculator.ToText(shape: shape, words:words)
//
//
//            print("score of \(score) using \(shape.placements.count) words")
//            print(text)
//
//        }
        // 147.794 seconds runtime
        XCTAssertEqual(891360, shapes.count)
       
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
        
        let shapes = MergeCalculator.ExecuteDifferentShapes(source: c2x2Gpu, search:c2x3Gpu, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
        XCTAssertEqual(1, shapes.count)
        let shape = shapes[0]
        
        let expectedText = "   ..     \n.STAY.    \n  .HAWSER.\n .BOW.    \n.GUY.     \n  O.      \n  Y       \n  .       "
        let (text, score) = ShapeCalculator.ToText(shape: shape, words: words)
        
        XCTAssertEqual(184, score)
        
        XCTAssertEqual(expectedText, text)
        print("Result score: \(score)")
        print(text)
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
        
        let shapes2 = MergeCalculator.ExecuteSameShape(shapes:gpuShapes, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
        
        // This result is actually wrong so we have more to do I think

            for shape in shapes2 {
                let (newShape,text) = ShapeCalculator.ToValidShape(shape: shape, words:words)
                if newShape != nil {
                    print(text)
                }
            }
        
        
        XCTAssertEqual(2, shapes2.count)
    
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
        

        for shape in result {
            let (newShape,text) = ShapeCalculator.ToValidShape(shape: shape, words:words)
            //if text.contains("#") == false {
                //print(text)
            //}
        }
            //let edge = edges[items]
            //print(edge.ToText(words:words))
       
        
        
        XCTAssertEqual(1, result.count)
        
     
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
        
       
        XCTAssertEqual(2854550,wordMatches.count)
        print(gpuShapes.count)
        print(wordMatches.count)
        
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
        
        
        XCTAssertEqual(2854550,wordMatches.count)
        print(gpuShapes.count)
        print(wordMatches.count)
        
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
