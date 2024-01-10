//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 8/1/2024.
//

import Foundation
public class MergePlacementCalculatorV2 {
    /// This is a new way of merging without flipping that I developed within c#
    /// and now want to see if it ports to swift
    
    /// Not yet in use
    static func FindFirstCommonPosition(
        sourcePlacements: [PlacementModel],
        searchPlacements: [PlacementModel]) -> (Int, Int)
    {
        // First, we find the common placement
        for (i, sourcePlacement) in sourcePlacements.enumerated() {
            for (j, searchPlacement) in searchPlacements.enumerated() {
                if sourcePlacement.w == searchPlacement.w {
                    return (i, j)
                }
            }
        }
        return (-1, -1)
    }
    

// Create a shape from two `GpuShapeModel` based on the instructions provided
public static func ExecuteV2(
        sourcePlacements: [PlacementModel],
        searchPlacements: [PlacementModel]) -> [PlacementModel]
    {

        


        let (commonSourceId, commonSearchId) = FindFirstCommonPosition(
            sourcePlacements: sourcePlacements,
            searchPlacements: searchPlacements)


        if commonSourceId == -1 {
            print("Your offset calculator did not work")
            return []
        }
        let flip = sourcePlacements[commonSourceId].z != searchPlacements[commonSearchId].z

//        if flip == true {
//            print("SourcePlacements")
//            print(PlacementCalculator.Print(placements: sourcePlacements))
//            print("SearchPlacements")
//            print(PlacementCalculator.Print(placements: searchPlacements))
//            
//        }
        
        // By this moment the placements are flipped if they were wrong originally
        let (sourceOffsetX, sourceOffsetY, searchOffsetX, searchOffsetY) = MergeOffsetCalculator.CalculateOffsets(
            xSource: Int(sourcePlacements[commonSourceId].x),
            ySource: Int(sourcePlacements[commonSourceId].y),
            xSearch: Int(searchPlacements[commonSearchId].x),
            ySearch: Int(searchPlacements[commonSearchId].y),
            flipped: flip)

        // Now we can apply the offsets I guess
        let sourcePlacements = MergeOffsetCalculator.ApplyOffsets(
            placements: sourcePlacements,
            xOffset: sourceOffsetX,
            yOffset: sourceOffsetY)

        let excludedWords = findCommonWords(
            sourcePlacements: sourcePlacements,
            searchPlacements: searchPlacements)

        var searchPlacements = searchPlacements
        if (flip == true)
        {
            // We are going to flip each placement and then apply the offset
            searchPlacements = applyOffsetsForSearchWithFlip(
                placements: searchPlacements,
                xOffset: Int(searchOffsetX),
                yOffset: Int(searchOffsetY),
                excludedWords: excludedWords);
        } else {
            // Apply offset and at the same time remove any common words
            searchPlacements = applyOffsetsForSearch(
                placements: searchPlacements,
                xOffset: Int(searchOffsetX),
                yOffset: Int(searchOffsetY),
                excludedWords: excludedWords);
        }

        var result = sourcePlacements + searchPlacements
        result.sort { $0.w < $1.w }

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

        return result
    }


    static func applyOffsetsForSearchWithFlip(
        placements: [PlacementModel],
        xOffset: Int,
        yOffset: Int,
        excludedWords: Set<Int>
    ) -> [PlacementModel] {
        var result = [PlacementModel]()

        for placement in placements {
            if !excludedWords.contains(Int(placement.w)) {
                let newPlacement = PlacementModel(
                    w: placement.w,
                    x: UInt8(Int(placement.y) + xOffset),
                    y: UInt8(Int(placement.x) + yOffset),
                    z: !placement.z,
                    l: placement.l
                )
                result.append(newPlacement)
            }
        }

        return result
    }
    static func applyOffsetsForSearch(
        placements: [PlacementModel],
        xOffset: Int,
        yOffset: Int,
        excludedWords: Set<Int>
    ) -> [PlacementModel] {
        var result = [PlacementModel]()

        for placement in placements {
            if !excludedWords.contains(Int(placement.w)) {
                let newPlacement = PlacementModel(
                    w: placement.w,
                    x: UInt8(Int(placement.x) + xOffset),
                    y: UInt8(Int(placement.y) + yOffset),
                    z: placement.z,
                    l: placement.l
                )
                result.append(newPlacement)
            }
        }

        return result
    }
    
    
    static func findCommonWords(sourcePlacements: [PlacementModel], searchPlacements: [PlacementModel]) -> Set<Int> {
        let sourceWords = getWords(from: sourcePlacements)
        let searchWords = getWords(from: searchPlacements)

        let commonWords = Set(sourceWords).intersection(searchWords)

        return commonWords
    }
    
    static func getWords(from placements: [PlacementModel]) -> [Int] {
        var result = [Int]()
        for placement in placements {
            result.append(Int(placement.w))
        }
        return result
    }
}
