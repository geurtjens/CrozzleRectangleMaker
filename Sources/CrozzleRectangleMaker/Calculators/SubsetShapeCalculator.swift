//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 16/6/2023.
//

import Foundation
public class SubsetShapeCalculator {
    
    public static func ApplyOffsets(placements: [PlacementModel], negativeOffsetX: UInt8, negativeOffsetY: UInt8) -> [PlacementModel] {
        var result: [PlacementModel] = []
        
        if negativeOffsetX == 0 && negativeOffsetY == 0 {
            return placements
        }
        
        for p in placements {
            result.append(PlacementModel(w: p.w, x: p.x - negativeOffsetX, y: p.y - negativeOffsetY, z: p.z, l: p.l))
        }
        return result
    }
    
    
    
    
    public static func IsSubset(shapeSmall: ShapeModel, shapeLarge: ShapeModel, words: [String]) -> Bool {
        
        if shapeSmall.placements.count > shapeLarge.placements.count {
            return IsSubset(shapeSmall: shapeLarge, shapeLarge: shapeSmall, words: words)
        }
        
        let subsetPlacements = GetCommonPlacements(placementsSmall: shapeSmall.placements, placementsLarge: shapeLarge.placements)
        if subsetPlacements.count == 0 {
            return false
        }
        
        let offsetX = GetMinX(placements: subsetPlacements)
        let offsetY = GetMinY(placements: subsetPlacements)
        
        let baselined = ApplyOffsets(placements: subsetPlacements, negativeOffsetX: offsetX, negativeOffsetY: offsetY)
       
        // Lets just make the text and compare them
        let baselinedShape = ShapeModel(score:shapeSmall.score, width: baselined.width(), height:baselined.height(), placements: baselined)
        
        let smallerShapeText = shapeSmall.ToString(words: words)
        if baselinedShape.placements[0].z == shapeSmall.placements[0].z {
            // going in the same direction
            
            let baselinedText = baselinedShape.ToString(words: words)
            if smallerShapeText == baselinedText {
                return true
            } else {
                return false
            }
                
        } else {
            let baselinedText = baselinedShape.Flip().ToString(words: words)
            if smallerShapeText == baselinedText {
                return true
            } else {
                return false
            }
        }
    }
    
    public static func GetMinX(placements: [PlacementModel]) -> UInt8 {
        var minX: UInt8 = 255
        for placement in placements {
            if placement.x < minX {
                minX = placement.x
            }
        }
        return minX
    }

    public static func GetMinY(placements: [PlacementModel]) -> UInt8 {
        var minY: UInt8 = 255
        for placement in placements {
            if placement.y < minY {
                minY = placement.y
            }
        }
        return minY
    }

    
    public static func GetCommonPlacement(wordId: UInt8, placements: [PlacementModel]) -> PlacementModel? {
        let matching = placements.filter { $0.w == wordId}
        
        if matching.count == 0 {
            return nil
        } else if matching.count > 1 {
            // This should never happen as they should all be unique
            return matching[0]
        } else {
            return matching[0]
        }
    }
    public static func GetCommonPlacements(placementsSmall: [PlacementModel], placementsLarge: [PlacementModel]) -> [PlacementModel]{
        
        var result: [PlacementModel] = []
        for placement in placementsSmall {
            let matching = GetCommonPlacement(wordId: placement.w, placements: placementsLarge)
            
            guard let matching = matching else {
                return []
            }
            result.append(matching)
        
        }
        return result
    }
}
