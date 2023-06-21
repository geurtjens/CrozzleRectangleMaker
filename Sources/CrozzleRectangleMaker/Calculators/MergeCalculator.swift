//
//  MergeCalculator.swift
//  
//
//  Created by Michael Geurtjens on 24/5/2023.
//

import Foundation
/// Merges two shapes together
public class MergeCalculator {
    
    
    /// if you have multiple words that are matching then are the distances between each of the words the same because if they are not then its not a proper match
    /// - Parameters:
    ///   - matchingWords: Can be -1 or else it can be the position of the shape and word within the other shape
    ///   - x: A list of all x positions within the source shape
    ///   - y: A list of all y positions within the source shape
    ///   - xList: A list of all x positions in the search shape
    ///   - yList: A list of all y positions in the search shape
    ///   - matchingDirection: Are these two shapes in the same direction, then its true, else its false
    /// - Returns: Tells us if the distances are matching because if they are not matching then this is not a valid merge
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
    
    /// Does the direction of all words in both lists, are they always the same or always opposite.  And which one is it same or opposite
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
                isHorizontal: isHorizontal,
                isHorizontalList: searchShapes.isHorizontal)
            
            if isMatching {
                
                if MatchingDistance(
                        matchingWords: matchingWords,
                        x: x,
                        y: y,
                        xList: searchShapes.x,
                        yList: searchShapes.y,
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
    public static func getMergeInstructions(source: GpuShapeModel, search: GpuShapeModel, matches:[MatchingShapesModel]) -> [MergeInstructionModel]{
        
        let strideSource = source.stride
        let strideSearch = search.stride
        
        var result: [MergeInstructionModel] = []
        
        for item in matches {
            let sourceStartPos = item.sourceShapeId * strideSource
            let searchStartPos = item.searchShapeId * strideSearch
            
            // We want to find the starting position for each of them
            var found = false
            var i = 0
            var k = 0
            while i < strideSource && k < strideSearch {
                if source.wordId[sourceStartPos + i] == search.wordId[searchStartPos + k] {
                    found = true
                    break
                } else if source.wordId[sourceStartPos + i] < search.wordId[searchStartPos + k] {
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
            let flipped = (source.isHorizontal[sourceIndex] != search.isHorizontal[searchableIndex])
            
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
    
    
    
    
    /// find the matching shapes using filters and word indexes
    public static func matchingShapes(sourceShapes: GpuShapeModel, sourceShapeId: Int, searchableShapes: GpuShapeModel, searchWordIndex: [[Int]], searchMin: Int, searchMax: Int) -> ([MatchingShapesModel],[Int]) {
        
        // First let us find shapes that have the same words in them
        
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
        
        // So now we can work out how many words there are that are matching
        let result = countOfWordsInShapes(sourceShapeId: sourceShapeId, matchingShapes: filtered)
        
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
        
        /// Find the count of all unique numbers in matching shapes such that key is the unique number and value is an array containing those numbers
        let dictionary = Dictionary(grouping: matchingShapes, by: { $0} )
        
        /// The size of the result will be the same as the size of the dictionary
        var result:[MatchingShapesModel] = []
        result.reserveCapacity(dictionary.count)
        
        for item in dictionary {
            result.append(MatchingShapesModel(sourceShapeId:sourceShapeId, searchShapeId: item.key, matchingWordCount: UInt8(item.value.count)))
        }
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
}
