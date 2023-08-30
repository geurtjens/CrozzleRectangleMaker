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
    public static func Execute(sourceShapes: GpuShapeModel, searchShapes: GpuShapeModel, instruction: MergeInstructionModel, words:[String]) -> [PlacementModel] {
        
        // This will flip the placements if they are opposite direction
        let (sourcePlacement, searchPlacement) = GetPlacementsForBothShapes(
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            instruction: instruction)
        
        let commonPlacements = PlacementCalculator.findCommonPlacement(
            sourcePlacements: sourcePlacement,
            searchPlacements: searchPlacement)
        
        if commonPlacements.count == 0 {
            print("Your offset calculator did not work")
        }
        
        let sourcePos = instruction.sourceShapeId * sourceShapes.stride + Int(instruction.firstSourcePos)
        
        let searchPos = instruction.searchShapeId * searchShapes.stride + Int(instruction.firstSearchPos)
        
        // I think the first word position might be useful
        let xSource = sourceShapes.x[sourcePos]
        let ySource = sourceShapes.y[sourcePos]

        let xSearch = searchShapes.x[searchPos]
        let ySearch = searchShapes.y[searchPos]
        
        // By this moment the placements are flipped if they were wrong originally
        let (sourceOffsetX, sourceOffsetY, searchOffsetX, searchOffsetY) = MergeOffsetCalculator.CalculateOffsets(
            xSource: Int(xSource),
            ySource: Int(ySource),
            xSearch: Int(xSearch),
            ySearch: Int(ySearch),
            flipped: instruction.flipped)
        
        // Now we can apply the offsets I guess
        let sourceFinal = MergeOffsetCalculator.ApplyOffsets(
            placements: sourcePlacement,
            xOffset: sourceOffsetX,
            yOffset: sourceOffsetY)
        
        let searchFinal = MergeOffsetCalculator.ApplyOffsets(
            placements: searchPlacement,
            xOffset: searchOffsetX,
            yOffset: searchOffsetY)
        
        
        // We need to remove the common words from searchFinal
        var searchNoDuplicates: [PlacementModel] = []
        for item in searchFinal {
            if commonPlacements.contains(Int(item.w)) == false {
                searchNoDuplicates.append(item)
            }
        }
        
        let isOverlapping = OverlappingPlacementsCalculator.isOverlapping(sourcePlacements: sourceFinal, searchPlacements: searchNoDuplicates)
        if isOverlapping {
            return []
        }
        
        var combined = sourceFinal + searchNoDuplicates
        
        combined.sort { $0.w < $1.w }
        
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
        
        
        // We do not know the score just yet
        //let shape = ShapeModel(score:10, width: UInt8(width), height: UInt8(height), placements: combined)

        
        return combined
    }
    
    
    // Create a shape from two `GpuShapeModel` based on the instructions provided
    public static func ExecuteV2(sourceShape: ShapeModel, searchShape: ShapeModel, instruction: MergeInstructionModel, words:[String]) -> [PlacementModel] {
        
        // This will flip the placements if they are opposite direction
        //let (sourcePlacements, searchPlacements) = GetPlacementsForBothShapesV2(
           // sourceShapes: sourceShapes,
           // searchShapes: searchShapes,
           // instruction: instruction)
        
        var sourceShape = sourceShape
        if instruction.flipped {
            sourceShape = sourceShape.Flip()
        }
        
        
        
        let commonPlacements = PlacementCalculator.findCommonPlacement(
            sourcePlacements: sourceShape.placements,
            searchPlacements: searchShape.placements)
        
        if commonPlacements.count == 0 {
            print("Your offset calculator did not work")
        }
        
//        let sourcePos = instruction.sourceShapeId * sourceShapes.stride + Int(instruction.sourceMatchingWordPosition)
//
//        let searchPos = instruction.searchShapeId * searchShapes.stride + Int(instruction.searchMatchingWordPosition)
//
        
        let sourcePlacement = sourceShape.placements[Int(instruction.firstSourcePos)]
        let searchPlacement = searchShape.placements[Int(instruction.firstSearchPos)]
        
        // I think the first word position might be useful
        let xSource = Int(sourcePlacement.x)
        let ySource = Int(sourcePlacement.y)

        let xSearch = Int(searchPlacement.x)
        let ySearch = Int(searchPlacement.y)
        
        // By this moment the placements are flipped if they were wrong originally
        let (sourceOffsetX, sourceOffsetY, searchOffsetX, searchOffsetY) = MergeOffsetCalculator.CalculateOffsets(
            xSource: xSource,
            ySource: ySource,
            xSearch: xSearch,
            ySearch: ySearch,
            flipped: false)
        
        // Now we can apply the offsets I guess
        let sourceFinal = MergeOffsetCalculator.ApplyOffsets(
            placements: sourceShape.placements,
            xOffset: sourceOffsetX,
            yOffset: sourceOffsetY)
        
        let searchFinal = MergeOffsetCalculator.ApplyOffsets(
            placements: searchShape.placements,
            xOffset: searchOffsetX,
            yOffset: searchOffsetY)
        
        
        // We need to remove the common words from searchFinal
        var searchNoDuplicates: [PlacementModel] = []
        for item in searchFinal {
            if commonPlacements.contains(Int(item.w)) == false {
                searchNoDuplicates.append(item)
            }
        }
        
        let isOverlapping = OverlappingPlacementsCalculator.isOverlapping(sourcePlacements: sourceFinal, searchPlacements: searchNoDuplicates)
        if isOverlapping {
            return []
        }
        
        var combined = sourceFinal + searchNoDuplicates
        
        combined.sort { $0.w < $1.w }
        
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
        
        
        // We do not know the score just yet
        //let shape = ShapeModel(score:10, width: UInt8(width), height: UInt8(height), placements: combined)

        
        return combined
    }
    
    
    
    
    /// Converting from `GpuShapeModel` to `[PlacementModel]`.  Flip second `[PlacementModel]` if required.  Only add words not in first to second `[PlacementModel]`.
    public static func GetPlacementsForBothShapes(sourceShapes: GpuShapeModel, searchShapes: GpuShapeModel, instruction: MergeInstructionModel) -> ([PlacementModel], [PlacementModel]) {
        
        let sourceStartPos = instruction.sourceShapeId * sourceShapes.stride
        let searchStartPos = instruction.searchShapeId * searchShapes.stride
        
        var words: [UInt8] = []
        
        var placements:[PlacementModel] = []
        for i in 0..<sourceShapes.stride {
            
            let idx = sourceStartPos + i
            
            words.append(sourceShapes.wordId[idx])
            
            let placement = PlacementModel(
                w: sourceShapes.wordId[idx],
                x: sourceShapes.x[idx],
                y: sourceShapes.y[idx],
                z: sourceShapes.isHorizontal[idx],
                l: sourceShapes.length[idx])
            placements.append(placement)
            
        }
        
        var otherPlacements:[PlacementModel] = []
        
        for i in 0..<searchShapes.stride {
            
            let idx = searchStartPos + i
            
            let wordId = searchShapes.wordId[idx]
            
            //if words.contains(wordId) == false {
                
                let z = searchShapes.isHorizontal[idx]
                let x = searchShapes.x[idx]
                let y = searchShapes.y[idx]
                let length = searchShapes.length[idx]
                
                if instruction.flipped {
                    let placement = PlacementModel(
                        w: wordId,
                        x: y,
                        y: x,
                        z: !z,
                        l: length)
                    otherPlacements.append(placement)
                } else {
                    let placement = PlacementModel(
                        w: wordId,
                        x: x,
                        y: y,
                        z: z,
                        l: length)
                    otherPlacements.append(placement)
                }
            //}
        }
        return (placements, otherPlacements)
        
    }
    
    public static func GetPlacementsForBothShapesV2(sourceShapes: [ShapeModel], searchShapes: [ShapeModel], instruction: MergeInstructionModel) -> ([PlacementModel], [PlacementModel]) {
        
        
        let sourcePlacements = sourceShapes[instruction.sourceShapeId].placements
        let searchPlacements = searchShapes[instruction.searchShapeId].placements
//        var searchShape = searchShapes[instruction.searchShapeId]
//
//        if instruction.flipped == true {
//            searchShape = searchShape.Flip()
//        }
        
        return (sourcePlacements, searchPlacements)
        
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
                w: search.wordId[idx],
                x: search.x[idx],
                y: search.y[idx],
                z: search.isHorizontal[idx],
                l: search.length[idx])
            searchPlacements.append(placement)
            
        }
        
        var sourcePlacements:[PlacementModel] = []
        
        for i in 0..<source.stride {
            
            let idx = sourceStartPos + i
            
            let wordId = source.wordId[idx]
            
            if words.contains(wordId) == false {
                
                let x = source.x[idx]
                let y = source.y[idx]
                let z = source.isHorizontal[idx]
                let length = source.length[idx]
                
                if instruction.flipped {
                    let placement = PlacementModel(
                        w: wordId,
                        x: y,
                        y: x,
                        z: !z,
                        l: length)
                    sourcePlacements.append(placement)
                } else {
                    let placement = PlacementModel(
                        w: wordId,
                        x: x,
                        y: y,
                        z: z,
                        l: length)
                    sourcePlacements.append(placement)
                }
            }
        }
        return (sourcePlacements, searchPlacements)
        
    }
    
    
  
    
}
