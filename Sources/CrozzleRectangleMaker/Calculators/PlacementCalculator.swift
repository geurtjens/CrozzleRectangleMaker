//
//  ShapeCalculator.swift
//  
//
//  Created by Michael Geurtjens on 18/5/2023.
//

import Foundation

// Placements will be sorted with lowest wordId first
public struct PlacementCalculator {
    
    public static func ConvertToPlacements(topLeft input: RectangleModel) -> [PlacementModel] {
        
        let maxLeft = Int(input.bottomLetterPos)
        
        let maxUp = Int(input.rightLetterPos) + 1
        
        let topPlacement = PlacementModel(
            i: Int(input.top),
            h: true,
            x: maxLeft + 1,
            y: maxUp,
            length: input.topLength
        )
        
        let bottomPlacement = PlacementModel(
            i: Int(input.bottom),
            h: true,
            x: maxLeft - Int(input.bottomLetterPos),
            y: maxUp + Int(input.interlockHeight),
            length: input.bottomLength)
        
        let leftPlacement = PlacementModel(
            i: Int(input.left),
            h: false,
            x: maxLeft + 1,
            y: maxUp,
            length: input.leftLength)
        
        let rightPlacement = PlacementModel(
            i: Int(input.right),
            h: false,
            x: maxLeft + Int(input.interlockWidth) + 1,
            y: 0,
            length: input.rightLength)
        
        var placements = [topPlacement, bottomPlacement, leftPlacement, rightPlacement]
        
        placements.sort { $0.i < $1.i}
        
        return placements
    }
    
    public static func ConvertToPlacements(topRight input: RectangleModel) -> [PlacementModel] {
        
        let maxLeft = Int(max(input.topLetterPos, input.bottomLetterPos))
        
        let maxUp = Int(input.leftLetterPos) + 1
        
        let topPlacement = PlacementModel(
            i: Int(input.top),
            h: true,
            x: maxLeft - Int(input.topLetterPos),
            y: maxUp,
            length: input.topLength)
        
        let bottomPlacement = PlacementModel(
            i: Int(input.bottom),
            h: true,
            x: maxLeft - Int(input.bottomLetterPos),
            y: maxUp + Int(input.interlockHeight),
            length: input.bottomLength)
        
        let leftPlacement = PlacementModel(
            i: Int(input.left),
            h: false,
            x: maxLeft + 1,
            y: 0,
            length: input.leftLength)
        
        let rightPlacement = PlacementModel(
            i: Int(input.right),
            h: false,
            x: maxLeft + Int(input.interlockWidth) + 1,
            y: maxUp,
            length: input.rightLength)
        
        var placements = [topPlacement, bottomPlacement, leftPlacement, rightPlacement]
        
        placements.sort { $0.i < $1.i}
        
        return placements
    }
    
    public static func ConvertToPlacements(bottomLeft input: RectangleModel) -> [PlacementModel] {
        
        let maxLeft = Int(input.topLetterPos) + 1
        
        let maxUp = Int(max(input.leftLetterPos, input.rightLetterPos))
        
        let topPlacement = PlacementModel(
            i: Int(input.top),
            h: true,
            x: 0, //maxLeft - input.topLetterPos,
            y: maxUp + 1,
            length: input.topLength)
        
        let bottomPlacement = PlacementModel(
            i: Int(input.bottom),
            h: true,
            x: maxLeft, // - input.bottomLetterPos,
            y: maxUp + 1 + Int(input.interlockHeight),
            length: input.bottomLength)
        
        let leftPlacement = PlacementModel(
            i: Int(input.left),
            h: false,
            x: maxLeft,
            y: maxUp - Int(input.leftLetterPos),
            length: input.leftLength)
        
        let rightPlacement = PlacementModel(
            i: Int(input.right),
            h: false,
            x: maxLeft + Int(input.interlockWidth),
            y: maxUp - Int(input.rightLetterPos),
            length: input.rightLength)
        
        var placements = [topPlacement, bottomPlacement, leftPlacement, rightPlacement]
        
        placements.sort { $0.i < $1.i}
        
        return placements

    }
    
    
    // This is just like rectangle actually so two birds with one stone
    public static func ConvertToPlacements(rectangle input: RectangleModel) -> [PlacementModel] {
        
        let maxLeft = Int(max(input.topLetterPos, input.bottomLetterPos))
        
        let maxUp = Int(max(input.leftLetterPos, input.rightLetterPos))
        
        let topPlacement = PlacementModel(
            i: Int(input.top),
            h: true,
            x: maxLeft - Int(input.topLetterPos),
            y: maxUp + 1,
            length: input.topLength)
        
        let bottomPlacement = PlacementModel(
            i: Int(input.bottom),
            h: true,
            x: maxLeft - Int(input.bottomLetterPos),
            y: maxUp + 1 + Int(input.interlockHeight),
            length: input.bottomLength)
        
        let leftPlacement = PlacementModel(
            i: Int(input.left),
            h: false,
            x: maxLeft + 1,
            y: maxUp - Int(input.leftLetterPos),
            length: input.leftLength)
        
        let rightPlacement = PlacementModel(
            i: Int(input.right),
            h: false,
            x: maxLeft + 1 + Int(input.interlockWidth),
            y: maxUp - Int(input.rightLetterPos),
            length: input.rightLength)
        
        var placements = [topPlacement, bottomPlacement, leftPlacement, rightPlacement]
        
        placements.sort { $0.i < $1.i}
        
        return placements
    }
    
    public static func width(fromPlacements placements: [PlacementModel]) -> Int {
        var maxWidth = 0
        for placement in placements {
            if placement.h {
                let end = placement.x + placement.l
                if maxWidth < end {
                    maxWidth = end
                }
            }
        }
        return maxWidth + 2
    }
    public static func height(fromPlacements placements: [PlacementModel]) -> Int {
        var maxHeight = 0
        for placement in placements {
            if placement.h == false {
                let end = placement.y + placement.l
                if maxHeight < end {
                    maxHeight = end
                }
            }
        }
        return maxHeight + 2
    }
}
