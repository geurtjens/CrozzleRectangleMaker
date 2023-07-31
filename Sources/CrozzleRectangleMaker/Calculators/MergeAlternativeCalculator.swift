//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 31/5/2023.
//

import Foundation
public class MergeAlternativeCalculator {
    /// When merging two shapes, return the placements for the second shape that have words that are not in the first shape
    public static func GetPlacementsForSearchShape(sourceShapes: [ShapeModel], searchShapes: [ShapeModel], instruction: MergeInstructionModel) -> [PlacementModel] {
        
        let sourceShape = sourceShapes[instruction.sourceShapeId]
        let searchShape = searchShapes[instruction.searchShapeId]
        
        let words: [UInt8] = sourceShape.getWords()
        
        var result:[PlacementModel] = []
        for placement in searchShape.placements {
            if words.contains(placement.w) == false {
                result.append(placement)
            }
        }
        
        return result
    }
    
    /// if you have multiple words that are matching then are the distances between each of the words the same because if they are not then its not a proper match
    public static func MatchingDistance(matchingWords: [Int], sourceShape: ShapeModel, searchShape: ShapeModel, matchingDirection: Bool) -> Bool {
        
        // the matchingWords are a set of numbers that when -1 means that there is no match
        
        let noMatch = -1
        
        
        // let find the first matching word
        var firstSourcePos = -1
        var firstSearchPos = -1
        for i in 0..<matchingWords.count {
            if matchingWords[i] != noMatch {
                firstSourcePos = i
                firstSearchPos = matchingWords[i]
                break
            }
        }
        let startingSource = sourceShape.placements[firstSourcePos]
        let startingSearch = searchShape.placements[firstSearchPos]
        
        
        
        for i in (firstSourcePos+1)..<matchingWords.count {
            if matchingWords[i] != noMatch {
                let source = sourceShape.placements[i]
                let search = searchShape.placements[matchingWords[i]]
                
                let distanceSourceX = startingSource.x - source.x
                let distanceSourceY = startingSource.y - source.y
                
                let distanceSearchX = startingSearch.x - search.x
                let distanceSearchY = startingSearch.y - search.y
                
                if matchingDirection {
                    if distanceSourceX != distanceSearchX {
                        return false
                    }
                    
                    if distanceSourceY != distanceSearchY {
                        return false
                    }
                } else {
                    if distanceSourceX != distanceSearchY {
                        return false
                    }
                    
                    if distanceSourceY != distanceSearchX {
                        return false
                    }
                }
            }
        }
        
        return true
    }
}
