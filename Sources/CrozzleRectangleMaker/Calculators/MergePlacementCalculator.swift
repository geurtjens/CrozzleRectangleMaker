//
//  MergePlacementCalculator.swift
//  
//
//  Created by Michael Geurtjens on 25/5/2023.
//

import Foundation
public struct MergePlacementCalculator {
    
    
    public static func GetPlacementsForBothShapes(source: GpuShapeModel, search: GpuShapeModel, instruction: MergeInstructionModel) -> ([PlacementModel], [PlacementModel]) {
        
        let sourceStartPos = instruction.sourceShapeId * source.stride
        let searchStartPos = instruction.searchableShapeId * search.stride
        
        
        
        
        // We want to add all of the original shape and cater for the offsets
        
        // Then we only add those placements from the second shape that we need
        
        let flipped = instruction.flipped
        
        var words: [UInt8] = []
        
        var placements:[PlacementModel] = []
        for i in 0..<source.stride {
            
            let idx = sourceStartPos + i
            
            words.append(source.wordId[idx])
            
            let placement = PlacementModel(
                i: Int(source.wordId[idx]),
                h: source.isHorizontal[idx],
                x: Int(source.x[idx]),
                y: Int(source.y[idx]),
                length: source.length[idx])
            placements.append(placement)
            
        }
        
        var otherPlacements:[PlacementModel] = []
        
        for i in 0..<search.stride {
            
            let idx = searchStartPos + i
            
            let wordId = search.wordId[idx]
            
            if words.contains(wordId) == false {
                
                let h = search.isHorizontal[idx]
                let x = Int(search.x[idx])
                let y = Int(search.y[idx])
                let length = search.length[idx]
                
                if flipped {
                    let placement = PlacementModel(
                        i: Int(wordId),
                        h: !h,
                        x: y,
                        y: x,
                        length: length)
                    otherPlacements.append(placement)
                } else {
                    let placement = PlacementModel(
                        i: Int(wordId),
                        h: h,
                        x: x,
                        y: y,
                        length: length)
                    otherPlacements.append(placement)
                }
            }
        }
        return (placements, otherPlacements)
        
    }
    
    
    public static func ApplySourceOffsets(placements:[PlacementModel], xOffset: Int8, yOffset: Int8) -> [PlacementModel] {
        var newPlacements: [PlacementModel] = []
        for j in placements {
            let newPlacement = PlacementModel(i:j.i, h: j.h, x: j.x + Int(xOffset), y: j.y + Int(yOffset), length: UInt8(j.l))
            newPlacements.append(newPlacement)
        }
        return newPlacements
    }
    public static func ApplySearchOffsets(placements:[PlacementModel], xOffset: Int8, yOffset: Int8) -> [PlacementModel] {
        var newPlacements: [PlacementModel] = []
        for j in placements {
            let newPlacement = PlacementModel(i:j.i, h: j.h, x: j.x + Int(xOffset), y: j.y + Int(yOffset), length: UInt8(j.l))
            newPlacements.append(newPlacement)
        }
        return newPlacements
    }
    
    // This is going to be rather complex I would say
    public static func CalculateOffsets(xOffset: Int, yOffset: Int,
                                        xSource: Int, ySource: Int,
                                        xSearch: Int, ySearch: Int,
                                        flipped: Bool )
    -> (Int8, Int8, Int8, Int8) {
        
        let xDiff = xSource - xSearch
        let yDiff = ySource - ySearch
        
        
        print("xOffset:\(xOffset), yOffset:\(yOffset)")
        print("xSource - xSearch = xDiff : \(xSource) - \(xSearch) = \(xDiff) ")
        print("ySource - ySearch = yDiff : \(ySource) - \(ySearch) = \(yDiff) ")
        print("flipped:\(flipped)")
        
        // When it is minus then we need to move the first one in that direction in the absolute amount
        // when its plus then we need to move the other one in that direction
        
        var sourceOffsetX = 0
        var sourceOffsetY = 0
        var searchOffsetX = 0
        var searchOffsetY = 0
        
        
        if xDiff < 0 {
            sourceOffsetX += xDiff * -1
        } else if xDiff > 0 {
            searchOffsetX += xDiff
        }
        if yDiff < 0 {
            sourceOffsetY += yDiff * -1
        } else if yDiff > 0 {
            searchOffsetY += yDiff
        }
        
//        if xOffset < 0 {
//            sourceOffsetX += xOffset * -1
//        } else if xOffset > 0 {
//            searchOffsetX += xOffset
//        }
//        if yOffset < 0 {
//            sourceOffsetY += yOffset * -1
//        } else if yOffset > 0 {
//            searchOffsetY += yOffset
//        }
        
        
        print("sourceOffsetX: \(sourceOffsetX), sourceOffsetY: \(sourceOffsetY)")
        print("searchOffsetX: \(searchOffsetX), searchOffsetY: \(searchOffsetY)")
        
        
        
        if flipped == false {
            return (Int8(sourceOffsetX),Int8(sourceOffsetY),Int8(searchOffsetX),Int8(searchOffsetY))
        } else {
            return (Int8(sourceOffsetY),Int8(sourceOffsetX),Int8(searchOffsetY),Int8(searchOffsetX))
        }
        
        
        
    }
    
    public static func GetPlacementsOne(source: GpuShapeModel, search: GpuShapeModel, instruction: MergeInstructionModel) -> ShapeModel {
        let (sourcePlacement, searchPlacement) = GetPlacementsForBothShapes(source: source, search: search, instruction: instruction)
        
        
        //print("Source Placements")
        //print(sourcePlacement)
        //print("Search Placements")
        //print(searchPlacement)
        
        let sourcePos = instruction.sourceShapeId * source.stride + Int(instruction.sourceMatchingWordPosition)
        
        let searchPos = instruction.searchableShapeId * search.stride + Int(instruction.searchableMatchingWordPosition)
        
        // I think the first word position might be useful
        let xSource = source.x[sourcePos]
        let ySource = source.y[sourcePos]

        let xSearch = search.x[searchPos]
        let ySearch = search.y[searchPos]
        
        let (sourceOffsetX, sourceOffsetY, searchOffsetX, searchOffsetY) = CalculateOffsets(
            xOffset: Int(instruction.xOffset),
            yOffset: Int(instruction.yOffset),
            xSource: Int(xSource),
            ySource: Int(ySource),
            xSearch: Int(xSearch),
            ySearch: Int(ySearch),
            flipped: instruction.flipped)
        
        // Now we can apply the offsets I guess
        let sourceFinal = ApplySourceOffsets(
            placements: sourcePlacement,
            xOffset: sourceOffsetX,
            yOffset: sourceOffsetY)
        
        let searchFinal = ApplySearchOffsets(
            placements: searchPlacement,
            xOffset: searchOffsetX,
            yOffset: searchOffsetY)
        
        var combined = sourceFinal + searchFinal
        combined.sort { $0.i < $1.i }
        
        let width = PlacementCalculator.width(fromPlacements: combined)
        let height = PlacementCalculator.height(fromPlacements: combined)
        print("width: \(width), height: \(height)")
        // We do not know the score just yet
        let shape = ShapeModel(score:10, width: width, height: height, placements: combined)
        
        
        return shape
        
        
    }
    public static func GetPlacements(source: GpuShapeModel, search: GpuShapeModel, instructions: [MergeInstructionModel]) -> [ShapeModel] {
       
        var shapeList: [ShapeModel] = []
        for instruction in instructions {
            let placements = GetPlacementsOne(source: source, search: search, instruction: instruction)
            shapeList.append(placements)
        }
        return shapeList
    }
}
