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
    
    /// Its true that area can fit into a smaller size for valid grids but sometimes we have crazy large invalid grids and this causes overflows
    public let area: UInt16
    
    public var density: Float32
    
    public init(score: UInt16, width: UInt8, height: UInt8, placements: [PlacementModel]) {
        self.score = score
        self.width = width
        self.height = height
        self.placements = placements
        let area: UInt16 = (UInt16(width) - 2) * (UInt16(height) - 2)
        self.area = area
        self.density = Float32(score) / Float32(area)
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
        
        for placement in placements {
            if wordSequence != "" {
                wordSequence += ","
            }
            if placement.h == true {
                wordSequence += "1"
            } else {
                wordSequence += "0"
            }
        }
        return wordSequence
    }
    
    public func ToString(words: [String]) -> String {
        let (text, score) = ShapeCalculator.ToText(shape: self, words: words)
        return "score:\(score), width:\(width), height:\(height), words:\(self.placements.count), area:\(area), density:\(density)\n`\n" + text + "\n`\n"
    }
    
    public func ToMarkFormat(words: [String]) -> String {
        let (text, score) = ShapeCalculator.ToText(shape: self, words: words)
        
        let compressed = GridCalculator.markAmabileFormat(text: text)
        
        var letterCount = 0
        for letter in compressed {
            if letter != " " {
                letterCount += 1
            }
        }
        
        return "score=\(score) wordCount:\(self.placements.count) charCount=\(letterCount)\n------------------------\n" + compressed + "\n------------------------\n\n"
    }
    
    
    public func ToStringExtended(words: [String], gameId: Int, winningScore: Int) -> String {
        
        var shape = self
        if shape.width < shape.height {
            shape = shape.Flip()
        }
        
        let (text, score) = ShapeCalculator.ToText(shape: shape, words: words)
        
        if score == winningScore {
            return "\nMATCHES HUMAN SCORE - score:\(score), winningScore:\(winningScore), gameId:\(gameId), width:\(shape.width), height:\(shape.height), words:\(shape.placements.count), area:\(shape.area), density:\(shape.density)\n```\n" + text + "\n```\n"
        } else if score > winningScore {
            return "\nWINNING SCORE - score:\(score), winningScore:\(winningScore), gameId:\(gameId), width:\(shape.width), height:\(shape.height), words:\(shape.placements.count), area:\(shape.area), density:\(shape.density)\n```\n" + text + "\n```\n"
        } else {
            
            return "\nscore:\(score), winningScore:\(winningScore), gameId:\(gameId), width:\(shape.width), height:\(shape.height), words:\(shape.placements.count), area:\(shape.area), density:\(shape.density)\n```\n" + text + "\n```\n"
        }
    }
    
    public func Code() -> String {
        return ShapeCalculator.ToCode(fromShape: self)
    }
    
    public func Flip() -> ShapeModel {
        return ShapeCalculator.Flip(shape: self)
    }
    
    public func CodeGridText(words: [String]) -> String {
        // firstly if we are more vertical than horizontal lets flip
        var shape = self
        if shape.width < shape.height {
            shape = ShapeCalculator.Flip(shape: shape)
        }
        
        let (_,text) = ShapeCalculator.getScoreAndText(shape: shape, words: words)
        
        let grid = text.split(separator:"\n")
        
        var result = ""
        for line in grid {
            if result != "" {
                result += ",\n"
            }
            result += "        \"\(line)\""
        }
        return "[\n\(result)\n    ]"
    }
}
