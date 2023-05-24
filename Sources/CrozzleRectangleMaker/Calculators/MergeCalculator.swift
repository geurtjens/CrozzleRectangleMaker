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
    
    public static func Execute(gpuShapeModel: GpuShapeModel, searchMax: Int, shapePosition: Int) -> [Int] {
        
        let searchSpaceSize = searchMax - (shapePosition + 1)
        
        let (wordId, isHorizontal, x, y) = SearchFor(gpuShapeModel: gpuShapeModel, shapePosition: shapePosition)
        
        let wordIdList = gpuShapeModel.wordId
        let isHorizontalList = gpuShapeModel.isHorizontal
        
        let stride = gpuShapeModel.wordCount
        
        var searchSpace: [Bool] = Array(repeating: false, count: searchSpaceSize)
        var matchingWords: [Int] = Array(repeating: -1, count: stride)
        var unmatchingWords: [Int] = Array(repeating: -1, count: stride)
        
        for shapeId in (shapePosition+1)..<searchMax {
            
            let startPos = shapeId * stride
            
            var j = 0
            var k = 0
            var matchingCount = 0

            // Clear the matching words
            for i in 0..<stride {
                matchingWords[i] = -1
                unmatchingWords[i] = -1
            }
            
            
            while j < stride && k < stride {
                if wordId[j] == wordIdList[startPos + k] {
                    matchingCount += 1
                    matchingWords[j] = startPos + k
                    j += 1
                } else if wordId[j] < wordIdList[startPos + k] {
                    j += 1
                } else {
                    k += 1
                }
            }
            // We want to calculate unmatching words also so that we can get their lengths and see if they overwrite our words in the location
            for i in 0..<stride {
                if matchingWords[i] == -1 {
                    unmatchingWords[i] = startPos + i
                } else {
                    unmatchingWords[i] = -1
                }
            }
            
            // Lets investigate the unmatching here and try it out on the faster thing which is edges
            
            
            
            if matchingCount == 1 {
                // We will let this pass as a single word can connect to another single word
                searchSpace[shapeId - (shapePosition + 1)] = true
            }
            // If there are more than 1 word matching then do these words have matching direction
            else if matchingCount > 1 && matchingCount < stride &&
                        MatchingDirection(
                            matchingWords: matchingWords,
                            isHorizontal: isHorizontal,
                            isHorizontalList: isHorizontalList) &&
                        MatchingDistance(
                            matchingWords: matchingWords,
                            x: x,
                            y: y,
                            xList: gpuShapeModel.x,
                            yList: gpuShapeModel.y)

            {
                searchSpace[shapeId - (shapePosition + 1)] = true
            }
            
        }
        
        // So lets count the number of true in the
        let matchCount = searchSpace.filter{ $0 }.count
        
        var matches:[Int] = Array(repeating:-1, count:matchCount)
        
        var matchIndex = 0
        for i in 0..<searchSpaceSize {
            if searchSpace[i] {
                matches[matchIndex] = i + shapePosition + 1
                matchIndex += 1
            }
        }
        return matches
    }
    

    
    
    public static func SearchFor(gpuShapeModel: GpuShapeModel, shapePosition: Int) -> ([UInt8], [Bool], [UInt8], [UInt8]){
        
        var wordId: [UInt8] = []
        var isHorizontal: [Bool] = []
        var x: [UInt8] = []
        var y: [UInt8] = []
        
        let startPos = shapePosition * gpuShapeModel.wordCount
        
        for i in 0..<gpuShapeModel.wordCount {
            let j = startPos + i
            wordId.append(gpuShapeModel.wordId[j])
            isHorizontal.append(gpuShapeModel.isHorizontal[j])
            x.append(gpuShapeModel.x[j])
            y.append(gpuShapeModel.y[j])
        }
        return (wordId, isHorizontal, x, y)
    }
}
