//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 23/8/2023.
//

import Foundation
public class ShapeToTextConverter {
    public static func getScoreAndText(shape: ShapeModel, words:[String]) -> (UInt16, String) {
        
        var score = 0
        
        let widthEOL = Int(shape.width) + 1
        let height = Int(shape.height)
        
        let gridSize = widthEOL * height
        
        var grid:[Character] = Array(repeating: " ", count: Int(gridSize))
        
        // Place all end of line characters into the space
        for i in 0..<height {
            grid[i * widthEOL] = "\n"
        }
        
        for placement in shape.placements {
            
            // the word must include the blocking characters at either end of the shape
            let word = "." + words[Int(placement.w)] + "."
            
            var gridPos = 0

            for i in 0..<word.count {
                let letter = word[i]
                
                if placement.z {
                    gridPos = Int(placement.x) + i + (Int(placement.y) * widthEOL + 1)
                } else {
                    gridPos = Int(placement.x) + 1 + (Int(placement.y) + i) * widthEOL
                }
                
                if grid[gridPos] != " " && grid[gridPos] != letter {
                    grid[gridPos] = "#"
                    return (UInt16(0),"")
                } else if grid[gridPos] == " " {
                    grid[gridPos] = letter
                } else if grid[gridPos] == letter {
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
        return (UInt16(score), result)
    }
    
    /// convert the shape to a valid shape or return null.  We might preprocess a shape but not yet know its valid so we use this to make sure
    public static func ToValidShape(shape: ShapeModel, words:[String]) -> (ShapeModel?, String) {
        let (score, text) = getScoreAndText(shape: shape, words: words)
        
        if score == 0 {
            return (nil, "")
        }
        // We should also check that the text doesnt have text running in parallel and without the . at each end
        let textIsVerified = VerifyText(text: text)
        
        if textIsVerified {
            let newShape = ShapeModel(score: score, width: shape.width, height: shape.height, placements: shape.placements)
            
            // our shapes must have first word as horizontal to help with removing duplicates
            if (newShape.placements[0].z == false) {
                let flipped = ShapeCalculator.Flip(shape: newShape)
                return (flipped, text)
            } else {
                return (newShape, text)
            }
        } else {
            return (nil,text)
        }
    }
    
    public static func ToValidShapeNoFlip(shape: ShapeModel, words:[String]) -> (ShapeModel?, String) {
        let (score, text) = getScoreAndText(shape: shape, words: words)
        
        if score == 0 {
            return (nil, "")
        }
        // We should also check that the text doesnt have text running in parallel and without the . at each end
        let textIsVerified = VerifyText(text: text)
        
        if textIsVerified {
            let newShape = ShapeModel(score: score, width: shape.width, height: shape.height, placements: shape.placements)
            
            // our shapes must have first word as horizontal to help with removing duplicates
            
            return (newShape, text)
            
        } else {
            return (nil,text)
        }
    }
    
    
    
    
    public static func VerifyText(text: String) -> Bool {

        if text == "" {
            return false
        }
//        if text.contains("#") {
//            return false
//        }
        
        let grid = text.split(separator: "\n")
        
        let heightMinusOne = grid.count - 1
        let widthMinusOne = grid[0].count - 1
        
        // Horizontal verification
        var previous: Character = " "
        var current: Character = " "
        var next: Character = " "
        for y in 1..<heightMinusOne {
            previous = grid[y][0]
            for x in 1..<widthMinusOne {
                current = grid[y][x]
                next = grid[y][x+1]
                if IsAlphabet(current) {
                    if previous == " " && IsAlphabet(next) {
                        return false
                    } else if x == 1 && IsAlphabet(previous) {
                        return false
                    } else if IsAlphabet(previous) && next == " " {
                        return false
                    } else if x == widthMinusOne - 1 && IsAlphabet(next) {
                        return false
                    }
                }
                previous = current
            }
        }
        
        //let reversed = rotateGrid(grid: grid)
        
        for y in 1..<widthMinusOne {
            previous = grid[0][y]
            for x in 1..<heightMinusOne {
                current = grid[x][y]
                next = grid[x+1][y]
                if IsAlphabet(current) {
                    if previous == " " && IsAlphabet(next) {
                        return false
                    } else if x == 1 && IsAlphabet(previous) {
                        return false
                    } else if IsAlphabet(previous) && next == " " {
                        return false
                    } else if x == heightMinusOne - 1 && IsAlphabet(next) {
                        return false
                    }
                }
                previous = current
            }
        }
        
        return true
    }
    
    public static func IsAlphabet(_ letter: Character) -> Bool {
        if letter != " " && letter != "." && letter != "#" {
            return true
        } else {
            return false
        }
    }
    
    public static func IsAlpha(_ letter: Int) -> Bool {
        return (letter >= 65 && letter <= 90)
    }
    
//    public static func VerifyText(textInt: [Int]) -> Bool {
//
//        let BLOCK = 35
//        if textInt.count == 0 {
//            return false
//        }
//        if textInt.contains(BLOCK) {
//            return false
//        }
//
//        let grid = text.split(separator: "\n")
//
//        let heightMinusOne = grid.count - 1
//        let widthMinusOne = grid[0].count - 1
//
//        // Horizontal verification
//        var previous: Character = " "
//        var current: Character = " "
//        var next: Character = " "
//        for y in 1..<heightMinusOne {
//            previous = grid[y][0]
//            for x in 1..<widthMinusOne {
//                current = grid[y][x]
//                next = grid[y][x+1]
//                if IsAlphabet(current) {
//                    if previous == " " && IsAlphabet(next) {
//                        return false
//                    } else if x == 1 && IsAlphabet(previous) {
//                        return false
//                    } else if IsAlphabet(previous) && next == " " {
//                        return false
//                    } else if x == widthMinusOne - 1 && IsAlphabet(next) {
//                        return false
//                    }
//                }
//                previous = current
//            }
//        }
//
//        //let reversed = rotateGrid(grid: grid)
//
//        for y in 1..<widthMinusOne {
//            previous = grid[0][y]
//            for x in 1..<heightMinusOne {
//                current = grid[x][y]
//                next = grid[x+1][y]
//                if IsAlphabet(current) {
//                    if previous == " " && IsAlphabet(next) {
//                        return false
//                    } else if x == 1 && IsAlphabet(previous) {
//                        return false
//                    } else if IsAlphabet(previous) && next == " " {
//                        return false
//                    } else if x == heightMinusOne - 1 && IsAlphabet(next) {
//                        return false
//                    }
//                }
//                previous = current
//            }
//        }
//
//        return true
//    }
    
    
//    public static func VerifyText2(text: String) -> Bool {
//
//        if text == "" {
//            return false
//        }
//        if text.contains("#") {
//            return false
//        }
//
//        let grid = text.split(separator: "\n")
//
//
//        // Horizontal verification
//        var previous: Character = " "
//        var current: Character = " "
//        var next: Character = " "
//        for line in grid {
//            previous = line[0]
//            for i in 1..<line.count - 1 {
//                current = line[i]
//                next = line[i+1]
//
//                if previous == " " && IsAlphabet(current) && IsAlphabet(next) {
//                    return false
//                } else if i == 1 && IsAlphabet(previous) && IsAlphabet(current) {
//                    return false
//                } else if IsAlphabet(previous) && IsAlphabet(current) && next == " " {
//                    return false
//                } else if i == line.count - 2 && IsAlphabet(current) && IsAlphabet(next) {
//                    return false
//                }
//                previous = current
//            }
//        }
//
//        let reversed = rotateGrid(grid: grid)
//
//        for line in reversed {
//            previous = line[0]
//            for i in 1..<line.count - 1 {
//                current = line[i]
//                next = line[i+1]
//
//                if previous == " " && IsAlphabet(current) && IsAlphabet(next) {
//                    return false
//                } else if i == 1 && IsAlphabet(previous) && IsAlphabet(current) {
//                    return false
//                } else if IsAlphabet(previous) && IsAlphabet(current) && next == " " {
//                    return false
//                } else if i == line.count - 2 && IsAlphabet(current) && IsAlphabet(next) {
//                    return false
//                }
//                previous = current
//            }
//        }
//
//        return true
//    }
    
//    public static func VerifyText3(text: String) -> Bool {
//
//        if text == "" {
//            return false
//        }
//        if text.contains("#") {
//            return false
//        }
//        
//        let grid = text.split(separator: "\n")
//        
//        let heightMinusOne = grid.count - 1
//        let widthMinusOne = grid[0].count - 1
//        
//        // Horizontal verification
//        var previous: Character = " "
//        var current: Character = " "
//        var next: Character = " "
//        for y in 1..<heightMinusOne {
//            previous = grid[y][0]
//            for i in 1..<widthMinusOne {
//                current = grid[y][i]
//                next = grid[y][i+1]
//                
//                if previous == " " && IsAlphabet(current) && IsAlphabet(next) {
//                    return false
//                } else if i == 1 && IsAlphabet(previous) && IsAlphabet(current) {
//                    return false
//                } else if IsAlphabet(previous) && IsAlphabet(current) && next == " " {
//                    return false
//                } else if i == widthMinusOne - 1 && IsAlphabet(current) && IsAlphabet(next) {
//                    return false
//                }
//                previous = current
//            }
//        }
//        
//        let reversed = rotateGrid(grid: grid)
//        
//        for y in 0..<widthMinusOne {
//            previous = reversed[y][0]
//            for i in 1..<heightMinusOne {
//                current = reversed[y][i]
//                next = reversed[y][i+1]
//                
//                if previous == " " && IsAlphabet(current) && IsAlphabet(next) {
//                    return false
//                } else if i == 1 && IsAlphabet(previous) && IsAlphabet(current) {
//                    return false
//                } else if IsAlphabet(previous) && IsAlphabet(current) && next == " " {
//                    return false
//                } else if i == heightMinusOne - 1 && IsAlphabet(current) && IsAlphabet(next) {
//                    return false
//                }
//                previous = current
//            }
//        }
//        
//        return true
//    }
    
    // Removed need to reverse grid
    public static func VerifyText4(text: String) -> Bool {

        if text == "" {
            return false
        }
        if text.contains("#") {
            return false
        }
        
        let grid = text.split(separator: "\n")
        
        let heightMinusOne = grid.count - 1
        let widthMinusOne = grid[0].count - 1
        
        // Horizontal verification
        var previous: Character = " "
        var current: Character = " "
        var next: Character = " "
        for y in 1..<heightMinusOne {
            previous = grid[y][0]
            for x in 1..<widthMinusOne {
                current = grid[y][x]
                next = grid[y][x+1]
                
                if previous == " " && IsAlphabet(current) && IsAlphabet(next) {
                    return false
                } else if x == 1 && IsAlphabet(previous) && IsAlphabet(current) {
                    return false
                } else if IsAlphabet(previous) && IsAlphabet(current) && next == " " {
                    return false
                } else if x == widthMinusOne - 1 && IsAlphabet(current) && IsAlphabet(next) {
                    return false
                }
                previous = current
            }
        }
        
        //let reversed = rotateGrid(grid: grid)
        
        for y in 0..<widthMinusOne {
            previous = grid[0][y]
            for x in 1..<heightMinusOne {
                current = grid[x][y]
                next = grid[x+1][y]
                
                if previous == " " && IsAlphabet(current) && IsAlphabet(next) {
                    return false
                } else if x == 1 && IsAlphabet(previous) && IsAlphabet(current) {
                    return false
                } else if IsAlphabet(previous) && IsAlphabet(current) && next == " " {
                    return false
                } else if x == heightMinusOne - 1 && IsAlphabet(current) && IsAlphabet(next) {
                    return false
                }
                previous = current
            }
        }
        
        return true
    }
    
    
    
    
    public static func VerifyText5(text: String) -> Bool {

        if text == "" {
            return false
        }
        if text.contains("#") {
            return false
        }
        
        let grid = text.split(separator: "\n")
        
        let heightMinusOne = grid.count - 1
        let widthMinusOne = grid[0].count - 1
        
        // Horizontal verification
        //var previous: Character = " "
        //var current: Character = " "
        //var next: Character = " "
        for y in 1..<heightMinusOne {
            //previous = grid[y][0]
            for x in 1..<widthMinusOne {
                //current = grid[y][x]
                //next = grid[y][x+1]
                if IsAlphabet(grid[y][x]) {
                    if grid[y][x-1] == " " && IsAlphabet(grid[y][x+1]) {
                        return false
                    } else if x == 1 && IsAlphabet(grid[y][x-1]) {
                        return false
                    } else if IsAlphabet(grid[y][x-1]) && grid[y][x+1] == " " {
                        return false
                    } else if x == widthMinusOne - 1 && IsAlphabet(grid[y][x+1]) {
                        return false
                    }
                }
                //previous = current
            }
        }
        
        //let reversed = rotateGrid(grid: grid)
        
        for y in 1..<widthMinusOne {
            //previous = grid[0][y]
            for x in 1..<heightMinusOne {
                //current = grid[x][y]
                //next = grid[x+1][y]
                if IsAlphabet(grid[x][y]) {
                    if grid[x-1][y] == " " && IsAlphabet(grid[x+1][y]) {
                        return false
                    } else if x == 1 && IsAlphabet(grid[x-1][y]) {
                        return false
                    } else if IsAlphabet(grid[x-1][y]) && grid[x+1][y] == " " {
                        return false
                    } else if x == heightMinusOne - 1 && IsAlphabet(grid[x+1][y]) {
                        return false
                    }
                }
                //previous = current
            }
        }
        
        return true
    }
}
