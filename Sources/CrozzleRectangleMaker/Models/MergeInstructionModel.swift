//
//  MergeInstructionModel.swift
//  
//
//  Created by Michael Geurtjens on 25/5/2023.
//

import Foundation
/// The instructions required to merge two shapes together
public struct MergeInstructionModel {
    
    /// position of the shape in the first shape list that is going to be used in the merge
    public let sourceShapeId: Int
    /// position of the shape in the secend shape list that is going to be used in the merge
    public let searchShapeId: Int
    
    /// how many words are the same in both of these shapes
    public let matchingWordCount: UInt8
    
    /// position of first matching word in first shape
    public let sourceMatchingWordPosition: UInt8
    
    /// position of first matching owrd in second shape
    public let searchMatchingWordPosition: UInt8
    
    /// does the second shape have to be flipped before they come together
    public let flipped: Bool
    
}
