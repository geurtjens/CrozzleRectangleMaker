//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 2/2/2024.
//

import Foundation
import MetalKit

public class GpuBufferCalculator {
    
    public static func Create_UInt32_Buffer(
        array: [UInt32],
        device: MTLDevice?) -> MTLBuffer
    {
        return (device?.makeBuffer(
            bytes: array,
            length: MemoryLayout<UInt32>.size * array.count,
            options: .storageModeShared))!
    }
    
    
    public static func Create_UInt16_Buffer(
        array:[UInt16],
        device:MTLDevice?) -> MTLBuffer
    {
        return (device?.makeBuffer(
            bytes: array,
            length: MemoryLayout<UInt16>.size * array.count,
            options: .storageModeShared))!
    }
    
    public static func Create_UInt8_Buffer(
        array:[UInt8],
        device:MTLDevice?) -> MTLBuffer
    {
        return (device?.makeBuffer(
            bytes: array,
            length: MemoryLayout<UInt8>.size * array.count,
            options: .storageModeShared))!
    }
    
    public static func Create_Bool_Buffer(
        array: [Bool],
        device: MTLDevice?) -> MTLBuffer
    {
        return (device?.makeBuffer(
            bytes: array,
            length: MemoryLayout<Bool>.size * array.count,
            options: .storageModeShared))!
    }
    
    public static func Create_Int32_Buffer(
        array: [Int32],
        device: MTLDevice?) -> MTLBuffer
    {
        return (device?.makeBuffer(
            bytes: array,
            length: MemoryLayout<Int32>.size * array.count,
            options: .storageModeShared))!
    }
}
