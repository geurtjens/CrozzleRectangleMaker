//
//  ShapeCalculator.swift
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
            grid[i * widthEOL] = "\n"
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
        let gridString = String(grid)
        // Remove the first character as it is a \n
        let range = gridString.index(after: gridString.startIndex)..<gridString.endIndex
        let result = String(gridString[range])
        return result
    }
    
    public static func ConvertToTextFlipped(shape: ShapeModel, words:[String]) -> String {
        
        let widthEOL = shape.height + 1
        
        let gridSize = widthEOL * shape.width
        
        var grid:[Character] = Array(repeating: " ", count: gridSize)
        
        // Place all end of line characters into the space
        for i in 0..<shape.width {
            grid[i * widthEOL] = "\n"
        }
        
        for placement in shape.placements {
            
            let word = "." + words[placement.i] + "."
            
            // Just to create the variables that will be used in the loop
            var gridPos = 0

            
            for i in 0..<word.count {
                let letter = word[i]
                
                if placement.h == false {
                    gridPos = placement.y + i + (placement.x * widthEOL + 1)
                } else {
                    gridPos = placement.y + 1 + ((placement.x + i) * widthEOL)
                }
                
                if grid[gridPos] != " " && grid[gridPos] != letter {
                    grid[gridPos] = "#"
                } else {
                    grid[gridPos] = letter
                }
            }
        }
        // Remove the first character as it is a \n
        let gridString = String(grid)
        
        let range = gridString.index(after: gridString.startIndex)..<gridString.endIndex
        let result = String(gridString[range])
        return result
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
        
        let shape = ShapeModel(score: score, width: width, height: height, placements: placements)
        
        return shape
    }
    
    public static func ConvertToShape(topRight: TopLeftBottomRightModel) -> ShapeModel {
        let input = topRight
        let width = input.width + 2
        let height = input.height + 2
        let score = input.score
        
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
        
        let shape = ShapeModel(score: score, width: width, height: height, placements: placements)
        
        return shape
    }
    
    public static func ConvertToShape(bottomLeft: TopLeftBottomRightModel) -> ShapeModel {
        
        let input = bottomLeft
        
        let width = input.width + 2
        let height = input.height + 2
        let score = input.score
        
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
        
        let shape = ShapeModel(score: score, width: width, height: height, placements: placements)
        
        return shape
    }
    
    
    // This is just like rectangle actually so two birds with one stone
    public static func ConvertToShape(rectangle: TopLeftBottomRightModel) -> ShapeModel {
        
        let input = rectangle
        
        let width = input.width + 2
        let height = input.height + 2
        let score = input.score
        
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
        
        let shape = ShapeModel(score: score, width: width, height: height, placements: placements)
        
        return shape
    }
}
