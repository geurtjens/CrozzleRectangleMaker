//
//  MergeSizeValidation2.swift
//
//
//  Created by Michael Geurtjens on 25/7/2023.
//

import Foundation
public class MergeSizeValidation2 {
    
    public static func orientationIsFlipped(sourcePlacementMatching: PlacementModel, searchPlacementMatching: PlacementModel) -> Bool {
        assert(sourcePlacementMatching.w == searchPlacementMatching.w, "these should match with same word otherwise something beforehand has gone wrong")
        
        let firstIsFlipped = !(sourcePlacementMatching.z == searchPlacementMatching.z)
        return firstIsFlipped
    }
    
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
        
        assert(sourcePlacement.w == searchPlacement.w, "We expected these two matching placements to have matching word id")
        
        let firstIsFlipped = orientationIsFlipped(
            sourcePlacementMatching: sourcePlacement,
            searchPlacementMatching: searchPlacement)
        
        let (isValid, width, height) = verifyWidthHeight(
            sourceWidth: Int(sourceShape.width),
            sourceHeight: Int(sourceShape.height),
            sourceX: Int(sourcePlacement.x),
            sourceY: Int(sourcePlacement.y),
            
            searchWidth: Int(searchShape.width),
            searchHeight: Int(searchShape.height),
            searchX: Int(searchPlacement.x),
            searchY: Int(searchPlacement.y),
            sourceIsFlipped: firstIsFlipped,
            widthMax: widthMax,
            heightMax: heightMax)
        
        if isValid {
            return (true, width, height, firstIsFlipped)
        } else {
            return (false, width, height, firstIsFlipped)
        }
    }
    
    
    
    public static func executeWithItems(
        sourceShapes: GpuShapeModel, sourceWidth: Int, sourceHeight: Int, sourcePos: Int,
        searchShapes: GpuShapeModel, searchWidth: Int, searchHeight: Int, searchPos: Int,
        widthMax: Int, heightMax: Int) -> (Bool, Int, Int)
    {
        let flipped = (sourceShapes.isHorizontal[sourcePos] == searchShapes.isHorizontal[searchPos])
        
        let sourceX = sourceShapes.x[sourcePos]
        let sourceY = sourceShapes.y[sourcePos]
        
        let searchX = searchShapes.x[searchPos]
        let searchY = searchShapes.y[searchPos]
        
        let (isValid, width, height) = verifyWidthHeight(
            sourceWidth: Int(sourceWidth),
            sourceHeight: Int(sourceHeight),
            sourceX: Int(sourceX),
            sourceY: Int(sourceY),
            searchWidth: Int(searchWidth),
            searchHeight: Int(searchHeight),
            searchX: Int(searchX),
            searchY: Int(searchY),
            sourceIsFlipped: flipped,
            widthMax: widthMax,
            heightMax: heightMax)
        
        if isValid {
            return (true, width, height)
        } else {
            return (false, width, height)
        }
    }
    
    public static func execute(instruction: MergeInstructionModel, sourceShapes: GpuShapeModel, searchShapes: GpuShapeModel, widthMax: Int, heightMax: Int) -> (Bool, Int, Int) {
        
        //return true
        
        let sourceWidth = sourceShapes.widths[instruction.sourceShapeId]
        let sourceHeight = sourceShapes.heights[instruction.sourceShapeId]
        
        let sourceWordPosition = instruction.sourceShapeId * sourceShapes.stride + Int(instruction.sourceMatchingWordPosition)
        
        let sourceX = sourceShapes.x[sourceWordPosition]
        let sourceY = sourceShapes.y[sourceWordPosition]
        
        let searchWidth = searchShapes.widths[instruction.searchShapeId]
        let searchHeight = searchShapes.heights[instruction.searchShapeId]
        
        let searchWordPosition = instruction.searchShapeId * searchShapes.stride + Int(instruction.searchMatchingWordPosition)
        
        let searchX = searchShapes.x[searchWordPosition]
        let searchY = searchShapes.y[searchWordPosition]
        
        let (isValid, width, height) = verifyWidthHeight(
            sourceWidth: Int(sourceWidth),
            sourceHeight: Int(sourceHeight),
            sourceX: Int(sourceX),
            sourceY: Int(sourceY),
            searchWidth: Int(searchWidth),
            searchHeight: Int(searchHeight),
            searchX: Int(searchX),
            searchY: Int(searchY),
            sourceIsFlipped: instruction.flipped,
            widthMax: widthMax,
            heightMax: heightMax)
        
        if isValid {
            return (true, width, height)
        } else {
            return (false, width, height)
        }
    }
    
    public static func verifyWidthHeight(
        sourceWidth: Int,
        sourceHeight: Int,
        sourceX: Int,
        sourceY: Int,
        searchWidth: Int,
        searchHeight: Int,
        searchX: Int,
        searchY: Int,
        sourceIsFlipped: Bool,
        widthMax: Int,
        heightMax: Int) -> (Bool, Int, Int)
    {
        
        
        
        let (width, height) = getWidthHeight(
            sourceWidth: sourceWidth,
            sourceHeight: sourceHeight,
            sourceX: sourceX,
            sourceY: sourceY,
            searchWidth: searchWidth,
            searchHeight: searchHeight,
            searchX: searchX,
            searchY: searchY,
            sourceIsFlipped: sourceIsFlipped)
        
        
        
        if (width <= widthMax && height <= heightMax) || (width <= heightMax && height <= widthMax) {
            return (true, width, height)
        } else {
            return (false, width, height)
        }
    }
    
    public static func getWidthHeight(
        sourceWidth: Int,
        sourceHeight: Int,
        sourceX: Int,
        sourceY: Int,
        searchWidth: Int,
        searchHeight: Int,
        searchX: Int,
        searchY: Int,
        sourceIsFlipped: Bool) -> (Int, Int) {
        if sourceIsFlipped == false {
            
            let width = getWidth(
                sourceWidth: sourceWidth,
                sourceX: sourceX,
                searchWidth: searchWidth,
                searchX: searchX)
            
            let height = getHeight(
                sourceHeight: sourceHeight,
                sourceY: sourceY,
                searchHeight: searchHeight,
                searchY: searchY)
            
            return (width, height)
        } else {
            let width = getWidth(
                sourceWidth: sourceHeight,
                sourceX: sourceY,
                searchWidth: searchWidth,
                searchX: searchX)
            let height = getHeight(
                sourceHeight: sourceWidth,
                sourceY: sourceX,
                searchHeight: searchHeight,
                searchY: searchY)
            return (width, height)
        }
    }
    
    public static func getWidth(sourceWidth: Int, sourceX: Int, searchWidth: Int, searchX: Int) -> Int {
        
        let extra1 = sourceWidth - sourceX
        let extra2 = searchWidth - searchX
        return max(extra1, extra2) + max(sourceX, searchX)
        
    }
    public static func getHeight(sourceHeight: Int, sourceY: Int, searchHeight: Int, searchY: Int) -> Int {
        let extra1 = sourceHeight - sourceY
        let extra2 = searchHeight - searchY
        return max(extra1, extra2) + max(sourceY, searchY)
    }
}
