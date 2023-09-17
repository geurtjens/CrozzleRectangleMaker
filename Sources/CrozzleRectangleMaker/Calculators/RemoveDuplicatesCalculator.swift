//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 30/5/2023.
//

import Foundation
/// ability to remove duplicates
public class RemoveDuplicatesCalculator {
    
    
    public static func flipIfRequired(shapes: [ShapeModel]) -> ([ShapeModel],Int) {
        var shapes = shapes
        
        // We want to rotate any shapes that are not starting with horizontal
        var flipCount = 0
        for i in 0..<shapes.count {
            if shapes[i].placements[0].z == false {
                shapes[i] = shapes[i].Flip()
                flipCount += 1
            }
        }
        return (shapes,flipCount)
    }
    
    
    public static func execute(treeNodes:[TreeNodeModel]) -> ([TreeNodeModel], Int) {
        if treeNodes.count == 0 {
            return ([],0)
        }
        
        var treeNodes = treeNodes

        ShapeCalculator.SortWithWordSequence(treeNodes: &treeNodes)
        
        var previous = 0
        var duplicateCount = 0
        for current in 1..<treeNodes.count {
            previous = current - 1
            if (treeNodes[current].parentShape.score == treeNodes[previous].parentShape.score &&
                treeNodes[current].parentShape.wordSequence == treeNodes[previous].parentShape.wordSequence &&
                treeNodes[current].parentShape.width * treeNodes[current].parentShape.height == treeNodes[previous].parentShape.width * treeNodes[previous].parentShape.height)
            {
                treeNodes[current].isValid = false
                duplicateCount += 1
            }
        }
        
        if duplicateCount > 0 {
            treeNodes = treeNodes.filter { $0.isValid }
            return (treeNodes, duplicateCount)
        } else {
            return (treeNodes, 0)
        }
    }
    
    
    
    
    
    
    
    /// This provides a new list of shapes that have no duplicates
    public static func execute(shapes: [ShapeModel]) -> ([ShapeModel], Int) {
        let (flippedShapes, flippedCount) = flipIfRequired(shapes: shapes)
        
        
        if flippedCount > 0 {
            if FeatureFlags.verbose {
                print("RemoveDuplicatesCalculator flipped \(flippedCount) shapes")
            }
        }
        
        let (nonDuplicatedShapes, previousDuplicateCount) = findDuplicates(shapes: flippedShapes)
        return (nonDuplicatedShapes, previousDuplicateCount)
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
    private static func findDuplicates(shapes: [ShapeModel]) -> ([ShapeModel],Int) {
                
        if shapes.count == 0 {
            return ([],0)
        }

        var shapes = shapes
        
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
        
        if duplicateCount > 0 {
            shapes = shapes.filter { $0.isValid }
            return (shapes,duplicateCount)
        } else {
            return (shapes, 0)
        }
        
    }
}
