//
//  ShapeCalculator.swift
//  
//
//  Created by Michael Geurtjens on 18/5/2023.
//

import Foundation

// Placements will be sorted with lowest wordId first
public struct PlacementCalculator {
    
    /// converts `topLeft` rectangles to placements
    public static func ConvertToPlacements(topLeft input: RectangleModel) -> [PlacementModel] {
        
        let maxLeft = Int(input.bottomLetterPos)
        
        let maxUp = Int(input.rightLetterPos) + 1
        
        let topPlacement = PlacementModel(
            i: input.top,
            h: true,
            x: UInt8(maxLeft + 1),
            y: UInt8(maxUp),
            length: input.topLength
        )
        
        let bottomPlacement = PlacementModel(
            i: input.bottom,
            h: true,
            x: UInt8(maxLeft - Int(input.bottomLetterPos)),
            y: UInt8(maxUp + Int(input.interlockHeight)),
            length: input.bottomLength)
        
        let leftPlacement = PlacementModel(
            i: input.left,
            h: false,
            x: UInt8(maxLeft + 1),
            y: UInt8(maxUp),
            length: input.leftLength)
        
        let rightPlacement = PlacementModel(
            i: input.right,
            h: false,
            x: UInt8(maxLeft + Int(input.interlockWidth) + 1),
            y: 0,
            length: input.rightLength)
        
        var placements = [topPlacement, bottomPlacement, leftPlacement, rightPlacement]
        
        placements.sort { $0.i < $1.i}
        
        return placements
    }
    
    
    /// converts `topRight` rectangles to placements
    public static func ConvertToPlacements(topRight input: RectangleModel) -> [PlacementModel] {
        
        let maxLeft = Int(max(input.topLetterPos, input.bottomLetterPos))
        
        let maxUp = Int(input.leftLetterPos) + 1
        
        let topPlacement = PlacementModel(
            i: input.top,
            h: true,
            x: UInt8(maxLeft - Int(input.topLetterPos)),
            y: UInt8(maxUp),
            length: input.topLength)
        
        let bottomPlacement = PlacementModel(
            i: input.bottom,
            h: true,
            x: UInt8(maxLeft - Int(input.bottomLetterPos)),
            y: UInt8(maxUp + Int(input.interlockHeight)),
            length: input.bottomLength)
        
        let leftPlacement = PlacementModel(
            i: input.left,
            h: false,
            x: UInt8(maxLeft + 1),
            y: 0,
            length: input.leftLength)
        
        let rightPlacement = PlacementModel(
            i: input.right,
            h: false,
            x: UInt8(maxLeft + Int(input.interlockWidth) + 1),
            y: UInt8(maxUp),
            length: input.rightLength)
        
        var placements = [topPlacement, bottomPlacement, leftPlacement, rightPlacement]
        
        placements.sort { $0.i < $1.i}
        
        return placements
    }
    
    
    /// converts `bottomLeft` rectangles to placements
    public static func ConvertToPlacements(bottomLeft input: RectangleModel) -> [PlacementModel] {
        
        let maxLeft = Int(input.topLetterPos) + 1
        
        let maxUp = Int(max(input.leftLetterPos, input.rightLetterPos))
        
        let topPlacement = PlacementModel(
            i: input.top,
            h: true,
            x: 0, //maxLeft - input.topLetterPos,
            y: UInt8(maxUp + 1),
            length: input.topLength)
        
        let bottomPlacement = PlacementModel(
            i: input.bottom,
            h: true,
            x: UInt8(maxLeft), // - input.bottomLetterPos,
            y: UInt8(maxUp + 1 + Int(input.interlockHeight)),
            length: input.bottomLength)
        
        let leftPlacement = PlacementModel(
            i: input.left,
            h: false,
            x: UInt8(maxLeft),
            y: UInt8(maxUp - Int(input.leftLetterPos)),
            length: input.leftLength)
        
        let rightPlacement = PlacementModel(
            i: input.right,
            h: false,
            x: UInt8(maxLeft + Int(input.interlockWidth)),
            y: UInt8(maxUp - Int(input.rightLetterPos)),
            length: input.rightLength)
        
        var placements = [topPlacement, bottomPlacement, leftPlacement, rightPlacement]
        
        placements.sort { $0.i < $1.i}
        
        return placements

    }
    
    
    /// Converts `rectangles` to placements
    public static func ConvertToPlacements(rectangle input: RectangleModel) -> [PlacementModel] {
        
        let maxLeft = Int(max(input.topLetterPos, input.bottomLetterPos))
        
        let maxUp = Int(max(input.leftLetterPos, input.rightLetterPos))
        
        let topPlacement = PlacementModel(
            i: input.top,
            h: true,
            x: UInt8(maxLeft - Int(input.topLetterPos)),
            y: UInt8(maxUp + 1),
            length: input.topLength)
        
        let bottomPlacement = PlacementModel(
            i: input.bottom,
            h: true,
            x: UInt8(maxLeft - Int(input.bottomLetterPos)),
            y: UInt8(maxUp + 1 + Int(input.interlockHeight)),
            length: input.bottomLength)
        
        let leftPlacement = PlacementModel(
            i: input.left,
            h: false,
            x: UInt8(maxLeft + 1),
            y: UInt8(maxUp - Int(input.leftLetterPos)),
            length: input.leftLength)
        
        let rightPlacement = PlacementModel(
            i: input.right,
            h: false,
            x: UInt8(maxLeft + 1 + Int(input.interlockWidth)),
            y: UInt8(maxUp - Int(input.rightLetterPos)),
            length: input.rightLength)
        
        var placements = [topPlacement, bottomPlacement, leftPlacement, rightPlacement]
        
        placements.sort { $0.i < $1.i}
        
        return placements
    }
    
    
    /// calculates `width` from `placements`
    public static func width(fromPlacements placements: [PlacementModel]) -> UInt8 {
        var maxWidth = 0
        for placement in placements {
            if placement.h {
                let end = Int(placement.x + placement.l)
                if maxWidth < end {
                    maxWidth = end
                }
            }
        }
        return UInt8(maxWidth + 2)
    }
    
    
    /// calculates `height` from `placements`
    public static func height(fromPlacements placements: [PlacementModel]) -> UInt8 {
        var maxHeight = 0
        for placement in placements {
            if placement.h == false {
                let end = Int(placement.y + placement.l)
                if maxHeight < end {
                    maxHeight = end
                }
            }
        }
        return UInt8(maxHeight + 2)
    }
}
