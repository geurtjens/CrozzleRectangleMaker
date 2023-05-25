//
//  MergeCalculator.swift
//  
//
//  Created by Michael Geurtjens on 24/5/2023.
//

import Foundation
struct MergeCalculator {
    
    public static func MatchingDistance(matchingWords: [Int], x:[UInt8], y:[UInt8], xList: [UInt8], yList: [UInt8]) -> Bool {
        
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
                    if distanceX != distanceListX {
                        return false
                    }
                    let distanceY = startingY - Int(y[i])
                    let distanceListY = startingListY - Int(yList[matchingWordPos])
                    if distanceY != distanceListY {
                        return false
                    }
                }
            }
        }
        return true
    }
    
    
    public static func MatchingDirection(
        matchingWords:[Int],
        isHorizontal:[Bool],
        isHorizontalList:[Bool]) -> Bool {
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
                        return false
                    }
                } else {
                    // The direction is not the same in this case
                    if directionIsSame == nil {
                        directionIsSame = false
                    } else if directionIsSame! != false {
                        // We do not have matching direction
                        return false
                    }
                }
            }
        }
            
            
        // So the next thing is to determine if we have matching spacing
        
            
        return true
    }
    
    ///// The next question is whether the multiWordMatch complies with what we want so we can then add those that comply to our list of oneWordMatch to get all possible matches that we can then use to do the more heavy lifting work that requires a lot more computation.
    public static func ValidateMultiWordMatches(wordId: [UInt8], isHorizontal:[Bool], x: [UInt8], y: [UInt8], searchableShapes: GpuShapeModel, multiWordMatch: [Int]) -> [MatchingWordCountInShapeModel] {
 
        var result:[MatchingWordCountInShapeModel] = []
        
        let strideSearchable = searchableShapes.stride
        let strideSource = wordId.count
        
        var matchingWords: [Int] = Array(repeating: -1, count: strideSource)
        
        for shapeIdPos in 0..<multiWordMatch.count {
            
            let searchStartPos = shapeIdPos * strideSearchable
            
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
            
            
            // Lets investigate the unmatching here and try it out on the faster thing which is edges
            
            
            
            if MatchingDirection(
                matchingWords: matchingWords,
                isHorizontal: isHorizontal,
                isHorizontalList: searchableShapes.isHorizontal) &&
                
                MatchingDistance(
                            matchingWords: matchingWords,
                            x: x,
                            y: y,
                            xList: searchableShapes.x,
                            yList: searchableShapes.y)

            {
                result.append(MatchingWordCountInShapeModel(shapeId: multiWordMatch[shapeIdPos], matchingWordCount: matchingCount))

            }
            
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
            wordId: wordId,
            isHorizontal: isHorizontal,
            x: x,
            y: y,
            searchableShapes: searchableShapes,
            multiWordMatch: multiWordMatch)
        
        let result = oneWordMatch + validatedMultiWordMatch
        
        return result
    }
    
    
    
    // Execute same shape requires that we avoid repeats and so we go through each one
    public static func ExecuteSameShape(shapes: GpuShapeModel) -> [[MatchingWordCountInShapeModel]] {
        var result: [[MatchingWordCountInShapeModel]] = []
        
        for shapeId in 0..<shapes.count {
            let item = ExecuteOne(searchableShapes: shapes, searchMin: shapeId+1, searchMax: shapes.count, sourceShapes: shapes, sourceShapeId: shapeId)
            result.append(item)
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
    
    public static func countOfWordsInShapes(matchingShapes: [Int]) -> [MatchingWordCountInShapeModel] {
        if matchingShapes.count == 0 {
            return []
        }
        
        var result:[MatchingWordCountInShapeModel] = []
        var shapeId = matchingShapes[0]
        var matchingWordCount = 1
        for i in 1..<matchingShapes.count {
            let current = matchingShapes[i]
            if current != shapeId {
                result.append(MatchingWordCountInShapeModel(shapeId: shapeId, matchingWordCount: matchingWordCount))
                shapeId = current
                matchingWordCount = 1
            } else {
                matchingWordCount += 1
            }
        }
        result.append(MatchingWordCountInShapeModel(shapeId: shapeId, matchingWordCount: matchingWordCount))
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
        let result = countOfWordsInShapes(matchingShapes: filtered)
        
        // for those where there are only 1 word lets just give them a list of those as they require no more processing
        let oneWordMatch = result.filter { $0.matchingWordCount == 1}
        
        let moreThanOneWordMatch = result.filter { $0.matchingWordCount > 1 && $0.matchingWordCount < sourceShapes.stride}
        
        //let oneWordId:[Int] = oneWordMatch.map {$0.shapeId}
        
        
        
        let moreThanOneWordId = moreThanOneWordMatch.map {$0.shapeId}
        
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
