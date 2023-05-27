//
//  GpuShapeModel.swift
//  
//
//  Created by Michael Geurtjens on 23/5/2023.
//

import Foundation
/// We are going to put all the placements from all shapes into this structure
public struct GpuShapeModel {
    /// The number of shapes contained within this structure
    public let count: Int
    /// The number of words in this list of shapes, so it acts like a stride as you go through the shapes for example 4 at a time if its a four word collection
    public let stride: Int
    /// List of widths and there will be one for each shape.  Not sure we need them
    public let widths: [UInt8]
    /// List of heights, not sure if we need them
    public let heights: [UInt8]
    /// List of scores for each shape
    public let scores: [UInt16]
    /// The word ids for each shape and they will be sorted by word id increasing
    public let wordId: [UInt8]
    /// Is this placement horizontal otherwise its vertical
    public let isHorizontal: [Bool]
    /// The x position for the placed word
    public let x: [UInt8]
    /// The y position for the placed word
    public let y: [UInt8]
    
    public let length: [UInt8]
    
    public let wordIndex: [[Int]]
    
    public init(shapes: [ShapeModel], totalWords: Int, wordCountInShapes: Int) {
        
        var shapes = shapes
        shapes.sort {
            if $0.score == $1.score {
                return $0.width * $0.height < $1.width * $1.height
            } else {
                return $0.score > $1.score
            }
        }
        
        
        let _shapeCount = shapes.count
        let _size = _shapeCount * wordCountInShapes

        // Initialize all arrays to allocate the space
        var _widths:  [UInt8] = Array(repeating:0, count:_shapeCount)
        var _heights: [UInt8] = Array(repeating: 0, count: _shapeCount)
        var _scores:  [UInt16] = Array(repeating: 0, count: _shapeCount)
        
        var _wordIds:[UInt8] = Array(repeating: 200, count: _size)
        var _isHorizontals:[Bool] = Array(repeating: true, count: _size )
        var _xs: [UInt8] = Array(repeating: 0, count: _size)
        var _ys: [UInt8] = Array(repeating: 0, count: _size)
        var _lengths: [UInt8] = Array(repeating: 0, count: _size)
       

        for i in 0..<shapes.count {
            let shape = shapes[i]
            _widths[i] = UInt8(shape.width)
            _heights[i] = UInt8(shape.height)
            _scores[i] = UInt16(shape.score)

            
            var placements = shape.placements
            placements.sort { $0.i < $1.i}
            
            for j in 0..<placements.count {
                let placement:PlacementModel = placements[j]
                
                let k = i * wordCountInShapes + j
                
                _wordIds[k] = UInt8(placement.i)
                _isHorizontals[k] = placement.h
                _xs[k] = UInt8(placement.x)
                _ys[k] = UInt8(placement.y)
                _lengths[k] = UInt8(placement.l)
            }
        }
        
        self.stride = wordCountInShapes
        self.count = _shapeCount
        self.widths = _widths
        self.heights = _heights
        self.scores = _scores
        
        // Here are the array of placements
        self.wordId = _wordIds
        self.isHorizontal = _isHorizontals
        self.x = _xs
        self.y = _ys
        self.length = _lengths
        
        // Lastly we want to know all words
        self.wordIndex = GpuShapeModel.createWordIndex(
            totalWords: totalWords,
            wordCountInShapes: wordCountInShapes,
            shapeCount: _shapeCount,
            words: _wordIds)
         
    }
        
    /// We want to find all the shapes for each word so we can easily identify what shapes to look through when we merge
    public static func createWordIndex(totalWords: Int, wordCountInShapes: Int, shapeCount: Int, words:[UInt8]) -> [[Int]] {
        var result: [[Int]] = Array(repeating: [], count: totalWords)
        var i = 0
        for shapeId in 0..<shapeCount {
            for _ in 0..<wordCountInShapes {
                let wordId = words[i]
                
                result[Int(wordId)].append(shapeId)
                i += 1
            }
        }
        return result
    }
}
