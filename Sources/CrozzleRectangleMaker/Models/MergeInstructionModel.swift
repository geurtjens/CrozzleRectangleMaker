//
//  MergeInstructionModel.swift
//  
//
//  Created by Michael Geurtjens on 25/5/2023.
//

import Foundation
public struct MergeInstructionModel {
    public let sourceShapeId: Int
    public let searchableShapeId: Int
    public let sourceMatchingWordPosition: UInt8
    public let searchableMatchingWordPosition: UInt8
    public let flipped: Bool
    public let xOffset: Int8
    public let yOffset: Int8
    public let matchingWordCount: UInt8
}
