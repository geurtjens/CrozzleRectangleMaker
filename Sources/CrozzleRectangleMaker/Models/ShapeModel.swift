//
//  ShapeModel.swift
//  
//
//  Created by Michael Geurtjens on 18/5/2023.
//

import Foundation
/// A shape is a grouping of words arranged to form a valid crozzle grid.  This model is the minimum instructions to create and manage any shape
public struct ShapeModel {
    
    /// The score of the shape calculated as 10 points for each word and then individual scoring for letters. Scoring is found in `ScoreCalculator`
    public let score: UInt16
    
    /// When the shape is rendered as text, `width` is the width of this text.
    public let width: UInt8
    
    /// When the shape is rendered as text, `height` is the height of this text
    public let height: UInt8
    
    /// A shape is made by placing one word at a time into a grid of text.  These are the instructions of which word and where to place it
    public let placements: [PlacementModel]
}
