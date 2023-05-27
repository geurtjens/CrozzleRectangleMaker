//
//  SplitShapesIntoWordCountCalculator.swift
//  
//
//  Created by Michael Geurtjens on 27/5/2023.
//

import Foundation
public struct SplitShapesIntoWordCountCalculator {
    public static func Execute(strideA: Int, strideB: Int, shapes: [ShapeModel]) -> ([Int],[[ShapeModel]]) {
        var smallest = strideA
        var largest = strideB
        if smallest > largest {
            swap(&smallest, &largest)
        }
        
        
        // The possible lengths will be 1 more than the smallest to one less than the largest
        let lowerRange = smallest + 1
        let upperRange = smallest + largest - 1
        
        var wordCounts:[Int] = []
        var shapesForWordCount: [[ShapeModel]] = []
        
        for i in lowerRange..<(upperRange+1) {
            let filteredShapes = shapes.filter { $0.placements.count == i }
            if filteredShapes.count > 0 {
                wordCounts.append(i)
                shapesForWordCount.append(filteredShapes)
            }
        }
        return (wordCounts, shapesForWordCount)
    }
}
