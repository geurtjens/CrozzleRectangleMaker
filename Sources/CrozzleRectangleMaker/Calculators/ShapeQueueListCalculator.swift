//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 29/5/2023.
//

import Foundation
public struct ShapeQueueListCalculator {
    public static func Execute(words: [String], scoresMin:[Int], widthMax: Int, heightMax: Int) async -> ShapeQueueList {
        let result = ShapeQueueList(words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
        
        let words2 = ShapeQueueListCalculator.get_2_word_shapes(
            words: words,
            scoreMin: scoresMin[2],
            widthMax: widthMax,
            heightMax: heightMax)
        
        result.add(shapes: words2)
        
        let words4 = await ShapeQueueListCalculator.get_4_word_shapes(
            words: words,
            scoreMin: scoresMin[4],
            widthMax: widthMax,
            heightMax: heightMax)
        
        result.add(shapes: words4)
        
        let words5 = ShapeQueueListCalculator.get_5_word_shapes(
            words: words,
            scoreMin: scoresMin[5],
            widthMax: widthMax,
            heightMax: heightMax)
        
        result.add(shapes: words5)
        
        let words6 = ShapeQueueListCalculator.get_6_word_shapes(
            words: words,
            scoreMin: scoresMin[6],
            widthMax: widthMax,
            heightMax: heightMax)
        
        result.add(shapes: words6)
        
        let words7 = ShapeQueueListCalculator.get_7_word_shapes(
            words: words,
            scoreMin: scoresMin[7],
            widthMax: widthMax,
            heightMax: heightMax)
        
        result.add(shapes: words7)
        
        let words8 = ShapeQueueListCalculator.get_8_word_shapes(
            words: words,
            scoreMin: scoresMin[8],
            widthMax: widthMax,
            heightMax: heightMax)
        
        result.add(shapes: words8)
        
        return result
    }
    
    public static func get_2_word_shapes(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        let edges = EdgeCalculator.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        let shapes = ShapeCalculator.toShapesSorted(edges: edges)
        
        return shapes
    }
    
    public static func get_4_word_shapes(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) async -> [ShapeModel] {
        let rectangles = await RectangleCalculator.Execute(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        let c2x2 = ClusterCalculator.C2x2(
            start: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
                                            
        let rectangleShapes = ShapeCalculator.toShapes(rectangles: rectangles)
        
        let clusterShapes = ShapeCalculator.toShapes(clusters: c2x2)
       
        var shapes = rectangleShapes + clusterShapes
        
        ShapeCalculator.Sort(shapes: &shapes)
        
        //let gpuShapes = GpuShapeModel(shapes:shapes, totalWords: words.count, wordCountInShapes: 4)
        
        return shapes
    }
    
    
    public static func get_5_word_shapes(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        let c2x3 = ClusterCalculator.C2x3(
            start: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let shapes = ShapeCalculator.toShapesSorted(clusters: c2x3)
        
        //let gpuShapes = GpuShapeModel(shapes:shapes, totalWords: words.count, wordCountInShapes: 5)
        
        return shapes //, gpuShapes)
    }
    
    public static func get_6_word_shapes(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        let c2x4 = ClusterCalculator.C2x4(
            start: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let c3x3 = ClusterCalculator.C3x3(
            start: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let clusterList = c2x4 + c3x3
        
        let shapes = ShapeCalculator.toShapesSorted(clusters: clusterList)
        
        //let gpuShapes = GpuShapeModel(shapes:shapes, totalWords: words.count, wordCountInShapes: 6)
        
        return shapes
    }
    
    public static func get_7_word_shapes(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        let c2x5 = ClusterCalculator.C2x5(
            start: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let c3x4 = ClusterCalculator.C3x4(
            start: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let clusterList = c2x5 + c3x4
        
        let shapes = ShapeCalculator.toShapesSorted(clusters: clusterList)
        
        //let gpuShapes = GpuShapeModel(shapes:shapes, totalWords: words.count, wordCountInShapes: 7)
        
        return shapes
    }
    
    
    public static func get_8_word_shapes(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        let c2x6 = ClusterCalculator.C2x6(
            start: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let c3x5 = ClusterCalculator.C3x5(
            start: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let clusterList = c2x6 + c3x5
        
        let shapes = ShapeCalculator.toShapesSorted(clusters: clusterList)
        
        //let gpuShapes = GpuShapeModel(shapes:shapes, totalWords: words.count, wordCountInShapes: 8)
        
        return shapes
    }
}
