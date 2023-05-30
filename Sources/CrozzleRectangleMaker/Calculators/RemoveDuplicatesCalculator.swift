//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 30/5/2023.
//

import Foundation
/// ability to remove duplicates
public class RemoveDuplicatesCalculator {
    
    /// This provides a new list of shapes that have no duplicates
    public static func execute(shapes: [ShapeModel]) -> [ShapeModel] {
        var shapes = shapes
        
        let duplicateCount = findDuplicates(shapes: &shapes)
        if duplicateCount == 0 {
            return shapes
        } else {
            return removeDuplicates(shapes: shapes)
        }
    }
    
    /// Marks duplicates as shapeModel.isValid = false so we can remove them later.  Also returns how many duplicates there are so we dont have to worry about removing what is not there
    public static func findDuplicates(shapes: inout [ShapeModel]) -> Int{
        
        if shapes.count == 0 {
            return 0
        }

        var duplicateCount = 0
        let wordCount = shapes[0].placements.count
        // first we need to sort to find the duplicates
        ShapeCalculator.SortWithWordSequence(shapes: &shapes)
        
        var previous = 0
        
        for current in 1..<shapes.count {
            if (shapes[current].score == shapes[previous].score &&
                shapes[current].wordSequence == shapes[previous].wordSequence &&
                shapes[current].width * shapes[current].height == shapes[current].width * shapes[current].height)
            {
                // We most likely have a duplicate
                var isDuplicate = true
                if shapes[current].placements[0].h == shapes[previous].placements[0].h {
                    // Our potential duplicate is in the same direction
                    for i in 0..<wordCount {
                        if shapes[current].placements[i].x != shapes[previous].placements[i].x {
                            isDuplicate = false
                            break
                        }
                        if shapes[current].placements[i].y != shapes[previous].placements[i].y {
                            isDuplicate = false
                            break
                        }
                        if shapes[current].placements[i].h != shapes[previous].placements[i].h {
                            isDuplicate = false
                            break
                        }
                    }
                } else {
                    // They are opposite sides
                    for i in 0..<wordCount {
                        if shapes[current].placements[i].x != shapes[previous].placements[i].y {
                            isDuplicate = false
                            break
                        }
                        if shapes[current].placements[i].y != shapes[previous].placements[i].x {
                            isDuplicate = false
                            break
                        }
                        if shapes[current].placements[i].h == shapes[previous].placements[i].h {
                            isDuplicate = false
                            break
                        }
                    }
                }
                if isDuplicate {
                    shapes[current].isValid = false
                    duplicateCount += 1
                } else {
                    previous = current
                }
            } else {
                // They are not the same in score or wordSequence
                previous = current
            }
        }
        return duplicateCount
    }
    
    /// removes the duplicates once find duplicates has happened but not before
    public static func removeDuplicates(shapes: [ShapeModel]) -> [ShapeModel] {
        return shapes.filter { $0.isValid }
    }
}
