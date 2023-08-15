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
    
    /// length of each word in the wordlist
    public let length: [UInt8]
    
    public init(shapes: [ShapeModel], totalWords: Int) {
        let shape = shapes[0]
        let stride = shape.placements.count
        self.init(shapes:shapes, totalWords: totalWords, stride: stride)
    }
    
    public init () {
        self.count = 0
        self.stride = 0
        self.widths = []
        self.heights = []
        self.scores = []
        self.wordId = []
        self.isHorizontal = []
        self.y = []
        self.x = []
        self.length = []
    }
    public init(shapes: [ShapeModel], totalWords: Int, stride: Int) {
        
        if shapes.count > 0 && shapes[0].placements.count != stride {
            print("ERROR HERE IN GPU SHAPE MODEL")
        }
        
        let _shapeCount = shapes.count
        let _size = _shapeCount * stride

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
            placements.sort { $0.w < $1.w}
            
            for j in 0..<placements.count {
                let placement:PlacementModel = placements[j]
                
                let k = i * stride + j
                
                _wordIds[k] = UInt8(placement.w)
                _isHorizontals[k] = placement.z
                _xs[k] = UInt8(placement.x)
                _ys[k] = UInt8(placement.y)
                _lengths[k] = UInt8(placement.l)
            }
        }
        
        self.stride = stride
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
        
    }
    
    public func getItem(shapePosition: Int) -> ([UInt8], [Bool], [UInt8], [UInt8]){
        
        var wordId: [UInt8] = []
        var isHorizontal: [Bool] = []
        var x: [UInt8] = []
        var y: [UInt8] = []
        
        let startPos = shapePosition * self.stride
        
        for i in 0..<self.stride {
            let j = startPos + i
            wordId.append(self.wordId[j])
            isHorizontal.append(self.isHorizontal[j])
            x.append(self.x[j])
            y.append(self.y[j])
        }
        return (wordId, isHorizontal, x, y)
    }
}
