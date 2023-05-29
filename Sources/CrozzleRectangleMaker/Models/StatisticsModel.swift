//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 24/5/2023.
//

import Foundation

/// Breaks the scores of shapes up into bands.  This model represents a single band.
public struct StatisticsModel {
    /// score of the shape
    public let score: UInt16
    
    /// within the shape list, this is the starting position for the score
    public let startPosition: Int
    
    /// how many shapes have the same score
    public let count: Int
    
    /// total number of shapes in the list, we use this to calculate percentages
    public let total: Int
    
    /// calculated field that tells us where the last shape is that has this same score
    public var endPosition: Int {
        return startPosition + count - 1
    }
    /// percentage of shapes out of the list of shapes that has this score.  We multiply by 100 for percentage but add 0000 extra zeros for 4 decimal places represented as an integer.
    public var percentage: Int {
        return Int(Double(count) / Double(total) * 100_0000)
    }
    /// percentage of shapes in the list that has this score or higher.  Measured to four decimal places.
    public var topPercentage: Int {
        return Int(Double(endPosition+1) / Double(total) * 100_0000)
    }
}
/// print out the contents of this object for debug purposes
extension StatisticsModel: CustomStringConvertible {
    public var description: String {
        return "score: \(score), count: \(count), startPosition: \(startPosition), endPosition: \(endPosition)"
    }
}

