//
//  MergeCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 24/5/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class ExecuteMergeCalculatorTests: XCTestCase {

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
        
        let shapes = QueueListCalculator.get_2_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let (gpuShapes, wordIndex) = GpuShapeModelCalculator.Create(shapes: shapes, totalWords: words.count, stride: 2)
        
        let scoresMin = [0, 10, 22, 33, 44, 55, 66, 77, 88, 99, 100]
        
        let merged = ExecuteMergeCalculator.ExecuteSameShape(
            sourceShapes:gpuShapes,
            wordIndex: wordIndex,
            searchMax: gpuShapes.count,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        
        // Interesting that we can have different numbers depending on the arrangement of words
        for shape in merged {
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
        
        let shapes = QueueListCalculator.get_2_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let scoresMin = [0, 10, 22, 33, 44, 55, 66, 77, 88, 99, 100]
        
        let (gpuShapes, wordIndex) = GpuShapeModelCalculator.Create(shapes: shapes, totalWords: words.count, stride: 2)
        
        let merged = ExecuteMergeCalculator.ExecuteSameShape(
            sourceShapes: gpuShapes,
            wordIndex: wordIndex,
            searchMax: gpuShapes.count,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        XCTAssertEqual(3, merged.count)
        
        for shape in merged {
            print(ShapeCalculator.ToText(shape: shape, words: words).0)
        }
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
        
        let shapes = QueueListCalculator.get_2_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let scoresMin = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        let (gpuShapes, wordIndex) = GpuShapeModelCalculator.Create(shapes:shapes,totalWords: words.count, stride:2)
        
        let merged = ExecuteMergeCalculator.ExecuteSameShape(
            sourceShapes:gpuShapes,
            wordIndex: wordIndex,
            searchMax: gpuShapes.count,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)

        XCTAssertEqual(3, merged.count)
    }
        
    
    func test_EdgesAllAsync() async throws {
        
        let shapes = QueueListCalculator.get_2_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let scoresMin = [0, 0, 0, 104, 0, 0, 0, 0, 0, 0, 0]

        let (gpuShapes, wordIndex) = GpuShapeModelCalculator.Create(shapes:shapes,totalWords: words.count, stride:2)

        let merged = await ExecuteMergeCalculator.ExecuteSameShapeAsync(
            shapes:gpuShapes,
            wordIndex: wordIndex,
            sourceMax: gpuShapes.count,
            searchMax: gpuShapes.count,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let statistics = StatisticsCalculator.Execute(shapes: merged)
        
        print(statistics)
        
        // with all words it was XCTAssertEqual(347, merged.count) //2_837_626 // with 54 there where 24191 but now 53834 in 72 seconds
        XCTAssertEqual(63, merged.count)
        print(merged.count)
        print(shapes.count)
    }
    
    
    func test_EdgesAll() throws {
        
        let shapes = QueueListCalculator.get_2_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let scoresMin = [0, 0, 0, 104, 0, 0, 0, 0, 0, 0, 0]
        
        let (gpuShapes, wordIndex) = GpuShapeModelCalculator.Create(shapes:shapes,totalWords: words.count, stride:2)
        
        let merged = ExecuteMergeCalculator.ExecuteSameShape(
            sourceShapes:gpuShapes,
            wordIndex: wordIndex,
            searchMax: gpuShapes.count,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let histogram = StatisticsCalculator.Execute(shapes: merged)
        print(histogram)
       
        // with all words there are XCTAssertEqual(347, merged.count) //2837626 // with 54 there where 24191
        XCTAssertEqual(63, merged.count)
        print(shapes.count)
        print(merged.count)
    }
    
    
    func test_Edges() throws {
        
        var edges = EdgeCalculator.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax, wordsMax: wordsMax)
        
        edges.sort {
            if $0.score == $1.score {
                return $0.width * $0.height < $1.width * $1.height
            } else {
                return $0.score > $1.score
            }
        }
        
        let shapes = QueueListCalculator.get_2_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let (gpuShapes, wordIndex) = GpuShapeModelCalculator.Create(shapes:shapes, totalWords: words.count, stride:2)
        
        let scoresMin = [0, 10, 22, 33, 44, 55, 66, 77, 88, 99, 100]
        
        let merged = ExecuteMergeCalculator.ExecuteSameShape(
            sourceShapes: gpuShapes,
            wordIndex: wordIndex,
            searchMax: gpuShapes.count,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        // There are 301 likely matches between the first and all other shapes
        // with all words it is XCTAssertEqual(1641783, merged.count)
        XCTAssertEqual(6111, merged.count)
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
        let wordsMax = WordData.winningWordsCount_8806
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        print("calculating 2x2 starting at \(Date.now)")
        let c2x2 = ClusterCalculator.C2x2(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        
        let c2x2Shapes = ShapeCalculator.toShape(fromClusters: c2x2)
        
        print("\(c2x2.count) c2x2 found finishing at \(Date.now)")
        
        
        let c2x3 = ClusterCalculator.C2x3(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let c2x3Shapes = ShapeCalculator.toShape(fromClusters: c2x3)
        
        print("\(c2x3.count) c2x3 found finishing at \(Date.now)")
        let c2x2Gpu = GpuShapeModel(shapes: c2x2Shapes, totalWords: words.count, stride: 4)
        print("initialised c2x2Gpu finishing at \(Date.now)")
        let (c2x3Gpu, wordIndex) = GpuShapeModelCalculator.Create(shapes: c2x3Shapes, totalWords: words.count, stride: 5)
        print("initialised c2x3Gpu finishing at \(Date.now)")
        
        let scoresMin = Array(repeating: 104, count: 20)
        
        print("merge starting at \(Date.now)")
        let shapes = ExecuteMergeCalculator.ExecuteDifferentShapes(
            sourceShapes: c2x2Gpu,
            searchShapes:c2x3Gpu,
            searchWordIndex: wordIndex,
            sourceMax: c2x2Gpu.count,
            searchMax: c2x3Gpu.count,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        print("merge produced \(shapes.count) shapes, merged finished at \(Date.now)")
        // takes 509 minutes without async
        // when its all words its XCTAssertEqual(891360, shapes.count)
        XCTAssertEqual(20, shapes.count)
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
        let wordsMax = WordData.winningWordsCount_8806
        let words = WordData.words_8806()
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        let c2x2 = ClusterCalculator.C2x2(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let c2x2Shapes = ShapeCalculator.toShape(fromClusters: c2x2)

        let c2x3 = ClusterCalculator.C2x3(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let c2x3Shapes = ShapeCalculator.toShape(fromClusters: c2x3)
        let source = GpuShapeModel(shapes: c2x2Shapes, totalWords: words.count, stride: 4)
        let (search, wordIndex) = GpuShapeModelCalculator.Create(shapes: c2x3Shapes, totalWords: words.count, stride: 5)
   
        let scoresMin = Array(repeating: 104, count: 20)
        
        let shapes = await ExecuteMergeCalculator.ExecuteDifferentShapesAsync(
            source: source,
            search:search,
            searchWordIndex: wordIndex,
            sourceMax: source.count,
            searchMax: search.count,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
      
        // 89.5 seconds runtime. used to be 140 when we didnt cut short the shape text looking for #
        
        // with the new thing it took 62 seconds but it stripped out and returned 352,825
        XCTAssertEqual(20, shapes.count)
       
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
            words: words,
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
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let c2x3Shapes = ShapeCalculator.toShape(fromClusters: c2x3)
        let (C2x3Text,C2x3Score) = ShapeCalculator.ToText(shape:c2x3Shapes[0], words: words)
        print("Shape B score: \(C2x3Score)")
        print(C2x3Text)
        
        let source = GpuShapeModel(shapes: c2x2Shapes, totalWords: words.count, stride: 4)
        let (search, wordIndex) = GpuShapeModelCalculator.Create(shapes: c2x3Shapes, totalWords: words.count, stride: 5)
        
        let scoresMin = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        let shapes = ExecuteMergeCalculator.ExecuteDifferentShapes(
            sourceShapes: source,
            searchShapes:search,
            searchWordIndex: wordIndex,
            sourceMax: source.count,
            searchMax: search.count,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        XCTAssertEqual(1, shapes.count)
        let shape = shapes[0]
        
        let expectedText = " .  .   \n S .G   \n T.BUOY.\n.AHOY.  \n.YAW.   \n .W.    \n  S     \n  E     \n  R     \n  .     "
        //"   ..     \n.STAY.    \n  .HAWSER.\n .BOW.    \n.GUY.     \n  O.      \n  Y       \n  .       "
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
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: 0)
        
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
        
        let (gpuShapes, wordIndex) = GpuShapeModelCalculator.Create(shapes: shapes, totalWords:words.count, stride: 4)
        
        let scoresMin = [0, 10, 22, 33, 44, 55, 66, 77, 88, 99, 100]
        
        let shapes2 = ExecuteMergeCalculator.ExecuteSameShape(
            sourceShapes:gpuShapes,
            wordIndex: wordIndex,
            searchMax: gpuShapes.count,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        XCTAssertEqual(0, shapes2.count)
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
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: 0)
        
        XCTAssertEqual(2, items.count)
        
        let a = items[0].ToShape()
        let b = items[1].ToShape()
        
        let c = ShapeCalculator.Flip(shape: b)
        
        let shapes = [a, c]
        
        let (gpuShapes, wordIndex) = GpuShapeModelCalculator.Create(shapes: shapes, totalWords:words.count, stride: 4)
        
        let scoresMin = [0, 10, 22, 33, 44, 55, 66, 77, 88, 99, 100]
        
        let result = ExecuteMergeCalculator.ExecuteSameShape(
            sourceShapes:gpuShapes,
            wordIndex: wordIndex,
            searchMax: gpuShapes.count,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        XCTAssertEqual(0, result.count)
    }
    
    
    func test_RectangleOne() async throws {
        
        let shapes = await QueueListCalculator.get_4_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        print("found: \(shapes.count) RectangleOne")
        let (gpuShapes, wordIndex) = GpuShapeModelCalculator.Create(shapes: shapes, totalWords:words.count, stride: 4)
        
        let scoresMin:[Int] = Array(repeating: 104, count: 20)  //[0, 10, 22, 33, 44, 55, 66, 77, 88, 99, 100]
        
        let merged = await ExecuteMergeCalculator.ExecuteSameShapeAsync(
            shapes:gpuShapes,
            wordIndex: wordIndex,
            sourceMax: gpuShapes.count,
            searchMax: gpuShapes.count,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        // with all words it was XCTAssertEqual(2854550,merged.count)
        // now it takes only 20 seconds rather than hours
        XCTAssertEqual(149_511,merged.count)
        print(gpuShapes.count)
        print(merged.count)
    }
    
    
    func test_RectangleAll() async throws {

        let shapes = await QueueListCalculator.get_4_word_shapes(
            words: words,
            scoreMin: 104,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        print("Shapes found:\(shapes.count) at \(Date.now)")
        let (gpuShapes, wordIndex) = GpuShapeModelCalculator.Create(shapes: shapes, totalWords:words.count, stride: 4)
        print("gpuShapes finished at \(Date.now)")
        let scoresMin:[Int] = Array(repeating: 0, count: 20)
        let wordsInt = WordCalculator.WordsToInt(words: words)
        let mergedShapes = await ExecuteMergeCalculator.ExecuteSameShapeAsync(
            shapes:gpuShapes,
            wordIndex: wordIndex,
            sourceMax: gpuShapes.count,
            searchMax: gpuShapes.count,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        // When scoreMin is 104 it creates 24,802 shapes yeilding 1,653,937 merged shapes in 887 seconds which is around 15 minutes.
        
        // It started with 1624 but I think it found many duplicates as we ended up with only 1082 left over
        XCTAssertEqual(1493,mergedShapes.count)
        print(gpuShapes.count)
        print(mergedShapes.count)
    }
    
    /// standard values for all tests
    let wordsMax = WordData.winningWordsCount_8612
    var wordsInt: [[Int]]
    let widthMax = 17
    let heightMax = 12
    let scoreMin = 0
    var words:[String] = []
    var lengths: [Int] = []
    override init() {
        
        words = WordData.words_8612()
        wordsInt = WordCalculator.WordsToInt(words: words)
        lengths = WordCalculator.lengths(words: words)
        super.init()
    }
//    override func setUpWithError() throws {
//        words = WordData.words_8612()
//        wordsInt = WordCalculator.WordsToInt(words: words)
//        lengths = WordCalculator.lengths(words: words)
//    }
}
