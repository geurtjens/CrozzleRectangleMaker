//
//  MergeCalculator.swift
//  
//
//  Created by Michael Geurtjens on 24/5/2023.
//

import Foundation
/// Merges two shapes together
public struct MergeCalculator {
    
    public static func MatchingDistance(matchingWords: [Int], x:[UInt8], y:[UInt8], xList: [UInt8], yList: [UInt8], matchingDirection: Bool) -> Bool {
        
        let stride = matchingWords.count
        var found = false
        var startingX: Int = 0
        var startingListX: Int = 0
        var startingY: Int = 0
        var startingListY: Int = 0
        for i in 0..<stride {
            let matchingWordPos = matchingWords[i]
            if matchingWordPos != -1 {
                if found == false {
                    found = true
                    startingX = Int(x[i])
                    startingListX = Int(xList[matchingWordPos])
                    startingY = Int(y[i])
                    startingListY = Int(yList[matchingWordPos])
                    
                } else {
                    let distanceX = startingX - Int(x[i])
                    let distanceListX = startingListX - Int(xList[matchingWordPos])
                    
                    let distanceY = startingY - Int(y[i])
                    let distanceListY = startingListY - Int(yList[matchingWordPos])
                    if matchingDirection {
                        if distanceX != distanceListX {
                            return false
                        }
                        
                        if distanceY != distanceListY {
                            return false
                        }
                    } else {
                        if distanceX != distanceListY {
                            return false
                        }
                        
                        if distanceY != distanceListX {
                            return false
                        }
                    }
                }
            }
        }
        return true
    }
    
    
    public static func MatchingDirection(
        matchingWords:[Int],
        isHorizontal:[Bool],
        isHorizontalList:[Bool]) -> (Bool,Bool) {
        // Well we know which words are matching fro the matchingWords array
        // lets compare the direction
        var directionIsSame: Bool?
        for matchedId in 0..<matchingWords.count {
            if matchingWords[matchedId] != -1 {
                let shapePosition = matchingWords[matchedId]
                if isHorizontal[matchedId] == isHorizontalList[shapePosition] {
                    // The direction is the same in this case
                    if directionIsSame == nil {
                        directionIsSame = true
                    } else if directionIsSame! != true {
                        // We do not have matching directions
                        return (false, directionIsSame!)
                    }
                } else {
                    // The direction is not the same in this case
                    if directionIsSame == nil {
                        directionIsSame = false
                    } else if directionIsSame! != false {
                        // We do not have matching direction
                        return (false, directionIsSame!)
                    }
                }
            }
        }
            
            
        // So the next thing is to determine if we have matching spacing
        
            
        return (true, directionIsSame!)
    }
    
