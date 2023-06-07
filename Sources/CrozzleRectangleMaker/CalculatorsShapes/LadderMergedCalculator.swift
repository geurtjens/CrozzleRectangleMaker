//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 8/6/2023.
//

import Foundation
public class LadderMergedCalculator {
    
    public static func ExecuteLadder(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        let len = WordCalculator.lengths(words: words)
        let d2x2 = RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let shapes = ShapeCalculator.toShapes(rectangles: d2x2)
        
        let gpuShapes = GpuShapeModel(shapes: shapes, totalWords: words.count, stride: 4)
        
        var merged = ExecuteMergeWithSpecificNumberOfCommonWordsCalculator.ExecuteSameShape(matchingWordCount: 3,
            gpuShapes: gpuShapes, words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        ShapeCalculator.Sort(shapes: &merged)
        
        return merged
    }
    
    public static func Execute2x3And2x2(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        let len = WordCalculator.lengths(words: words)
        let d2x2 = RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let shapes2x2 = ShapeCalculator.toShapes(rectangles: d2x2)
        
        let gpuShapes2x2 = GpuShapeModel(shapes: shapes2x2, totalWords: words.count, stride: 4)
        
        let d2x3 = RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let shapes2x3 = ShapeCalculator.toShapes(rectangles: d2x3)
        
        let gpuShapes2x3 = GpuShapeModel(shapes: shapes2x3, totalWords: words.count, stride: 4)
        
        
        
        var merged = ExecuteMergeWithSpecificNumberOfCommonWordsCalculator.ExecuteTwoShapes(
            matchingWordCount: 1,
            gpuSource: gpuShapes2x2, gpuSearch: gpuShapes2x3, words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        ShapeCalculator.Sort(shapes: &merged)
        
        return merged
    }
}
