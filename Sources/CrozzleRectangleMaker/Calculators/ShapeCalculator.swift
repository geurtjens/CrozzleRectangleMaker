//
//  ShapeCalculator.swift
//  
//
//  Created by Michael Geurtjens on 25/5/2023.
//

import Foundation
public struct ShapeCalculator {
    public static func Flip(shape: ShapeModel) -> ShapeModel {
        var placements:[PlacementModel] = []
        
        for p in shape.placements {
            let reversed = PlacementModel(i: p.i, h: !p.h, x: p.y, y: p.x, length: UInt8(p.l))
            placements.append(reversed)
        }
        
        let shape = ShapeModel(score: shape.score, width: shape.height, height: shape.width, placements: placements)
        return shape
    }
    
    public static func ToValidShape(shape: ShapeModel, words:[String]) -> (ShapeModel?, String) {
        let (text,score) = ToText(shape: shape, words: words)
        
        // We should also check that the text doesnt have text running in parallel and without the . at each end
        let verifiedText = ShapeCalculator.VerifyText(text: text)
        
        if score > 0 {
            let newShape = ShapeModel(score: Int(score), width: shape.width, height: shape.height, placements: shape.placements)
            return (newShape, text)
        } else {
           
            return (nil,text)
        }
        
    }
    public static func VerifyText(text: String) -> Bool {

        let grid = text.split(separator: "\n")

        // Horizontal verification
        
//        for line in grid {
//            var wordStarted = false
//            for letter in line {
//                if letter == "." {
//                    wordStarted = true
//                }
//            }
//        }
        return true
    }
    public static func ToText(shape: ShapeModel, words:[String]) -> (String, UInt16) {
        
        var score = 0
        
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
                } else if grid[gridPos] == " " {
                    grid[gridPos] = letter
                }
                else if grid[gridPos] == letter {
                    score += ScoreCalculator.score(forLetter: letter)
                    
                }
            }
            
        }
        let gridString = String(grid)
        // Remove the first character as it is a \n
        let range = gridString.index(after: gridString.startIndex)..<gridString.endIndex
        let result = String(gridString[range])
        if result.contains("#") {
            score = 0
        } else {
            score += shape.placements.count * 10
        }
        return (result, UInt16(score))
    }
}