    ///// The next question is whether the multiWordMatch complies with what we want so we can then add those that comply to our list of oneWordMatch to get all possible matches that we can then use to do the more heavy lifting work that requires a lot more computation.
    public static func ValidateMultiWordMatches(sourceShapeId: Int, wordId: [UInt8], isHorizontal:[Bool], x: [UInt8], y: [UInt8], searchableShapes: GpuShapeModel, multiWordMatch: [Int]) -> [MatchingWordCountInShapeModel] {
 
        var result:[MatchingWordCountInShapeModel] = []
        
        let strideSearchable = searchableShapes.stride
        let strideSource = wordId.count
        
        var matchingWords: [Int] = Array(repeating: -1, count: strideSource)
        
        for shapeIdPos in 0..<multiWordMatch.count {
            
            let searchStartPos = multiWordMatch[shapeIdPos] * strideSearchable
            
            var j = 0
            var k = 0
            var matchingCount = 0

            // Clear the matching words
            for i in 0..<strideSource {
                matchingWords[i] = -1
            }
            
            
            while j < strideSource && k < strideSearchable {
                if wordId[j] == searchableShapes.wordId[searchStartPos + k] {
                    matchingCount += 1
                    matchingWords[j] = searchStartPos + k
                    j += 1
                } else if wordId[j] < searchableShapes.wordId[searchStartPos + k] {
                    j += 1
                } else {
                    k += 1
                }
            }
            
            
            // This checks if all the isHorizontal are all same all opposite
            let (isMatching, directionIsSame) = MatchingDirection(
                matchingWords: matchingWords,
                isHorizontal: isHorizontal,
                isHorizontalList: searchableShapes.isHorizontal)
            
            if isMatching {
                
                if MatchingDistance(
                        matchingWords: matchingWords,
                        x: x,
                        y: y,
                        xList: searchableShapes.x,
                        yList: searchableShapes.y,
                        matchingDirection: directionIsSame)
                 {
                    
                    result.append(MatchingWordCountInShapeModel(
                        sourceShapeId:sourceShapeId,
                        searchShapeId: multiWordMatch[shapeIdPos],
                        matchingWordCount: UInt8(matchingCount)))
                }
            }
            
        }
        
        return result
    }
    
    
    public static func getMergeInstructions(source: GpuShapeModel, searchable: GpuShapeModel, matches:[MatchingWordCountInShapeModel]) -> [MergeInstructionModel]{
        
        let strideSource = source.stride
        let strideSearchable = searchable.stride
        
        var result: [MergeInstructionModel] = []
        
        for item in matches {
            let sourceStartPos = item.sourceShapeId * strideSource
            let searchStartPos = item.searchShapeId * strideSearchable
            
            // We want to find the starting position for each of them
            var found = false
            var i = 0
            var k = 0
            while i < strideSource && k < strideSearchable {
                if source.wordId[sourceStartPos + i] == searchable.wordId[searchStartPos + k] {
                    found = true
                    break
                } else if source.wordId[sourceStartPos + i] < searchable.wordId[searchStartPos + k] {
                    i += 1
                } else {
                    k += 1
                }
            }
            
            if found == false {
                
                print("we didnt find any matching words here")
                break
            }
            
            // I am hoping now that we have the exact locations of the matching word in both structures
            let sourceIndex = i + sourceStartPos
            let searchableIndex = k + searchStartPos
            
            // We know if the first word is rotated
            let flipped = (source.isHorizontal[sourceIndex] != searchable.isHorizontal[searchableIndex])
            
            //let xOffset = Int8(source.x[sourceIndex]) - Int8(searchable.x[searchableIndex])
            //let yOffset = Int8(source.y[sourceIndex]) - Int8(searchable.y[searchableIndex])
            
            let mergeInstruction = MergeInstructionModel(
                sourceShapeId: item.sourceShapeId,
                searchShapeId: item.searchShapeId,
                matchingWordCount: item.matchingWordCount,
                sourceMatchingWordPosition: UInt8(i),
                searchMatchingWordPosition: UInt8(k),
                flipped: flipped)
                
            result.append(mergeInstruction)
        }
        return result
    }
    
    public static func ExecuteOne(
        searchableShapes: GpuShapeModel,
        searchMin: Int,
        searchMax: Int,
    
        sourceShapes: GpuShapeModel,
        sourceShapeId: Int
        ) -> [MatchingWordCountInShapeModel]
    {
        let (oneWordMatch, multiWordMatch) = matchingShapes(
            sourceShapes: sourceShapes,
            sourceShapeId: sourceShapeId,
            searchableShapes: searchableShapes,
            searchMin: searchMin,
            searchMax: searchMax
        )
        
        let (wordId, isHorizontal, x, y) = SearchFor(gpuShapeModel: sourceShapes, shapePosition: sourceShapeId)
        
        let validatedMultiWordMatch = ValidateMultiWordMatches(
            sourceShapeId: sourceShapeId,
            wordId: wordId,
            isHorizontal: isHorizontal,
            x: x,
            y: y,
            searchableShapes: searchableShapes,
            multiWordMatch: multiWordMatch)
        
        let result = oneWordMatch + validatedMultiWordMatch
        
        return result
    }
    
    
    
