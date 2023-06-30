//
//  MergeCalculator.swift
//  
//
//  Created by Michael Geurtjens on 24/5/2023.
//

import Foundation
/// Merges two shapes together
public class MatchingWordsCalculator {
    
    
    /// Get merge instructions for when we have two different lists of shapes
    /// - Parameters:
    ///   - source: The shapes with the smaller number of words
    ///   - sourceShapeId: The actual shape id from the source shapes that we want the instructions for
    ///   - search: Shapes with the larger number of words that we are trying to find a match with the source shape
    ///   - searchWordIndex: An index with an entry for each word id and within that entry is all shapes that can connect with it from the search shapes
    /// - Returns: Details about two shapes that will probably merge together
    public static func GetMergeInstructions(sourceShapes: GpuShapeModel, sourceShapeId: Int, searchShapes: GpuShapeModel, searchWordIndex:[[Int]]) -> [MergeInstructionModel]{
        let matches: [MatchingShapesModel] = ExecuteOne(
            sourceShapes: sourceShapes,
            sourceShapeId: sourceShapeId,
            searchShapes: searchShapes,
            searchWordIndex: searchWordIndex,
            searchMin: 0,
            searchMax: searchShapes.count)
        
        let instructions = getMergeInstructions(
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            matches: matches)
        
        return instructions
    }
    
