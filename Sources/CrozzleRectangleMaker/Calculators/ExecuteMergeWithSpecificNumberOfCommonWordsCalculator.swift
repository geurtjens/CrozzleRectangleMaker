//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 8/6/2023.
//

import Foundation
public class ExecuteMergeWithSpecificNumberOfCommonWordsCalculator {
    
    
    /// The full blown version that can search any subset of two lists of shapes
    public static func ExecuteSameShape(matchingWordCount: Int, gpuShapes: GpuShapeModel,
                                        words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel]
    {
    
        var result: [ShapeModel] = []
        
        let scoresMin: [Int] = Array(repeating: scoreMin, count: 40)
        
        for shapeId in 0..<gpuShapes.count {
            let matchingShapes = ExecuteSameShapeOnce(
                matchingWordCount: matchingWordCount,
                shapeId: shapeId,
                gpuShapes: gpuShapes,
                words: words,
                scoresMin: scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            result += matchingShapes
        }
        return result
    }
    
    
    public static func ExecuteSameShapeOnce(matchingWordCount: Int, shapeId: Int, gpuShapes: GpuShapeModel,
                                            words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        let matchingWords: [MatchingShapesModel] = ExecuteMergeCalculator.ExecuteOne(
            sourceShapes: gpuShapes,
            sourceShapeId: shapeId,
            
            searchShapes: gpuShapes,
            searchMin: shapeId + 1,
            searchMax: gpuShapes.count)
        
        let limitedMatchingWords = matchingWords.filter { $0.matchingWordCount == matchingWordCount }
        
        let instructions = MergeCalculator.getMergeInstructions(
            source: gpuShapes,
            search: gpuShapes,
            matches: limitedMatchingWords)
        
        let shapeList = ProcessInstructions(
            words: words,
            source: gpuShapes,
            search: gpuShapes,
            instructions: instructions,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
       
        return shapeList
    }
    
    public static func ExecuteTwoShapes(matchingWordCount: Int, gpuSource: GpuShapeModel, gpuSearch: GpuShapeModel,
                                        words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel]
    {
    
        var result: [ShapeModel] = []
        
        let scoresMin: [Int] = Array(repeating: scoreMin, count: 40)
        
        for shapeId in 0..<gpuSource.count {
            let matchingShapes = ExecuteTwoShapesOnce(
                matchingWordCount: matchingWordCount,
                shapeId: shapeId,
                
                gpuSource: gpuSource,
                gpuSearch: gpuSearch,
                words: words,
                scoresMin: scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            result += matchingShapes
        }
        return result
    }
    
    public static func ExecuteTwoShapesOnce(
        matchingWordCount: Int,
        shapeId: Int,
                                            
                                            gpuSource: GpuShapeModel,
                                            gpuSearch: GpuShapeModel,
                                            words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        let matchingWords: [MatchingShapesModel] = ExecuteMergeCalculator.ExecuteOne(
            sourceShapes: gpuSource,
            sourceShapeId: shapeId,
            
            searchShapes: gpuSearch,
            searchMin: 0,
            searchMax: gpuSearch.count)
        
        let limitedMatchingWords = matchingWords.filter { $0.matchingWordCount == matchingWordCount }
        
        let instructions = MergeCalculator.getMergeInstructions(
            source: gpuSource,
            search: gpuSearch,
            matches: limitedMatchingWords)
        
        let shapeList = ProcessInstructions(
            words: words,
            source: gpuSource,
            search: gpuSearch,
            instructions: instructions,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
       
        return shapeList
    }
    
    
    public static func ProcessInstructions(words: [String], source: GpuShapeModel, search: GpuShapeModel, instructions: [MergeInstructionModel], scoresMin:[Int], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        var shapeList: [ShapeModel] = []
        
        for instruction in instructions {
            let potentialShape = MergePlacementCalculator.Execute(source: source, search: search, instruction: instruction, words: words)
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
