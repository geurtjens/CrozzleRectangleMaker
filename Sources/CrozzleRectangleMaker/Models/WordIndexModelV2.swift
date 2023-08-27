//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 27/8/2023.
//

import Foundation
/// I tried to remake the creation of MergeInstructionModel in C++ and came up with a simpler algorithm which is what we will be matching here.

public struct WordIndexModelV2 {
    
    let index: [[Int]]
    
    public init(_ shapes: [ShapeModel], _ wordsPerShape: Int, _ wordCount: Int) {
        
        var indexTemp: [[Int]] = Array(repeating: [], count: wordCount)
        
        for shapeId in 0..<shapes.count {
            for placementId in 0..<wordsPerShape {
                let w = Int(shapes[shapeId].placements[placementId].w);
                indexTemp[w].append(shapeId);
            }
        }
        self.index = indexTemp
    }
    
    
    private func MatchingPlacementPosition(_ searchShape: ShapeModel,
                                          _ wordId: Int) -> Int {
        for i in 0..<searchShape.placements.count {
            if (searchShape.placements[i].w == wordId) {
                return i;
            }
        }
        return -1;
    }
    private func SingleWordMatch(_ sourceShape: ShapeModel,
                                _ sourceShapeId: Int,
                                _ searchShape: ShapeModel,
                                _ searchShapeId: Int) -> MergeInstructionModel? {
        
        assert(sourceShape.placements.count <= searchShape.placements.count, "Source Shape should always have less than or equal words as search shape")
        
        for i in 0..<sourceShape.placements.count {
            
            /// Tells us the location of the word matching with the current word or else -1
            let matchedId = MatchingPlacementPosition(searchShape, Int(sourceShape.placements[i].w));
            if (matchedId != -1) {
                let flipped = sourceShape.placements[i].z != searchShape.placements[matchedId].z;
                return MergeInstructionModel(sourceShapeId: sourceShapeId,
                                             searchShapeId: searchShapeId,
                                             matchingWordCount: 1,
                                             sourceMatchingWordPosition: UInt8(i),
                                             searchMatchingWordPosition: UInt8(matchedId),
                                             flipped: flipped);
            }
        }
        return nil;
    }
    
    private func ValidateMultiWordMatches(_ sourceShape: ShapeModel,
                                         _ sourceShapeId: Int,
                                         _ searchShape: ShapeModel,
                                         _ searchShapeId: Int,
                                         _ matchingWordCount: Int) -> MergeInstructionModel? {
        
        // If we have the smaller and larger the wrong way around then call again but this time making smaller actually smaller
        
        assert(sourceShape.placements.count <= searchShape.placements.count, "Source Shape should always have less than or equal words as search shape")
        
        
        var directionIsFlipped = false
        var firstMatchingWord = -1
        var sameOrientationForGroup = 0
        var matchingWordPosition: [Int] = [];
        for i in 0..<sourceShape.placements.count {
            
            /// Tells us the location of the word matching with the current word or else -1
            let matchedId = MatchingPlacementPosition(searchShape, Int(sourceShape.placements[i].w))
            matchingWordPosition.append(matchedId);
            
            if (matchedId != -1) {
                
                if (firstMatchingWord == -1) {
                    // If we do not have the first matching word then lets record that this one which is matching is the first matching
                    firstMatchingWord = i;
                }
                
                
                // While we are here lets see if they are the same orientation
                
                let flipped = (sourceShape.placements[i].z != searchShape.placements[matchedId].z)
                
                if (sameOrientationForGroup == 0) {
                    if (flipped) {
                        sameOrientationForGroup = -1;
                    } else {
                        sameOrientationForGroup = 1;
                    }
                } else if (flipped && sameOrientationForGroup == 1) {
                    // the first orientation was the same but this orientation is different so these shapes cannot merge
                    return nil;
                } else if (flipped == false && sameOrientationForGroup == -1) {
                    // the first orientation was opposite but this orientation is the same so these shapes cannot merge
                    return nil;
                }
                
            }
            
            
            if (sameOrientationForGroup == -1) {
                directionIsFlipped = true;
            }
            
            
        }
        
        // The last thing to worry about is the distance
        
        let isMatchingDistance = MatchingDistance(firstMatchingWord, !directionIsFlipped, matchingWordPosition, sourceShape, searchShape);
        
        if isMatchingDistance == false {
            return nil
        } else {
            let searchMatchingWordPosition = matchingWordPosition[firstMatchingWord]
            return MergeInstructionModel(sourceShapeId: sourceShapeId,
                                         searchShapeId: searchShapeId,
                                         matchingWordCount: UInt8(matchingWordCount),
                                         sourceMatchingWordPosition: UInt8(firstMatchingWord),
                                         searchMatchingWordPosition: UInt8(searchMatchingWordPosition),
                                         flipped: directionIsFlipped)
        }
        
    }
    
    
    
    
    private func FindMatch(_ sourceShape: ShapeModel,
                          _ wordsPerShape: Int,
                          _ searchMin: Int,
                          _ searchMax: Int) -> [Int] {
        
        
        var matchingShapeIds: [Int] = [];
        for placementId in 0..<wordsPerShape {
            let w = Int(sourceShape.placements[placementId].w);
            
            matchingShapeIds += self.index[w]
        }
        
        RemoveItemsOutOfScope(&matchingShapeIds, searchMin, searchMax);
        
        
        return matchingShapeIds;
    }
    
    
    
    
    private func RemoveItemsOutOfScope( _ matches: inout [Int], _ searchMin: Int, _ searchMax: Int) {
        matches = matches.filter {$0 >= searchMin || $0 <= searchMax}
    }
    
    
    
    
    