    /// Get merge instructions for when we are merging with the same list of shapes.  Merge instructions happens only for shapes that are after the source shape id
    /// - Parameters:
    ///   - source: Shapes that we are trying to find intelligent sounding merges
    ///   - sourceShapeId: The location within the source array that we are searching
    ///   - sourceWordIndex: An index containing the location of what shapes contain what word.
    /// - Returns: Details about two shapes in the same set of shapes that we probably merge together
    public static func GetMergeInstructions(sourceShapes: GpuShapeModel, sourceShapeId: Int, sourceWordIndex:[[Int]], searchMax: Int) -> [MergeInstructionModel]{
        let matches: [MatchingShapesModel] = ExecuteOne(
            sourceShapes: sourceShapes,
            sourceShapeId: sourceShapeId,
            searchShapes: sourceShapes,
            searchWordIndex: sourceWordIndex,
            searchMin: sourceShapeId+1, // We are searching for everything after the one we are starting with
            searchMax: searchMax)
        
        let instructions = getMergeInstructions(
            sourceShapes: sourceShapes,
            searchShapes: sourceShapes,
            matches: matches)
        
        return instructions
    }
    
    
    public static func ExecuteOne(sourceShapes: GpuShapeModel, sourceShapeId: Int, searchShapes: GpuShapeModel, searchWordIndex: [[Int]], searchMin: Int, searchMax: Int) -> [MatchingShapesModel]
    {
        let (oneWordMatch, multiWordMatch) = findShapesThatContainCommonWordsWithOurSourceShape(
            sourceShapes: sourceShapes,
            sourceShapeId: sourceShapeId,
            searchWordIndex: searchWordIndex,
            searchMin: searchMin,
            searchMax: searchMax
        )
        
        let (wordId, isHorizontal, x, y) = sourceShapes.getItem(shapePosition: sourceShapeId)
        
        let validatedMultiWordMatch = ValidateMultiWordMatches(
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
    
    
    
    public static func findShapesContainingCommonWords(sourceShapes: GpuShapeModel, sourceShapeId: Int, searchWordIndex: [[Int]], searchMin: Int, searchMax: Int) -> [Int] {
        var shapesWithWords:[Int] = []
        let startPos = sourceShapeId * sourceShapes.stride
        for i in 0..<sourceShapes.stride {
            let pos = startPos + i
            let wordId = Int(sourceShapes.wordId[pos])
            let shapesWithThatWordId = searchWordIndex[wordId]
            if shapesWithThatWordId.count > 0 {
                shapesWithWords += shapesWithThatWordId
            }
        }

        var filtered = shapesWithWords.filter { $0 >= searchMin && $0 <= searchMax}
        
        filtered.sort()
        return filtered
    }
    
    /// Search for shapes that have common words with the particular shape that we are trying to merge with
    /// - Parameters:
    ///   - sourceShapes: A list of shapes from which we extract details of the shape that we are going to try to merge with all possible shapes in searchableShapes
    ///   - sourceShapeId: The actual shape that we will be referencing and endevouring to match with
    ///   - searchableShapes: The total number of shapes that we might be able to merge with
    ///   - searchWordIndex: an array of words each with an array of shape positions that have that word in the shape.  If there are 91 words then it will contain 91 items and each item is an array of locations where the word appears.  So the array position 0 is for word zero and array position 90 for the last word.
    ///   - searchMin: lower limit of what shapes to start to try to merge with from the search shapes
    ///   - searchMax: upper limit of what shapes to try merge with from the search shapes
    /// - Returns: A list of shapes that combine with the source shape.  There is the list that tells how many words are matching and another list of one word matches
    public static func findShapesThatContainCommonWordsWithOurSourceShape(sourceShapes: GpuShapeModel, sourceShapeId: Int, searchWordIndex: [[Int]], searchMin: Int, searchMax: Int) -> ([MatchingShapesModel],[Int]) {
        
        // First let us find shapes that have the same words in them
        let matchingShapes = findShapesContainingCommonWords(sourceShapes: sourceShapes, sourceShapeId: sourceShapeId, searchWordIndex: searchWordIndex, searchMin: searchMin, searchMax: searchMax)
        
        
        // So now we can work out how many words there are that are matching
        let result = countOfWordsInShapes(sourceShapeId: sourceShapeId, matchingShapes: matchingShapes)
        
        // for those where there are only 1 word lets just give them a list of those as they require no more processing
        let oneWordMatch = result.filter { $0.matchingWordCount == 1}
        
        let moreThanOneWordMatch = result.filter { $0.matchingWordCount > 1 && $0.matchingWordCount < sourceShapes.stride}
        
        let moreThanOneWordId = moreThanOneWordMatch.map {$0.searchShapeId}
        
        return (oneWordMatch, moreThanOneWordId)
        
    }
    
    public static func countOfWordsInShapes(sourceShapeId: Int, matchingShapes: [Int]) -> [MatchingShapesModel] {
        if matchingShapes.count == 0 {
            return []
        }
        
        var result:[MatchingShapesModel] = []
        
        let dictionary = Dictionary(grouping: matchingShapes, by: { $0} )

        result.reserveCapacity(dictionary.count)

        for item in dictionary {
            result.append(MatchingShapesModel(sourceShapeId:sourceShapeId, searchShapeId: item.key, matchingWordCount: UInt8(item.value.count)))
        }
        
        result.sort() { $0.searchShapeId < $1.searchShapeId }
        return result

        
        
//        var shapeId = matchingShapes[0]
//        var matchingWordCount = 1
//        for i in 1..<matchingShapes.count {
//            let current = matchingShapes[i]
//            if current != shapeId {
//                result.append(MatchingShapesModel(sourceShapeId: sourceShapeId,searchShapeId: shapeId, matchingWordCount: UInt8(matchingWordCount)))
//                shapeId = current
//                matchingWordCount = 1
//            } else {
//                matchingWordCount += 1
//            }
//        }
//        result.append(MatchingShapesModel(sourceShapeId: sourceShapeId,searchShapeId: shapeId, matchingWordCount: UInt8(matchingWordCount)))
//        return result
    }
    
    
    
    /// if you have multiple words that are matching then are the distances between each of the words the same because if they are not then its not a proper match
    /// - Parameters:
    ///   - matchingWords: Can be -1 or else it can be the position of the shape and word within the other shape
    ///   - sourceX: A list of all x positions within the source shape
    ///   - sourceY: A list of all y positions within the source shape
    ///   - searchX: A list of all x positions in the search shape
    ///   - searchY: A list of all y positions in the search shape
    ///   - matchingDirection: Are these two shapes in the same direction, then its true, else its false
    /// - Returns: Tells us if the distances are matching because if they are not matching then this is not a valid merge
    public static func MatchingDistance(matchingWords: [Int], sourceX:[UInt8], sourceY:[UInt8], searchX: [UInt8], searchY: [UInt8], matchingDirection: Bool) -> Bool {
        
        let stride = matchingWords.count
        var found = false
        var startingSourceX: Int = 0
        var startingSearchX: Int = 0
        var startingSourceY: Int = 0
        var startingSearchY: Int = 0
        for i in 0..<stride {
            let matchingWordPos = matchingWords[i]
            if matchingWordPos != -1 {
                if found == false {
                    found = true
                    startingSourceX = Int(sourceX[i])
                    startingSearchX = Int(searchX[matchingWordPos])
                    startingSourceY = Int(sourceY[i])
                    startingSearchY = Int(searchY[matchingWordPos])
                    
                } else {
                    let distanceSourceX = startingSourceX - Int(sourceX[i])
                    let distanceSearchX = startingSearchX - Int(searchX[matchingWordPos])
                    
                    let distanceSourceY = startingSourceY - Int(sourceY[i])
                    let distanceSearchY = startingSearchY - Int(searchY[matchingWordPos])
                    if matchingDirection {
                        if distanceSourceX != distanceSearchX || distanceSourceY != distanceSearchY {
                            return false
                        }
                    } else {
                        if distanceSourceX != distanceSearchY || distanceSourceY != distanceSearchX {
                            return false
                        }
                    }
                }
            }
        }
        return true
    }
    
    
    /// Does the direction of all words in both lists, are they always the same or always opposite.  And which one is it same or opposite
    public static func MatchingDirection(matchingWords: [Int], isHorizontalSource: [Bool], isHorizontalSearch: [Bool]) -> (Bool,Bool) {
        // Well we know which words are matching fro the matchingWords array
        // lets compare the direction
        var directionIsSame: Bool?
        for matchedId in 0..<matchingWords.count {
            if matchingWords[matchedId] != -1 {
                let shapePosition = matchingWords[matchedId]
                if isHorizontalSource[matchedId] == isHorizontalSearch[shapePosition] {
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
        return (true, directionIsSame!)
    }
    
    ///The next question is whether the multiWordMatch complies with what we want so we can then add those that comply to our list of oneWordMatch to get all possible matches that we can then use to do the more heavy lifting work that requires a lot more computation.
    public static func ValidateMultiWordMatches(sourceShapeId: Int, wordId: [UInt8], isHorizontal:[Bool], x: [UInt8], y: [UInt8], searchShapes: GpuShapeModel, multiWordMatch: [Int]) -> [MatchingShapesModel] {
 
        var result:[MatchingShapesModel] = []
        
        let strideSearch = searchShapes.stride
        let strideSource = wordId.count
        
        var matchingWords: [Int] = Array(repeating: -1, count: strideSource)
        
        for shapeIdPos in 0..<multiWordMatch.count {
            
            let searchStartPos = multiWordMatch[shapeIdPos] * strideSearch
            
            var j = 0
            var k = 0
            var matchingCount = 0

            // Clear the matching words
            for i in 0..<strideSource {
                matchingWords[i] = -1
            }
            
            
            while j < strideSource && k < strideSearch {
                if wordId[j] == searchShapes.wordId[searchStartPos + k] {
                    matchingCount += 1
                    matchingWords[j] = searchStartPos + k
                    j += 1
                } else if wordId[j] < searchShapes.wordId[searchStartPos + k] {
                    j += 1
                } else {
                    k += 1
                }
            }
            
            
            // This checks if all the isHorizontal are all same all opposite
            let (isMatching, directionIsSame) = MatchingDirection(
                matchingWords: matchingWords,
                isHorizontalSource: isHorizontal,
                isHorizontalSearch: searchShapes.isHorizontal)
            
            if isMatching {
                
                if MatchingDistance(
                        matchingWords: matchingWords,
                        sourceX: x,
                        sourceY: y,
                        searchX: searchShapes.x,
                        searchY: searchShapes.y,
                        matchingDirection: directionIsSame)
                 {
                    result.append(MatchingShapesModel(
                        sourceShapeId:sourceShapeId,
                        searchShapeId: multiWordMatch[shapeIdPos],
                        matchingWordCount: UInt8(matchingCount)))
                }
            }
        }
        return result
    }
    
    
    /// creates the merge instructions that we can then use to derive the merges
    public static func getMergeInstructions(sourceShapes: GpuShapeModel, searchShapes: GpuShapeModel, matches: [MatchingShapesModel]) -> [MergeInstructionModel]{
        
        let strideSource = sourceShapes.stride
        let strideSearch = searchShapes.stride
        
        var result: [MergeInstructionModel] = []
        
        for item in matches {
            let sourceStartPos = item.sourceShapeId * strideSource
            let searchStartPos = item.searchShapeId * strideSearch
            
            // We want to find the starting position for each of them
            var found = false
            var i = 0
            var k = 0
            while i < strideSource && k < strideSearch {
                if sourceShapes.wordId[sourceStartPos + i] == searchShapes.wordId[searchStartPos + k] {
                    found = true
                    break
                } else if sourceShapes.wordId[sourceStartPos + i] < searchShapes.wordId[searchStartPos + k] {
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
            let flipped = (sourceShapes.isHorizontal[sourceIndex] != searchShapes.isHorizontal[searchableIndex])
            
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
}
