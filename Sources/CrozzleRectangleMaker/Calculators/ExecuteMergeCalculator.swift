//
//  ExecuteMergeCalculator.swift
//  
//
//  Created by Michael Geurtjens on 30/5/2023.
//

import Foundation

/// a collection of functions that can merge a list of shapes to another list of shapes
public class ExecuteMergeCalculator {
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // Execute same shape requires that we avoid repeats and so we go through each one
    public static func ExecuteSameShapeAsync(shapes: GpuShapeModel, wordIndex: [[Int]], words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) async -> [ShapeModel] {
        
        // Rather than having a loop and running one at a time we have these async things that process all going up 10 at a time
        
        async let a0 = ExecuteSameShapeOneAsync(
            zeroToNine:0,
            sourceShapes: shapes,
            wordIndex: wordIndex,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a1 = ExecuteSameShapeOneAsync(
            zeroToNine: 1,
            sourceShapes: shapes,
            wordIndex: wordIndex,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a2 = ExecuteSameShapeOneAsync(
            zeroToNine: 2,
            sourceShapes: shapes,
            wordIndex: wordIndex,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a3 = ExecuteSameShapeOneAsync(
            zeroToNine: 3,
            sourceShapes: shapes,
            wordIndex: wordIndex,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a4 = ExecuteSameShapeOneAsync(
            zeroToNine: 4,
            sourceShapes: shapes,
            wordIndex: wordIndex,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a5 = ExecuteSameShapeOneAsync(
            zeroToNine: 5,
            sourceShapes: shapes,
            wordIndex: wordIndex,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a6 = ExecuteSameShapeOneAsync(
            zeroToNine: 6,
            sourceShapes: shapes,
            wordIndex: wordIndex,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a7 = ExecuteSameShapeOneAsync(
            zeroToNine: 7,
            sourceShapes: shapes,
            wordIndex: wordIndex,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a8 = ExecuteSameShapeOneAsync(
            zeroToNine: 8,
            sourceShapes: shapes,
            wordIndex: wordIndex,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a9 = ExecuteSameShapeOneAsync(
            zeroToNine: 9,
            sourceShapes: shapes,
            wordIndex: wordIndex,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
   
        return await a0 + a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9
    }
    
    public static func ExecuteDifferentShapesAsync(source: GpuShapeModel, search: GpuShapeModel, searchWordIndex: [[Int]], words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) async -> [ShapeModel] {

        // Rather than having a loop and running one at a time we have these async things that process all going up 10 at a time
        
        async let a0 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 0,
            sourceShapes: source,
            searchShapes: search,
            wordIndex: searchWordIndex,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a1 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 1,
            sourceShapes: source,
            searchShapes: search,
            wordIndex: searchWordIndex,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a2 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 2,
            sourceShapes: source,
            searchShapes: search,
            wordIndex: searchWordIndex,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a3 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 3,
            sourceShapes: source,
            searchShapes: search,
            wordIndex: searchWordIndex,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a4 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 4,
            sourceShapes: source,
            searchShapes: search,
            wordIndex: searchWordIndex,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a5 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 5,
            sourceShapes: source,
            searchShapes: search,
            wordIndex: searchWordIndex,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a6 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 6,
            sourceShapes: source,
            searchShapes: search,
            wordIndex: searchWordIndex,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a7 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 7,
            sourceShapes: source,
            searchShapes: search,
            wordIndex: searchWordIndex,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a8 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 8,
            sourceShapes: source,
            searchShapes: search,
            wordIndex: searchWordIndex,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a9 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 9,
            sourceShapes: source,
            searchShapes: search,
            wordIndex: searchWordIndex,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)

        return await a0 + a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9
    }
    
    
    
    
    
    public static func ExecuteSameShapeOneAsync(zeroToNine: Int, sourceShapes: GpuShapeModel, wordIndex: [[Int]], words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        var result:[ShapeModel] = []
        
        // The difference is that each cpu works on 0,10,20 .. or 1, 11, 21 and so we divide the task
        for shapeId in stride(from: zeroToNine, to:sourceShapes.count, by: 10) {
            let shapes = ExecuteSameShapeOnce(
                shapeId: shapeId,
                sourceShapes: sourceShapes,
                wordIndex: wordIndex,
                words: words,
                scoresMin: scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            result += shapes
        }
        return result
    }
    

    public static func ExecuteDifferentShapesAsyncOne(zeroToNine: Int, sourceShapes: GpuShapeModel, searchShapes: GpuShapeModel, wordIndex: [[Int]], words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        var result: [ShapeModel] = []
        
        for shapeId in stride(from: zeroToNine, to: sourceShapes.count, by: 10) {
            let shapes = ExecuteDifferentShapesOne(
                sourceShapes: sourceShapes,
                sourceShapeId: shapeId,
                searchShapes: searchShapes,
                searchWordIndex: wordIndex,
                words: words,
                scoresMin:scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            result += shapes
        }
        return result
    }
    
    
    // NonAsync version of merging shapes together.  So it runs on only one core.
    public static func ExecuteSameShape(sourceShapes: GpuShapeModel, wordIndex: [[Int]], words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        var result: [ShapeModel] = []
        
        for shapeId in 0..<sourceShapes.count {
            let shapes = ExecuteSameShapeOnce(
                shapeId: shapeId,
                sourceShapes: sourceShapes,
                wordIndex: wordIndex,
                words: words,
                scoresMin: scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
            result += shapes
        }
   
        return result
    }
    
    
    public static func ExecuteDifferentShapes(sourceShapes: GpuShapeModel, searchShapes: GpuShapeModel, searchWordIndex: [[Int]], words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        var result: [ShapeModel] = []
        
        for shapeId in 0..<sourceShapes.count {
            let shapes = ExecuteDifferentShapesOne(
                sourceShapes: sourceShapes,
                sourceShapeId: shapeId,
                searchShapes: searchShapes,
                searchWordIndex: searchWordIndex,
                words: words, scoresMin:scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            result += shapes
        }
        return result
    }
    
    
    
    
    
    public static func ExecuteSameShapeOnce(shapeId: Int, sourceShapes: GpuShapeModel, wordIndex: [[Int]], words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        let instructions = MatchingWordsCalculator.GetMergeInstructions(
            sourceShapes: sourceShapes,
            sourceShapeId: shapeId,
            sourceWordIndex: wordIndex)
        
        let shapeList = GetShapesFromInstructions(
            instructions: instructions,
            sourceShapes: sourceShapes,
            searchShapes: sourceShapes,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        
        return shapeList
    }
    
    
    public static func ExecuteDifferentShapesOne(sourceShapes: GpuShapeModel, sourceShapeId: Int, searchShapes: GpuShapeModel, searchWordIndex:[[Int]], words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        let instructions = MatchingWordsCalculator.GetMergeInstructions(
            sourceShapes: sourceShapes,
            sourceShapeId: sourceShapeId,
            searchShapes: searchShapes,
            searchWordIndex: searchWordIndex)
       
        
        let shapeList = GetShapesFromInstructions(
            instructions: instructions,sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        return shapeList
    }
    
    
    public static func GetShapesFromInstructions(instructions: [MergeInstructionModel], sourceShapes: GpuShapeModel, searchShapes: GpuShapeModel, words: [String], scoresMin:[Int], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        var shapeList: [ShapeModel] = []
        for instruction in instructions {
       
            let potentialShape = MergePlacementCalculator.Execute(
                sourceShapes: sourceShapes,
                searchShapes: searchShapes,
                instruction: instruction,
                words: words)
            
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
}
