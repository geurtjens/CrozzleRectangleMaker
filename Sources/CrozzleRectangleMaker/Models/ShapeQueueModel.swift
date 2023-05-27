//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 27/5/2023.
//

import Foundation
public struct ShapeQueueModel {
    public let totalWordCount: Int
    public let wordCountInShapes: Int
    
    public var minScore: Int
    public var shapes: [ShapeModel] = []
    public var index: GpuShapeModel
    
    public var statistics: [StatisticsModel] = []
    
    public mutating func add(shapes: [ShapeModel]){
        self.shapes += shapes
        self.shapes.sort() {
            if $0.score == $1.score {
                return $0.width * $0.height < $1.width * $1.height
            } else {
                return $0.score > $1.score
            }
        }
        index = GpuShapeModel(shapes: self.shapes, totalWords: self.totalWordCount, wordCountInShapes: self.wordCountInShapes)
        statistics = StatisticsCalculator.Execute(scores: index.scores)
    }
    
    public init(wordCount: Int, minScore: Int, totalWords: Int) {
        self.totalWordCount = wordCount
        self.wordCountInShapes = wordCount
        self.minScore = minScore
        self.index = GpuShapeModel(shapes:[], totalWords: totalWords, wordCountInShapes: wordCount)
    }
}
