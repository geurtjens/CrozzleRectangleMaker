//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 27/5/2023.
//

import Foundation

/// A collection of all shapes that have `stride` number of words
public struct QueueModel {
    
    /// total number of words in the word list that we are processing
    public let totalWords: Int
    
    /// number of words that are in each shape.  So a queue
    public let stride: Int
    
    /// minimum score for a shape within the list
    public var scoreMin: Int
    
    /// a list of valid shapes where each shape is made up of `stride` number of words.
    public var shapes: [ShapeModel] = []
    
    /// stores the collection of shapes in the queue in the format of object of arrays which is faster to process
    public var gpuShapes: GpuShapeModel
    
    /// breakdown of scores in all the shapes so that we can decide only to use scores in the top 10% of the range of shapes we have selected
    public var statistics: [StatisticsModel] = []
    
    /// adding a newly formed list of shapes into our collection adding their results to shapes, gpuShapes and updating the statistics
    public mutating func add(shapes: [ShapeModel]) {
        self.shapes += shapes
        self.shapes.sort() {
            if $0.score == $1.score {
                return $0.width * $0.height < $1.width * $1.height
            } else {
                return $0.score > $1.score
            }
        }
        self.gpuShapes = GpuShapeModel(shapes: self.shapes, totalWords: self.totalWords, stride: self.stride)
        self.statistics = StatisticsCalculator.Execute(scores: self.gpuShapes.scores)
    }
    
    /// Changes minimum score of the queue and if the queue already contains shapes that are lower than min socre then they will be removed
    public mutating func update(scoreMin: Int) {
        if self.scoreMin > scoreMin {
            /// will have to delete some of our records
            self.shapes = self.shapes.filter { $0.score >= scoreMin }
            self.gpuShapes = GpuShapeModel(shapes: self.shapes, totalWords: self.totalWords, stride: self.stride)
            self.statistics = StatisticsCalculator.Execute(scores: self.gpuShapes.scores)
        }
        self.scoreMin = scoreMin
    }
    
    /// Creating a new shape queue model based on an original set of shapes
    public init(shapes: [ShapeModel], stride: Int, scoreMin: Int, totalWords: Int) {
        self.totalWords = totalWords
        self.stride = stride
        self.scoreMin = scoreMin
        self.shapes = shapes
        
        // The gpu shapes and statistics are derived from shapes
        let gpuShapes = GpuShapeModel(shapes: shapes, totalWords: totalWords, stride: stride)
        self.gpuShapes = gpuShapes
        self.statistics = StatisticsCalculator.Execute(scores: gpuShapes.scores)
    }
    
    
}
