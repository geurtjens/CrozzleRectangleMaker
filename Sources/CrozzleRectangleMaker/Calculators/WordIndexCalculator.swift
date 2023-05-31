//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 31/5/2023.
//

import Foundation
public class WordIndexCalculator {
    
    public static func createWordIndex(totalWords: Int, stride: Int, shapes:[ShapeModel]) -> [[Int]] {
        let shapeCount = shapes.count
        
        var result: [[Int]] = Array(repeating: [], count: totalWords)
        var i = 0
        for shapeId in 0..<shapeCount {
            for j in 0..<stride {
                let wordId = shapes[shapeId].placements[j].i
                
                result[Int(wordId)].append(shapeId)
                i += 1
            }
        }
        return result
    }
    
    
    /// We want to find all the shapes for each word so we can easily identify what shapes to look through when we merge
    public static func createWordIndex(totalWords: Int, stride: Int, shapeCount: Int, words:[UInt8]) -> [[Int]] {
        var result: [[Int]] = Array(repeating: [], count: totalWords)
        var i = 0
        for shapeId in 0..<shapeCount {
            for _ in 0..<stride {
                let wordId = words[i]
                
                result[Int(wordId)].append(shapeId)
                i += 1
            }
        }
        return result
    }
}
