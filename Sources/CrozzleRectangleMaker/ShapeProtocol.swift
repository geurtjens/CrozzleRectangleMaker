//
//  ShapeProtocol.swift
//  
//
//  Created by Michael Geurtjens on 18/5/2023.
//

import Foundation
public protocol ShapeProtocol {
    var score: UInt16 {get}
    var width: UInt8 {get}
    var height: UInt8 {get}

    func ToPlacement() -> [PlacementModel]
}
extension ShapeProtocol {
    func ToShape() -> ShapeModel {
        return ShapeModel(score: score, width: width, height: height, placements: ToPlacement())
    }
    
    func ToText(words:[String]) -> String {
        
        let shape = ToShape()
        
        let width = Int(shape.width)
        let height = Int(shape.height)
        
        let widthEOL = width + 1
        
        let gridSize = widthEOL * height
        
        var grid:[Character] = Array(repeating: " ", count: gridSize)
        
        // Place all end of line characters into the space
        for i in 0..<height {
            grid[i * widthEOL] = "\n"
        }
        
        for placement in shape.placements {
            
            let word = "." + words[Int(placement.i)] + "."
            
            // Just to create the variables that will be used in the loop
            var gridPos = 0

            
            for i in 0..<word.count {
                let letter = word[i]
                
                if placement.h {
                    gridPos = Int(placement.x) + i + (Int(placement.y) * widthEOL + 1)
                } else {
                    gridPos = Int(placement.x) + 1 + ((Int(placement.y) + i) * widthEOL)
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
        
        let width = Int(shape.width)
        let height = Int(shape.height)
        
        let widthEOL = height + 1
        
        let gridSize = widthEOL * width
        
        var grid:[Character] = Array(repeating: " ", count: gridSize)
        
        // Place all end of line characters into the space
        for i in 0..<width {
            grid[i * widthEOL] = "\n"
        }
        
        for placement in shape.placements {
            
            let word = "." + words[Int(placement.i)] + "."
            
            // Just to create the variables that will be used in the loop
            var gridPos = 0

            
            for i in 0..<word.count {
                let letter = word[i]
                
                if placement.h == false {
                    gridPos = Int(placement.y) + i + (Int(placement.x) * widthEOL + 1)
                } else {
                    gridPos = Int(placement.y) + 1 + ((Int(placement.x) + i) * widthEOL)
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
