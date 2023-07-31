//
//  CheckMergeSizeIsValid.swift
//  
//
//  Created by Michael Geurtjens on 25/7/2023.
//

import Foundation
public class MergeSizeValidation {
    
    
    public static func execute( matches: [WordIndexResultModel], sourceShapes: GpuShapeModel, sourceShapeId: Int, searchShapes: GpuShapeModel, searchShapeId: Int, widthMax: Int, heightMax: Int) -> (Bool, Int, Int) {
        
        
        let sourcePos = sourceShapeId * Int(sourceShapes.stride) + Int(matches[0].searchPos)
        let sourceWidth = Int(sourceShapes.widths[sourceShapeId])
        let sourceHeight = Int(sourceShapes.heights[sourceShapeId])
        
        let searchPos = searchShapeId * Int(searchShapes.stride) + Int(matches[0].searchPos)
        let searchWidth = Int(searchShapes.widths[searchShapeId])
        let searchHeight = Int(searchShapes.heights[searchShapeId])
        
        return executeWithItems(
            sourceShapes: sourceShapes,
            sourceWidth: sourceWidth,
            sourceHeight: sourceHeight,
            sourcePos: sourcePos,
            searchShapes: searchShapes,
            searchWidth: searchWidth,
            searchHeight: searchHeight,
            searchPos: searchPos,
            widthMax: widthMax,
            heightMax: heightMax)
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
        
        let (isValid, width, height) = verifyWidthHeight(width1: Int(sourceWidth), height1: Int(sourceHeight), x1: Int(sourceX), y1: Int(sourceY), width2: Int(searchWidth), height2: Int(searchHeight), x2: Int(searchX), y2: Int(searchY), flipped: flipped, widthMax: widthMax, heightMax: heightMax)
        
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
        
        let (isValid, width, height) = verifyWidthHeight(width1: Int(sourceWidth), height1: Int(sourceHeight), x1: Int(sourceX), y1: Int(sourceY), width2: Int(searchWidth), height2: Int(searchHeight), x2: Int(searchX), y2: Int(searchY), flipped: instruction.flipped, widthMax: widthMax, heightMax: heightMax)
        
        if isValid {
            return (true, width, height)
        } else {
            return (false, width, height)
        }
    }
    
    public static func verifyWidthHeight(width1: Int, height1: Int, x1: Int, y1: Int, width2: Int, height2: Int, x2: Int, y2: Int, flipped: Bool, widthMax: Int, heightMax: Int) -> (Bool, Int, Int) {
        let (width,height) = getWidthHeight(width1: width1, height1: height1, x1: x1, y1: y1, width2: width2, height2: height2, x2: x2, y2: y2, flipped: flipped)
        
        if (width <= widthMax && height <= heightMax) || (width <= heightMax && height <= widthMax) {
            return (true, width, height)
        } else {
            return (false, width, height)
        }
    }
    
    public static func getWidthHeight(width1: Int, height1: Int, x1: Int, y1: Int, width2: Int, height2: Int, x2: Int, y2: Int, flipped: Bool) -> (Int, Int) {
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
    
    public static func getWidth(width1: Int, x1: Int, width2: Int, x2: Int) -> Int {
        
        let extra1 = width1 - x1
        let extra2 = width2 - x2
        return max(extra1, extra2) + max(x1, x2)
        
    }
    public static func getHeight(height1: Int, y1: Int, height2: Int, y2: Int) -> Int {
        let extra1 = height1 - y1
        let extra2 = height2 - y2
        return max(extra1, extra2) + max(y1, y2)
    }
}
