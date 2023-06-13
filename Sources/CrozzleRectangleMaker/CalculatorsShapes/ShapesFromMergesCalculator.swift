//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 8/6/2023.
//

import Foundation
public class ShapesFromMergesCalculator {
    
    public static func Ladder2x2x2(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
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
    
    public static func LadderPacman(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        let len = WordCalculator.lengths(words: words)
        
        let square2x2 = RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let shapesSquare2x2 = ShapeCalculator.toShapesSorted(rectangles: square2x2)

        let gpuSquare2x2 = GpuShapeModel(shapes: shapesSquare2x2, totalWords: words.count, stride: 4)
        
        
        
        let squareBottomRight2x2 = RectangleCalculator.BottomRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax, heightMax: heightMax)
        
        let squareTopLeft2x2 = RectangleCalculator.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax, heightMax: heightMax)
        
        let squareTopRight2x2 = RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax, heightMax: heightMax)
        
        let squareOpen2x2 = squareBottomRight2x2 + squareTopLeft2x2 + squareTopRight2x2
        
        let shapesOpen2x2 = ShapeCalculator.toShapes(rectangles: squareOpen2x2)
        
        let gpuOpen2x2 = GpuShapeModel(shapes: shapesOpen2x2, totalWords: words.count, stride: 4)
        
        var merged = ExecuteMergeWithSpecificNumberOfCommonWordsCalculator.ExecuteTwoShapes(
            matchingWordCount: 3,
            gpuSource: gpuSquare2x2, gpuSearch: gpuOpen2x2, words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        ShapeCalculator.Sort(shapes: &merged)
        
        return merged
    }
    
    
    
    public static func LadderLadderPacman(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        let len = WordCalculator.lengths(words: words)
        
        let square2x2 = RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let shapesSquare2x2 = ShapeCalculator.toShapesSorted(rectangles: square2x2)
        
        let gpuSquare2x2 = GpuShapeModel(shapes: shapesSquare2x2, totalWords: words.count, stride: 4)
        
        var mergeStart = ExecuteMergeWithSpecificNumberOfCommonWordsCalculator.ExecuteSameShape(
            matchingWordCount: 3,
            gpuShapes: gpuSquare2x2,
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        ShapeCalculator.Sort(shapes: &mergeStart)
        
        let gpuMergeStart = GpuShapeModel(shapes: mergeStart, totalWords: words.count, stride: 5)
        
        
        // Next we get all the opens
        
//        let squareBottomRight2x2 = RectangleCalculator.BottomRightSquare(
//            interlockWidth: 2,
//            words: words,
//            lengths: len,
//            scoreMin: scoreMin,
//            widthMax: widthMax, heightMax: heightMax)
//        
//        let squareTopLeft2x2 = RectangleCalculator.TopLeftSquare(
//            interlockWidth: 2,
//            words: words,
//            lengths: len,
//            scoreMin: scoreMin,
//            widthMax: widthMax, heightMax: heightMax)
//        
//        let squareTopRight2x2 = RectangleCalculator.TopRightSquare(
//            interlockWidth: 2,
//            words: words,
//            lengths: len,
//            scoreMin: scoreMin,
//            widthMax: widthMax, heightMax: heightMax)
        
       // let squareOpen2x2 = squareBottomRight2x2 + squareTopLeft2x2 + squareTopRight2x2
        
        //let shapesOpen2x2 = ShapeCalculator.toShapes(rectangles: squareOpen2x2)
        
       // let gpuOpen2x2 = GpuShapeModel(shapes: shapesOpen2x2, totalWords: words.count, stride: 4)
        
        var merged = ExecuteMergeWithSpecificNumberOfCommonWordsCalculator.ExecuteTwoShapes(
            matchingWordCount: 3,
            gpuSource: gpuSquare2x2, gpuSearch: gpuMergeStart, words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        ShapeCalculator.Sort(shapes: &merged)
        
        return merged
    }
    
    
    
    public static func Glasses(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        let len = WordCalculator.lengths(words: words)
        
        let squareBottomRight2x2 = RectangleCalculator.BottomRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax, heightMax: heightMax)
        
        let squareTopLeft2x2 = RectangleCalculator.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax, heightMax: heightMax)
        
        let squareTopRight2x2 = RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax, heightMax: heightMax)
        
        let squareOpen2x2 = squareBottomRight2x2 + squareTopLeft2x2 + squareTopRight2x2
        
        let shapesOpen2x2 = ShapeCalculator.toShapes(rectangles: squareOpen2x2)
        
        let gpuOpen2x2 = GpuShapeModel(shapes: shapesOpen2x2, totalWords: words.count, stride: 4)
        
        var merged = ExecuteMergeWithSpecificNumberOfCommonWordsCalculator.ExecuteSameShape(
            matchingWordCount: 2,
            gpuShapes: gpuOpen2x2,
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        ShapeCalculator.Sort(shapes: &merged)
        
        return merged
    }
    
    public static func Glasses2(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        let len = WordCalculator.lengths(words: words)
        
        let squareTopLeft2x2 = RectangleCalculator.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax, heightMax: heightMax)
        
        let squareTopRight2x2 = RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax, heightMax: heightMax)
        
        
        
        let shapesTopLeft = ShapeCalculator.toShapesSorted(rectangles: squareTopLeft2x2)
        
        let shapesTopRight = ShapeCalculator.toShapesSorted(rectangles: squareTopRight2x2)
        
        let gpuTopLeft = GpuShapeModel(shapes: shapesTopLeft, totalWords: words.count, stride: 4)
        
        let gpuTopRight = GpuShapeModel(shapes: shapesTopRight, totalWords: words.count, stride: 4)
        
        var merged = ExecuteMergeWithSpecificNumberOfCommonWordsCalculator.ExecuteTwoShapes(
            matchingWordCount: 2,
            gpuSource: gpuTopLeft,
            gpuSearch: gpuTopRight,
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
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
