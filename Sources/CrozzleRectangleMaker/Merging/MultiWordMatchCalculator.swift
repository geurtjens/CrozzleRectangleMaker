//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 28/7/2023.
//

import Foundation
public class MultiWordMatchCalculator {
    ///The next question is whether the multiWordMatch complies with what we want so we can then add those that comply to our list of oneWordMatch to get all possible matches that we can then use to do the more heavy lifting work that requires a lot more computation.
    public static func ValidateMultiWordMatches(
        sourceShapeId: Int,
        wordId: [UInt8],
        isHorizontal: [Bool],
        x: [UInt8],
        y: [UInt8],
        searchShapes: GpuShapeModel,
        multiWordMatch: [Int]) -> [Int]
    {
 
        var result:[Int] = []
        
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
                    result.append(multiWordMatch[shapeIdPos])
                }
            }
        }
        return result
    }
    
    /// Does the direction of all words in both lists, are they always the same or always opposite.  And which one is it same or opposite
    public static func MatchingDirection(
        matchingWords: [Int],
        isHorizontalSource: [Bool],
        isHorizontalSearch: [Bool]) -> (Bool,Bool)
    {
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
    
    /// if you have multiple words that are matching then are the distances between each of the words the same because if they are not then its not a proper match
    /// - Parameters:
    ///   - matchingWords: Can be -1 or else it can be the position of the shape and word within the other shape
    ///   - sourceX: A list of all x positions within the source shape
    ///   - sourceY: A list of all y positions within the source shape
    ///   - searchX: A list of all x positions in the search shape
    ///   - searchY: A list of all y positions in the search shape
    ///   - matchingDirection: Are these two shapes in the same direction, then its true, else its false
    /// - Returns: Tells us if the distances are matching because if they are not matching then this is not a valid merge
    public static func MatchingDistance(
        matchingWords: [Int],
        sourceX: [UInt8],
        sourceY: [UInt8],
        searchX: [UInt8],
        searchY: [UInt8],
        matchingDirection: Bool) -> Bool
    {
        
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
}
