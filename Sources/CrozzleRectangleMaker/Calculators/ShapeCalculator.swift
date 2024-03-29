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
    
    public static func findAverageScore(shapes: [ShapeModel]) -> UInt16 {
        var sum = 0
        for shape in shapes {
            sum += Int(shape.score)
        }
        
        let average = sum / shapes.count
        return UInt16(average)
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
            } 
            else {
                return $0.score > $1.score
            }
        }
    }
    
    public static func SortByScoreThenWordSequence(shapes: inout [ShapeModel]) {
        shapes.sort {
            if $0.score == $1.score {
                return $0.wordSequence < $1.wordSequence
            }
            else {
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
    public static func setMergeHistory(shapes: inout [ShapeModel], startingWith: Int = 0) {
        for shapeId in 0..<shapes.count {
            let position = shapeId + startingWith
            shapes[shapeId].mergeHistory = [position]
        }
    }
    
    public static func getMergeHistory(shape: ShapeModel, count: Int) -> [Int] {
        var result: [Int] = []
        if shape.mergeHistory.count < count {
            return []
            // This should never happen
        }
        for i in 0..<count {
            result.append(shape.mergeHistory[i])
        }
        return result
    }
    
    public static func SortWithWordSequence(treeNodes: inout [TreeNodeModel]) {

        treeNodes.sort {
            return $0.parentShape.wordSequence < $1.parentShape.wordSequence
        }
    }
    
    
    /// sort shapes by score, area and then also word sequence.  Useful for finding duplicates
    public static func SortWithWordSequence(shapes: inout [ShapeModel]) {
        
        shapes.sort {
            return $0.wordSequence < $1.wordSequence
        }
    }
    
    
    public static func mergeShapesByIndex(
        shapes: [ShapeModel],
        shapeIds: [Int],
        words: [String],
        widthMax: Int = 17,
        heightMax: Int = 13,
        wordsInt: [[Int]]) -> ShapeModel? {
        
        let firstShapeId = shapeIds[0]
        
        var sourceShape: ShapeModel? = shapes[firstShapeId]
        
        for i in 1..<shapeIds.count {
            let shapeId = shapeIds[i]
            
            let searchShape = shapes[shapeId]
            
            sourceShape = MergeCalculatorV2.mergeTwoShapes(
                sourceShape: sourceShape!,
                searchShape: searchShape,
                words: words,
                widthMax: widthMax,
                heightMax: heightMax,
                wordsInt: wordsInt)
            
            if sourceShape == nil {
                return nil
            }
        }
        return sourceShape
    }
    
    public static func lowestShapeScoresFirst(_ firstShape: ShapeModel, _ secondShape: ShapeModel) -> Bool {
        
        if firstShape.mergeHistory.count == secondShape.mergeHistory.count {
            for mergeHistoryPos in 0..<firstShape.mergeHistory.count {
                let firstItem = firstShape.mergeHistory[mergeHistoryPos]
                let secondItem = secondShape.mergeHistory[mergeHistoryPos]
                
                if firstItem > secondItem {
                    // Means that secondShape has a lower shape id in its merge history
                    return false
                }
            }
        }

        // means first is better than second
        return true
    }
    
    public static func lowestShapeScoresFirst( firstNode: TreeNodeModel, secondNode: TreeNodeModel) -> Bool {
        
        if firstNode.parentShape.mergeHistory.count == secondNode.parentShape.mergeHistory.count {
            for mergeHistoryPos in 0..<firstNode.parentShape.mergeHistory.count {
                let firstItem = firstNode.parentShape.mergeHistory[mergeHistoryPos]
                let secondItem = secondNode.parentShape.mergeHistory[mergeHistoryPos]
                
                if firstItem > secondItem {
                    // Means that secondShape has a lower shape id in its merge history
                    return false
                }
            }
        }

        // means first is better than second
        return true
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
    
    
    public static func getScore(width: UInt8, height: UInt8, placements: [PlacementModel], wordsInt:[[Int]]) -> UInt16 {
        
        let SPACE: Int = 32
        let EOL: Int = 13
        let DOT: Int = 46
        let BLOCK: Int = 35
        
        var score = 0
        
        let widthEOL = Int(width) + 1
        let height = Int(height)
        
        let gridSize = widthEOL * height
        
        
        var grid = Array(repeating: SPACE, count: gridSize)
        
        // Place all end of line characters into the space
        for i in 0..<height {
            grid[i * widthEOL] = EOL // Means end of line
        }
        
        for placement in placements {
            
            // the word must include the blocking characters at either end of the shape
            let word = [DOT] + wordsInt[Int(placement.w)] + [DOT]
            
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
                    return UInt16(0)
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
            score += placements.count * 10
        //}
        return UInt16(score)
    }
    
   
    public static func FlipToText(shape: ShapeModel, words: [String]) -> (String, UInt16)
    {
        let flippedPlacements = PlacementCalculator.flip(placements: shape.placements)
        
        return ToText(
            width: shape.height,
            height: shape.width,
            placements: flippedPlacements,
            words: words)
    }
    
    public static func ToText(
        shape: ShapeModel,
        words: [String]) -> (String, UInt16)
    {
        return ToText(
            width: shape.width,
            height: shape.height,
            placements: shape.placements,
            words: words)
    }
    
    public static func ToText(
        width: UInt8,
        height: UInt8,
        placements: [PlacementModel],
        words:[String]) -> (String, UInt16) {
        
        var score = 0
        
        let widthEOL = Int(width) + 1
        let height = Int(height)
        
        let gridSize = widthEOL * height
        
        var grid:[Character] = Array(repeating: " ", count: Int(gridSize))
        
        // Place all end of line characters into the space
        for i in 0..<height {
            grid[i * widthEOL] = "\n"
        }
        
        for placement in placements {
            
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
            score += placements.count * 10
        }
        return (result, UInt16(score))
    }
    
    
    
    public static func ToJson(shape: ShapeModel, words: [String]) -> String {
        let (text, score) = ToText(shape: shape, words: words)
        
        let grid = text.split(separator:"\n")
        var result = ""
        for line in grid {
            if result != "" {
                result += ",\n"
            }
            result += "    \"\(line)\""
        }
        result = "{\"score\": \(score), \"width\": \(shape.width), \"height\": \(shape.height), \"history\": \(shape.mergeHistory), \"grid\": [\n" + result + "]}"
        return result
    }
    
    public static func ToTextDebug(
        shape: ShapeModel,
        words:[String]) -> (String, UInt16)
    {
        return ToTextDebug(
            width: shape.width,
            height: shape.height,
            placements: shape.placements,
            words: words)
    }
    
    public static func FlipToTextDebug(
        shape: ShapeModel,
        words:[String]) -> (String, UInt16)
    {
        let flippedPlacements = PlacementCalculator.flip(placements: shape.placements)
        
        return ToTextDebug(
            width: shape.height,
            height: shape.width,
            placements: flippedPlacements,
            words: words)
    }
    
    public static func ToTextDebug(
        width: UInt8,
        height: UInt8,
        placements: [PlacementModel],
        words:[String]) -> (String, UInt16) 
    {
        
        var score = 0
        
        let widthEOL = Int(width) + 1
        let height = Int(height)
        
        let gridSize = widthEOL * height
        
        var grid:[Character] = Array(repeating: " ", count: Int(gridSize))
        
        // Place all end of line characters into the space
        for i in 0..<height {
            grid[i * widthEOL] = "\n"
        }
        
        for placement in placements {
            
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
            score += placements.count * 10
        }
        return (result, UInt16(score))
    }
    
    
    public static func find(shapes: [ShapeModel], mergeHistory: [Int]) -> [ShapeModel] {
        var result: [ShapeModel] = []

        for shape in shapes {
            if findMergeHistoryMatches(find: mergeHistory, search: shape.mergeHistory) {
                result.append(shape)
            }
        }
        return result
    }
    
    
    
    public static func findMergeHistoryMatches(find: [Int], search: [Int]) -> Bool {
        if find.count > search.count {
            // it cannot match as there is not enough in the search
            return false
        }
        
        for i in 0..<find.count {
            if find[i] != search[i] {
                return false
            }
        }
        return true
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
        
        
        code += "let shape = ShapeModel(score: \(shape.score), width: \(shape.width), height: \(shape.height), placements: \(shape.placements))"
        
        return code
    }
    
    
    
    public static func getWordDifferences(parentShape: ShapeModel, childShapes: [ShapeModel]) -> [Set<Int>] {
        var result: [Set<Int>] = []
        
        let parentWords = getWordsFromShape(shape: parentShape)
        
        for sibling in childShapes {
            let siblingWords = getWordsFromShape(shape: sibling)
            
            let missingWords = findExtraWords(parent: parentWords, sibling: siblingWords)
            result.append(missingWords)
        }
        return result
    }
    
    /// Given a shape, return the set of words used in the shape
    public static func getWordsFromShape(shape: ShapeModel) -> Set<Int> {
        var result: Set<Int> = []
        for placement in shape.placements {
            result.insert(Int(placement.w))
        }
        return result
    }
    
    public static func findExtraWords(parent: Set<Int>, sibling: Set<Int>) -> Set<Int> {
        let missingWords = sibling.subtracting(parent)
        return missingWords
    }
    
    
    
    /// Assuming that all shapes have at least one shapeId in their mergeHistory, lets get the last one from each shape
    /// - Parameter shapes: ShapeModel that definitely has their mergeHistory set
    /// - Returns: An array of shapeIds that was the last shapeId added to make up each shape
    public static func getLastMergeHistoryShapeId(shapes: [ShapeModel]) -> [Int] {
        var result: [Int] = []
        for shape in shapes {
            result.append(shape.mergeHistory.last!)
        }
        return result
    }
    
    
    /// Set the mergeHistory for `shapes` based on the `referenceShapes` that already have mergeHistories
    /// We use this when we have `winningShapes` and want to give them the `mergeHistory` of `searchShapes`
    /// - Parameters:
    ///   - shapes: Array of shapes that have no `mergeHistory`
    ///   - referenceShapes: Array of shapes that have a `mergeHistory`
    public static func setMergeHistories(
        shapes: inout [ShapeModel],
        referenceShapes: [ShapeModel])
    {
        
        for shapeId in 0..<shapes.count {
            let referenceShapeId = getShapeBySequence(
                shapes: referenceShapes,
                sequence: shapes[shapeId].wordSequence)
            
            if referenceShapeId == -1 {
                print("Something wrong, winning shapes are not in searchShapes")
            } else {
                shapes[shapeId].mergeHistory += referenceShapes[referenceShapeId].mergeHistory
            }
        }
    }
    
    
    public static func getWinningShapesShapeIds(
        winningShapes: [ShapeModel],
        searchShapes: [ShapeModel]) -> [Int]
    {
        
        
        
//        for shape in shapes {
//            print(shape.ToText(words: words))
//        }
        
        
        
        
        var mergeHistory: [Int] = []
        
        for i in 0..<winningShapes.count {
            let shapePos = getShapeBySequence(shapes: searchShapes, sequence: winningShapes[i].wordSequence)
            if shapePos == -1 {
                print("Something wrong, winning shapes are not in searchShapes")
            } else {
                mergeHistory += searchShapes[shapePos].mergeHistory
            }
            
        }
        
        // The mergeHistory is sorted by score and so its not the actual sequence of words.  So order doesnt matter except for choosing the first word
        
        return mergeHistory
    }
    
    public static func getShapeBySequence(
        shapes: [ShapeModel],
        sequence: String) -> Int
    {
        for shapeId in 0..<shapes.count {
            if shapes[shapeId].wordSequence == sequence {
                return shapeId
            }
        }
        return -1
    }
}
