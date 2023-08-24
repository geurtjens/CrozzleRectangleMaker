//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 24/8/2023.
//

import Foundation
class ShapeToText2Converter {
    
    public static func ToString(grid:[Int]) -> String {
        var result = ""
        for i in 0..<grid.count {
            if grid[i] == 10 {
                result += "\n"
            } else {
                let letter: Character = Character(UnicodeScalar(grid[i])!)
                result += String(letter)
            }
        }
        return result
    }
    
    /// convert the shape to a valid shape or return null.  We might preprocess a shape but not yet know its valid so we use this to make sure
    public static func ToValidShape(shape: ShapeModel, words:[[Int]]) -> ShapeModel? {
        let (score, grid) = getScoreAndText(shape: shape, words: words)
        
        if score == 0 {
            return nil
        }
        // We should also check that the text doesnt have text running in parallel and without the . at each end
        let textIsVerified = VerifyGrid(grid: grid, width: Int(shape.width), height: Int(shape.height))
        
        if textIsVerified {
            let newShape = ShapeModel(score: score, width: shape.width, height: shape.height, placements: shape.placements)
            
            // our shapes must have first word as horizontal to help with removing duplicates
            if (newShape.placements[0].z == false) {
                let flipped = ShapeCalculator.Flip(shape: newShape)
                return flipped
            } else {
                return newShape
            }
        } else {
            return nil
        }
    }
    
    
    
    public static func getScoreAndText(shape: ShapeModel, words:[[Int]]) -> (UInt16, [Int]) {
        
        let SPACE: Int = 32
        let LF: Int = 10
        let DOT: Int = 46
        let BLOCK: Int = 35
        
        var score = 0
        
        let widthEOL = Int(shape.width) + 1
        let height = Int(shape.height)
        
        let gridSize = widthEOL * height
        
        var grid:[Int] = Array(repeating: SPACE, count: Int(gridSize))
        
        
        // Place all end of line characters into the space
        for i in 0..<height {
            grid[i * widthEOL] = LF // Means end of line
        }
        
        for placement in shape.placements {
            
            // the word must include the blocking characters at either end of the shape
            let word = [DOT] + words[Int(placement.w)] + [DOT]
            
            var gridPos = 0

            for i in 0..<word.count {
                let letter = word[i]
                
                if placement.z {
                    gridPos = Int(placement.x) + i + (Int(placement.y) * widthEOL + 1)
                } else {
                    gridPos = Int(placement.x) + 1 + (Int(placement.y) + i) * widthEOL
                }
                
                if grid[gridPos] != SPACE && grid[gridPos] != letter {
                    grid[gridPos] = BLOCK
                    return (UInt16(0),[])
                } else if grid[gridPos] == SPACE {
                    grid[gridPos] = letter
                } else if grid[gridPos] == letter {
                    score += ScoreCalculator.score(forInt: letter)
                }
            }
        }
        //let gridString = String(grid)
        
        // Remove the first character as it is a \n
        //let range = gridString.index(after: gridString.startIndex)..<gridString.endIndex
        //let result = String(gridString[range])
        
        //if result.contains("#") {
        //    score = 0
        //} else {
            score += shape.placements.count * 10
        //}
        
        grid.remove(at: 0)
        
        return (UInt16(score), grid)
    }
    
    
    
    
    
    
   
    
    
    
    public static func VerifyGrid(grid: [Int], width: Int, height: Int) -> Bool {

        let SPACE = 32
        
        let heightMinusOne = height - 1
        let widthMinusOne = width - 1
        let widthEOL = width + 1
        // Horizontal verification
        var previous: Int = 0
        var current: Int = 0
        var next: Int = 0
        for y in 1..<heightMinusOne {
            previous = V(y, 0, grid, widthEOL)
            for x in 1..<widthMinusOne {
                current = V(y, x, grid, widthEOL)
                next = V(y, x+1, grid, widthEOL)
                if IsAlpha(current) {
                    if previous == SPACE && IsAlpha(next) {
                        return false
                    } else if x == 1 && IsAlpha(previous) {
                        return false
                    } else if IsAlpha(previous) && next == SPACE {
                        return false
                    } else if x == widthMinusOne - 1 && IsAlpha(next) {
                        return false
                    }
                }
                previous = current
            }
        }
        
        //let reversed = rotateGrid(grid: grid)
        
        for y in 1..<widthMinusOne {
            previous = V(0,y,grid, widthEOL)
            for x in 1..<heightMinusOne {
                current = V(x, y, grid, widthEOL)
                next = V(x+1, y, grid, widthEOL)
                if IsAlpha(current) {
                    if previous == SPACE && IsAlpha(next) {
                        return false
                    } else if x == 1 && IsAlpha(previous) {
                        return false
                    } else if IsAlpha(previous) && next == SPACE {
                        return false
                    } else if x == heightMinusOne - 1 && IsAlpha(next) {
                        return false
                    }
                }
                previous = current
            }
        }
        
        return true
    }
    
    
    
    public static func V(_ y: Int, _ x: Int, _ grid:[Int], _ widthEOL: Int) -> Int {
        if y == 0 {
            return grid[x]
        } else {
            
        }
        let gridPos = x + (y * widthEOL)
        return grid[gridPos]
    }
    
    public static func IsAlpha(_ letter: Int) -> Bool {
        return (letter >= 65 && letter <= 90)
    }
   

}
