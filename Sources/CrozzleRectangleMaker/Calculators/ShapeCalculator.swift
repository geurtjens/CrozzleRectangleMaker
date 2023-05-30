//
//  ShapeCalculator.swift
//  
//
//  Created by Michael Geurtjens on 25/5/2023.
//

import Foundation
/// A variety of functions used with shapes convertion from clusters and edges and ability to flip shapes etc
public class ShapeCalculator {
    
    /// conveniently convert all clusters to shapes
    public static func toShape(fromClusters clusters: [ClusterModel]) -> [ShapeModel] {
        var shapes: [ShapeModel] = []
        for cluster in clusters {
            shapes.append(cluster.ToShape())
        }
        return shapes
    }
    
    /// conveniently convert all edges to shapes
    public static func toShape(fromEdges edges: [EdgeModel]) -> [ShapeModel] {
        var shapes: [ShapeModel] = []
        for edge in edges {
            shapes.append(edge.ToShape())
        }
        return shapes
    }
    
    /// rotate a shape and return a rotated shape which means width becomes height and all placements are rearranged
    public static func Flip(shape: ShapeModel) -> ShapeModel {
        var placements:[PlacementModel] = []
        
        for p in shape.placements {
            let reversed = PlacementModel(i: p.i, h: !p.h, x: p.y, y: p.x, l: UInt8(p.l))
            placements.append(reversed)
        }
        
        let shape = ShapeModel(score: shape.score, width: shape.height, height: shape.width, placements: placements)
        return shape
    }
    
    /// convert the shape to a valid shape or return null.  We might preprocess a shape but not yet know its valid so we use this to make sure
    public static func ToValidShape(shape: ShapeModel, words:[String]) -> (ShapeModel?, String) {
        let (text,score) = ToText(shape: shape, words: words)
        
        // We should also check that the text doesnt have text running in parallel and without the . at each end
        let textIsVerified = ShapeCalculator.VerifyText(text: text)
        
        if score > 0 && textIsVerified {
            let newShape = ShapeModel(score: score, width: shape.width, height: shape.height, placements: shape.placements)
            return (newShape, text)
        } else {
           
            return (nil,text)
        }
        
    }
    
    /// Given a grid, rotate it so that we can tell if the text is valid in the vertical direction but reuse the horizontal direction validation
    public static func rotateGrid(grid: [Substring]) -> [String] {
        
        if grid.count == 0 {
            return []
        }

        var result: [String] = []
        
        let width = grid[0].count
        for j in 1..<width {
            var line = ""
            for i in 0..<grid.count {
                line += String(grid[i][j])
            }
            result.append(line)
        }
        
        return result
    }
    
    /// Verify that the shapes text is valid, that is there are no overlaps and no errors like #
    public static func VerifyText(text: String) -> Bool {

        if text == "" {
            return false
        }
        if text.contains("#") {
            return false
        }
        
        let grid = text.split(separator: "\n")
        
        let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        // Horizontal verification
        var previous: Character = " "
        var current: Character = " "
        var next: Character = " "
        for line in grid {
            previous = line[0]
            for i in 1..<line.count - 1 {
                current = line[i]
                next = line[i+1]
                
                if previous == " " && alphabet.contains(current) && alphabet.contains(next) {
                    return false
                } else if i == 1 && alphabet.contains(previous) && alphabet.contains(current) {
                    return false
                }
                previous = current
            }
        }
        
        let reversed = rotateGrid(grid: grid)
        
        for line in reversed {
            previous = line[0]
            for i in 1..<line.count - 1 {
                current = line[i]
                next = line[i+1]
                
                if previous == " " && alphabet.contains(current) && alphabet.contains(next) {
                    return false
                } else if i == 1 && alphabet.contains(previous) && alphabet.contains(current) {
                    return false
                }
                previous = current
            }
        }
        
        return true
    }
    
    /// convert `clusters` to `shapes` and then we sort them
    public static func toShapes(clusters: [ClusterModel]) -> [ShapeModel] {
        var shapes:[ShapeModel] = []
        for cluster in clusters {
            let shape = cluster.ToShape()
            shapes.append(shape)
        }
        return shapes
    }
    
    /// first we convert `clusters` to `shapes` and then we sort them
    public static func toShapesSorted(clusters: [ClusterModel]) -> [ShapeModel] {
        var shapes = toShapes(clusters: clusters)
        Sort(shapes: &shapes)
        return shapes
    }
    /// first we convert `rectangles` to `shapes` and then we sort them
    public static func toShapesSorted(rectangles: [RectangleModel]) -> [ShapeModel] {
        var shapes = toShapes(rectangles: rectangles)
        Sort(shapes: &shapes)
        return shapes
    }
    /// convert `rectangles` to `shapes`
    public static func toShapes(rectangles: [RectangleModel]) -> [ShapeModel] {
        var shapes:[ShapeModel] = []
        for rectangle in rectangles {
            let shape = rectangle.ToShape()
            shapes.append(shape)
        }
        return shapes
    }
    
    /// convert the edges to shapes
    public static func toShapes(edges: [EdgeModel]) -> [ShapeModel] {
        var shapes:[ShapeModel] = []
        for edge in edges {
            let shape = edge.ToShape()
            shapes.append(shape)
        }
        return shapes
    }
    
    /// first we convert the edges to shapes and then we sort them
    public static func toShapesSorted(edges: [EdgeModel]) -> [ShapeModel] {
        var shapes = toShapes(edges: edges)
        Sort(shapes:&shapes)
        return shapes
    }
    
    /// sort shapes by score and area
    public static func Sort(shapes: inout [ShapeModel]) {
        shapes.sort {
            if $0.score == $1.score {
                return $0.width * $0.height < $1.width * $1.height
            } else {
                return $0.score > $1.score
            }
        }
    }
    
    /// sort shapes by score, area and then also word sequence.  Useful for finding duplicates
    public static func SortWithWordSequence(shapes: inout [ShapeModel]) {
        
        shapes.sort {
            if $0.score == $1.score {
                if $0.width * $0.height == $1.width * $1.height {
                    return $0.wordSequence < $1.wordSequence
                }
                else {
                    return $0.width * $0.height < $1.width * $1.height
                }
            } else {
                return $0.score > $1.score
            }
        }
    }
    
    /// convert a shape into the text and return the score as well
    public static func ToText(shape: ShapeModel, words:[String]) -> (String, UInt16) {
        
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
            let word = "." + words[Int(placement.i)] + "."
            
            var gridPos = 0

            for i in 0..<word.count {
                let letter = word[i]
                
                if placement.h {
                    gridPos = Int(placement.x) + i + (Int(placement.y) * widthEOL + 1)
                } else {
                    gridPos = Int(placement.x) + 1 + (Int(placement.y) + i) * widthEOL
                }
                
                if grid[gridPos] != " " && grid[gridPos] != letter {
                    grid[gridPos] = "#"
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
        return (result, UInt16(score))
    }
}
