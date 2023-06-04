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
    
    /// Used to find duplicates, it is a csv for all the words in the shape.
    public let wordSequence: String
    
    public let area: UInt8
    
    public let density: Float32
    
    public init(score: UInt16, width: UInt8, height: UInt8, placements: [PlacementModel]) {
        self.score = score
        self.width = width
        self.height = height
        self.placements = placements
        let area = (width - 2) * (height - 2)
        self.area = area
        self.density = Float32(score) / Float32(area)
        // This code may slow things down alot
        
        self.wordSequence = ShapeModel.getWordSequence(placements: placements)
    }
    /// provide the words that are found in this shape
    public func getWords() -> [UInt8] {
        var result:[UInt8] = []
        for placement in placements {
            result.append(placement.i)
        }
        return result
    }
    public static func getWordSequence(placements: [PlacementModel]) -> String {
        var wordSequence = ""
        for placement in placements {
            if wordSequence != "" {
                wordSequence += ","
            }
            wordSequence += String(placement.i)
        }
        
        for placement in placements {
            if wordSequence != "" {
                wordSequence += ","
            }
            wordSequence += String(placement.x)
        }
        for placement in placements {
            if wordSequence != "" {
                wordSequence += ","
            }
            wordSequence += String(placement.y)
        }
        return wordSequence
    }
    
    public func ToString(words: [String]) -> String {
        let (text, score) = ShapeCalculator.ToText(shape: self, words: words)
        return "\nscore:\(score), width:\(width), height:\(height), words:\(self.placements.count)\n\n" + text
    }
}
