//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 18/5/2023.
//

import Foundation
public struct ShapeCalculator {
    
    
    public static func ConvertToText(shape: ShapeModel, words:[String]) -> String {
        
        let widthEOL = shape.width + 1
        
        let gridSize = widthEOL * shape.height
        
        var grid:[Character] = Array(repeating: " ", count: gridSize)
        
        // Place all end of line characters into the space
        for i in 0..<shape.height {
            //if i != 0 {
                grid[i * widthEOL] = "\n"
            //}
        }
        
        for placement in shape.placements {
            
            let word = "." + words[placement.i] + "."
            
            // Just to create the variables that will be used in the loop
            var gridPos = 0

            
            for i in 0..<word.count {
                let letter = word[i]
                
                if placement.h {
                    gridPos = placement.x + i + (placement.y * widthEOL + 1)
                } else {
                    gridPos = placement.x + 1 + ((placement.y + i) * widthEOL)
                }
                
                if grid[gridPos] != " " && grid[gridPos] != letter {
                    grid[gridPos] = "#"
                } else {
                    grid[gridPos] = letter
                }
            }
            
        }
        return String(grid)
        
    }
    
    
    public static func ConvertToShape(topLeft: TopLeftBottomRightModel) -> ShapeModel {
        
        /*
           .
         .STAR.
         Z O
     .FAMILY.
         O S
         N .
         .
         */
        let input = topLeft
        let width = input.width + 2
        let height = input.height + 2
        let score = input.score
        
        let maxLeft = input.bottomLetterPos
        
        let maxUp = input.rightLetterPos + 1
        
        let topPlacement = PlacementModel(
            i: input.top,
            h: true,
            x: maxLeft + 1,
            y: maxUp)
        
        let bottomPlacement = PlacementModel(
            i: input.bottom,
            h: true,
            x: maxLeft - input.bottomLetterPos,
            y: maxUp + input.interlockHeight)
        
        let leftPlacement = PlacementModel(
            i: input.left,
            h: false,
            x: maxLeft + 1,
            y: maxUp)
        
        let rightPlacement = PlacementModel(
            i: input.right,
            h: false,
            x: maxLeft + input.interlockWidth + 1,
            y: 0)
        
        let placements = [topPlacement, bottomPlacement, leftPlacement, rightPlacement]
        
        let shape = ShapeModel(score: score, width: width, height: height, placements: placements)
        
        return shape
    }
    
    public static func ConvertToShape(topRight: TopLeftBottomRightModel) -> ShapeModel {
        let input = topRight
        let width = input.width + 2
        let height = input.height + 2
        let score = input.score
        
        let maxLeft = max(input.topLetterPos, input.bottomLetterPos)
        
        let maxUp = input.leftLetterPos + 1
        
        let topPlacement = PlacementModel(
            i: input.top,
            h: true,
            x: maxLeft - input.topLetterPos,
            y: maxUp)
        
        let bottomPlacement = PlacementModel(
            i: input.bottom,
            h: true,
            x: maxLeft - input.bottomLetterPos,
            y: maxUp + input.interlockHeight)
        
        let leftPlacement = PlacementModel(
            i: input.left,
            h: false,
            x: maxLeft + 1,
            y: 0)
        
        let rightPlacement = PlacementModel(
            i: input.right,
            h: false,
            x: maxLeft + input.interlockWidth + 1,
            y: maxUp)
        
        let placements = [topPlacement, bottomPlacement, leftPlacement, rightPlacement]
        
        let shape = ShapeModel(score: score, width: width, height: height, placements: placements)
        
        return shape
    }
    
    public static func ConvertToShape(bottomLeft: TopLeftBottomRightModel) -> ShapeModel {
        
        let input = bottomLeft
        
        let width = input.width + 2
        let height = input.height + 2
        let score = input.score
        
        let maxLeft = input.topLetterPos + 1
        
        let maxUp = max(input.leftLetterPos, input.rightLetterPos)
        
        let topPlacement = PlacementModel(
            i: input.top,
            h: true,
            x: 0, //maxLeft - input.topLetterPos,
            y: maxUp + 1)
        
        let bottomPlacement = PlacementModel(
            i: input.bottom,
            h: true,
            x: maxLeft, // - input.bottomLetterPos,
            y: maxUp + 1 + input.interlockHeight)
        
        let leftPlacement = PlacementModel(
            i: input.left,
            h: false,
            x: maxLeft,
            y: maxUp - input.leftLetterPos)
        
        let rightPlacement = PlacementModel(
            i: input.right,
            h: false,
            x: maxLeft + input.interlockWidth,
            y: maxUp - input.rightLetterPos)
        
        let placements = [topPlacement, bottomPlacement, leftPlacement, rightPlacement]
        
        let shape = ShapeModel(score: score, width: width, height: height, placements: placements)
        
        return shape
    }
    
    
    // This is just like rectangle actually so two birds with one stone
    public static func ConvertToShape(rectangle: TopLeftBottomRightModel) -> ShapeModel {
        
        let input = rectangle
        
        let width = input.width + 2
        let height = input.height + 2
        let score = input.score
        
        let maxLeft = max(input.topLetterPos, input.bottomLetterPos)
        
        let maxUp = max(input.leftLetterPos, input.rightLetterPos)
        
        let topPlacement = PlacementModel(
            i: input.top,
            h: true,
            x: maxLeft - input.topLetterPos,
            y: maxUp + 1)
        
        let bottomPlacement = PlacementModel(
            i: input.bottom,
            h: true,
            x: maxLeft - input.bottomLetterPos,
            y: maxUp + 1 + input.interlockHeight)
        
        let leftPlacement = PlacementModel(
            i: input.left,
            h: false,
            x: maxLeft + 1,
            y: maxUp - input.leftLetterPos)
        
        let rightPlacement = PlacementModel(
            i: input.right,
            h: false,
            x: maxLeft + 1 + input.interlockWidth,
            y: maxUp - input.rightLetterPos)
        
        let placements = [topPlacement, bottomPlacement, leftPlacement, rightPlacement]
        
        let shape = ShapeModel(score: score, width: width, height: height, placements: placements)
        
        return shape
    }
}
