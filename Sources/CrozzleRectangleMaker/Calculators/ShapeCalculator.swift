//
//  ShapeCalculator.swift
//  
//
//  Created by Michael Geurtjens on 25/5/2023.
//

import Foundation
/// A variety of functions used with shapes convertion from clusters and edges and ability to flip shapes etc
public class ShapeCalculator {
     
    /// This is how the `QueueModel` adds shapes
    public static func addShapes(oldShapes: [ShapeModel], newShapes: [ShapeModel], scoreMin: Int, constraints: ConstraintsModel) -> [ShapeModel] {
        
        let shapesWithCorrectScores = newShapes.filter { $0.score >= scoreMin }
        
        let (noDuplicatesOfShapesWithCorrectScores, duplicatesOfShapesWithCorrectScores) = RemoveDuplicatesCalculator.execute(shapes: shapesWithCorrectScores)
        
        
        let result = oldShapes + noDuplicatesOfShapesWithCorrectScores
        //self.shapes += shapesWithCorrectScores
        

        // Its not finding two duplicates
        var (noDuplicates, duplicateCount) = RemoveDuplicatesCalculator.execute(shapes: result)
        
        if newShapes.count > 0 {
            let wordCount = newShapes[0].placements.count
            if GlobalVariables.verbose {
                print("\(wordCount) word queue has \(oldShapes.count), adding \(noDuplicatesOfShapesWithCorrectScores.count) after taking out \(duplicatesOfShapesWithCorrectScores) duplicates, once merged encountered \(duplicateCount) duplicates, so \(noDuplicatesOfShapesWithCorrectScores.count - duplicateCount) where new")
            }
        }
        switch (constraints.priorityFunction) {
        case .score_area:
            ShapeCalculator.SortByScoreThenArea(shapes: &noDuplicates)
        case .density_score:
            ShapeCalculator.SortByDensityThenScore(shapes: &noDuplicates)
        }
        
        if noDuplicates.count > constraints.queueLengthMax {
            noDuplicates.removeSubrange(constraints.queueLengthMax..<noDuplicates.count)
        }
        return noDuplicates
    }
    
    public static func toShapes(fromGrids grids: [[String]], words:[String]) -> [ShapeModel] {
        var result: [ShapeModel] = []
        for grid in grids {
            if let shape = toShape(fromGrid: grid, words: words) {
                result.append(shape)
            }
        }
        return result
    }
    
    
    public static func toShape(fromGrid grid: [String], words:[String]) -> ShapeModel? {
        let (placements, isValid) = PlacementCalculator.fromTextToPlacements(grid: grid, words: words)
        
        if isValid == false {
            return nil
        }
        
        let placementsShape = placements.toShape(score: 0)
        
        let (shape,_) = ShapeCalculator.ToValidShape(shape: placementsShape, words: words)
        
        return shape
    }
    
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
        let (score, text) = getScoreAndText(shape: shape, words: words)
        
        if score == 0 {
            return (nil, "")
        }
        // We should also check that the text doesnt have text running in parallel and without the . at each end
        let textIsVerified = ShapeCalculator.VerifyText(text: text)
        
