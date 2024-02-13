//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 11/2/2024.
//

import Foundation
public class IndexResultValidator {

    /// Produces a list of instructions that can formulate a new shape
    public static func Execute(
        sourceShape: ShapeModel,
        searchShapes: [ShapeModel],
        items: [IndexResultModel],
        widthMax: Int,
        heightMax: Int) -> [IndexResultInstruction]
    {
        var result: [IndexResultInstruction] = []
        for item in items {
            if let validation = Validate(
                item: item,
                sourceShape: sourceShape,
                searchShape: searchShapes[item.searchShapeId],
                widthMax: widthMax,
                heightMax: heightMax)
            {
                result.append(validation)
            }
        }
        return result
    }
    
    /// This will gather the width and height and make sure its not too big, work out the offsets and if its flipped
    /// and if there are more than one common words will check if the common words are same direction and distance apart
    public static func Validate(
        item: IndexResultModel,
        sourceShape: ShapeModel,
        searchShape: ShapeModel,
        widthMax: Int,
        heightMax: Int) -> IndexResultInstruction?
    {
        
        let isFlipped = sourceShape.placements[Int(item.sourcePosList[0])].z != searchShape.placements[Int(item.searchPosList[0])].z
        
        let sourceX = Int(sourceShape.placements[Int(item.sourcePosList[0])].x)
        let sourceY = Int(sourceShape.placements[Int(item.sourcePosList[0])].y)
        let searchX = Int(searchShape.placements[Int(item.searchPosList[0])].x)
        let searchY = Int(searchShape.placements[Int(item.searchPosList[0])].y)
        
        // we should first validate the size
        let (width, height) = getWidthHeight(
            sourceWidth: Int(sourceShape.width),
            sourceHeight: Int(sourceShape.height),
            sourceX: sourceX,
            sourceY: sourceY,
            searchWidth: Int(searchShape.width),
            searchHeight: Int(searchShape.height),
            searchX: searchX,
            searchY: searchY,
            isFlipped: isFlipped)
        
        if !((width <= widthMax && height <= heightMax) ||
             (width <= heightMax && height <= widthMax)) 
        {
            return nil
        }
        
        let (sourceOffsetX, sourceOffsetY, searchOffsetX, searchOffsetY) = CalculateOffsets(
            sourceX: sourceX,
            sourceY: sourceY,
            searchX: searchX,
            searchY: searchY,
            isFlipped: isFlipped)
        
        /// If more than one common word then we have to check for other things, same direction and same distance
        if item.sourcePosList.count > 1
        {

            // Because we have more than one pos we must extract the values from the shapes
            let (sourceXList, sourceYList, sourceZList, searchXList, searchYList, searchZList) = GetStructures(item: item, sourceShape: sourceShape, searchShape: searchShape)
        
            let sameDirection = IsSameDirection(
                sourceZList: sourceZList,
                searchZList: searchZList,
                firstIsFlipped: isFlipped)
            
            if !sameDirection 
            {
                return nil
            }
            
            let sameDistance = IsSameDistance(
                sourceXList: sourceXList,
                sourceYList: sourceYList,
                searchXList: searchXList,
                searchYList: searchYList,
                firstIsFlipped: isFlipped)
            
            if sameDistance == false 
            {
                return nil
            }
        }
        
        return IndexResultInstruction(
            searchShapeId: item.searchShapeId,
            sourcePosList: item.sourcePosList,
            searchPosList: item.searchPosList,
            isFlipped: isFlipped,
            width: UInt8(width),
            height: UInt8(height),
            sourceOffsetX: sourceOffsetX,
            sourceOffsetY: sourceOffsetY,
            searchOffsetX: searchOffsetX,
            searchOffsetY: searchOffsetY)
    }
    
    
    /// will extract a data structure that makes it easier to work out same distance and same direction
    public static func GetStructures(
        item: IndexResultModel,
        sourceShape: ShapeModel,
        searchShape: ShapeModel) -> ([Int], [Int], [Bool], [Int], [Int], [Bool])
    {
        var sourceXList: [Int] = []
        var sourceYList: [Int] = []
        var sourceZList: [Bool] = []
        
        var searchXList: [Int] = []
        var searchYList: [Int] = []
        var searchZList: [Bool] = []
        
        for i in item.sourcePosList 
        {
            let pos = Int(i)
            sourceXList.append(Int(sourceShape.placements[pos].x))
            sourceYList.append(Int(sourceShape.placements[pos].y))
            sourceZList.append(sourceShape.placements[pos].z)
        }
        
        for i in item.searchPosList 
        {
            let pos = Int(i)
            searchXList.append(Int(searchShape.placements[pos].x))
            searchYList.append(Int(searchShape.placements[pos].y))
            searchZList.append(searchShape.placements[pos].z)
        }
        
        return (sourceXList, sourceYList, sourceZList, searchXList, searchYList, searchZList)
    }
    
    
    /// The offset depends on if the shape is flipped or will be merged in the same original direction.
    public static func CalculateOffsets(
        sourceX: Int,
        sourceY: Int,
        searchX: Int,
        searchY: Int,
        isFlipped: Bool) -> (Int8, Int8, Int8, Int8) 
    {
        /// Initialize variables no matter if its flipped or not
        var sourceOffsetX = 0
        var sourceOffsetY = 0
        var searchOffsetX = 0
        var searchOffsetY = 0
        
        if isFlipped == false
        {
            let xDiff = sourceX - searchX
            let yDiff = sourceY - searchY
            
            /// When it is minus then we need to move the first one in that direction in the absolute amount
            /// when its plus then we need to move the other one in that direction
            
            if xDiff < 0
            {
                sourceOffsetX += xDiff * -1
            }
            else if xDiff > 0
            {
                searchOffsetX += xDiff
            }
            
            if yDiff < 0
            {
                sourceOffsetY += yDiff * -1
            }
            else if yDiff > 0
            {
                searchOffsetY += yDiff
            }
            
            return (
                Int8(sourceOffsetX),
                Int8(sourceOffsetY),
                Int8(searchOffsetX),
                Int8(searchOffsetY))
        }
        else
        {
            let xDiff = sourceX - searchY
            let yDiff = sourceY - searchX
            
            /// When it is minus then we need to move the first one in that direction in the absolute amount
            /// when its plus then we need to move the other one in that direction
            
            if xDiff < 0
            {
                sourceOffsetX += xDiff * -1
            }
            else if xDiff > 0 {
                searchOffsetX += xDiff
            }
            
            if yDiff < 0
            {
                sourceOffsetY += yDiff * -1
            }
            else if yDiff > 0
            {
                searchOffsetY += yDiff
            }
            
            return (
                Int8(sourceOffsetX),
                Int8(sourceOffsetY),
                Int8(searchOffsetX),
                Int8(searchOffsetY))
        }
    }
    
    
    /// Check if matching words in source have same direction characteristics are matching words in search shape
    public static func IsSameDirection(
        sourceZList: [Bool],
        searchZList: [Bool],
        firstIsFlipped: Bool) -> Bool
    {
        /// The first direction comes from firstIsFlipped so we check that all others have same direction characteristics,
        /// either they are all flipped or all are not flipped
        for i in 1..<sourceZList.count
        {
            let isFlipped = sourceZList[i] != searchZList[i]
            
            if firstIsFlipped != isFlipped
            {
                return false
            }
        }
        return true
    }
    
    
    /// Check if the common words in source shape are same distance apart as common words in search shape
    public static func IsSameDistance(
        sourceXList: [Int],
        sourceYList: [Int],
        searchXList: [Int],
        searchYList: [Int],
        firstIsFlipped: Bool) -> Bool
    {
        /// Compare first match with all other matches
        let sourceX = sourceXList[0]
        let sourceY = sourceYList[0]
        let searchX = searchXList[0]
        let searchY = searchYList[0]

        let matchCount = sourceXList.count

        for sourcePos in 1..<matchCount 
        {
            let sourceX_diff = sourceX - sourceXList[sourcePos]
            let sourceY_diff = sourceY - sourceYList[sourcePos]

            let searchX_diff = searchX - searchXList[sourcePos]
            let searchY_diff = searchY - searchYList[sourcePos]

            if (firstIsFlipped) 
            {
                if (sourceX_diff != searchY_diff || sourceY_diff != searchX_diff) 
                {
                    return false
                }
            } 
            else
            {
                if (sourceX_diff != searchX_diff || sourceY_diff != searchY_diff) 
                {
                    return false
                }
            }
        }
        // We have passed all the distance checks
        return true
    }
      
    
    /// Find the width and height of the merged structure
    public static func getWidthHeight(
        sourceWidth: Int,
        sourceHeight: Int,
        sourceX: Int,
        sourceY: Int,
        searchWidth: Int,
        searchHeight: Int,
        searchX: Int,
        searchY: Int,
        isFlipped: Bool) -> (Int, Int) 
    {
        if isFlipped == false 
        {
            let width = getWidth(
                width1: sourceWidth,
                x1: sourceX,
                width2: searchWidth,
                x2: searchX)
            
            let height = getHeight(
                height1: sourceHeight,
                y1: sourceY,
                height2: searchHeight,
                y2: searchY)
            
            return (width, height)
        } 
        else
        {
            let width = getWidth(
                width1: sourceWidth,
                x1: sourceX,
                width2: searchHeight,
                x2: searchY)
            
            let height = getHeight(
                height1: sourceHeight,
                y1: sourceY,
                height2: searchWidth,
                y2: searchX)
            
            return (width, height)
        }
    }
        
    
    /// Get width of new structure
    public static func getWidth(width1: Int, x1: Int, width2: Int, x2: Int) -> Int 
    {
        let extra1 = width1 - x1
        let extra2 = width2 - x2
        
        return max(extra1, extra2) + max(x1, x2)
    }
    
        
    /// Get height of new structure
    public static func getHeight(height1: Int, y1: Int, height2: Int, y2: Int) -> Int 
    {
        let extra1 = height1 - y1
        let extra2 = height2 - y2
        
        return max(extra1, extra2) + max(y1, y2)
    }
    
    
    public static func MergeTwoShapesList(
        sourceShape: ShapeModel,
        searchShapes: [ShapeModel],
        instructions: [IndexResultInstruction]) -> [ShapeModel]
    {
        var result: [ShapeModel] = []
        for instruction in instructions {
            result.append(MergeTwoShapes(
                sourceShape: sourceShape,
                searchShape: searchShapes[instruction.searchShapeId],
                instruction: instruction))
        }
        return result
    }
    
