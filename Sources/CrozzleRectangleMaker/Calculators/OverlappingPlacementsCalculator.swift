//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 31/5/2023.
//

import Foundation
/// Assume both sourcePlacements and searchPlacements which are [PlacementModel] are now facing same direction and have their offsets adjusted before starting this
public class OverlappingPlacementsCalculator {
    public static func isOverlapping(sourcePlacements: [PlacementModel], searchPlacements: [PlacementModel]) -> Bool {

        for searchItem in searchPlacements {
            if isOverlappingOne(sourcePlacements:sourcePlacements, find:searchItem) {
                return true
            }
        }
        return false
    }
    
    public static func isOverlappingOne(item: PlacementModel, find: PlacementModel) -> Bool {
        if item.h == find.h {
            
            if item.h == true && item.y == find.y && columnsAreOverlapping(sourceStart: item.x, sourceLength: item.l, searchStart:find.x, searchLength: find.l) {
                return true
            }
            if item.h == false && item.x == find.x && columnsAreOverlapping(sourceStart: item.y, sourceLength: item.l, searchStart:find.y, searchLength: find.l) {
                return true
            }
        } else {
            if interlockOverlapping(source: item, search: find) {
                // when the placements are going in the opposite direction then overlapping rules do not apply, as this is an interlock
                // but what if it starts one less than the other then it would be a block right on the same word and that is not allowed so we could do something here
                return true
            }
        }
        return false
    }
    
    public static func isOverlappingOne(sourcePlacements: [PlacementModel], find: PlacementModel) -> Bool {
        for item in sourcePlacements {
            if isOverlappingOne(item: item, find: find) {
                return true
            }
        }
        return false
    }
    
    public static func interlockOverlapping(source: PlacementModel, search: PlacementModel) -> Bool {

        if source.h == search.h {
            return false
        }
        
        var horizontal = source
        var vertical = search
        if horizontal.h == false {
            swap(&horizontal, &vertical)
        }
        
        
            
        if (horizontal.y == vertical.y || horizontal.y  == vertical.y + vertical.l + 1)  && (vertical.x > horizontal.x && vertical.x <= horizontal.x + horizontal.l)  {
            return true
                /// is this an interlock where there will be a block character on our word?
        } else if (horizontal.x == vertical.x || vertical.x  == horizontal.x + horizontal.l + 1)  && (horizontal.y > vertical.y && horizontal.y <= vertical.y + vertical.l) {
                /// look for this blocking interlock problem here also
            return true
        }
        
        return false
    }
    
    public static func columnsAreOverlapping(sourceStart: UInt8, sourceLength: UInt8, searchStart: UInt8, searchLength: UInt8) -> Bool {
        // Here is the tricky part about overlapping.  Can we figure this out and then fully test it.
        let sourceEnd = sourceStart + sourceLength
        let searchEnd = searchStart + searchLength
        
        /*
         01234567890
         .ABC.
            .DEF.
         */
        if searchStart >= sourceStart && searchStart <= sourceEnd {
            return true
        }
        
        /*
         01234567890
            .ABC.
         .DEF.
         */
        else if sourceStart >= searchStart && sourceStart <= searchEnd {
            return true
        }
        
        return false
    }
}
