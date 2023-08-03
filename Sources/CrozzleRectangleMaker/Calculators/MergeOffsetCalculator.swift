//
//  MergeOffsetCalculator.swift
//  
//
//  Created by Michael Geurtjens on 1/8/2023.
//

import Foundation
public class MergeOffsetCalculator {
    
    /* This is part of the new way*/
    public static func GetAdjustedPlacement(placement: PlacementModel) -> (Int, Int) {
        if placement.z {
            return (Int(placement.x), Int(placement.y - 1))
        } else {
            // lets also flip them
            return (Int(placement.y), Int(placement.x - 1))
        }
    }
    /* this is part of the new way*/
    public static func GetOffsets(p1: PlacementModel, p2: PlacementModel) -> (UInt8, UInt8, UInt8, UInt8, Bool) {
        
        let flipped = p1.z != p2.z
        
        // These adjusted when its vertical it gets flipped
        let (ax1, ay1) = GetAdjustedPlacement(placement: p1)
        let (ax2, ay2) = GetAdjustedPlacement(placement: p2)
        
        
        var x1: UInt8 = 0
        var y1: UInt8 = 0
        
        var x2: UInt8 = 0
        var y2: UInt8 = 0
        
        
        
        if ax1 > ax2 {
            x2 = UInt8(ax1 - ax2)
        } else if ax2 > ax1 {
            x1 = UInt8(ax2 - ax1)
        }
        
        if ay1 > ay2 {
            y2 = UInt8(ay1 - ay2)
        } else if ay2 > ay1 {
            y1 = UInt8(ay2 - ay1)
        }
       
        
        // How much each should move by to accommodate the other shape
        return (x1, y1, x2, y2, flipped)
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