    public static func MergeTwoShapes(
        sourceShape: ShapeModel,
        searchShape: ShapeModel,
        instruction: IndexResultInstruction) -> ShapeModel
    {
        // We must first merge the placements
        let placements = MergePlacements(sourceShape: sourceShape, searchShape: searchShape, instruction: instruction)
        
        let score: UInt16 = 0
        
        let shape = ShapeModel(
            score: score,
            width: instruction.width,
            height: instruction.height,
            placements: placements)
        
        return shape
    }
    
    public static func MergePlacements(sourceShape: ShapeModel, searchShape: ShapeModel, instruction: IndexResultInstruction) -> [PlacementModel]
    {
            
        var result: [PlacementModel] = []
        if instruction.sourceOffsetX == 0 && instruction.sourceOffsetY == 0 {
            result = sourceShape.placements
        } else {
            for p in sourceShape.placements {
                result.append(PlacementModel(
                    w:p.w,
                    x: p.x + UInt8(instruction.sourceOffsetX),
                    y: p.y + UInt8(instruction.sourceOffsetY),
                    z: p.z,
                    l: p.l))
            }
        }
        
        
        for i in 0..<searchShape.placements.count {
            if instruction.searchPosList.contains(UInt8(i)) == false {
                if instruction.isFlipped == false {
                    for p in searchShape.placements {
                        result.append(PlacementModel(
                            w: p.w,
                            x: p.x + UInt8(instruction.searchOffsetX),
                            y: p.y + UInt8(instruction.searchOffsetY),
                            z: p.z,
                            l: p.l))
                    }
                } else {
                    for p in searchShape.placements {
                        result.append(PlacementModel(
                            w: p.w,
                            x: p.y + UInt8(instruction.searchOffsetX),
                            y: p.x + UInt8(instruction.searchOffsetY),
                            z: !p.z,
                            l: p.l))
                    }
                }
            }
        }
        
        result.sort { $0.w < $1.w }
        
        if result[0].z == false {
            result = PlacementCalculator.flip(placements: result)
        }
        return result
    }
}
