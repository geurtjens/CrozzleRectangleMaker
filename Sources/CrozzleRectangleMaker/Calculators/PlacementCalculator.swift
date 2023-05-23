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
            y: maxUp)
        
        let bottomPlacement = PlacementModel(
            i: Int(input.bottom),
            h: true,
            x: maxLeft - Int(input.bottomLetterPos),
            y: maxUp + Int(input.interlockHeight))
        
        let leftPlacement = PlacementModel(
            i: Int(input.left),
            h: false,
            x: maxLeft + 1,
            y: maxUp)
        
        let rightPlacement = PlacementModel(
            i: Int(input.right),
            h: false,
            x: maxLeft + Int(input.interlockWidth) + 1,
            y: 0)
        
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
            y: maxUp)
        
        let bottomPlacement = PlacementModel(
            i: Int(input.bottom),
            h: true,
            x: maxLeft - Int(input.bottomLetterPos),
            y: maxUp + Int(input.interlockHeight))
        
        let leftPlacement = PlacementModel(
            i: Int(input.left),
            h: false,
            x: maxLeft + 1,
            y: 0)
        
        let rightPlacement = PlacementModel(
            i: Int(input.right),
            h: false,
            x: maxLeft + Int(input.interlockWidth) + 1,
            y: maxUp)
        
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
            y: maxUp + 1)
        
        let bottomPlacement = PlacementModel(
            i: Int(input.bottom),
            h: true,
            x: maxLeft, // - input.bottomLetterPos,
            y: maxUp + 1 + Int(input.interlockHeight))
        
        let leftPlacement = PlacementModel(
            i: Int(input.left),
            h: false,
            x: maxLeft,
            y: maxUp - Int(input.leftLetterPos))
        
        let rightPlacement = PlacementModel(
            i: Int(input.right),
            h: false,
            x: maxLeft + Int(input.interlockWidth),
            y: maxUp - Int(input.rightLetterPos))
        
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
            y: maxUp + 1)
        
        let bottomPlacement = PlacementModel(
            i: Int(input.bottom),
            h: true,
            x: maxLeft - Int(input.bottomLetterPos),
            y: maxUp + 1 + Int(input.interlockHeight))
        
        let leftPlacement = PlacementModel(
            i: Int(input.left),
            h: false,
            x: maxLeft + 1,
            y: maxUp - Int(input.leftLetterPos))
        
        let rightPlacement = PlacementModel(
            i: Int(input.right),
            h: false,
            x: maxLeft + 1 + Int(input.interlockWidth),
            y: maxUp - Int(input.rightLetterPos))
        
        var placements = [topPlacement, bottomPlacement, leftPlacement, rightPlacement]
        
        placements.sort { $0.i < $1.i}
        
        return placements
    }
}
