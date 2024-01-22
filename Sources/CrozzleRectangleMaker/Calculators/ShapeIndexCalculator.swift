//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 22/1/2024.
//

import Foundation
public class ShapeIndexCalculator {
    public static func CalcIndex(
        searchShapes: [ShapeModel],
        wordCount: Int) -> [[Int]]
    {
        var result: [[Int]] = Array(repeating: [], count: wordCount)
        
        for shapeId in 0..<searchShapes.count {
            for placementId in 0..<searchShapes[shapeId].placements.count {
                let w = Int(searchShapes[shapeId].placements[placementId].w);
                result[w].append(shapeId);
            }
        }
        return result
    }
    
    public static func CalcIndexWithWordsPerShape(
        searchShapes: [ShapeModel],
        wordCount: Int,
        wordsPerShape: Int) -> [[Int]]
    {
        var result: [[Int]] = Array(repeating: [], count: wordCount)
        
        for shapeId in 0..<searchShapes.count {
            for placementId in 0..<wordsPerShape {
                let w = Int(searchShapes[shapeId].placements[placementId].w);
                result[w].append(shapeId);
            }
        }
        return result
    }
}
