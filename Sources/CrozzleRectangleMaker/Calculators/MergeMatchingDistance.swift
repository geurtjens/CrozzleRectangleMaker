//
//  MergeMatchingDistance.swift
//  
//
//  Created by Michael Geurtjens on 30/7/2023.
//

import Foundation
public class MergeMatchingDistance {
    
    
    public static func MatchingDistance(matches: [WordIndexResultModel], matchingOrientation: Bool, sourceShapes: GpuShapeModel, sourceShapeId: Int, searchShapes: GpuShapeModel, searchShapeId: Int) -> Bool {
        
        let sourceBase = sourceShapeId * sourceShapes.stride
        let searchBase = searchShapeId * searchShapes.stride

        let sourceFirstPos = sourceBase + Int(matches[0].sourcePos)
        let sourceFirstX = sourceShapes.x[sourceFirstPos]
        let sourceFirstY = sourceShapes.y[sourceFirstPos]
        
        let searchFirstPos = searchBase + Int(matches[0].searchPos)
        let searchFirstX = searchShapes.x[searchFirstPos]
        let searchFirstY = searchShapes.y[searchFirstPos]
        
        for i in 1..<matches.count {
            
            let sourceComparePos = sourceBase + Int(matches[i].sourcePos)
            let sourceCompareX = sourceShapes.x[sourceComparePos]
            let sourceCompareY = sourceShapes.y[sourceComparePos]
            
            let searchComparePos = searchBase + Int(matches[i].searchPos)
            let searchCompareX = searchShapes.x[searchComparePos]
            let searchCompareY = searchShapes.y[searchComparePos]
           
            let distanceSourceX = sourceFirstX - sourceCompareX
            let distanceSourceY = sourceFirstY - sourceCompareY
            
            let distanceSearchX = searchFirstX - searchCompareX
            let distanceSearchY = searchFirstY - searchCompareY
                    
            if matchingOrientation == true && (distanceSourceX != distanceSearchX || distanceSourceY != distanceSearchY) {
                    return false
            } else if matchingOrientation == false && (distanceSourceX != distanceSearchY || distanceSourceY != distanceSearchX) {
                    return false
            }
        }
        return true
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
}
