//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 22/1/2024.
//

import Foundation
public class ShapeLimitCalculator {
    public func getNextShapeScore(
        winningShapeScores: [Int],
        sourceShape: ShapeModel) -> Int
    {
        
        //let winningShapeScores = WinningShapesCalculatorV1.getScoresForWinningShapes(gameId: gameId)
        
        let nextShapeIndex = sourceShape.mergeHistory.count
        //sourceShape.mergeHistory.count
        if nextShapeIndex < winningShapeScores.count {
            return winningShapeScores[nextShapeIndex]
        } else {
            return 0
        }
    }

    public static func findStuff(
        searchShapes: [ShapeModel],
        letterArray:[Int],
        searchScore: Int) -> Int
    {
        for i in stride(from: letterArray.count-1, to: 0, by: -1) {
            let score = searchShapes[letterArray[i]].score
            if score >= searchScore {
                return i
            }
        }
        return 0
    }
    
    /// `index` contains a list of shapes for each letter and these shapes are sorted by score.
    /// So we are given winningShapesScores and want to locate the cut off point for that score
    /// So the result is a list of cut off points for each position in the winningShapesScores
    /// So can we create this list as a separate thing for each game just like index is separate for each game?
    public static func execute(
        searchShapes: [ShapeModel],
        gameId: Int,
        index: [[Int]]) -> [[Int]]
    {
        
        let winningShapesScores = WinningShapesCalculatorV1.getScoresForWinningShapes(gameId: gameId)
        var result: [[Int]] = []
        
        for _ in 0..<index.count {
            result.append([])
        }
        
        
        
        for i in 0..<winningShapesScores.count {
            let winningShapeScore = winningShapesScores[i]
            
            
            for letterId in 0..<index.count {
                
                let letterArray = index[letterId]
                
                let idx = findStuff(
                    searchShapes: searchShapes,
                    letterArray: letterArray,
                    searchScore: winningShapeScore)
                
                result[letterId].append(idx)
                
                
                
                
            }
            
        }
        return result
    }
}
