//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 24/5/2023.
//

import Foundation
public struct StatisticsModel {
    public let score: UInt16
    public let startPosition: Int
    public let count: Int
    public let total: Int
    public var endPosition: Int {
        return startPosition + count - 1
    }
    public var percentage: Int {
        return Int(Double(count) / Double(total) * 100_0000)
    }
    public var topPercentage: Int {
        return Int(Double(endPosition+1) / Double(total) * 100_0000)
    }
}
// print out the contents of this object for debug purposes
extension StatisticsModel: CustomStringConvertible {
    public var description: String {
        return "score: \(score), count: \(count), startPosition: \(startPosition), endPosition: \(endPosition)"
    }
}

