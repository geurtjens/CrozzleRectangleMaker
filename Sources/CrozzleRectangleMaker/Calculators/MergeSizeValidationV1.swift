//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 18/1/2024.
//

import Foundation
public class MergeSizeValidationV1 {
    public static func executeWithItems(
        sourceShapes: GpuShapeModel,
        sourceWidth: Int,
        sourceHeight: Int,
        sourcePos: Int,
        searchShapes: GpuShapeModel,
        searchWidth: Int,
        searchHeight: Int,
        searchPos: Int,
        widthMax: Int,
        heightMax: Int) -> (Bool, Int, Int)
    {
        let flipped = (sourceShapes.isHorizontal[sourcePos] == searchShapes.isHorizontal[searchPos])

        let sourceX = sourceShapes.x[sourcePos]
        let sourceY = sourceShapes.y[sourcePos]
        let searchX = searchShapes.x[searchPos]
        let searchY = searchShapes.y[searchPos]

        let (isValid, width, height) = MergeSizeValidation.verifyWidthHeight(
            width1: Int(sourceWidth),
            height1: Int(sourceHeight),
            x1: Int(sourceX),
            y1: Int(sourceY),
            width2: Int(searchWidth),
            height2: Int(searchHeight),
            x2: Int(searchX),
            y2: Int(searchY),
            flipped: flipped,
            widthMax: widthMax,
            heightMax: heightMax)

        if isValid {
            return (true, width, height)
        } else {
            return (false, width, height)
        }
    }
    
    
    
    
    public static func execute(
        instruction: MergeInstructionModel,
        sourceShapes: GpuShapeModel,
        searchShapes: GpuShapeModel,
        widthMax: Int,
        heightMax: Int) -> (Bool, Int, Int)
    {

        //return true

        let sourceWidth = sourceShapes.widths[instruction.sourceShapeId]
        let sourceHeight = sourceShapes.heights[instruction.sourceShapeId]

        let sourceWordPosition = instruction.sourceShapeId * sourceShapes.stride + Int(instruction.firstSourcePos)

        let sourceX = sourceShapes.x[sourceWordPosition]
        let sourceY = sourceShapes.y[sourceWordPosition]

        let searchWidth = searchShapes.widths[instruction.searchShapeId]
        let searchHeight = searchShapes.heights[instruction.searchShapeId]

        let searchWordPosition = instruction.searchShapeId * searchShapes.stride + Int(instruction.firstSearchPos)

        let searchX = searchShapes.x[searchWordPosition]
        let searchY = searchShapes.y[searchWordPosition]

        let (isValid, width, height) = MergeSizeValidation.verifyWidthHeight(
            width1: Int(sourceWidth),
            height1: Int(sourceHeight),
            x1: Int(sourceX),
            y1: Int(sourceY),
            width2: Int(searchWidth),
            height2: Int(searchHeight),
            x2: Int(searchX),
            y2: Int(searchY),
            flipped: instruction.flipped,
            widthMax: widthMax,
            heightMax: heightMax)

        if isValid {
            return (true, width, height)
        } else {
            return (false, width, height)
        }
    }
}
