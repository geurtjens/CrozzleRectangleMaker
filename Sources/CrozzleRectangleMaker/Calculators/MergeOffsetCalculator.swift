//
//  MergeOffsetCalculator.swift
//  
//
//  Created by Michael Geurtjens on 1/8/2023.
//

import Foundation
public class MergeOffsetCalculator {
    
    
    
    
    
    
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
    
    /// change where we are placing each word, adjusting them so two placements can fall together in the one grid
    public static func ApplyOffsets(placements:[PlacementModel], xOffset: Int8, yOffset: Int8) -> [PlacementModel] {
        var newPlacements: [PlacementModel] = []
        for j in placements {
            let newPlacement = PlacementModel(
                w: j.w,
                x: UInt8(Int(j.x) + Int(xOffset)),
                y: UInt8(Int(j.y) + Int(yOffset)),
                z: j.z,
                l: UInt8(j.l))
            newPlacements.append(newPlacement)
        }
        return newPlacements
    }
  
}
