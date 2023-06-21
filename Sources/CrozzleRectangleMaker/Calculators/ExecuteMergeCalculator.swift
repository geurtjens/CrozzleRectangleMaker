//
//  ExecuteMergeCalculator.swift
//  
//
//  Created by Michael Geurtjens on 30/5/2023.
//

import Foundation

/// a collection of functions that can merge a list of shapes to another list of shapes
public class ExecuteMergeCalculator {
    
    
    /// The full blown version that can search any subset of two lists of shapes
    public static func Execute(
        sourceShapes: GpuShapeModel,
        sourceWordIndex: [[Int]],
        sourceMin: Int,
        sourceMax: Int,
        
        searchShapes: GpuShapeModel,
        searchWordIndex: [[Int]],
        searchMin: Int,
        searchMax: Int) -> [[MatchingShapesModel]]
    {
    
        var result: [[MatchingShapesModel]] = []
        if searchShapes.stride > sourceShapes.stride {
            // We can only merge a source which has a smaller or equal number of word count within the shapes
            return Execute(
                sourceShapes: searchShapes,
                sourceWordIndex: searchWordIndex,
                sourceMin: searchMin,
                sourceMax: searchMin,
                
                searchShapes: sourceShapes,
                searchWordIndex: sourceWordIndex,
                searchMin: sourceMin,
                searchMax: sourceMax)
        }
        
        for sourceShapeId in sourceMin..<sourceMax {
            let matchingShapes = ExecuteOne(
                sourceShapes: sourceShapes,
                sourceShapeId: sourceShapeId,
                searchShapes: searchShapes,
                searchWordIndex: searchWordIndex,
                searchMin: searchMin,
                searchMax: searchMax)
            
            result.append(matchingShapes)
        }
        return result
    }
    
    public static func ExecuteOne(
        sourceShapes: GpuShapeModel,
        sourceShapeId: Int,
        searchShapes: GpuShapeModel,
        searchWordIndex: [[Int]],
        searchMin: Int,
        searchMax: Int) -> [MatchingShapesModel]
    {
        let (oneWordMatch, multiWordMatch) = MergeCalculator.matchingShapes(
            sourceShapes: sourceShapes,
            sourceShapeId: sourceShapeId,
            searchableShapes: searchShapes,
            searchWordIndex: searchWordIndex,
            searchMin: searchMin,
            searchMax: searchMax
        )
        
        let (wordId, isHorizontal, x, y) = sourceShapes.getItem(shapePosition: sourceShapeId)
        
        let validatedMultiWordMatch = MergeCalculator.ValidateMultiWordMatches(
            sourceShapeId: sourceShapeId,
            wordId: wordId,
            isHorizontal: isHorizontal,
            x: x,
            y: y,
            searchShapes: searchShapes,
            multiWordMatch: multiWordMatch)
        
        let result = oneWordMatch + validatedMultiWordMatch
        
        return result
    }
    
