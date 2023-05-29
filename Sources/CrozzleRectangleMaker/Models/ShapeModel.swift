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
    
    /// Used when we want to remove shapes from a collection such as when its a duplicate.  When duplicate is detected its set to false and so we can easily remove it using filter
    public var isValid: Bool = true
    
    public let wordSequence: String
    
    public init(score: UInt16, width: UInt8, height: UInt8, placements: [PlacementModel]) {
        self.score = score
        self.width = width
        self.height = height
        self.placements = placements
        
        // This code may slow things down alot
        
        self.wordSequence = ShapeModel.getWordSequence(placements: placements)
    }
    
    public static func getWordSequence(placements: [PlacementModel]) -> String {
        var wordSequence = ""
        for placement in placements {
            if wordSequence != "" {
                wordSequence += ","
            }
            wordSequence += String(placement.i)
        }
        return wordSequence
    }
}
