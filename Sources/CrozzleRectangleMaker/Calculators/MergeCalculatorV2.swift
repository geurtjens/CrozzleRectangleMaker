//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 27/8/2023.
//

import Foundation
// a collection of functions that can merge a list of shapes to another list of shapes
public class MergeCalculatorV2 {
    
    // Execute same shape requires that we avoid repeats and so we go through each one
    public static func ExecuteSameShapeAsync(
        shapes: [ShapeModel],
        wordIndex: WordIndexModelV2,
        sourceMax: Int,
        searchMax: Int,
        words:[String],
        wordsInt: [[Int]],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int) async -> [ShapeModel]
    {
        
        // Rather than having a loop and running one at a time we have these async things that process all going up 10 at a time
        
        async let a0 = ExecuteSameShapeOneAsync(
            zeroToNine:0,
            sourceShapes: shapes,
            wordIndex: wordIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            wordsInt: wordsInt,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a1 = ExecuteSameShapeOneAsync(
            zeroToNine: 1,
            sourceShapes: shapes,
            wordIndex: wordIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            wordsInt: wordsInt,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a2 = ExecuteSameShapeOneAsync(
            zeroToNine: 2,
            sourceShapes: shapes,
            wordIndex: wordIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            wordsInt: wordsInt,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a3 = ExecuteSameShapeOneAsync(
            zeroToNine: 3,
            sourceShapes: shapes,
            wordIndex: wordIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            wordsInt: wordsInt,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a4 = ExecuteSameShapeOneAsync(
            zeroToNine: 4,
            sourceShapes: shapes,
            wordIndex: wordIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            wordsInt: wordsInt,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a5 = ExecuteSameShapeOneAsync(
            zeroToNine: 5,
            sourceShapes: shapes,
            wordIndex: wordIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            wordsInt: wordsInt,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a6 = ExecuteSameShapeOneAsync(
            zeroToNine: 6,
            sourceShapes: shapes,
            wordIndex: wordIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            wordsInt: wordsInt,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a7 = ExecuteSameShapeOneAsync(
            zeroToNine: 7,
            sourceShapes: shapes,
            wordIndex: wordIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            wordsInt: wordsInt,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a8 = ExecuteSameShapeOneAsync(
            zeroToNine: 8,
            sourceShapes: shapes,
            wordIndex: wordIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            wordsInt: wordsInt,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a9 = ExecuteSameShapeOneAsync(
            zeroToNine: 9,
            sourceShapes: shapes,
            wordIndex: wordIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            wordsInt: wordsInt,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        
        return await a0 + a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9
    }
    
    public static func ExecuteDifferentShapesAsync(
        sourceShapes: [ShapeModel],
        searchShapes: [ShapeModel],
        searchWordIndex: WordIndexModelV2,
        sourceMax: Int,
        searchMax: Int,
        words:[String],
        wordsInt: [[Int]],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int) async -> [ShapeModel]
    {
        
        // Rather than having a loop and running one at a time we have these async things that process all going up 10 at a time
        
        async let a0 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 0,
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            wordIndex: searchWordIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a1 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 1,
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            wordIndex: searchWordIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a2 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 2,
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            wordIndex: searchWordIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a3 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 3,
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            wordIndex: searchWordIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a4 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 4,
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            wordIndex: searchWordIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a5 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 5,
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            wordIndex: searchWordIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a6 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 6,
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            wordIndex: searchWordIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a7 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 7,
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            wordIndex: searchWordIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a8 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 8,
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            wordIndex: searchWordIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a9 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 9,
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            wordIndex: searchWordIndex,
            sourceMax: sourceMax,
            searchMax: searchMax,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        return await a0 + a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9
    }
    
    
    public static func ExecuteSameShapeOneAsync(
        zeroToNine: Int,
        sourceShapes: [ShapeModel],
        wordIndex: WordIndexModelV2,
        sourceMax: Int,
        searchMax:Int,
        words:[String],
        wordsInt: [[Int]],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int) -> [ShapeModel]
    {
        var result:[ShapeModel] = []
        
        // The difference is that each cpu works on 0,10,20 .. or 1, 11, 21 and so we divide the task
        for sourceShapeId in stride(from: zeroToNine, to:sourceMax, by: 10) {
            
            let shapes = ExecuteSameShapeOnce(
                sourceShapeId: sourceShapeId,
                sourceShape: sourceShapes[sourceShapeId],
                searchShapes: sourceShapes,
                wordIndex: wordIndex,
                searchMax: searchMax,
                words: words,
                wordsInt: wordsInt,
                scoresMin: scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            result += shapes
        }
        return result
    }
    
    
    public static func ExecuteDifferentShapesAsyncOne(
        zeroToNine: Int,
        sourceShapes: [ShapeModel],
        searchShapes: [ShapeModel],
        wordIndex: WordIndexModelV2,
        sourceMax: Int,
        searchMax: Int,
        words:[String],
        wordsInt: [[Int]],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int) -> [ShapeModel]
    {
        var result: [ShapeModel] = []
        
        for sourceShapeId in stride(from: zeroToNine, to: sourceMax, by: 10) {
            let shapes = ExecuteDifferentShapesOne(
                sourceShape: sourceShapes[sourceShapeId],
                sourceShapeId: sourceShapeId,
                searchShapes: searchShapes,
                searchWordIndex: wordIndex,
                searchMax: searchMax,
                words: words,
                wordsInt: wordsInt,
                scoresMin:scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            result += shapes
        }
        return result
    }
    
    
    // NonAsync version of merging shapes together.  So it runs on only one core.
    public static func ExecuteSameShapeSync(
        sourceShapes: [ShapeModel],
        wordIndex: WordIndexModelV2,
        searchMax: Int,
        words:[String],
        wordsInt: [[Int]],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int) -> [ShapeModel]
    {
        var result: [ShapeModel] = []
        
        for sourceShapeId in 0..<sourceShapes.count {
            
            let shapes = ExecuteSameShapeOnce(
                sourceShapeId: sourceShapeId,
                sourceShape: sourceShapes[sourceShapeId],
                searchShapes: sourceShapes,
                wordIndex: wordIndex,
                searchMax: searchMax,
                words: words,
                wordsInt: wordsInt,
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
        searchWordIndex: WordIndexModelV2,
        sourceMax: Int,
        searchMax: Int,
        words:[String],
        wordsInt: [[Int]],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int) -> [ShapeModel]
    {
        var result: [ShapeModel] = []
        
        for sourceShapeId in 0..<sourceMax {
            let shapes = ExecuteDifferentShapesOne(
                sourceShape: sourceShapes[sourceShapeId],
                sourceShapeId: sourceShapeId,
                searchShapes: searchShapes,
                searchWordIndex: searchWordIndex,
                searchMax: searchMax,
                words: words,
                wordsInt: wordsInt,
                scoresMin:scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            result += shapes
        }
        return result
    }
    
    
    public static func ExecuteSameShapeOnce(
        sourceShapeId: Int,
        sourceShape: ShapeModel,
        searchShapes: [ShapeModel],
        wordIndex: WordIndexModelV2,
        searchMax: Int,
        words:[String],
        wordsInt:[[Int]],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int) -> [ShapeModel]
    {
        
        let instructions = wordIndex.findMatches(
            sourceShape: sourceShape,
            sourceShapeId: sourceShapeId,
            searchMin: sourceShapeId + 1,
            searchMax: searchMax,
            searchShapes: searchShapes)
        
        let shapeList = GetShapesFromInstructions(
            instructions: instructions,
            sourceShape: sourceShape,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        return shapeList
    }
    
    
    public static func ExecuteDifferentShapesOne(
        sourceShape: ShapeModel,
        sourceShapeId: Int,
        searchShapes: [ShapeModel],
        searchWordIndex: WordIndexModelV2,
        searchMax: Int, words:[String],
        wordsInt: [[Int]],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int) -> [ShapeModel]
    {
        let instructions = searchWordIndex.findMatches(
            sourceShape: sourceShape,
            sourceShapeId: sourceShapeId,
            searchMin: 0,
            searchMax: searchMax,
            searchShapes: searchShapes)
        
        let shapeList = GetShapesFromInstructions(
            instructions: instructions,
            sourceShape: sourceShape,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        return shapeList
    }
    
    
    public static func GetShapesFromInstructions(
        instructions: [MergeInstructionModel],
        sourceShape: ShapeModel,
        searchShapes: [ShapeModel],
        words: [String],
        wordsInt: [[Int]],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int) -> [ShapeModel]
    {
        
        var shapeList: [ShapeModel] = []
        
        for instruction in instructions {
            
            let searchShape = searchShapes[instruction.searchShapeId]
            
            // We have matches of 2 but instruction says its a match of 1
            let (isValidSize, calcWidth, calcHeight) = MergeSizeValidation.Execute(
                instruction: instruction,
                sourceShape: sourceShape,
                searchShape: searchShape,
                widthMax: widthMax,
                heightMax: heightMax)
            
            if isValidSize {
                
                let potentialPlacements = MergePlacementCalculator.ExecuteV2(
                    sourcePlacements: sourceShape.placements,
                    searchPlacements: searchShape.placements)
                
                if potentialPlacements.count > 0 {
                    
                    
                    
                    
                    
                    let potentialWidth = PlacementCalculator.width(fromPlacements: potentialPlacements)
                    let potentialHeight = PlacementCalculator.height(fromPlacements: potentialPlacements)
                    
                    //                    if (calcWidth == potentialWidth && calcHeight == potentialHeight) || (calcWidth == potentialHeight && calcHeight == potentialWidth) {}
                    //                    else {
                    //
                    //                        print("ERROR HERE - GetShapesFromInstructions\ncalcWidth: \(calcWidth), potentialWidth:\(potentialWidth), calcHeight: \(calcHeight), potentialHeight: \(potentialHeight)")
                    //                        print(sourceShape.ToCode(words: words))
                    //                        print(searchShape.ToCode(words: words))
                    //
                    //                        print ("// sourceShape\n")
                    //                        if instruction.flipped {
                    //                            print("/*\n\(sourceShape.ToText(words: words))\n*/")
                    //                        } else {
                    //                            print("/*\n\(sourceShape.ToText(words: words))\n*/")
                    //                        }
                    //                        print ("// searchShape\n")
                    //                        print("/*\n\(searchShape.ToText(words: words))\n*/")
                    //                        print ("// result\n")
                    //                        print("/*\n\(potentialPlacements.toShape(score: 0).ToTextDebug(words: words))\n*/")
                    //                        print("potentialWH::(\(potentialWidth),\(potentialHeight)), calcWH:(\(calcWidth), \(calcHeight))")
                    //
                    //                        print("\(instruction)")
                    //                    }
                    
                    if (potentialWidth <= widthMax && potentialHeight <= heightMax) ||
                        (potentialWidth <= heightMax && potentialHeight <= widthMax) {
                        
                        let validShape = ShapeToTextConverterV2.ToValidShape(
                            placements: potentialPlacements,
                            width: Int(potentialWidth),
                            height: Int(potentialHeight),
                            wordsInt: wordsInt,
                            words: words)
                        
                        if let validShape = validShape {
                            
                            // I wonder if the shape width and height are the same
                            if potentialWidth == validShape.width && potentialHeight == validShape.height {
                                //print("same")
                            } else if potentialWidth == validShape.height && potentialHeight == validShape.width {
                                //print("opposite")
                            } else {
                                print("different")
                            }
                            
                            // is shape is not nil so it must be a valid shape
                            let wordCount = validShape.placements.count
                            let scoreMin = scoresMin[wordCount]
                            if validShape.score >= scoreMin {
                                var validShape = validShape
                                validShape.mergeHistory = ShapeModel.createMergeHistory(
                                    sourceShapeHistory: sourceShape.mergeHistory,
                                    searchShapeHistory: searchShape.mergeHistory)
                                
                                shapeList.append(validShape)
                            }
                        }
                    } else {
                        //print("We thought it was a valid size but it wasnt")
                    }
                }
            }
        }
        return shapeList
    }
    
    
    public static func mergeTwoShapes(
        sourceShape: ShapeModel,
        searchShape: ShapeModel,
        words: [String],
        widthMax: Int,
        heightMax: Int,
        scoreMin: Int = 0,
        wordsInt:[[Int]]) -> ShapeModel?
    {
        let sourceShape = sourceShape
        
        
        
        let (_, _, _, matchingWordCount) = ValidateMergeCalculator.GetMatches(
            sourceShape: sourceShape,
            searchShape: searchShape)
        
        
        let instruction = ValidateMergeCalculator.Execute(
            matchCount: matchingWordCount,
            sourceShape: sourceShape,
            sourceShapeId: 0,
            searchShape:searchShape,
            searchShapeId: 0)
        if instruction == nil {
            return nil
        }
        
        guard let instruction = instruction else { return nil}
        
        
        // We have matches of 2 but instruction says its a match of 1
        let (isValidSize, calcWidth, calcHeight) = MergeSizeValidation.Execute(
            instruction: instruction,
            sourceShape: sourceShape,
            searchShape: searchShape,
            widthMax: widthMax,
            heightMax: heightMax)
        
        if isValidSize {
            
            let potentialPlacements = MergePlacementCalculator.ExecuteV2(
                sourcePlacements: sourceShape.placements,
                searchPlacements: searchShape.placements)
            
            if potentialPlacements.count > 0 {
                
                let potentialWidth = PlacementCalculator.width(fromPlacements: potentialPlacements)
                let potentialHeight = PlacementCalculator.height(fromPlacements: potentialPlacements)
                
                //                if (calcWidth == potentialWidth && calcHeight == potentialHeight) || (calcWidth == potentialHeight && calcHeight == potentialWidth) {} else {
                //
                //
                //                    print("ERROR HERE - mergeTwoShapes\ncalcWidth: \(calcWidth), potentialWidth:\(potentialWidth), calcHeight: \(calcHeight), potentialHeight: \(potentialHeight)")
                //                    print(sourceShape.ToCode(words: words))
                //                    print(searchShape.ToCode(words: words))
                //
                //                    print ("// sourceShape\n")
                //                    if instruction.flipped {
                //                        print("/*\n\(sourceShape.ToText(words: words))\n*/")
                //                    } else {
                //                        print("/*\n\(sourceShape.ToText(words: words))\n*/")
                //                    }
                //                    print ("// searchShape\n")
                //                    print("/*\n\(searchShape.ToText(words: words))\n*/")
                //                    print ("// result\n")
                //                    print("/*\n\(potentialPlacements.toShape(score: 0).ToTextDebug(words: words))\n*/")
                //                    print("potentialWH::(\(potentialWidth),\(potentialHeight)), calcWH:(\(calcWidth), \(calcHeight))")
                //
                //
                //                    print("\(instruction)")
                //                }
                
                if (potentialWidth <= widthMax && potentialHeight <= heightMax) ||
                    (potentialWidth <= heightMax && potentialHeight <= widthMax) {
                    
                    let validShape = ShapeToTextConverterV2.ToValidShape(placements: potentialPlacements, width: Int(potentialWidth), height: Int(potentialHeight), wordsInt: wordsInt, words: words)
                    
                    if let validShape = validShape {
                        
                        // I wonder if the shape width and height are the same
                        if potentialWidth == validShape.width && potentialHeight == validShape.height {
                            //print("same")
                        } else if potentialWidth == validShape.height && potentialHeight == validShape.width {
                            //print("opposite")
                        } else {
                            print("different")
                        }
                        
                        
                        // is shape is not nil so it must be a valid shape
                        
                        if validShape.score >= scoreMin {
                            var validShape = validShape
                            validShape.mergeHistory = ShapeModel.createMergeHistory(sourceShapeHistory: sourceShape.mergeHistory, searchShapeHistory: searchShape.mergeHistory)
                            return validShape
                        }
                    }
                }
            } else {
                //print("We thought it was a valid size but it wasnt")
            }
        }
            
            return nil
        }
        
        
   
}
