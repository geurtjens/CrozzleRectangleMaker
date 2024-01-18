//
//  CheckMergeSizeIsValid.swift
//  
//
//  Created by Michael Geurtjens on 25/7/2023.
//

import Foundation
public class MergeSizeValidation {
    
    
    
    public static func execute(
        sourceShape: ShapeModel,
        sourcePos: Int,
        searchShape: ShapeModel,
        searchPos: Int,
        widthMax: Int,
        heightMax: Int) -> (Bool, Int, Int, Bool)
    {
        
        let sourcePlacement = sourceShape.placements[sourcePos]
        let searchPlacement = searchShape.placements[searchPos]
        
        let firstIsFlipped = orientationIsFlipped(
            sourcePlacementMatching: sourcePlacement,
            searchPlacementMatching: searchPlacement)
        
        let (isValid, width, height) = verifyWidthHeight(
            width1: Int(sourceShape.width), height1: Int(sourceShape.height), x1: Int(sourcePlacement.x), y1: Int(sourcePlacement.y),
            width2: Int(searchShape.width), height2: Int(searchShape.height), x2: Int(searchPlacement.x), y2: Int(searchPlacement.y),
            flipped: firstIsFlipped, widthMax: widthMax, heightMax: heightMax)
        
        if isValid {
            return (true, width, height, firstIsFlipped)
        } else {
            return (false, width, height, firstIsFlipped)
        }
    }
    
    public static func orientationIsFlipped(
        sourcePlacementMatching: PlacementModel,
        searchPlacementMatching: PlacementModel) -> Bool
    {
        assert(sourcePlacementMatching.w == searchPlacementMatching.w, "these should match with same word otherwise something beforehand has gone wrong")
        
        let firstIsFlipped = !(sourcePlacementMatching.z == searchPlacementMatching.z)
        return firstIsFlipped
    }
    
    

    
    public static func verifyWidthHeight(
        width1: Int,
        height1: Int,
        x1: Int,
        y1: Int,
        width2: Int,
        height2: Int,
        x2: Int,
        y2: Int,
        flipped: Bool,
        widthMax: Int,
        heightMax: Int) -> (Bool, Int, Int) {
            
        let (width,height) = getWidthHeight(
            width1: width1,
            height1: height1,
            x1: x1,
            y1: y1,
            width2: width2,
            height2: height2,
            x2: x2,
            y2: y2,
            flipped: flipped)
        
        if (width <= widthMax && height <= heightMax) || (width <= heightMax && height <= widthMax) {
            return (true, width, height)
        } else {
            return (false, width, height)
        }
    }
    
    public static func getWidthHeight(
        width1: Int,
        height1: Int,
        x1: Int,
        y1: Int,
        width2: Int,
        height2: Int,
        x2: Int,
        y2: Int,
        flipped: Bool) -> (Int, Int)
    {
        if flipped == false {
            let width = getWidth(width1: width1, x1: x1, width2: width2,  x2: x2)
            let height = getHeight(height1: height1, y1: y1, height2: height2,  y2: y2)
            return (width, height)
        } else {
            let width = getWidth(width1: width1, x1: x1, width2: height2, x2: y2)
            let height = getHeight(height1: height1, y1: y1, height2: width2, y2: x2)
            return (width, height)
        }
    }
    
    public static func getWidth(
        width1: Int,
        x1: Int,
        width2: Int,
        x2: Int) -> Int
    {
        
        let extra1 = width1 - x1
        let extra2 = width2 - x2
        return max(extra1, extra2) + max(x1, x2)
        
    }
    public static func getHeight(
        height1: Int,
        y1: Int,
        height2: Int,
        y2: Int) -> Int
    {
        let extra1 = height1 - y1
        let extra2 = height2 - y2
        return max(extra1, extra2) + max(y1, y2)
    }
}


