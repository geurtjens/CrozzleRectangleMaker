//
//  ShapeCalculator.swift
//  
//
//  Created by Michael Geurtjens on 18/5/2023.
//

import Foundation
public struct PlacementCalculator {
    
    public static func ConvertToPlacements(topLeft input: TopLeftBottomRightModel) -> [PlacementModel] {
        
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
        
        let placements = [topPlacement, bottomPlacement, leftPlacement, rightPlacement]
        
        return placements
    }
    
    public static func ConvertToPlacements(topRight input: TopLeftBottomRightModel) -> [PlacementModel] {
        
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
        
        let placements = [topPlacement, bottomPlacement, leftPlacement, rightPlacement]
        
        return placements
    }
    
    public static func ConvertToPlacements(bottomLeft input: TopLeftBottomRightModel) -> [PlacementModel] {
        
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
        
        let placements = [topPlacement, bottomPlacement, leftPlacement, rightPlacement]
        
        return placements

    }
    
    
    // This is just like rectangle actually so two birds with one stone
    public static func ConvertToPlacements(rectangle input: TopLeftBottomRightModel) -> [PlacementModel] {
        
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
        
        let placements = [topPlacement, bottomPlacement, leftPlacement, rightPlacement]
        
        return placements
    }
}
