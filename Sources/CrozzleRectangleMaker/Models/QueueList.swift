//
//  QueueList.swift
//  
//
//  Created by Michael Geurtjens on 27/5/2023.
//

import Foundation
/// contains all shape queues and so is a central repository of all known shapes
public struct QueueList {
    
    public let game: GameModel
    
    
    /// all possible queue sizes that a game can handle, max of `maxQueues`
    public var queues: [QueueModel] = []
    
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
                    print(ShapeCalculator.ToText(shape:duplicate, words: self.game.words()).1)
                    print(ShapeCalculator.ToText(shape:duplicate, words: self.game.words()).0)
                }
                self.queues[wordCount].shapes = self.queues[wordCount].shapes.filter { $0.isValid}
            }
            
            self.queues[wordCount].gpuShapes = GpuShapeModel(shapes:self.queues[wordCount].shapes, totalWords: self.queues[wordCount].totalWords, stride: self.queues[wordCount].stride)
            self.queues[wordCount].statistics = StatisticsCalculator.Execute(scores: self.queues[wordCount].gpuShapes.scores)
        }
    }
    
    public mutating func mergeWithItselfAsync(
        wordCount: Int,
        words: [String],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int) async {
            
        let shapes = await ExecuteMergeCalculator.ExecuteSameShapeAsync(shapes: self.queues[wordCount].gpuShapes, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
        if shapes.count > 0 {
            add(shapes: shapes)
        }
    }
    
    /// Perform the merge on yourself but do not let the `notTheseWordCounts` count of words to be included.  So merge 3 words with 3 words and ignore the 4 word, only include the 5 word shapes
    public mutating func mergeWithItselfAsync(
        wordCount: Int,
        words: [String],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int,
        notTheseWordCounts:[Int]) async {
            
        let shapes = await ExecuteMergeCalculator.ExecuteSameShapeAsync(shapes: self.queues[wordCount].gpuShapes, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
        if shapes.count > 0 {
            var filteredShapes: [ShapeModel] = []
            let dictionary = Dictionary(grouping: shapes, by: { $0.placements.count})
            for item in dictionary {
                if notTheseWordCounts.contains(item.key) == false {
                    filteredShapes += item.value
                }
            }
            
            add(shapes: filteredShapes)
        }
    }
    
    public mutating func mergeTwoAsync(
        mergeIndex: Int,
        withIndex mergeIndex2: Int,
        words: [String],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int) async {
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
    
    public mutating func mergeTwoAsync(
        mergeIndex: Int,
        withIndex mergeIndex2: Int,
        words: [String],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int,
        notTheseWordCounts:[Int]) async {
        let shapes = await ExecuteMergeCalculator.ExecuteDifferentShapesAsync(
            source: self.queues[mergeIndex].gpuShapes,
            search:self.queues[mergeIndex2].gpuShapes,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)

        if shapes.count > 0 {
            
            var filteredShapes: [ShapeModel] = []
            let dictionary = Dictionary(grouping: shapes, by: { $0.placements.count})
            for item in dictionary {
                if notTheseWordCounts.contains(item.key) == false {
                    filteredShapes += item.value
                }
            }
            
            add(shapes: filteredShapes)
        }
    }
    
    
    /// create a bunch of these queues and create the entire strucutre
    public init(game: GameModel, scoresMin:[Int]) {
        let wordCount = game.words().count
        
        self.game = game
        
        for i in 0..<maxQueues {
            queues.append(QueueModel(shapes:[], stride:i, scoreMin: scoresMin[i], totalWords: wordCount))
        }
    }
}
