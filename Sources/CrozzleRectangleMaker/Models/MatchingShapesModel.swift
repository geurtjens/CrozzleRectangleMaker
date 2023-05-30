//
//  MatchingShapesModel.swift
//  
//
//  Created by Michael Geurtjens on 25/5/2023.
//

import Foundation
/// Two shapes can be merged and have a common number of words.
public struct MatchingShapesModel {
    /// location of the shape in its list that we are finding matches for
    public let sourceShapeId: Int
    
    /// location of the shape in its list that we have found a match for
    public let searchShapeId: Int
    
    /// number of words that are matching in both shapes
    public let matchingWordCount: UInt8
}
