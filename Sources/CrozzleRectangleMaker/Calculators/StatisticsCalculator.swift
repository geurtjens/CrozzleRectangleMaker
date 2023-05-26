//
//  StatisticsCalculator.swift
//  
//
//  Created by Michael Geurtjens on 24/5/2023.
//

import Foundation
public struct StatisticsCalculator {
    
    /// How many shapes are there that has a score that is equal or greater than the score we provide.
    public static func lastPositionWithScoreOrHigher(scoreMin: Int, statistics: [StatisticsModel]) -> Int {
        
        if statistics.count == 0 {
            return 0
        }
       
        for i in 0..<statistics.count {
            let statistic = statistics[i]
            if statistic.score < scoreMin {
                return statistics[i].startPosition - 1
            }
        }
        return -1
    }
    
    /// What is the score for the top x% of shapes
    public static func scoreFor(topPercentage: Int, statistics: [StatisticsModel]) -> UInt16 {
        
        if statistics.count == 0 {
            return 0
        }
        let maxPercentage = topPercentage * 10000
        
        for i in 0..<statistics.count {
            let statistic = statistics[i]
            if statistic.topPercentage > maxPercentage {
                return statistics[i - 1].score
            }
        }
        return statistics.last!.score
    }
    
    /// How many shapes are there in the top x% of shapes
    public static func positionMax(topPercentage: Int, statistics: [StatisticsModel]) -> Int {
        
        if statistics.count == 0 {
            return 0
        }
        let maxPercentage = topPercentage * 10000
        
        for i in 0..<statistics.count {
            let statistic = statistics[i]
            if statistic.topPercentage > maxPercentage {
                return statistics[i].startPosition - 1
            }
        }
        return statistics.count
    }
    
    public static func Execute(shapes: [ShapeModel]) -> [StatisticsModel] {
        
        var shapes = shapes
        shapes.sort { $0.score > $1.score }
        
        var scores:[UInt16] = []
        for shape in shapes {
            scores.append(UInt16(shape.score))
        }

        return Execute(scores: scores)
    }
    /// Create a statistics model that has the score, number of shapes with that score, where it appears in all shapes and various percentages that we can use for filtering
    public static func Execute(scores:[UInt16]) -> [StatisticsModel] {
        if scores.count == 0 {
            return []
        }
        
        let total = scores.count
        var result:[StatisticsModel] = []
        var currentScore = scores[0]
        var count = 1
        var startPosition = 0
        for i in 1..<total {
            if scores[i] != currentScore {
                result.append(StatisticsModel(
                    score: currentScore,
                    startPosition: startPosition,
                    count: count,
                    total: total))
                
                count = 1
                currentScore = scores[i]
                startPosition = i
                
            } else {
                count += 1
            }
        }
        result.append(StatisticsModel(
            score: currentScore,
            startPosition: startPosition,
            count: count,
            total: total))
        return result
    }
}
