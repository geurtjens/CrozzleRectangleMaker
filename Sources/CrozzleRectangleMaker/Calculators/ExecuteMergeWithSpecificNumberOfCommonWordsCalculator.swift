//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 8/6/2023.
//

import Foundation
public class ExecuteMergeWithSpecificNumberOfCommonWordsCalculator {
    
    
    /// The full blown version that can search any subset of two lists of shapes
    public static func ExecuteSameShape(matchingWordCount: Int, sourceShapes: GpuShapeModel, wordIndex: [[Int]], words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel]
    {
    
        var result: [ShapeModel] = []
        
        let scoresMin: [Int] = Array(repeating: scoreMin, count: 40)
        
        for shapeId in 0..<sourceShapes.count {
            let matchingShapes = ExecuteSameShapeOnce(
                matchingWordCount: matchingWordCount,
                shapeId: shapeId,
                sourceShapes: sourceShapes,
                wordIndex: wordIndex,
                words: words,
                scoresMin: scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            result += matchingShapes
        }
        return result
    }
    
    
    public static func ExecuteSameShapeOnce(matchingWordCount: Int, shapeId: Int, sourceShapes: GpuShapeModel, wordIndex: [[Int]],words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        var matchingWords: [MatchingShapesModel] = MatchingWordsCalculator.ExecuteOne(
            sourceShapes: sourceShapes,
            sourceShapeId: shapeId,
            
            searchShapes: sourceShapes,
            searchWordIndex: wordIndex,
            searchMin: shapeId + 1,
            searchMax: sourceShapes.count)
        
        matchingWords = matchingWords.filter { $0.matchingWordCount == matchingWordCount }
        
        let instructions = MatchingWordsCalculator.getMergeInstructions(
            sourceShapes: sourceShapes,
            searchShapes: sourceShapes,
            matches: matchingWords)
        
        let shapeList = ProcessInstructions(
            words: words,
            sourceShapes: sourceShapes,
            searchShapes: sourceShapes,
            instructions: instructions,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
       
        return shapeList
    }
    
    public static func ExecuteTwoShapes(matchingWordCount: Int, sourceShapes: GpuShapeModel, searchShapes: GpuShapeModel, searchWordIndex:[[Int]], words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel]
    {
    
        var result: [ShapeModel] = []
        
        let scoresMin: [Int] = Array(repeating: scoreMin, count: 40)
        
        for shapeId in 0..<sourceShapes.count {
            let matchingShapes = ExecuteTwoShapesOnce(
                matchingWordCount: matchingWordCount,
                shapeId: shapeId,
                
                sourceShapes: sourceShapes,
                searchShapes: searchShapes,
                searchWordIndex: searchWordIndex,
                
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
        sourceShapes: GpuShapeModel,
        searchShapes: GpuShapeModel,
        searchWordIndex: [[Int]],
        words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        var matchingWords: [MatchingShapesModel] = MatchingWordsCalculator.ExecuteOne(
            sourceShapes: sourceShapes,
            sourceShapeId: shapeId,
            
            searchShapes: searchShapes,
            searchWordIndex: searchWordIndex,
            searchMin: 0,
            searchMax: searchShapes.count)
        
        matchingWords = matchingWords.filter { $0.matchingWordCount == matchingWordCount }
        
        let instructions = MatchingWordsCalculator.getMergeInstructions(
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            matches: matchingWords)
        
        let shapeList = ProcessInstructions(
            words: words,
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            instructions: instructions,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
       
        return shapeList
    }
    
    
    public static func ProcessInstructions(words: [String], sourceShapes: GpuShapeModel, searchShapes: GpuShapeModel, instructions: [MergeInstructionModel], scoresMin:[Int], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
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
                    let (validShape,_) = ShapeToTextConverter.ToValidShape(shape: potentialShape, words: words)
                    
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