    // NonAsync version of merging shapes together.  So it runs on only one core.
    public static func ExecuteSameShape(shapes: GpuShapeModel, wordIndex: [[Int]], words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        var result: [ShapeModel] = []
        
        for shapeId in 0..<shapes.count {
            let shapes = ExecuteSameShapeOnce(
                shapeId: shapeId,
                shapes: shapes,
                wordIndex: wordIndex,
                words: words,
                scoresMin: scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
            result += shapes
        }
   
        return result
    }
    
    public static func ExecuteSameShapeOnce(shapeId: Int, shapes: GpuShapeModel, wordIndex: [[Int]], words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        let matchingWords: [MatchingShapesModel] = ExecuteOne(
            sourceShapes: shapes,
            sourceShapeId: shapeId,
            
            searchShapes: shapes,
            searchWordIndex: wordIndex,
            searchMin: shapeId + 1,
            searchMax: shapes.count)
        
        let instructions = MergeCalculator.getMergeInstructions(
            source: shapes,
            search: shapes,
            matches: matchingWords)
        
        var shapeList: [ShapeModel] = []
        for instruction in instructions {
       
            let potentialShape = MergePlacementCalculator.Execute(source: shapes, search: shapes, instruction: instruction, words: words)
            if let potentialShape = potentialShape {
                if (potentialShape.width <= widthMax && potentialShape.height <= heightMax) ||
                    (potentialShape.width <= heightMax && potentialShape.height <= widthMax) {
                    let (validShape,_) = ShapeCalculator.ToValidShape(shape: potentialShape, words: words)
                    
                    if let validShape = validShape {
                        // is shape is not nil so it must be a valid shape
                        let wordCount = validShape.placements.count
                        let scoreMin = scoresMin[wordCount]
                        if validShape.score >= scoreMin {
                            shapeList.append(validShape)
                        }
                    }
                }
            }
        }
        return shapeList
    }
    
    // Execute same shape requires that we avoid repeats and so we go through each one
    public static func ExecuteSameShapeAsync(shapes: GpuShapeModel, wordIndex: [[Int]], words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) async -> [ShapeModel] {
        
        // Rather than having a loop and running one at a time we have these async things that process all going up 10 at a time
        
        async let a0 = ExecuteSameShapeOneAsync(
            zeroToNine:0,
            shapes: shapes,
            wordIndex: wordIndex,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a1 = ExecuteSameShapeOneAsync(
            zeroToNine: 1,
            shapes: shapes,
            wordIndex: wordIndex,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a2 = ExecuteSameShapeOneAsync(
            zeroToNine: 2,
            shapes: shapes,
            wordIndex: wordIndex,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a3 = ExecuteSameShapeOneAsync(
            zeroToNine: 3,
            shapes: shapes,
            wordIndex: wordIndex,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a4 = ExecuteSameShapeOneAsync(
            zeroToNine: 4,
            shapes: shapes,
            wordIndex: wordIndex,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a5 = ExecuteSameShapeOneAsync(
            zeroToNine: 5,
            shapes: shapes,
            wordIndex: wordIndex,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a6 = ExecuteSameShapeOneAsync(
            zeroToNine: 6,
            shapes: shapes,
            wordIndex: wordIndex,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a7 = ExecuteSameShapeOneAsync(
            zeroToNine: 7,
            shapes: shapes,
            wordIndex: wordIndex,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a8 = ExecuteSameShapeOneAsync(
            zeroToNine: 8,
            shapes: shapes,
            wordIndex: wordIndex,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a9 = ExecuteSameShapeOneAsync(
            zeroToNine: 9,
            shapes: shapes,
            wordIndex: wordIndex,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
   
        return await a0 + a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9
    }
    
    public static func ExecuteSameShapeOneAsync(zeroToNine: Int, shapes: GpuShapeModel, wordIndex: [[Int]], words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        var result:[ShapeModel] = []
        
        // The difference is that each cpu works on 0,10,20 .. or 1, 11, 21 and so we divide the task
        for shapeId in stride(from: zeroToNine, to:shapes.count, by: 10) {
            let shapes = ExecuteSameShapeOnce(
                shapeId: shapeId,
                shapes: shapes,
                wordIndex: wordIndex,
                words: words,
                scoresMin: scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
            result += shapes
        }
        return result
    }
    
    
    
    
    public static func ExecuteDifferentShapesAsyncOne(zeroToNine: Int, source: GpuShapeModel, search: GpuShapeModel, wordIndex: [[Int]], words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        var result: [ShapeModel] = []
        
        for shapeId in stride(from: zeroToNine, to: source.count, by: 10) {
            let shapes = ExecuteDifferentShapesOne(source: source, sourceShapeId: shapeId, search: search, searchWordIndex: wordIndex, words: words, scoresMin:scoresMin, widthMax: widthMax, heightMax: heightMax)
            
            result += shapes
        }
        return result
    }
    
    public static func ExecuteDifferentShapesAsync(source: GpuShapeModel, search: GpuShapeModel, searchWordIndex: [[Int]], words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) async -> [ShapeModel] {
       
        
        // Rather than having a loop and running one at a time we have these async things that process all going up 10 at a time
        
        async let a0 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 0,
            source: source,
            search: search,
            wordIndex: searchWordIndex,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a1 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 1,
            source: source,
            search: search,
            wordIndex: searchWordIndex,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a2 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 2,
            source: source,
            search: search,
            wordIndex: searchWordIndex,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a3 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 3,
            source: source,
            search: search,
            wordIndex: searchWordIndex,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a4 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 4,
            source: source,
            search: search,
            wordIndex: searchWordIndex,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a5 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 5,
            source: source,
            search: search,
            wordIndex: searchWordIndex,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a6 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 6,
            source: source,
            search: search,
            wordIndex: searchWordIndex,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a7 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 7,
            source: source,
            search: search,
            wordIndex: searchWordIndex,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a8 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 8,
            source: source,
            search: search,
            wordIndex: searchWordIndex,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a9 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 9,
            source: source,
            search: search,
            wordIndex: searchWordIndex,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)

        return await a0 + a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9
    }
    
    public static func ExecuteDifferentShapes(source: GpuShapeModel, search: GpuShapeModel, searchWordIndex: [[Int]], words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        var result: [ShapeModel] = []
        
        for shapeId in 0..<source.count {
            let shapes = ExecuteDifferentShapesOne(source: source, sourceShapeId: shapeId, search: search, searchWordIndex: searchWordIndex, words: words, scoresMin:scoresMin, widthMax: widthMax, heightMax: heightMax)
            
            result += shapes
        }
        return result
    }
    
    public static func ExecuteDifferentShapesOne(source: GpuShapeModel, sourceShapeId: Int, search: GpuShapeModel, searchWordIndex:[[Int]], words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        var shapeList: [ShapeModel] = []
        
        let matches: [MatchingShapesModel] = ExecuteOne(
            sourceShapes: source,
            sourceShapeId: sourceShapeId,
            searchShapes: search,
            searchWordIndex: searchWordIndex,
            searchMin: 0,
            searchMax: search.count)
        
        let instructions = MergeCalculator.getMergeInstructions(
            source:source,
            search: search,
            matches: matches)
        
        for instruction in instructions {
       
            let potentialShape = MergePlacementCalculator.Execute(source: source, search: search, instruction: instruction, words: words)
            if let potentialShape {
                if (potentialShape.width <= widthMax && potentialShape.height <= heightMax) || (potentialShape.width <= heightMax && potentialShape.height <= widthMax) {
                    
                    let (shape,_) = ShapeCalculator.ToValidShape(shape: potentialShape, words: words)
                    
                    if let shape = shape {
                        // the shape is not null so it must be a valid shape
                        let wordCount = shape.placements.count
                        let scoreMin = scoresMin[wordCount]
                        if shape.score >= scoreMin {
                            shapeList.append(shape)
                        }
                    }
                }
            }
        }
        return shapeList
    }
}
