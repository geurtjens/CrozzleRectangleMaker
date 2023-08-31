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
        
        let newShapes = newShapes.filter { $0.score >= scoreMin }
        
        let (noDuplicatesOfShapesWithCorrectScores, duplicatesOfShapesWithCorrectScores) = RemoveDuplicatesCalculator.execute(shapes: newShapes)
        
        
        let result = oldShapes + noDuplicatesOfShapesWithCorrectScores
        //self.shapes += shapesWithCorrectScores
        

        // Its not finding two duplicates
        var (noDuplicates, duplicateCount) = RemoveDuplicatesCalculator.execute(shapes: result)
        
        if newShapes.count > 0 {
            let wordCount = newShapes[0].placements.count
            if FeatureFlags.verbose {
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
    
    
    public static func toShapeNoFlip(fromGrid grid: [String], words:[String]) -> ShapeModel? {
        let (placements, isValid) = PlacementCalculator.fromTextToPlacements(grid: grid, words: words)
        
        if isValid == false {
            return nil
        }
        
        let placementsShape = placements.toShape(score: 0)
        
        let (shape,_) = ShapeToTextConverter.ToValidShapeNoFlip(shape: placementsShape, words: words)
        
        return shape
    }
    
    public static func toShape(fromGrid grid: [String], words:[String]) -> ShapeModel? {
        var (placements, isValid) = PlacementCalculator.fromTextToPlacements(grid: grid, words: words)
        
        if isValid == false {
            return nil
        }
        
        placements.sort() { $0.w < $1.w }
        
        let placementsShape = placements.toShape(score: 0)
        
        let (shape,_) = ShapeToTextConverter.ToValidShape(shape: placementsShape, words: words)
        
        return shape
    }
    
    public static func toShape(fromPlacements: [PlacementModel], words: [String]) -> ShapeModel {
        let shape = fromPlacements.toShape(score: 0)
        
        let (score, _) = ShapeToTextConverter.getScoreAndText(shape: shape, words: words)
        
        let result = fromPlacements.toShape(score: score)
        
        return result
        
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
            let reversed = PlacementModel(w: p.w, x: p.y, y: p.x, z: !p.z, l: UInt8(p.l))
            placements.append(reversed)
        }
        
        let shape = ShapeModel(score: shape.score, width: shape.height, height: shape.width, placements: placements)
        return shape
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
    
    
    /// When we have an initial set of shapes and these shapes are going to be the origin of all merges
    /// then we give each shape a mergeHistory number and that is what will be propogated throughout all merges in the future
    /// So this routine just sets that number
    public static func SetMergeHistory(shapes: inout [ShapeModel], startingWith: Int = 0) {
        for shapeId in 0..<shapes.count {
            let position = shapeId + startingWith
            shapes[shapeId].mergeHistory = [position]
        }
    }
    
    
    /// sort shapes by score, area and then also word sequence.  Useful for finding duplicates
    public static func SortWithWordSequence(shapes: inout [ShapeModel]) {
        
        
        
//        for i in 0..<shapes.count {
//            if shapes[i].seqCalculated == false {
//                shapes[i].wordSequence = ShapeModel.getWordSequence(placements: shapes[i].placements)
//                shapes[i].seqCalculated = true
//            }
//        }
        
        
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
    
    
    
    
    
    public static func getScoreAndText3(shape: ShapeModel, words2:[[Int]], grid: inout [Int]) -> (UInt16, [Int]) {
        
        let SPACE: Int = 32
        let EOL: Int = 13
        let DOT: Int = 46
        let BLOCK: Int = 35
        
        var score = 0
        
        let widthEOL = Int(shape.width) + 1
        let height = Int(shape.height)
        
        let gridSize = widthEOL * height
        
        for i in 0..<grid.count {
            grid[i] = SPACE
        }
        
        grid.removeAll()
        grid = Array(repeating: SPACE, count: gridSize)
        
        // Place all end of line characters into the space
        for i in 0..<height {
            grid[i * widthEOL] = EOL // Means end of line
        }
        
        for placement in shape.placements {
            
            // the word must include the blocking characters at either end of the shape
            let word = [DOT] + words2[Int(placement.w)] + [DOT]
            
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
        return (UInt16(score), grid)
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
    
    public static func ToTextDebug(shape: ShapeModel, words:[String]) -> (String, UInt16) {
        
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
                    //return (String(grid), UInt16(0))
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