        if textIsVerified {
            let newShape = ShapeModel(score: score, width: shape.width, height: shape.height, placements: shape.placements)
            
            // our shapes must have first word as horizontal to help with removing duplicates
            if (newShape.placements[0].h == false) {
                let flipped = ShapeCalculator.Flip(shape: newShape)
                return (flipped, text)
            } else {
                return (newShape, text)
            }
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
    
    
    public static func IsAlphabet(_ letter: Character) -> Bool {
        if letter != " " && letter != "." && letter != "#" {
            return true
        } else {
            return false
        }
    }
    
    /// Verify that the shapes text is valid, that is there are no overlaps and no errors like #
    public static func VerifyText2(text: String) -> Bool {

        if text == "" {
            return false
        }
        if text.contains("#") {
            return false
        }
        
        let grid = text.split(separator: "\n")
        
        
        // Horizontal verification
        var previous: Character = " "
        var current: Character = " "
        var next: Character = " "
        for line in grid {
            previous = line[0]
            for i in 1..<line.count - 1 {
                current = line[i]
                next = line[i+1]
                
                if previous == " " && IsAlphabet(current) && IsAlphabet(next) {
                    return false
                } else if i == 1 && IsAlphabet(previous) && IsAlphabet(current) {
                    return false
                } else if IsAlphabet(previous) && IsAlphabet(current) && next == " " {
                    return false
                } else if i == line.count - 2 && IsAlphabet(current) && IsAlphabet(next) {
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
                
                if previous == " " && IsAlphabet(current) && IsAlphabet(next) {
                    return false
                } else if i == 1 && IsAlphabet(previous) && IsAlphabet(current) {
                    return false
                } else if IsAlphabet(previous) && IsAlphabet(current) && next == " " {
                    return false
                } else if i == line.count - 2 && IsAlphabet(current) && IsAlphabet(next) {
                    return false
                }
                previous = current
            }
        }
        
        return true
    }
    
    public static func VerifyText3(text: String) -> Bool {

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
            for i in 1..<widthMinusOne {
                current = grid[y][i]
                next = grid[y][i+1]
                
                if previous == " " && IsAlphabet(current) && IsAlphabet(next) {
                    return false
                } else if i == 1 && IsAlphabet(previous) && IsAlphabet(current) {
                    return false
                } else if IsAlphabet(previous) && IsAlphabet(current) && next == " " {
                    return false
                } else if i == widthMinusOne - 1 && IsAlphabet(current) && IsAlphabet(next) {
                    return false
                }
                previous = current
            }
        }
        
        let reversed = rotateGrid(grid: grid)
        
        for y in 0..<widthMinusOne {
            previous = reversed[y][0]
            for i in 1..<heightMinusOne {
                current = reversed[y][i]
                next = reversed[y][i+1]
                
                if previous == " " && IsAlphabet(current) && IsAlphabet(next) {
                    return false
                } else if i == 1 && IsAlphabet(previous) && IsAlphabet(current) {
                    return false
                } else if IsAlphabet(previous) && IsAlphabet(current) && next == " " {
                    return false
                } else if i == heightMinusOne - 1 && IsAlphabet(current) && IsAlphabet(next) {
                    return false
                }
                previous = current
            }
        }
        
        return true
    }
    
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
    
    public static func VerifyText(text: String) -> Bool {

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
    
    
    
    /// convert `clusters` to `shapes` and then we sort them
    public static func toShapes(clusters: [ClusterModel]) -> [ShapeModel] {
        var shapes:[ShapeModel] = []
        for cluster in clusters {
            let shape = cluster.ToShape()
            shapes.append(shape)
        }
        return shapes
    }
    
    /// convert `pacmans` to `shapes`
    public static func toShapes(pacmans: [PacmanModel]) -> [ShapeModel] {
        var shapes:[ShapeModel] = []
        for pacman in pacmans {
            let shape = pacman.ToShape()
            shapes.append(shape)
        }
        return shapes
    }
    /// convert `pacmans` to `shapes`
    public static func toShapesSorted(pacmans: [PacmanModel]) -> [ShapeModel] {
        var shapes:[ShapeModel] = []
        for pacman in pacmans {
            let shape = pacman.ToShape()
            shapes.append(shape)
        }
        ShapeCalculator.Sort(shapes: &shapes)
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
    
    /// convert the outers to shapes
    public static func toShapes(outers: [OuterModel]) -> [ShapeModel] {
        var shapes:[ShapeModel] = []
        for outer in outers {
            let shape = outer.ToShape()
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
                return $0.area < $1.area
            } else {
                return $0.score > $1.score
            }
        }
    }
    
    public static func SortWithoutUpdate(shapes: [ShapeModel]) -> [ShapeModel] {
        var sorted = shapes
        sorted.sort {
            if $0.score == $1.score {
                return $0.area < $1.area
            } else {
                return $0.score > $1.score
            }
        }
        return sorted
    }
    public static func SortByScoreThenArea(shapes: inout [ShapeModel]) {
        shapes.sort {
            if $0.score == $1.score {
                return $0.area < $1.area
            } else {
                return $0.score > $1.score
            }
        }
    }
    
    public static func SortByDensityThenScore(shapes: inout [ShapeModel]) {
        shapes.sort {
            if $0.density == $1.density {
                return $0.score > $1.score
            } else {
                return $0.density > $1.density
            }
        }
    }
    
    /// sort shapes by score, area and then also word sequence.  Useful for finding duplicates
    public static func SortWithWordSequence(shapes: inout [ShapeModel]) {
        
        shapes.sort {
            if $0.score == $1.score {
                if $0.area == $1.area {
                    return $0.wordSequence < $1.wordSequence
                }
                else {
                    return $0.area < $1.area
                }
            } else {
                return $0.score > $1.score
            }
        }
    }
    
    
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
                    return (String(grid), UInt16(0))
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
    
    
    public static func filterInclude(shapes: [ShapeModel], containing search:[String], from words: [String]) -> [ShapeModel]{
        let wordIds = WordCalculator.extractPositions(ofWords: search, from: words)
        
        var result:[ShapeModel]=[]
        for shape in shapes {
            var wordsFound = true
            for wordId in wordIds {
                let wordsInShape = shape.getWords()
                if wordsInShape.contains(wordId) == false {
                    wordsFound = false
                    break
                }
            }
            if wordsFound {
                result.append(shape)
            }
        }
        return result
    }
    
    
    public static func ToCode(fromShape shape: ShapeModel) -> String {
        var code = ""
        
        code += PlacementCalculator.ToCode(fromPlacements: shape.placements) + "\n"
        
        
        code += "let shape = ShapeModel(score: \(shape.score), width: \(shape.width), height: \(shape.height), placements: placements)"
        
        return code
    }
}
