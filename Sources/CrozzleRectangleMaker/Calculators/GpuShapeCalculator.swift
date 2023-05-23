//
//  GpuShapeCalculator.swift
//  
//
//  Created by Michael Geurtjens on 23/5/2023.
//

import Foundation
struct GpuShapeCalculator {
    
    public static func get_2_word_shapes(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> GpuShapeModel {
        let edges = EdgeCalculator.Execute(words: words, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        var shapes = toShapes(edges: edges)
        
        shapes.sort {
            if $0.score == $1.score {
                return $0.width * $0.height < $1.width * $1.height
            } else {
                return $0.score > $1.score
            }
        }
        
        // Now we can store the record
        let result = GpuShapeModel(shapes:shapes, wordCount: 2)
        return result
    }
    
    public static func get_4_word_shapes(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) async -> GpuShapeModel {
        let rectangles = await RectangleCalculator.Execute(
            words: words,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        let c2x2 = ClusterCalculator.C2x2(
            start: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
                                            
        
        
        
        let rectangleShapes = toShapes(rectangles: rectangles)
        
        let clusterShapes = toShapes(clusters: c2x2)
       
        var shapes = rectangleShapes + clusterShapes
        
        shapes.sort {
            if $0.score == $1.score {
                return $0.width * $0.height < $1.width * $1.height
            } else {
                return $0.score > $1.score
            }
        }
        
        // Now we can store the record
        let result = GpuShapeModel(shapes:shapes, wordCount: 4)
        return result
        
        
    }
    
    
    public static func get_5_word_shapes(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> GpuShapeModel {
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        let c2x3 = ClusterCalculator.C2x3(
            start: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        var shapes = toShapes(clusters: c2x3)
        
        shapes.sort {
            if $0.score == $1.score {
                return $0.width * $0.height < $1.width * $1.height
            } else {
                return $0.score > $1.score
            }
        }
        
        // Now we can store the record
        let result = GpuShapeModel(shapes:shapes, wordCount: 5)
        return result
    }
    
    public static func get_6_word_shapes(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> GpuShapeModel {
        
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
        
        var shapes = toShapes(clusters: clusterList)
        
        shapes.sort {
            if $0.score == $1.score {
                return $0.width * $0.height < $1.width * $1.height
            } else {
                return $0.score > $1.score
            }
        }
        
        // Now we can store the record
        let result = GpuShapeModel(shapes:shapes, wordCount: 6)
        return result
    }
    
    public static func get_7_word_shapes(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> GpuShapeModel {
        
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
        
        var shapes = toShapes(clusters: clusterList)
        
        shapes.sort {
            if $0.score == $1.score {
                return $0.width * $0.height < $1.width * $1.height
            } else {
                return $0.score > $1.score
            }
        }
        
        // Now we can store the record
        let result = GpuShapeModel(shapes:shapes, wordCount: 7)
        return result
    }
    
    
    public static func get_8_word_shapes(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> GpuShapeModel {
        
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
        
        var shapes = toShapes(clusters: clusterList)
        
        shapes.sort {
            if $0.score == $1.score {
                return $0.width * $0.height < $1.width * $1.height
            } else {
                return $0.score > $1.score
            }
        }
        
        // Now we can store the record
        let result = GpuShapeModel(shapes:shapes, wordCount: 8)
        return result
    }
    
    
    
    
    public static func toShapes(edges: [EdgeModel]) -> [ShapeModel] {
        var shapes:[ShapeModel] = []
        for edge in edges {
            let shape = edge.ToShape()
            shapes.append(shape)
        }
        return shapes
    }
    
    public static func toShapes(clusters: [ClusterMakerModel]) -> [ShapeModel] {
        var shapes:[ShapeModel] = []
        for cluster in clusters {
            let shape = cluster.ToShape()
            shapes.append(shape)
        }
        return shapes
    }
    
    public static func toShapes(rectangles: [RectangleModel]) -> [ShapeModel] {
        var shapes:[ShapeModel] = []
        for rectangle in rectangles {
            let shape = rectangle.ToShape()
            shapes.append(shape)
        }
        return shapes
    }
}
