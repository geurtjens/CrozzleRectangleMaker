//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 27/5/2023.
//

import Foundation
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
    public var queues: [Int:ShapeQueueModel] = [:]
    
    /// number of queues we allow in the game meaning the max number of words in any winning game
    public let maxQueues = 40
        
    /// Adding shapes that may have any number of words in them.  Here we split them into the different `stride` and add to appropriate queue.
    public func add(shapes: [ShapeModel]) {
        let dictionary = Dictionary(grouping: shapes, by: { $0.placements.count})
        
        for item in dictionary {
            let wordCount = item.key
            let shapes = item.value
            
            if var queue = self.queues[wordCount] {
                let filteredShapes = shapes.filter { $0.score >= queue.scoreMin }
            
                queue.shapes += filteredShapes
                ShapeCalculator.Sort(shapes: &queue.shapes)
                
                queue.gpuShapes = GpuShapeModel(shapes:queue.shapes, totalWords: queue.totalWords, stride: queue.stride)
                queue.statistics = StatisticsCalculator.Execute(scores: queue.gpuShapes.scores)
                
            }
        }
    }
    
    /// create a bunch of these queues and create the entire strucutre
    public init(words: [String], scoresMin:[Int], widthMax: Int, heightMax: Int) {
        let wordCount = words.count
        self.words = words
        self.wordCount = wordCount
        self.widthMax = widthMax
        self.heightMax = heightMax
        for i in 2..<maxQueues {
            self.queues[i] = ShapeQueueModel(shapes:[], stride:i, scoreMin: scoresMin[i], totalWords: words.count)
        }
    }
}
