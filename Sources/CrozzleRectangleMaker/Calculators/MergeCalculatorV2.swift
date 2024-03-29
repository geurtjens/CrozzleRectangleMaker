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
        heightMax: Int) async -> [ShapeModel] {
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
        searchMax: Int,
        words:[String],
        wordsInt: [[Int]],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int) -> [ShapeModel] 
    {
        let instructions = searchWordIndex.findMatches(
            sourceShape: sourceShape,
            sourceShapeId: sourceShapeId,
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
    
    public static func ExecuteDifferentShapesOneAsync(
        sourceShape: ShapeModel,
        sourceShapeId: Int,
        searchShapes: [ShapeModel],
        searchWordIndex: WordIndexModelV2,
        searchMax: Int,
        words:[String],
        wordsInt: [[Int]],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int) async -> [ShapeModel]
    {
        let instructions = await searchWordIndex.findMatchesAsync(
            sourceShape: sourceShape,
            sourceShapeId: sourceShapeId,
            searchShapes: searchShapes)
        
        let shapeList = await GetShapesFromInstructionsAsync(
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
    
    
    public static func ProcessInstruction(
        instruction: MergeInstructionModel,
        sourceShape: ShapeModel,
        searchShape: ShapeModel,
        words: [String],
        wordsInt: [[Int]],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int
    ) async -> ShapeModel?
    {
        
        
        // We have matches of 2 but instruction says its a match of 1
        let (isValidSize, _, _) = mergeSizeValidation(
            instruction: instruction,
            sourceShape: sourceShape,
            searchShape: searchShape,
            widthMax: widthMax,
            heightMax: heightMax)
        
        if isValidSize {
            
            let potentialPlacements = MergePlacementCalculator.ExecuteV2(
                sourceShape: sourceShape,
                searchShape: searchShape,
                instruction: instruction,
                words: words)
            
            if potentialPlacements.count > 0 {
                
                let potentialWidth = PlacementCalculator.width(fromPlacements: potentialPlacements)
                
                let potentialHeight = PlacementCalculator.height(fromPlacements: potentialPlacements)
                
                if (potentialWidth <= widthMax && potentialHeight <= heightMax) ||
                    (potentialWidth <= heightMax && potentialHeight <= widthMax) {
                    
                    let validShape = ShapeToTextConverterV2.ToValidShape(
                        placements: potentialPlacements,
                        width: Int(potentialWidth),
                        height: Int(potentialHeight),
                        wordsInt: wordsInt,
                        words: words)
                    
                    if let validShape = validShape {
                        
                        
                        
                        // is shape is not nil so it must be a valid shape
                        let wordCount = validShape.placements.count
                        let scoreMin = scoresMin[wordCount]
                        if validShape.score >= scoreMin {
                            var validShape = validShape
                            
                            validShape.mergeHistory = ShapeModel.createMergeHistory(
                                sourceShapeHistory: sourceShape.mergeHistory,
                                searchShapeHistory: searchShape.mergeHistory)
                            
                            return validShape
                        }
                    }
                }
            }
        }
        return nil
    }
    
    public static func GetShapesFromInstructionsAsync(
        instructions: [MergeInstructionModel],
        sourceShape: ShapeModel,
        searchShapes: [ShapeModel],
        words: [String],
        wordsInt: [[Int]],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int) async -> [ShapeModel]
    {
        var shapeDictionary: [Int:ShapeModel?] = [:]
        
        await withTaskGroup(of: (Int, ShapeModel?).self) {group in
            for instructionId in 0..<instructions.count {
                group.addTask {
                    
                    return (instructionId, 
                            await ProcessInstruction(
                                instruction: instructions[instructionId],
                                sourceShape: sourceShape,
                                searchShape: searchShapes[instructions[instructionId].searchShapeId],
                                                          
                                words: words,
                                wordsInt: wordsInt,
                                scoresMin: scoresMin,
                                widthMax: widthMax,
                                heightMax: heightMax) )
                    
                }
            }
            for await (instructionId, shape) in group {
                if shape != nil {
                    shapeDictionary[instructionId] = shape!
                }
            }
        }
        
        let sortedDictionary = shapeDictionary.sorted() {$0.key < $1.key}
        var result: [ShapeModel] = []
        for (_, shape) in sortedDictionary {
            if shape != nil {
                result.append(shape!)
            }
        }
        return result
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
            let (isValidSize, calcWidth, calcHeight) = mergeSizeValidation(
                instruction: instruction,
                sourceShape: sourceShape,
                searchShape: searchShape,
                widthMax: widthMax,
                heightMax: heightMax)

            if isValidSize {
                
                let potentialPlacements = MergePlacementCalculator.ExecuteV2(
                    sourceShape: sourceShape,
                    searchShape: searchShape,
                    instruction: instruction,
                    words: words)
                 
                if potentialPlacements.count > 0 {
                    
                    let potentialWidth = PlacementCalculator.width(fromPlacements: potentialPlacements)
                    
                    let potentialHeight = PlacementCalculator.height(fromPlacements: potentialPlacements)

                    if (calcWidth == potentialWidth && calcHeight == potentialHeight) || (calcWidth == potentialHeight && calcHeight == potentialWidth) {} else {
                        
                        print("ERROR HERE")
                        print(sourceShape.ToCode(words: words))
                        print(searchShape.ToCode(words: words))
                        
                        print ("// sourceShape\n")
                        if instruction.flipped {
                            print("/*\n\(sourceShape.FlipToText(words: words))\n*/")
                        } else {
                            print("/*\n\(sourceShape.ToText(words: words))\n*/")
                        }
                        print ("// searchShape\n")
                        print("/*\n\(searchShape.ToText(words: words))\n*/")
                        print ("// result\n")
                        print("/*\n\(potentialPlacements.toShape(score: 0).ToTextDebug(words: words))\n*/")
                        print("potentialWH::(\(potentialWidth),\(potentialHeight)), calcWH:(\(calcWidth), \(calcHeight))")
                        
                        print("\(instruction)")
                    }
                    
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
                            if potentialWidth == validShape.width
                                && potentialHeight == validShape.height {
                                //print("same")
                            } else if potentialWidth == validShape.height
                                        && potentialHeight == validShape.width {
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
        let (isValidSize, calcWidth, calcHeight) = mergeSizeValidation(
            instruction: instruction,
            sourceShape: sourceShape,
            searchShape: searchShape,
            widthMax: widthMax,
            heightMax: heightMax)

        if isValidSize {
//            print("SourceShape")
//            print(sourceShape.ToText(words: words))
//            print("SearchShape")
//            print(searchShape.ToText(words: words))
//            print("Flipped SearchShape")
//            print(searchShape.FlipToText(words: words))
            
            let potentialPlacements = MergePlacementCalculator.ExecuteV2(
                sourceShape: sourceShape,
                searchShape: searchShape,
                instruction: instruction,
                words: words)
            
//            if instruction.flipped == true {
//                print("PotentialPlacements")
//                print(PlacementCalculator.Print(placements: potentialPlacements))
//            }
            
            // other version see if they are the same
            // See if it gives same results
//            let alternativePlacements = MergePlacementCalculatorV2.ExecuteV2(
//                sourcePlacements: sourceShape.placements,
//                searchPlacements: searchShape.placements)

//            let samePlacements = ComparePlacements(
//                potentialPlacements: potentialPlacements,
//                alternativePlacements: alternativePlacements)
//            
//            if samePlacements == false && potentialPlacements.count > 0 {
//                print("PLACEMENTS DIFFERENT")
//            }
            // when flipped is true then our calculation is wrong.  So its an isFlipped problem.
//            print("SamePlacements: \(samePlacements), IsFlipped: \(instruction.flipped)")
//            
            if potentialPlacements.count > 0 {
                
                let potentialWidth = PlacementCalculator.width(fromPlacements: potentialPlacements)
                
                let potentialHeight = PlacementCalculator.height(fromPlacements: potentialPlacements)

                if (calcWidth == potentialWidth && calcHeight == potentialHeight) || (calcWidth == potentialHeight && calcHeight == potentialWidth) {} else {
                    
                    print("ERROR HERE")
                    print(sourceShape.ToCode(words: words))
                    print(searchShape.ToCode(words: words))
                    
                    print ("// sourceShape\n")
                    if instruction.flipped {
                        print("/*\n\(sourceShape.FlipToText(words: words))\n*/")
                    } else {
                        print("/*\n\(sourceShape.ToText(words: words))\n*/")
                    }
                    print ("// searchShape\n")
                    print("/*\n\(searchShape.ToText(words: words))\n*/")
                    print ("// result\n")
                    print("/*\n\(potentialPlacements.toShape(score: 0).ToTextDebug(words: words))\n*/")
                    print("potentialWH::(\(potentialWidth),\(potentialHeight)), calcWH:(\(calcWidth), \(calcHeight))")
                    
                    print("\(instruction)")
                }
                
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
                        
                        if validShape.score >= scoreMin {
                            var validShape = validShape
                            
                            validShape.mergeHistory = ShapeModel.createMergeHistory(
                                sourceShapeHistory: sourceShape.mergeHistory,
                                searchShapeHistory: searchShape.mergeHistory)
                            
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
    
    
    // This will prove that both methods yield totally different results and that is why the c# version is defective.
    public static func ComparePlacements(
        potentialPlacements: [PlacementModel],
        alternativePlacements: [PlacementModel]) -> Bool 
    {
        if potentialPlacements.count != alternativePlacements.count {
            return false
        }
        var isOk = true
        //print("")
        //var result: [(Bool, String)] = []
        for i in 0..<potentialPlacements.count {
            let a = potentialPlacements[i]
            let b = alternativePlacements[i]
            
            //let text = "w: \(a.w):\(b.w), l: \(a.l):\(b.l), x: \(a.x):\(b.x), y: \(a.y):\(b.y), z: \(a.z):\(b.z)"
            //print(text)
            
            if a.w != b.w || a.x != b.x || a.y != b.y || a.z != b.z || a.l != b.l {
                //result.append((false, text))
                isOk = false
                //print("FALSE")
            }
            else {
                //result.append((true, text))
            }
        }
        if isOk == true {
            return true
        } else {
            return false
        }
    }
    
    
    public static func mergeSizeValidation(
        instruction: MergeInstructionModel,
        sourceShape: ShapeModel,
        searchShape: ShapeModel,
        widthMax: Int,
        heightMax: Int) -> (Bool, Int, Int)
    {
        let sourceWidth = Int(sourceShape.width)
        let sourceHeight = Int(sourceShape.height)
        
        let searchWidth = Int(searchShape.width)
        let searchHeight = Int(searchShape.height)
        
        let sourcePlacement = sourceShape.placements[Int(instruction.firstSourcePos)]
        let sourceX = Int(sourcePlacement.x)
        let sourceY = Int(sourcePlacement.y)
        
        let searchPlacement = searchShape.placements[Int(instruction.firstSearchPos)]
        let searchX = Int(searchPlacement.x)
        let searchY = Int(searchPlacement.y)
        
        let (isValid, width, height) = MergeSizeValidation.verifyWidthHeight(
            width1: sourceWidth,
            height1: sourceHeight,
            x1: sourceX,
            y1: sourceY,
            
            width2: searchWidth,
            height2: searchHeight,
            x2: searchX,
            y2: searchY,
            flipped: instruction.flipped,
            widthMax: widthMax,
            heightMax: heightMax)
        
        if isValid {
            return (true, width, height)
        } else {
            return (false, width, height)
        }
    }
}
