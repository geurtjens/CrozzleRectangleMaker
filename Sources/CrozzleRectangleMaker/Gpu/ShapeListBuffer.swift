//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 2/2/2024.
//

import Foundation
import MetalKit
public struct ShapeListBuffer {
    
    public let id: MTLBuffer // [UInt32]
    
    /// Width of each shape
    public let width: MTLBuffer // [UInt8]
    
    /// Height of each shape
    public let height: MTLBuffer // [UInt8]
    
    /// Score of each shape
    public let score: MTLBuffer //[UInt16]
    
    /// The number of words in each shape
    public let stride: MTLBuffer //[UInt8]
    
    // Now we have the items for each word in each shape so many more of these
    
    /// Location of where a word starts for the nth shape
    public let start: MTLBuffer //[Int32]
    public let end: MTLBuffer //[Int32]
    
    // The index to all words that exist in each shape,  each shape is sorted by word id increasing and where the first one has isHorizontal = true

    /// The index to the word that is in this shape
    public let w: MTLBuffer //[UInt8]

    /// The x position for the placed word
    public let x: MTLBuffer //[UInt8]
    
    /// The y position for the placed word
    public let y: MTLBuffer //[UInt8]
    
    /// Is this placement horizontal then its true else vertical is false
    public let z: MTLBuffer //[Bool]
    
    /// The length of each placed word
    public let l: MTLBuffer //[UInt8]
    
    public init(shapes: ShapeListSoa, device: MTLDevice?) {
        
        self.id = GpuBufferCalculator.Create_UInt32_Buffer(
            array: shapes.id,
            device: device)
        
        self.width = GpuBufferCalculator.Create_UInt8_Buffer(
            array: shapes.width,
            device: device)
        
        self.height = GpuBufferCalculator.Create_UInt8_Buffer(
            array: shapes.height,
            device: device)
        
        self.score = GpuBufferCalculator.Create_UInt16_Buffer(
            array: shapes.score,
            device: device)
        
        self.stride = GpuBufferCalculator.Create_UInt8_Buffer(
            array: shapes.stride,
            device: device)
        
        self.start = GpuBufferCalculator.Create_UInt32_Buffer(
            array: shapes.start,
            device: device)
        
        self.end = GpuBufferCalculator.Create_UInt32_Buffer(
            array: shapes.end,
            device: device)
        
        self.w = GpuBufferCalculator.Create_UInt8_Buffer(
            array: shapes.w,
            device: device)
        
        self.x = GpuBufferCalculator.Create_UInt8_Buffer(
            array: shapes.x,
            device: device)
        
        self.y = GpuBufferCalculator.Create_UInt8_Buffer(
            array: shapes.y,
            device: device)
        
        self.z = GpuBufferCalculator.Create_Bool_Buffer(
            array: shapes.z,
            device: device)
        
        self.l = GpuBufferCalculator.Create_UInt8_Buffer(
            array: shapes.l,
            device: device)
    }
}
