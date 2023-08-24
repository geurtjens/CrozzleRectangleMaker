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
        let d2x2 = RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let shapes = ShapeCalculator.toShapes(rectangles: d2x2)
        
        let (sourceShapes, wordIndex) = GpuShapeModelCalculator.Create(shapes: shapes, totalWords: words.count, stride: 4)
        
        var merged = ExecuteMergeWithSpecificNumberOfCommonWordsCalculator.ExecuteSameShape(
                matchingWordCount: 3,
                sourceShapes: sourceShapes,
                wordIndex: wordIndex,
                words: words,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
        
        ShapeCalculator.Sort(shapes: &merged)
        
        return merged
    }
    
    public static func LadderPacman(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        let len = WordCalculator.lengths(words: words)
        
        let square2x2 = RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let shapesSquare2x2 = ShapeCalculator.toShapesSorted(rectangles: square2x2)

        let gpuSquare2x2 = GpuShapeModel(shapes: shapesSquare2x2, totalWords: words.count, stride: 4)
        
        
        
        let squareBottomRight2x2 = RectangleCalculatorV1.BottomRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax, heightMax: heightMax)
        
        let squareTopLeft2x2 = RectangleCalculatorV1.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax, heightMax: heightMax)
        
        let squareTopRight2x2 = RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax, heightMax: heightMax)
        
        let squareOpen2x2 = squareBottomRight2x2 + squareTopLeft2x2 + squareTopRight2x2
        
        let shapesOpen2x2 = ShapeCalculator.toShapes(rectangles: squareOpen2x2)
        
        let (gpuSearch, wordIndex) = GpuShapeModelCalculator.Create(shapes: shapesOpen2x2, totalWords: words.count, stride: 4)
      
        var merged = ExecuteMergeWithSpecificNumberOfCommonWordsCalculator.ExecuteTwoShapes(
                matchingWordCount: 3,
                sourceShapes: gpuSquare2x2,
                searchShapes: gpuSearch,
                searchWordIndex: wordIndex,
                words: words,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
        
        ShapeCalculator.Sort(shapes: &merged)
        
        return merged
    }
    
    
    
    public static func LadderLadderPacman(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        let len = WordCalculator.lengths(words: words)
        
        let square2x2 = RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let shapesSquare2x2 = ShapeCalculator.toShapesSorted(rectangles: square2x2)
        
        let (gpuShapes, wordIndex) = GpuShapeModelCalculator.Create(shapes: shapesSquare2x2, totalWords: words.count, stride: 4)
        
        var mergeStart = ExecuteMergeWithSpecificNumberOfCommonWordsCalculator.ExecuteSameShape(
            matchingWordCount: 3,
            sourceShapes: gpuShapes,
            wordIndex: wordIndex,
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        ShapeCalculator.Sort(shapes: &mergeStart)
        
        let gpuMergeStart = GpuShapeModel(shapes: mergeStart, totalWords: words.count, stride: 5)
        let gpuMergeStartWordIndex = WordIndexCalculator.createWordIndex(totalWords: words.count, stride: gpuMergeStart.stride, shapeCount: gpuMergeStart.count, words: gpuMergeStart.wordId)
        var merged = ExecuteMergeWithSpecificNumberOfCommonWordsCalculator.ExecuteTwoShapes(
            matchingWordCount: 3,
            sourceShapes: gpuShapes,
            searchShapes: gpuMergeStart,
            searchWordIndex: gpuMergeStartWordIndex,
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        ShapeCalculator.Sort(shapes: &merged)
        
        return merged
    }
    
    
    
    public static func Glasses(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        let len = WordCalculator.lengths(words: words)
        
        let squareBottomRight2x2 = RectangleCalculatorV1.BottomRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax, heightMax: heightMax)
        
        let squareTopLeft2x2 = RectangleCalculatorV1.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax, heightMax: heightMax)
        
        let squareTopRight2x2 = RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax, heightMax: heightMax)
        
        let squareOpen2x2 = squareBottomRight2x2 + squareTopLeft2x2 + squareTopRight2x2
        
        let shapesOpen2x2 = ShapeCalculator.toShapes(rectangles: squareOpen2x2)
        
        let (gpuOpen2x2, wordIndex) = GpuShapeModelCalculator.Create(shapes: shapesOpen2x2, totalWords: words.count, stride: 4)
        
        var merged = ExecuteMergeWithSpecificNumberOfCommonWordsCalculator.ExecuteSameShape(
            matchingWordCount: 2,
            sourceShapes: gpuOpen2x2,
            wordIndex: wordIndex,
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        ShapeCalculator.Sort(shapes: &merged)
        
        return merged
    }
    
    public static func Glasses2(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        let len = WordCalculator.lengths(words: words)
        
        let squareTopLeft2x2 = RectangleCalculatorV1.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax, heightMax: heightMax)
        
        let squareTopRight2x2 = RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax, heightMax: heightMax)
        
        
        
        let shapesTopLeft = ShapeCalculator.toShapesSorted(rectangles: squareTopLeft2x2)
        
        let shapesTopRight = ShapeCalculator.toShapesSorted(rectangles: squareTopRight2x2)
        
        let gpuTopLeft = GpuShapeModel(shapes: shapesTopLeft, totalWords: words.count, stride: 4)
        
        let (gpuTopRight, wordIndex) = GpuShapeModelCalculator.Create(shapes: shapesTopRight, totalWords: words.count, stride: 4)
        
        var merged = ExecuteMergeWithSpecificNumberOfCommonWordsCalculator.ExecuteTwoShapes(
            matchingWordCount: 2,
            sourceShapes: gpuTopLeft,
            searchShapes: gpuTopRight,
            searchWordIndex: wordIndex,
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        ShapeCalculator.Sort(shapes: &merged)
        
        return merged
    }
    public static func Execute2x3And2x2(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        let len = WordCalculator.lengths(words: words)
        let d2x2 = RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let shapes2x2 = ShapeCalculator.toShapes(rectangles: d2x2)
        
        let gpuShapes2x2 = GpuShapeModel(shapes: shapes2x2, totalWords: words.count, stride: 4)
        
        let d2x3 = RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let shapes2x3 = ShapeCalculator.toShapes(rectangles: d2x3)
        
        let (gpuShapes2x3, wordIndex) = GpuShapeModelCalculator.Create(shapes: shapes2x3, totalWords: words.count, stride: 4)
        
        
        
        var merged = ExecuteMergeWithSpecificNumberOfCommonWordsCalculator.ExecuteTwoShapes(
                matchingWordCount: 1,
                sourceShapes: gpuShapes2x2,
                searchShapes: gpuShapes2x3,
                searchWordIndex: wordIndex,
                words: words,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
        
        ShapeCalculator.Sort(shapes: &merged)
        
        return merged
    }
}
