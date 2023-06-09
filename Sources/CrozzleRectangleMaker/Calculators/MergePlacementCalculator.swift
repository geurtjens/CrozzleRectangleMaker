//
//  MergePlacementCalculator.swift
//  
//
//  Created by Michael Geurtjens on 25/5/2023.
//

import Foundation
/// Merging together placements from two different shapes
public class MergePlacementCalculator {
    
    // Create a shape from two `GpuShapeModel` based on the instructions provided
    public static func Execute(source: GpuShapeModel, search: GpuShapeModel, instruction: MergeInstructionModel) -> ShapeModel? {
        
        let (sourcePlacement, searchPlacement) = GetPlacementsForBothShapes(source: source, search: search, instruction: instruction)
        
        let sourcePos = instruction.sourceShapeId * source.stride + Int(instruction.sourceMatchingWordPosition)
        
        let searchPos = instruction.searchShapeId * search.stride + Int(instruction.searchMatchingWordPosition)
        
        // I think the first word position might be useful
        let xSource = source.x[sourcePos]
        let ySource = source.y[sourcePos]

        let xSearch = search.x[searchPos]
        let ySearch = search.y[searchPos]
        
        let (sourceOffsetX, sourceOffsetY, searchOffsetX, searchOffsetY) = CalculateOffsets(
            xSource: Int(xSource),
            ySource: Int(ySource),
            xSearch: Int(xSearch),
            ySearch: Int(ySearch),
            flipped: instruction.flipped)
        
        // Now we can apply the offsets I guess
        let sourceFinal = ApplyOffsets(
            placements: sourcePlacement,
            xOffset: sourceOffsetX,
            yOffset: sourceOffsetY)
        
        let searchFinal = ApplyOffsets(
            placements: searchPlacement,
            xOffset: searchOffsetX,
            yOffset: searchOffsetY)
        
        let isOverlapping = OverlappingPlacementsCalculator.isOverlapping(sourcePlacements: sourceFinal, searchPlacements: searchFinal)
        if isOverlapping {
            return nil
        }
        
        var combined = sourceFinal + searchFinal
        combined.sort { $0.i < $1.i }
        
        /*
         .  .
         S .G
         T.BUOY.
        .AHOY.
        .YAW.
         .W.
          S
          E
          R
          .
         */
        
        let width = PlacementCalculator.width(fromPlacements: combined)
        let height = PlacementCalculator.height(fromPlacements: combined)

        // We do not know the score just yet
        let shape = ShapeModel(score:10, width: UInt8(width), height: UInt8(height), placements: combined)

        
        return shape
    }
    
    
    
    
    
    
    
    /// Converting from `GpuShapeModel` to `[PlacementModel]`.  Flip second `[PlacementModel]` if required.  Only add words not in first to second `[PlacementModel]`.
    public static func GetPlacementsForBothShapes(source: GpuShapeModel, search: GpuShapeModel, instruction: MergeInstructionModel) -> ([PlacementModel], [PlacementModel]) {
        
        let sourceStartPos = instruction.sourceShapeId * source.stride
        let searchStartPos = instruction.searchShapeId * search.stride
        
        var words: [UInt8] = []
        
        var placements:[PlacementModel] = []
        for i in 0..<source.stride {
            
            let idx = sourceStartPos + i
            
            words.append(source.wordId[idx])
            
            let placement = PlacementModel(
                i: source.wordId[idx],
                h: source.isHorizontal[idx],
                x: source.x[idx],
                y: source.y[idx],
                l: source.length[idx])
            placements.append(placement)
            
        }
        
        var otherPlacements:[PlacementModel] = []
        
        for i in 0..<search.stride {
            
            let idx = searchStartPos + i
            
            let wordId = search.wordId[idx]
            
            if words.contains(wordId) == false {
                
                let h = search.isHorizontal[idx]
                let x = search.x[idx]
                let y = search.y[idx]
                let length = search.length[idx]
                
                if instruction.flipped {
                    let placement = PlacementModel(
                        i: wordId,
                        h: !h,
                        x: y,
                        y: x,
                        l: length)
                    otherPlacements.append(placement)
                } else {
                    let placement = PlacementModel(
                        i: wordId,
                        h: h,
                        x: x,
                        y: y,
                        l: length)
                    otherPlacements.append(placement)
                }
            }
        }
        return (placements, otherPlacements)
        
    }
    
    /// This is a duplicate of `GetPlacementsForBothShapes` except we do things in opposite order.  But currently this doesnt work, needs refining
    public static func GetPlacementsForBothShapesOpposite(source: GpuShapeModel, search: GpuShapeModel, instruction: MergeInstructionModel) -> ([PlacementModel], [PlacementModel]) {
        
        let sourceStartPos = instruction.sourceShapeId * source.stride
        let searchStartPos = instruction.searchShapeId * search.stride
        
        var words: [UInt8] = []
        
        var searchPlacements:[PlacementModel] = []
        for i in 0..<search.stride {
            
            let idx = searchStartPos + i
            
            words.append(search.wordId[idx])
            
            let placement = PlacementModel(
                i: search.wordId[idx],
                h: search.isHorizontal[idx],
                x: search.x[idx],
                y: search.y[idx],
                l: search.length[idx])
            searchPlacements.append(placement)
            
        }
        
        var sourcePlacements:[PlacementModel] = []
        
        for i in 0..<source.stride {
            
            let idx = sourceStartPos + i
            
            let wordId = source.wordId[idx]
            
            if words.contains(wordId) == false {
                
                let h = source.isHorizontal[idx]
                let x = source.x[idx]
                let y = source.y[idx]
                let length = source.length[idx]
                
                if instruction.flipped {
                    let placement = PlacementModel(
                        i: wordId,
                        h: !h,
                        x: y,
                        y: x,
                        l: length)
                    sourcePlacements.append(placement)
                } else {
                    let placement = PlacementModel(
                        i: wordId,
                        h: h,
                        x: x,
                        y: y,
                        l: length)
                    sourcePlacements.append(placement)
                }
            }
        }
        return (sourcePlacements, searchPlacements)
        
    }
    
    
    /// change where we are placing each word, adjusting them so two placements can fall together in the one grid
    public static func ApplyOffsets(placements:[PlacementModel], xOffset: Int8, yOffset: Int8) -> [PlacementModel] {
        var newPlacements: [PlacementModel] = []
        for j in placements {
            let newPlacement = PlacementModel(
                i:j.i,
                h: j.h,
                x: UInt8(Int(j.x) + Int(xOffset)),
                y: UInt8(Int(j.y) + Int(yOffset)),
                l: UInt8(j.l))
            newPlacements.append(newPlacement)
        }
        return newPlacements
    }
    
    /// The offset depends on if the shape is flipped or will be merged in the same original direction.
    public static func CalculateOffsets(xSource: Int, ySource: Int,xSearch: Int, ySearch: Int,flipped: Bool) -> (Int8, Int8, Int8, Int8) {
        
        if flipped == false {
            let xDiff = xSource - xSearch
            let yDiff = ySource - ySearch
            
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
            
            return (Int8(sourceOffsetX),Int8(sourceOffsetY),Int8(searchOffsetX),Int8(searchOffsetY))
        }
        else {
            let xDiff = xSource - ySearch
            let yDiff = ySource - xSearch
            
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
        
            return (Int8(sourceOffsetX),Int8(sourceOffsetY),Int8(searchOffsetX),Int8(searchOffsetY))
        }
    }
}
