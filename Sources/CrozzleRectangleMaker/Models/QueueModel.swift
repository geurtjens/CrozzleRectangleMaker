//
//  QueueModel.swift
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
    
    /// Which words are in which shapes, so if there are 91 words then there will be an index for each so we can quickly find matching shapes.
    public var wordIndex: [[Int]]
    
    
    
    
    /// adding a newly formed list of shapes into our collection adding their results to shapes, gpuShapes and updating the statistics
    public mutating func add(newShapes: [ShapeModel], constraints: ConstraintsModel, words: [String]) {

        let startTime = DispatchTime.now()
        self.shapes = ShapeCalculator.addShapes(oldShapes: self.shapes, newShapes: newShapes, scoreMin: self.scoreMin, constraints: constraints)
        let shapesDone = DispatchTime.now()
        self.gpuShapes = GpuShapeModel(shapes: self.shapes, totalWords: self.totalWords, stride: self.stride)
        let gpuShapesDone = DispatchTime.now()
        self.wordIndex = WordIndexCalculator.createWordIndex(
            totalWords: self.totalWords,
            stride: self.stride,
            shapeCount: self.gpuShapes.count,
            words: self.gpuShapes.wordId)
        let wordIndexDone = DispatchTime.now()
        if constraints.recalculateStatisticsWhenAddingToQueue {
            self.statistics = StatisticsCalculator.Execute(scores: self.gpuShapes.scores)
        }
        
        let totalNano = wordIndexDone.uptimeNanoseconds - startTime.uptimeNanoseconds
        let totalSeconds = Double(totalNano) / 1_000_000_000
        
        if totalSeconds > 1 {
            
            let addShapesNano = shapesDone.uptimeNanoseconds - startTime.uptimeNanoseconds
            let gpuShapesNano = gpuShapesDone.uptimeNanoseconds - shapesDone.uptimeNanoseconds
            let wordIndexNano = wordIndexDone.uptimeNanoseconds - gpuShapesDone.uptimeNanoseconds
            
            
            let addShapesSeconds = Double(addShapesNano) / 1_000_000_000
            let gpuShapesSeconds = Double(gpuShapesNano) / 1_000_000_000
            let wordIndexSeconds = Double(wordIndexNano) / 1_000_000_000
            
            print("Seconds Total: \(totalSeconds), addShapes: \(addShapesSeconds), gpuShapes: \(gpuShapesSeconds), wordIndex: \(wordIndexSeconds)")
        }
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
        
        self.wordIndex = WordIndexCalculator.createWordIndex(
            totalWords: totalWords,
            stride: stride,
            shapeCount: shapes.count,
            words: gpuShapes.wordId)
    }
    
    public func minScore() -> UInt16 {
        if shapes.count == 0 {
            return 0
        } else {
            var min = UInt16(9999)
            for score in gpuShapes.scores {
                if score < min {
                    min = score
                }
            }
            return min
        }
    }
    
    public func minScore(winningShape: ShapeModel, words: [String]) -> UInt16 {
        if shapes.count == 0 {
            return 0
        }
 
        var min = UInt16(9999)
        for shape in shapes {
            
            if shape.score < min {
                // Lets see if this shape is in the winning shape
                if SubsetShapeCalculator.IsSubset(shapeSmall: shape, shapeLarge: winningShape, words:words) {
                    min = shape.score
                }
            }
        }
        if min == 9999 {
            return 0
        }
        return min
    }
    
    public func printAllShapes(words: [String]) {
        print ("\(stride) words queue shapes")
        for shape in shapes {
            print(shape.ToString(words: words))
        }
    }
}
