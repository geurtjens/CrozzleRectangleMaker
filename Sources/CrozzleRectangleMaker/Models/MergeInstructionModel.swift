//
//  MergeInstructionModel.swift
//  
//
//  Created by Michael Geurtjens on 25/5/2023.
//

import Foundation
public struct MergeInstructionModel {
    public let sourceShapeId: Int
    public let searchShapeId: Int
    public let matchingWordCount: UInt8
    public let sourceMatchingWordPosition: UInt8
    public let searchMatchingWordPosition: UInt8
    public let flipped: Bool
    
}
