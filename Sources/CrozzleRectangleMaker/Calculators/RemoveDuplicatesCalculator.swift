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
    public static func execute(shapes: [ShapeModel]) -> ([ShapeModel], Int) {
        var shapes = shapes
        
        // We want to rotate any shapes that are not starting with horizontal
        
        for i in 0..<shapes.count {
            if shapes[i].placements[0].h == false {
                shapes[i] = shapes[i].Flip()
            }
        }
        
        let duplicateCount = findDuplicates(shapes: &shapes)
        if duplicateCount == 0 {
            return (shapes,0)
        } else {
            return (removeDuplicates(shapes: shapes), duplicateCount)
        }
    }
    
    private static func printDuplicateSpread(shapes: [ShapeModel]) {
        if shapes.count == 0 {
            return
        }
        var last = shapes[0].isValid
        if shapes[0].isValid == true {
            print("0 true  \(shapes[0].wordSequence)")
        } else {
            print("0 false \(shapes[0].wordSequence)")
        }
        
        
        for i in 1..<shapes.count {
            if last == shapes[i].isValid {
                print("*********************")
                print(shapes[i-1].Code())
                print(shapes[i].Code())
            }
            last = shapes[i].isValid
            if shapes[i].isValid == true {
                print("\(i) true  \(shapes[i].wordSequence)")
            } else {
                print("\(i) false \(shapes[i].wordSequence)")
            }
            
        }
    }
    
    /// Marks duplicates as shapeModel.isValid = false so we can remove them later.  Also returns how many duplicates there are so we dont have to worry about removing what is not there
    private static func findDuplicates(shapes: inout [ShapeModel]) -> Int {
        
        if shapes.count == 0 {
            return 0
        }

        var duplicateCount = 0
        
        // first we need to sort to find the duplicates
        ShapeCalculator.SortWithWordSequence(shapes: &shapes)
        
        var previous = 0
        
        /// We can only switch previous when we have gone through all of the same word id sequences maybe then we have a change at duplicates
        /// because adding the x and y is not going to work because of the possibility that words are flipped.
        /// what if all shapes are flipped if their first shape is not horizontal so that it is always horizontal,  then the using x and y will work for removing duplicates
        for current in 1..<shapes.count {
            previous = current - 1
            if (shapes[current].score == shapes[previous].score &&
                shapes[current].wordSequence == shapes[previous].wordSequence &&
                shapes[current].width * shapes[current].height == shapes[previous].width * shapes[previous].height)
            {
                shapes[current].isValid = false
                duplicateCount += 1
            }
        }
        return duplicateCount
    }
    
    /// removes the duplicates once find duplicates has happened but not before
    private static func removeDuplicates(shapes: [ShapeModel]) -> [ShapeModel] {
        return shapes.filter { $0.isValid }
    }
}
