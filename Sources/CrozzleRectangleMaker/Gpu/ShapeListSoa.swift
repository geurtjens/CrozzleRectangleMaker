//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 2/2/2024.
//

import Foundation

/// This is an update to the original GpuShapeModel taking into account our new algorithms
public struct ShapeListSoa {
    
    /// The number of shapes contained within this structure
    public let count: Int
    
    /// The merge history of search shapes will always have only one value
    public let id: [UInt32]
    
    /// Width of each shape
    public let width: [UInt8]
    
    /// Height of each shape
    public let height: [UInt8]
    
    /// Score of each shape
    public let score: [UInt16]
    
    /// The number of words in each shape
    public let stride: [UInt8]
    
    // Now we have the items for each word in each shape so many more of these
    
    /// Location of where a word starts for the nth shape
    public let start: [Int32]
    public let end: [Int32]
    
    // The index to all words that exist in each shape,  each shape is sorted by word id increasing and where the first one has isHorizontal = true

    /// The index to the word that is in this shape
    public let w: [UInt8]

    /// The x position for the placed word
    public let x: [UInt8]
    
    /// The y position for the placed word
    public let y: [UInt8]
    
    /// Is this placement horizontal then its true else vertical is false
    public let z: [Bool]
    
    /// The length of each placed word
    public let l: [UInt8]
    
    public init(shapes: [ShapeModel]) {
        
        // Initialize all arrays to allocate the space
        var _id: [Int] = []
        var _width: [UInt8] = []
        var _height: [UInt8] = []
        var _score: [UInt16] = []
        var _stride: [UInt8] = []
        
        var _start: [Int] = []
        var _end: [Int] = []
        
        var _w: [UInt8] = []
        var _x: [UInt8] = []
        var _y: [UInt8] = []
        var _z: [Bool] = []
        var _l: [UInt8] = []
        
        for i in 0..<shapes.count {
            _id.append(i)
            _width.append(shapes[i].width)
            _height.append(shapes[i].height)
            _score.append(shapes[i].score)
            _stride.append(UInt8(shapes[i].placements.count))
            
            _start.append(Int(_w.count))
            
            for j in 0..<shapes[i].placements.count {
                _w.append(shapes[i].placements[j].w)
                _x.append(shapes[i].placements[j].x)
                _y.append(shapes[i].placements[j].y)
                _z.append(shapes[i].placements[j].z)
                _l.append(shapes[i].placements[j].l)
            }
            _end.append(_w.count - 1)
            
        }
        
        self.count = shapes.count
        
        self.id = _id
        self.width = _width
        self.height = _height
        self.score = _score
        self.stride = _stride
        
        self.start = _start
        self.end = _end
        
        // Here are the array of placements
        self.w = _w
        self.x = _x
        self.y = _y
        self.z = _z
        self.l = _l
        
    }
}
