//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 27/5/2023.
//

import Foundation
/// contains all shape queues and so is a central repository of all known shapes
public struct ShapeQueueList {
    
    /// these are the words that are used in all processing.  They must say in the same order / sequence throughout the game
    public let words: [String]
    
    /// number of words in the words collection
    public let wordCount: Int
    
    /// when a shape is rendered as text, its width must be less than or equal to `widthMax` for it to comply with the games size.  Shapes can be flipped so the constraint is width x height or height x width
    public let widthMax: Int
    /// when a shape is rendered as text, its height must be less than or equal to `heightMax` for it to comply with the games size.  Shapes can be flipped so its width x height or height x width
    public let heightMax: Int
    
    /// all possible queue sizes that a game can handle, max of `maxQueues`
    public var queues: [ShapeQueueModel] = []
    
    /// number of queues we allow in the game meaning the max number of words in any winning game
    public let maxQueues = 40
        
    /// Adding shapes that may have any number of words in them.  Here we split them into the different `stride` and add to appropriate queue.
    public mutating func add(shapes: [ShapeModel]) {
        let dictionary = Dictionary(grouping: shapes, by: { $0.placements.count})
        
        for item in dictionary {
            let wordCount = item.key
            let shapes = item.value
            

            let filteredShapes = shapes.filter { $0.score >= self.queues[wordCount].scoreMin }
            
            self.queues[wordCount].shapes += filteredShapes
            
            ShapeCalculator.SortWithWordSequence(shapes: &self.queues[wordCount].shapes)
            
            let duplicates = RemoveDuplicatesCalculator.findDuplicates(shapes: &self.queues[wordCount].shapes)
            if duplicates > 0 {
                let duplicateList = self.queues[wordCount].shapes.filter { $0.isValid == false}
                for duplicate in duplicateList {
                    print(ShapeCalculator.ToText(shape:duplicate, words: words).1)
                    print(ShapeCalculator.ToText(shape:duplicate, words: words).0)
                }
                self.queues[wordCount].shapes = self.queues[wordCount].shapes.filter { $0.isValid}
            }
            
            self.queues[wordCount].gpuShapes = GpuShapeModel(shapes:self.queues[wordCount].shapes, totalWords: self.queues[wordCount].totalWords, stride: self.queues[wordCount].stride)
            self.queues[wordCount].statistics = StatisticsCalculator.Execute(scores: self.queues[wordCount].gpuShapes.scores)
        }
    }
    
    public mutating func mergeWithItselfAsync(wordCount: Int, words: [String], scoresMin:[Int], widthMax: Int, heightMax: Int) async {
        let shapes = await ExecuteMergeCalculator.ExecuteSameShapeAsync(shapes: self.queues[wordCount].gpuShapes, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
        if shapes.count > 0 {
            add(shapes: shapes)
        }
    }
    
    public mutating func mergeTwoAsync(mergeIndex: Int, withIndex mergeIndex2: Int, words: [String], scoresMin:[Int], widthMax: Int, heightMax: Int) async {
        let shapes = await ExecuteMergeCalculator.ExecuteDifferentShapesAsync(
            source: self.queues[mergeIndex].gpuShapes,
            search:self.queues[mergeIndex2].gpuShapes,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)

        if shapes.count > 0 {
            add(shapes: shapes)
        }
    }
    
    
    /// create a bunch of these queues and create the entire strucutre
    public init(words: [String], scoresMin:[Int], widthMax: Int, heightMax: Int) {
        let wordCount = words.count
        self.words = words
        self.wordCount = wordCount
        self.widthMax = widthMax
        self.heightMax = heightMax
        for i in 0..<maxQueues {
            queues.append(ShapeQueueModel(shapes:[], stride:i, scoreMin: scoresMin[i], totalWords: words.count))
        }
    }
}