    public static func ExecuteSameShapeOnce(shapeId: Int, shapes: GpuShapeModel, words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        let matchingWords: [MatchingWordCountInShapeModel] = ExecuteOne(
            searchableShapes: shapes,
            searchMin: shapeId+1,
            searchMax: shapes.count,
            sourceShapes: shapes,
            sourceShapeId: shapeId)
        
        let instructions = getMergeInstructions(
            source:shapes,
            searchable: shapes,
            matches: matchingWords)
        
        var shapeList: [ShapeModel] = []
        for instruction in instructions {
       
            let potentialShape = MergePlacementCalculator.GetPlacementsOne(source: shapes, search: shapes, instruction: instruction)
            
            if (potentialShape.width <= widthMax && potentialShape.height <= heightMax) ||
                (potentialShape.width <= heightMax && potentialShape.height <= widthMax) {
                let (validShape,_) = ShapeCalculator.ToValidShape(shape: potentialShape, words: words)
                
                if let validShape = validShape {
                    let wordCount = validShape.placements.count
                    let scoreMin = scoresMin[wordCount]
                    if validShape.score >= scoreMin {
                        shapeList.append(validShape)
                    }
                }
            }
        }
        return shapeList
    }
    
    
    public static func ExecuteSameShapeAsyncOne(zeroToNine: Int, shapes: GpuShapeModel, words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        var result:[ShapeModel] = []
        
        // The difference is that each cpu works on 0,10,20 .. or 1, 11, 21 and so we divide the task
        for shapeId in stride(from: zeroToNine, to:shapes.count, by: 10) {
            let shapes = ExecuteSameShapeOnce(
                shapeId: shapeId,
                shapes: shapes,
                words: words,
                scoresMin: scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
            result += shapes
        }
        return result
    }
    
    
    // Execute same shape requires that we avoid repeats and so we go through each one
    public static func ExecuteSameShapeAsync(shapes: GpuShapeModel, words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) async -> [ShapeModel] {
        
        // Rather than having a loop and running one at a time we have these async things that process all going up 10 at a time
        
        async let a0 = ExecuteSameShapeAsyncOne(
            zeroToNine:0,
            shapes: shapes,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a1 = ExecuteSameShapeAsyncOne(
            zeroToNine: 1,
            shapes: shapes,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a2 = ExecuteSameShapeAsyncOne(
            zeroToNine: 2,
            shapes: shapes,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a3 = ExecuteSameShapeAsyncOne(
            zeroToNine: 3,
            shapes: shapes,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a4 = ExecuteSameShapeAsyncOne(
            zeroToNine: 4,
            shapes: shapes,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a5 = ExecuteSameShapeAsyncOne(
            zeroToNine: 5,
            shapes: shapes,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a6 = ExecuteSameShapeAsyncOne(
            zeroToNine: 6,
            shapes: shapes,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a7 = ExecuteSameShapeAsyncOne(
            zeroToNine: 7,
            shapes: shapes,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a8 = ExecuteSameShapeAsyncOne(
            zeroToNine: 8,
            shapes: shapes,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        async let a9 = ExecuteSameShapeAsyncOne(
            zeroToNine: 9,
            shapes: shapes,
            words: words,
            scoresMin:scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
   
        return await a0 + a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9
    }
    
    
    // Execute same shape requires that we avoid repeats and so we go through each one
    public static func ExecuteSameShape(shapes: GpuShapeModel, words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        var result: [ShapeModel] = []
        
        for shapeId in 0..<shapes.count {
            let shapes = ExecuteSameShapeOnce(
                shapeId: shapeId,
                shapes: shapes,
                words: words,
                scoresMin: scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
            result += shapes
        }
   
        return result
    }
    
    public static func ExecuteDifferentShapesOne(source: GpuShapeModel, sourceShapeId: Int, search: GpuShapeModel, words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        var shapeList: [ShapeModel] = []
        
        
        let matches: [MatchingWordCountInShapeModel] = ExecuteOne(searchableShapes: search, searchMin: 0, searchMax: search.count, sourceShapes: source, sourceShapeId: sourceShapeId)
        
        let instructions = getMergeInstructions(source:source, searchable: search, matches: matches)
        
        for instruction in instructions {
       
            let potentialShape = MergePlacementCalculator.GetPlacementsOne(source: source, search: search, instruction: instruction)
            
            if (potentialShape.width <= widthMax && potentialShape.height <= heightMax) || (potentialShape.width <= heightMax && potentialShape.height <= widthMax) {
                
                let (shape,_) = ShapeCalculator.ToValidShape(shape: potentialShape, words: words)
                
                if let shape = shape {
                    let wordCount = shape.placements.count
                    let scoreMin = scoresMin[wordCount]
                    if shape.score >= scoreMin {
                        shapeList.append(shape)
                    }
                }
            }
        }
        return shapeList
    }
    
    
    
    public static func ExecuteDifferentShapesAsyncOne(zeroToNine: Int, source: GpuShapeModel, search: GpuShapeModel, words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        var result: [ShapeModel] = []
        
        for shapeId in stride(from: zeroToNine, to: source.count, by: 10) {
            let shapes = ExecuteDifferentShapesOne(source: source, sourceShapeId: shapeId, search: search, words: words, scoresMin:scoresMin, widthMax: widthMax, heightMax: heightMax)
            
            result += shapes
        }
        return result
    }
    
    public static func ExecuteDifferentShapesAsync(source: GpuShapeModel, search: GpuShapeModel, words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) async -> [ShapeModel] {
       
        
        // Rather than having a loop and running one at a time we have these async things that process all going up 10 at a time
        
        async let a0 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 0,
            source: source,
            search: search,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a1 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 1,
            source: source,
            search: search,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a2 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 2,
            source: source,
            search: search,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a3 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 3,
            source: source,
            search: search,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a4 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 4,
            source: source,
            search: search,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a5 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 5,
            source: source,
            search: search,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a6 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 6,
            source: source,
            search: search,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a7 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 7,
            source: source,
            search: search,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a8 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 8,
            source: source,
            search: search,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let a9 = ExecuteDifferentShapesAsyncOne(
            zeroToNine: 9,
            source: source,
            search: search,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)

        return await a0 + a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9
    }
    
    public static func ExecuteDifferentShapes(source: GpuShapeModel, search: GpuShapeModel, words:[String], scoresMin:[Int], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        var result: [ShapeModel] = []
        
        for shapeId in 0..<source.count {
            let shapes = ExecuteDifferentShapesOne(source: source, sourceShapeId: shapeId, search: search, words: words, scoresMin:scoresMin, widthMax: widthMax, heightMax: heightMax)
            
            result += shapes
        }
        return result
    }
    
    
    public static func Execute(
        searchableShapes: GpuShapeModel,
        searchMin: Int,
        searchMax: Int,
    
        sourceShapes: GpuShapeModel,
        sourceMin: Int,
        sourceMax: Int) -> [[MatchingWordCountInShapeModel]]
    {
    
        var result: [[MatchingWordCountInShapeModel]] = []
        if searchableShapes.stride > sourceShapes.stride {
            // We can only merge a source which has a smaller or equal number of word count within the shapes
            return Execute(
                searchableShapes: sourceShapes,
                searchMin: sourceMin,
                searchMax: sourceMax,
                sourceShapes: searchableShapes,
                sourceMin: searchMin,
                sourceMax: searchMin)
        }
        
        for sourceShapeId in sourceMin..<sourceMax {
            let matchingShapes = ExecuteOne(
                searchableShapes: searchableShapes,
                searchMin: searchMin,
                searchMax: searchMax,
                sourceShapes: sourceShapes,
                sourceShapeId: sourceShapeId)
            
            result.append(matchingShapes)
        }
        return result
    }
    
    public static func countOfWordsInShapes(sourceShapeId: Int,matchingShapes: [Int]) -> [MatchingWordCountInShapeModel] {
        if matchingShapes.count == 0 {
            return []
        }
        
        var result:[MatchingWordCountInShapeModel] = []
        var shapeId = matchingShapes[0]
        var matchingWordCount = 1
        for i in 1..<matchingShapes.count {
            let current = matchingShapes[i]
            if current != shapeId {
                result.append(MatchingWordCountInShapeModel(sourceShapeId: sourceShapeId,searchShapeId: shapeId, matchingWordCount: UInt8(matchingWordCount)))
                shapeId = current
                matchingWordCount = 1
            } else {
                matchingWordCount += 1
            }
        }
        result.append(MatchingWordCountInShapeModel(sourceShapeId: sourceShapeId,searchShapeId: shapeId, matchingWordCount: UInt8(matchingWordCount)))
        return result
    }
    
    public static func matchingShapes(sourceShapes: GpuShapeModel, sourceShapeId: Int, searchableShapes: GpuShapeModel, searchMin: Int, searchMax: Int) -> ([MatchingWordCountInShapeModel],[Int]) {
        // First let us find shapes that have the same words in them
        
        var shapesWithWords:[Int] = []
        let startPos = sourceShapeId * sourceShapes.stride
        for i in 0..<sourceShapes.stride {
            let pos = startPos + i
            let wordId = Int(sourceShapes.wordId[pos])
            shapesWithWords += searchableShapes.wordIndex[wordId]
        }
        
        
        
        var filtered = shapesWithWords.filter { $0 >= searchMin && $0 <= searchMax}
        
        filtered.sort()
        
        // So now we can work out how many words there are that are matching
        let result = countOfWordsInShapes(sourceShapeId: sourceShapeId,matchingShapes: filtered)
        
        // for those where there are only 1 word lets just give them a list of those as they require no more processing
        let oneWordMatch = result.filter { $0.matchingWordCount == 1}
        
        let moreThanOneWordMatch = result.filter { $0.matchingWordCount > 1 && $0.matchingWordCount < sourceShapes.stride}
        
        //let oneWordId:[Int] = oneWordMatch.map {$0.shapeId}
        
        
        
        let moreThanOneWordId = moreThanOneWordMatch.map {$0.searchShapeId}
        
        return (oneWordMatch, moreThanOneWordId)
        
    }
    
    
    

    
    
    public static func SearchFor(gpuShapeModel: GpuShapeModel, shapePosition: Int) -> ([UInt8], [Bool], [UInt8], [UInt8]){
        
        var wordId: [UInt8] = []
        var isHorizontal: [Bool] = []
        var x: [UInt8] = []
        var y: [UInt8] = []
        
        let startPos = shapePosition * gpuShapeModel.stride
        
        for i in 0..<gpuShapeModel.stride {
            let j = startPos + i
            wordId.append(gpuShapeModel.wordId[j])
            isHorizontal.append(gpuShapeModel.isHorizontal[j])
            x.append(gpuShapeModel.x[j])
            y.append(gpuShapeModel.y[j])
        }
        return (wordId, isHorizontal, x, y)
    }
}
