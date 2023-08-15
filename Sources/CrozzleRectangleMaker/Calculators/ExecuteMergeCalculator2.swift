//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 4/8/2023.
//

import Foundation
public class ExecuteMergeCalculator2 {
     
    
    // NonAsync version of merging shapes together.  So it runs on only one core.
    public static func ExecuteSameShapeSync(
        sourceShapes: [ShapeModel],
        searchIndex: [[WordIndexModel]],
        searchMax: Int,
        words:[String],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int) -> [ShapeModel]
    {
        var result: [ShapeModel] = []
        
        for shapeId in 0..<sourceShapes.count {
            let shapes = ExecuteSameShape(
                sourceShapes: sourceShapes,
                shapeId: shapeId,
                searchIndex: searchIndex,
                searchMax: searchMax,
                words: words,
                scoresMin: scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
            result += shapes
        }
        return result
    }
    
    
    // Execute same shape requires that we avoid repeats and so we go through each one
    public static func ExecuteSameShapeAsync(
        shapes: [ShapeModel],
        searchIndex: [[WordIndexModel]],
        sourceMax: Int,
        searchMax: Int,
        words:[String],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int) async -> [ShapeModel]
    {
        
        // Rather than having a loop and running one at a time we have these async things that process all going up 10 at a time
        
        async let a0 = ExecuteSameShapeOneAsync(
            zeroToNine:0,
            sourceShapes: shapes,
            searchIndex: searchIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a1 = ExecuteSameShapeOneAsync(
            zeroToNine: 1,
            sourceShapes: shapes,
            searchIndex: searchIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a2 = ExecuteSameShapeOneAsync(
            zeroToNine: 2,
            sourceShapes: shapes,
            searchIndex: searchIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a3 = ExecuteSameShapeOneAsync(
            zeroToNine: 3,
            sourceShapes: shapes,
            searchIndex: searchIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a4 = ExecuteSameShapeOneAsync(
            zeroToNine: 4,
            sourceShapes: shapes,
            searchIndex: searchIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a5 = ExecuteSameShapeOneAsync(
            zeroToNine: 5,
            sourceShapes: shapes,
            searchIndex: searchIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a6 = ExecuteSameShapeOneAsync(
            zeroToNine: 6,
            sourceShapes: shapes,
            searchIndex: searchIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a7 = ExecuteSameShapeOneAsync(
            zeroToNine: 7,
            sourceShapes: shapes,
            searchIndex: searchIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a8 = ExecuteSameShapeOneAsync(
            zeroToNine: 8,
            sourceShapes: shapes,
            searchIndex: searchIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a9 = ExecuteSameShapeOneAsync(
            zeroToNine: 9,
            sourceShapes: shapes,
            searchIndex: searchIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
   
        return await a0 + a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9
    }
    
    public static func ExecuteSameShapeOneAsync(
        zeroToNine: Int,
        sourceShapes: [ShapeModel],
        searchIndex: [[WordIndexModel]],
        sourceMax: Int,
        searchMax:Int,
        words:[String],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int) -> [ShapeModel]
    {
        var result:[ShapeModel] = []
        
        // The difference is that each cpu works on 0,10,20 .. or 1, 11, 21 and so we divide the task
        for shapeId in stride(from: zeroToNine, to:sourceMax, by: 10) {
            let shapes = ExecuteSameShape(
                sourceShapes: sourceShapes,
                shapeId: shapeId,
                searchIndex: searchIndex,
                searchMax: searchMax,
                words: words,
                scoresMin: scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            result += shapes
        }
        return result
    }
    
    
    public static func ExecuteDifferentShapesSync(
        sourceShapes: [ShapeModel],
        searchShapes: [ShapeModel],
        searchIndex: [[WordIndexModel]],
        sourceMax: Int,
        searchMin: Int,
        searchMax: Int,
        words:[String],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int) -> [ShapeModel]
    {
        var result: [ShapeModel] = []
        
        for shapeId in 0..<sourceMax {
            let shapes = ExecuteDifferentShapes(
                sourceShapes: sourceShapes,
                sourceShapeId: shapeId,
                searchShapes: searchShapes,
                searchIndex: searchIndex,
                searchMin: searchMin,
                searchMax: searchMax,
                words: words, scoresMin:scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
            result += shapes
        }
        return result
    }
    
    public static func ExecuteDifferentShapesAsync(
        sourceShapes: [ShapeModel],
        searchShapes: [ShapeModel],
        searchIndex: [[WordIndexModel]],
        sourceMax: Int,
        searchMin: Int,
        searchMax: Int,
        words: [String],
        scoresMin: [Int],
        widthMax: Int,
        heightMax: Int) async -> [ShapeModel]
    {

        // Rather than having a loop and running one at a time we have these async things that process all going up 10 at a time
        
        async let a0 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 0,
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            searchIndex: searchIndex,
            sourceMax: sourceMax,
            searchMin: searchMin,
            searchMax: searchMax,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a1 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 1,
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            searchIndex: searchIndex,
            sourceMax: sourceMax,
            searchMin: searchMin,
            searchMax: searchMax,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a2 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 2,
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            searchIndex: searchIndex,
            sourceMax: sourceMax,
            searchMin: searchMin,
            searchMax: searchMax,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a3 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 3,
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            searchIndex: searchIndex,
            sourceMax: sourceMax,
            searchMin: searchMin,
            searchMax: searchMax,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a4 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 4,
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            searchIndex: searchIndex,
            sourceMax: sourceMax,
            searchMin: searchMin,
            searchMax: searchMax,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a5 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 5,
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            searchIndex: searchIndex,
            sourceMax: sourceMax,
            searchMin: searchMin,
            searchMax: searchMax,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a6 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 6,
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            searchIndex: searchIndex,
            sourceMax: sourceMax,
            searchMin: searchMin,
            searchMax: searchMax,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a7 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 7,
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            searchIndex: searchIndex,
            sourceMax: sourceMax,
            searchMin: searchMin,
            searchMax: searchMax,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a8 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 8,
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            searchIndex: searchIndex,
            sourceMax: sourceMax,
            searchMin: searchMin,
            searchMax: searchMax,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a9 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 9,
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            searchIndex: searchIndex,
            sourceMax: sourceMax,
            searchMin: searchMin,
            searchMax: searchMax,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)

        return await a0 + a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9
    }
    

    public static func ExecuteDifferentShapesAsyncOne(
        zeroToNine: Int,
        sourceShapes: [ShapeModel],
        searchShapes: [ShapeModel],
        searchIndex: [[WordIndexModel]],
        sourceMax: Int,
        searchMin: Int,
        searchMax: Int,
        words:[String],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int) -> [ShapeModel]
    {
        var result: [ShapeModel] = []
        
        for shapeId in stride(from: zeroToNine, to: sourceMax, by: 10) {
            
            let shapes = ExecuteDifferentShapes(
                sourceShapes: sourceShapes,
                sourceShapeId: shapeId,
                searchShapes: searchShapes,
                searchIndex: searchIndex,
                searchMin: searchMin,
                searchMax: searchMax,
                words: words,
                scoresMin:scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            result += shapes
        }
        return result
    }
    
    
    
    
    
    
    

    public static func ExecuteSameShape(
        sourceShapes: [ShapeModel],
        shapeId: Int,
        searchIndex: [[WordIndexModel]],
        searchMax: Int,
        words:[String],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int) -> [ShapeModel]
    {
        let shapeList = WordIndex2Calculator.findMergedShapes(
            words: words,
            sourceShape: sourceShapes[shapeId],
            sourceShapeId: shapeId,
            searchShapes: sourceShapes,
            searchIndex: searchIndex,
            searchMin: shapeId + 1,
            searchMax: searchMax,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax
        )
        return shapeList
    }
    
    
    public static func ExecuteDifferentShapes(
        sourceShapes: [ShapeModel],
        sourceShapeId: Int,
        searchShapes: [ShapeModel],
        searchIndex:[[WordIndexModel]],
        searchMin: Int,
        searchMax: Int,
        words:[String],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int) -> [ShapeModel]
    {
        let shapeList = WordIndex2Calculator.findMergedShapes(
            words: words,
            sourceShape: sourceShapes[sourceShapeId],
            sourceShapeId: sourceShapeId,
            searchShapes: searchShapes,
            searchIndex: searchIndex,
            searchMin: searchMin,
            searchMax: searchMax,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax
        )
        return shapeList
    }
}
