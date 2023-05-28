//
//  SplitShapesIntoWordCountCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 27/5/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class SplitShapesIntoWordCountCalculatorTests: XCTestCase {

    func test_Execute() async throws {
        let scoreMin = 0
        let widthMax = 17
        let heightMax = 12
        
        let words = WordData.words_8612()
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        let edges = EdgeCalculator.Execute(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let shapes1x1 = ShapeCalculator.toShape(fromEdges: edges)
        let c2x2 = ClusterCalculator.C2x2(
            start: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        let shapes2x2 = ShapeCalculator.toShape(fromClusters: c2x2)
        
        let gpu2x2 = GpuShapeModel(shapes: shapes2x2, totalWords: words.count, stride: 4)
        let gpu1x1 = GpuShapeModel(shapes: shapes1x1, totalWords: words.count, stride: 2)
        
        let scoresMin = [0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        
        let merged = await MergeCalculator.ExecuteDifferentShapesAsync(
            source: gpu1x1, search: gpu2x2, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
        
        let (wordCounts, wordCountedShapes) = SplitShapesIntoWordCountCalculator.Execute(strideA:2, strideB: 4, shapes: merged)
        
        XCTAssertEqual(1, wordCounts.count)
        XCTAssertEqual(5, wordCounts[0])
        
        XCTAssertEqual(1, wordCountedShapes.count)
        XCTAssertEqual(264014, wordCountedShapes[0].count)
        
        
    }
}
