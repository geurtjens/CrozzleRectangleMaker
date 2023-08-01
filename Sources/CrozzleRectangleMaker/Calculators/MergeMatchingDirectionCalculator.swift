//
//  MergeMatchingDirectionCalculator.swift
//  
//
//  Created by Michael Geurtjens on 30/7/2023.
//

import Foundation
public class MergeMatchingDirectionCalculator {
    
    public static func firstIsFlipped(sourceShape: ShapeModel, sourcePos: Int, searchShape: ShapeModel, searchPos: Int) -> Bool {
        return sourceShape.placements[sourcePos].z == searchShape.placements[searchPos].z
    }
    
    /// Here is the matching direction calculator that uses the WordIndexResultList
    /// Does the direction of all words in both lists, are they always the same or always opposite.  And which one is it same or opposite
    public static func MatchingDirection(matches: [WordIndexResultModel], firstIsFlipped: Bool, sourceShape: ShapeModel, searchShape: ShapeModel) -> Bool {

        for i in 1..<matches.count {
            
            if firstIsFlipped != (sourceShape.placements[Int(matches[i].sourcePos)].z == searchShape.placements[Int(matches[i].searchPos)].z) {
                return false
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

}
