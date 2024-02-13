//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 13/2/2024.
//

import Foundation
public struct IndexResultInstruction {
    
    public let searchShapeId: Int
    
    public let sourcePosList: [UInt8]
    public let searchPosList: [UInt8]
    
    // To fit, the source must be flipped hopefully or maybe search must be flipped,
    // cant remember please validate
    public let isFlipped: Bool
    
    // width and height
    public let width: UInt8
    public let height: UInt8
    
    // sourceOffsetX, sourceOffsetY, searchOffsetX, searchOffsetY
    public let sourceOffsetX: Int8
    public let sourceOffsetY: Int8
    public let searchOffsetX: Int8
    public let searchOffsetY: Int8
    
}
