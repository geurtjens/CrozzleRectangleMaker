//
//  ShapeProtocol.swift
//  
//
//  Created by Michael Geurtjens on 18/5/2023.
//

import Foundation
public protocol ShapeProtocol {
    var score: Int {get}
    var width: Int {get}
    var height: Int {get}

    func ToPlacement() -> [PlacementModel]
}
extension ShapeProtocol {
    func ToShape() -> ShapeModel {
        return ShapeModel(score: score, width: width, height: height, placements: ToPlacement())
    }
    
    func ToText(words:[String]) -> String {
        
        let shape = ToShape()
        
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
    
    func ToTextFlipped(words:[String]) -> String {
        
        let shape = ToShape()
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
}
