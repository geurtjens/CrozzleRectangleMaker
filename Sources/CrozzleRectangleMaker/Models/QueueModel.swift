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
    
    
    // List of shapes that meet certain heuristics like score or score / area etc and we only merge off what is in here.
    // secondly we have a flag to say that merging has already been done so we dont merge it more than once.
    // thirdly when we add new items in here we check that its not already in here so cannot be added twice and that means the flag is not set to finished just yet.
    // We want the best of each heuristic and add them in but ofcourse each shape is not duplicated in here.
    public var shapesToSearchOn: [ShapeModel] = []
    
    /// stores the collection of shapes in the queue in the format of object of arrays which is faster to process
    public var gpuShapes: GpuShapeModel
    
    /// breakdown of scores in all the shapes so that we can decide only to use scores in the top 10% of the range of shapes we have selected
    public var statistics: [StatisticsModel] = []
    
    /// Which words are in which shapes, so if there are 91 words then there will be an index for each so we can quickly find matching shapes.
    public var wordIndex: [[Int]] = []
    
    
    //public var wordIndex2: [[WordIndexModel]] = []
    
    public var wordIndexV2: WordIndexModelV2
    
    /// Top percent of scores will merge from
    public var source_TopScorePercent: Float = 100.0

    /// Top percent of scores will merge to
    public var search_TopScorePercent: Float = 100.0

    /// Last position that will be merged from within the total list of shapes
    public var sourceMax: Int = 0

    /// Last position that will be merged to within the total list of shapes
    public var searchMax: Int = 0
    
    
    /// adding a newly formed list of shapes into our collection adding their results to shapes, gpuShapes and updating the statistics
    public mutating func add(newShapes: [ShapeModel], constraints: ConstraintsModel, words: [String]) {

        let startTime = DateTimeCalculator.now()
        self.shapes = ShapeCalculator.addShapes(oldShapes: self.shapes, newShapes: newShapes, scoreMin: self.scoreMin, constraints: constraints)
        let shapesDone = DateTimeCalculator.now()
        
        if FeatureFlags.mergeMethod == 1 {
            self.gpuShapes = GpuShapeModel(shapes: self.shapes, totalWords: self.totalWords, stride: self.stride)
        }
        let gpuShapesDone = DateTimeCalculator.now()
        
        if FeatureFlags.mergeMethod == 1 {
            
            self.wordIndex = WordIndexCalculator.createWordIndex(
                totalWords: self.totalWords,
                stride: self.stride,
                shapeCount: self.gpuShapes.count,
                words: self.gpuShapes.wordId)
            
        } else {
            self.wordIndexV2 = WordIndexModelV2(self.shapes, self.stride, self.totalWords)
        }
        let wordIndexDone = DateTimeCalculator.now()
        /// Calculating where the last position to merge should be for this queue
        if self.source_TopScorePercent < 100.0 || self.search_TopScorePercent < 100.0 {
            self.statistics = StatisticsCalculator.Execute(scores: self.gpuShapes.scores)
            if self.source_TopScorePercent < 100 {
                self.sourceMax = StatisticsCalculator.findLastSearchPosition(percentage: self.source_TopScorePercent, statistics: self.statistics)
            } else {
                self.sourceMax = self.gpuShapes.count
            }
            if self.search_TopScorePercent < 100 {
                self.searchMax = StatisticsCalculator.findLastSearchPosition(percentage: self.search_TopScorePercent, statistics: self.statistics)
            } else {
                self.searchMax = self.gpuShapes.count
            }
            
        } else {
            self.sourceMax = self.shapes.count
            self.searchMax = self.shapes.count
        }
        
        let totalSeconds = DateTimeCalculator.seconds(start: startTime, finish: wordIndexDone)
        
        if totalSeconds > 1 {
            let totalDuration = DateTimeCalculator.duration(start: startTime, finish: wordIndexDone)
            let addShapesDuration = DateTimeCalculator.duration(start: startTime, finish: shapesDone)
            let gpuShapesDuration = DateTimeCalculator.duration(start: shapesDone, finish: gpuShapesDone)
            let wordIndexDuration = DateTimeCalculator.duration(start: gpuShapesDone, finish: wordIndexDone)
            
            print("Total: \(totalDuration), addShapes: \(addShapesDuration), gpuShapes: \(gpuShapesDuration), wordIndex: \(wordIndexDuration)")
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
        self.wordIndexV2 = WordIndexModelV2(shapes, stride, totalWords)
        if FeatureFlags.mergeMethod == 1 {
        // The gpu shapes and statistics are derived from shapes
            let gpuShapes = GpuShapeModel(shapes: shapes, totalWords: totalWords, stride: stride)
            self.gpuShapes = gpuShapes
            self.statistics = StatisticsCalculator.Execute(scores: gpuShapes.scores)
        
        
            self.wordIndex = WordIndexCalculator.createWordIndex(
                totalWords: totalWords,
                stride: stride,
                shapeCount: shapes.count,
                words: gpuShapes.wordId)
        } else  {
            
               
            self.gpuShapes = GpuShapeModel()
        }
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