    public func FindMatches(_ sourceShape: ShapeModel,
                            _ sourceShapeId: Int,
                            _ searchMin: Int,
                            _ searchMax: Int,
                            _ searchShapes: [ShapeModel]) -> [MergeInstructionModel] {
        
        let wordsPerShape = sourceShape.placements.count;
        
        // Find potential matches by using the index against all words in shape
        var matches = FindMatch(sourceShape, wordsPerShape, searchMin, searchMax)
        
        if matches.count == 0 {
            return []
        }
        
        matches.sort()
        
        
        var result: [MergeInstructionModel] = [];

        var searchShapeId = matches[0]
        var previous = matches[0]
        var matchCount = 1
        for i in 1..<matches.count {
            searchShapeId = matches[i]
            if (previous == searchShapeId) {
                matchCount += 1
            } else {
                let item = Process(matchCount: matchCount, wordsPerShape: wordsPerShape, sourceShape: sourceShape, sourceShapeId: sourceShapeId, searchShape:searchShapes[searchShapeId], searchShapeId: searchShapeId)
                if item != nil {
                    result.append(item!)
                }
                
                previous = searchShapeId
                matchCount = 1
            }
        }
        
        
        // Process last one
        let item = Process(matchCount: matchCount, wordsPerShape: wordsPerShape, sourceShape: sourceShape, sourceShapeId: sourceShapeId, searchShape:searchShapes[searchShapeId], searchShapeId: searchShapeId)
        if item != nil {
            result.append(item!)
        }
        
        
        
        
        return result
    }
    
    
    
    
    private func Process(matchCount: Int, wordsPerShape: Int, sourceShape: ShapeModel, sourceShapeId: Int, searchShape: ShapeModel, searchShapeId:Int) -> MergeInstructionModel? {
        // We only have 1 match
        if (matchCount == 1) {
            let match = SingleWordMatch(sourceShape, sourceShapeId, searchShape, searchShapeId)
            
            return match

        } else if (matchCount > 1) {
            
            // We have more than one match
            if (matchCount < wordsPerShape) {
                
                let multiWordMatch = ValidateMultiWordMatches(sourceShape, sourceShapeId, searchShape, searchShapeId, matchCount)
                
                return multiWordMatch
            }
        }
        return nil
        
    }
    
    
    
    
    private func MatchingDistance(_ firstMatch: Int,
                                 _ directionIsSame: Bool,
                                 _ matchingWords: [Int],
                                 _ smallerShape: ShapeModel,
                                 _ largerShape: ShapeModel) -> Bool {
        
        let smallerX = Int(smallerShape.placements[firstMatch].x)
        let smallerY = Int(smallerShape.placements[firstMatch].y)
        
        let largerX = Int(largerShape.placements[firstMatch].x)
        let largerY = Int(largerShape.placements[firstMatch].y)
        
        
        for i in (firstMatch+1)..<matchingWords.count {
            //for i in (firstMatch+1)..<matchingWords.count {
            let nextMatch = matchingWords[i]
            
            if (nextMatch != -1) {
                let diffSmallerX = smallerX - Int(smallerShape.placements[i].x)
                let diffSmallerY = smallerY - Int(smallerShape.placements[i].y)
                
                let diffLargerX = largerX - Int(largerShape.placements[nextMatch].x)
                let diffLargerY = largerY - Int(largerShape.placements[nextMatch].y)
                
                if (directionIsSame) {
                    if (diffSmallerX != diffLargerX || diffSmallerY != diffLargerY) {
                        return false
                    }
                } else {
                    if (diffSmallerX != diffLargerY || diffSmallerY != diffLargerX) {
                        return false
                    }
                }
            }
        }
        // We have passed all the distance checks
        return true
    }
    
}
