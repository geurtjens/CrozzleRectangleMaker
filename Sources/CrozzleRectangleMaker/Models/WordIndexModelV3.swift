//
//  WordIndexModelV3.swift
//  
//
//  Created by Michael Geurtjens on 30/8/2023.
//

import Foundation

/// This version is different from V2 in that it does not create an array of shape positions that incompasss all words.
/// instead it searches through each of the words one at a time and sees if we have already seen that word and if so rejects it
/// The advantage is that we do not create the index which is impossible to do on a GPU implementation
/// The disadvantage is that it takes 23 minutes and 35 seconds compared to 4 minutes and 44 seconds processing time.
/// So we have taken this out of the execution path but it remains here as an example of doing the search another way.
public struct WordIndexModelV3 {
    
    
    
    public func FindMatches(sourceShape: ShapeModel,
                            sourceShapeId: Int,
                            searchMin: Int,
                            searchMax: Int,
                            searchShapes: [ShapeModel]) -> [MergeInstructionModel] {
        return FindMatchesV3(sourceShape: sourceShape, sourceShapeId: sourceShapeId, searchMin: searchMin, searchMax:searchMax, searchShapes: searchShapes)
    }
    
    private func FindMatchesV3(sourceShape: ShapeModel,
                            sourceShapeId: Int,
                            searchMin: Int,
                            searchMax: Int,
                            searchShapes: [ShapeModel]) -> [MergeInstructionModel] {
        
        var result: [MergeInstructionModel] = [];
        
        for wordPos in 0..<sourceShape.placements.count {
            
            // The word in the shape
            let wordId = Int(sourceShape.placements[wordPos].w)
            
            /// These are all the shapes that contain the word in shape
            //let matches = self.index[wordId]
            
            let (lowestIndexPos, highestIndexPos) = FindValidRangeOfIndexPosV3(indexForWord: self.index[wordId], searchMin: searchMin, searchMax: searchMax)
            
            if lowestIndexPos != -1 {
               
                for i in lowestIndexPos..<highestIndexPos+1 {
                    let searchShapeId = self.index[wordId][i]
                    
                    let item = ProcessV3(wordPos: wordPos, sourceShape: sourceShape, sourceShapeId: sourceShapeId, searchShape:searchShapes[searchShapeId], searchShapeId: searchShapeId)
                    if item != nil {
                        result.append(item!)
                    }
                }
            }
        }
  
        return result
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    private func GetMatchesV3(sourceShape: ShapeModel, searchShape: ShapeModel) -> ([Int],Int,Int) {
        
        var firstSource = -1
        var matches: [Int] = [];
        var matchCount = 0
        for i in 0..<sourceShape.placements.count {
            
            /// Tells us the location of the word matching with the current word or else -1
            let matchedId = MatchingPlacementPosition(searchShape: searchShape,
                                                      wordId:Int(sourceShape.placements[i].w))
            matches.append(matchedId);
            
            if matchedId != -1 {
                
                if firstSource == -1 {
                    firstSource = i
                }
                matchCount += 1
            }
        }
        return (matches, firstSource, matchCount)
    }
    
    
    
    
    
    private func ValidateMultiWordMatchesV3(
        sourceShape: ShapeModel,
        sourceShapeId: Int,
        firstSourcePos: Int,
        searchShape: ShapeModel,
        searchShapeId: Int,
        firstSearchPos: Int,
        matches: [Int],
        matchingWordCount: Int) -> MergeInstructionModel? {
        
        
        let firstIsFlipped = (sourceShape.placements[firstSourcePos].z != searchShape.placements[firstSearchPos].z)
        
        let sameDirectionIsOk = SameDirection(firstSource: firstSourcePos,
                                              firstSearch: firstSearchPos,
                                              matches: matches,
                                              firstIsFlipped: firstIsFlipped,
                                              sourceShape: sourceShape,
                                              searchShape: searchShape)
        
        if sameDirectionIsOk == false {
            return nil
        }
        
        let isMatchingDistance = MatchingDistance(firstSource: firstSourcePos,
                                                  firstSearch: firstSearchPos,
                                                  matches: matches,
                                                  isFlipped: firstIsFlipped,
                                                  sourceShape:sourceShape,
                                                  searchShape:searchShape)
        if isMatchingDistance == false {
            return nil
        } else {
            
            return MergeInstructionModel(sourceShapeId: sourceShapeId,
                                         searchShapeId: searchShapeId,
                                         matchingWordCount: UInt8(matchingWordCount),
                                         firstSourcePos: UInt8(firstSourcePos),
                                         firstSearchPos: UInt8(firstSearchPos),
                                         flipped: firstIsFlipped)
        }
    }
    
    
    /// Finds the lowerest position of valid index for us to search for based on the criteria we are given
    private func FindFirstValidIndexPosV3(indexForWord:[Int], searchMin: Int) -> Int {
        
        for i in 0..<indexForWord.count{
            if indexForWord[i] >= searchMin {
                return i
            }
        }
        return -1
    }
    
    
    /// Finds the lowerest position of valid index for us to search for based on the criteria we are given
    private func FindLastValidIndexPosV3(indexForWord:[Int], searchMax: Int) -> Int {
        
        for i in stride(from: indexForWord.count-1, through: 0, by: -1) {
            if indexForWord[i] <= searchMax {
                return i
            }
        }
        return -1
    }
    
    private func FindValidRangeOfIndexPosV3(indexForWord: [Int], searchMin: Int, searchMax: Int) -> (Int,Int) {
        let lowest = FindFirstValidIndexPosV3(indexForWord:indexForWord, searchMin: searchMin)
        let highest = FindLastValidIndexPosV3(indexForWord: indexForWord, searchMax: searchMax)
        return (lowest, highest)
    }
    
    
    private func ProcessV3(wordPos: Int,
                           sourceShape: ShapeModel,
                           sourceShapeId: Int,
                           searchShape: ShapeModel,
                           searchShapeId:Int) -> MergeInstructionModel? {
        
        // We do not want to include if we have already included when we processed an earlier word
        // so we make sure that the words that came before are not in this searchShape
        // How many words are matching
        
        assert(sourceShape.placements.count <= searchShape.placements.count, "Source Shape should always have less than or equal words as search shape")
        
        let (matches, firstSourcePos, matchCount) = GetMatchesV3(sourceShape: sourceShape, searchShape: searchShape)
        
        if matchCount == sourceShape.placements.count {
            return nil
        }
        if firstSourcePos < wordPos {
            return nil
        }
        
        let firstSearchPos = matches[firstSourcePos]
        
        // We only have 1 match
        if (matchCount == 1) {
            let match = SingleWordMatchV3(
                sourceShape: sourceShape,
                sourceShapeId: sourceShapeId,
                firstSourcePos: firstSourcePos,
                matches: matches,
                searchShape: searchShape,
                searchShapeId: searchShapeId,
                firstSearchPos: firstSearchPos)
            
            return match
            
        } else if (matchCount > 1) {
            
            // We have more than one match
            if (matchCount < sourceShape.placements.count) {
                
                let multiWordMatch = ValidateMultiWordMatchesV3(
                    sourceShape: sourceShape,
                    sourceShapeId: sourceShapeId,
                    firstSourcePos: firstSourcePos,
                    searchShape: searchShape,
                    searchShapeId: searchShapeId,
                    firstSearchPos: firstSourcePos,
                    matches: matches,
                    matchingWordCount: matchCount)
                
                return multiWordMatch
            } else {
                return nil
            }
        }
        return nil
    }
    
    
    
    
    private func SingleWordMatchV3(
        sourceShape: ShapeModel,
        sourceShapeId: Int,
        firstSourcePos: Int,
        matches: [Int],
        searchShape: ShapeModel,
        searchShapeId: Int,
        firstSearchPos: Int) -> MergeInstructionModel {
        
        assert(sourceShape.placements.count <= searchShape.placements.count, "Source Shape should always have less than or equal words as search shape")
        
        let flipped = sourceShape.placements[firstSourcePos].z != searchShape.placements[firstSearchPos].z;
        
        return MergeInstructionModel(sourceShapeId: sourceShapeId,
                                     searchShapeId: searchShapeId,
                                     matchingWordCount: 1,
                                     firstSourcePos: UInt8(firstSourcePos),
                                     firstSearchPos: UInt8(firstSearchPos),
                                     flipped: flipped);
        
    }
    
    
    /// All code below is the same as WordIndexModelV2
    
    public let index: [[Int]]
    public init(shapes: [ShapeModel], wordsPerShape: Int, wordCount: Int) {
        
        var indexTemp: [[Int]] = Array(repeating: [], count: wordCount)
        
        for shapeId in 0..<shapes.count {
            for placementId in 0..<wordsPerShape {
                let w = Int(shapes[shapeId].placements[placementId].w);
                indexTemp[w].append(shapeId);
            }
        }
        self.index = indexTemp
    }
    
    
    // While we are here lets see if they are the same orientation
    private func SameDirection(firstSource: Int,
                               firstSearch: Int,
                               matches:[Int],
                               firstIsFlipped: Bool,
                               sourceShape: ShapeModel,
                               searchShape: ShapeModel) -> Bool {
         
        for sourceMatch in (firstSource + 1)..<matches.count {
            let searchMatch = matches[sourceMatch]
            if searchMatch != -1 {
                
                let isFlipped = (sourceShape.placements[sourceMatch].z != searchShape.placements[searchMatch].z)
                if firstIsFlipped != isFlipped {
                    return false
                }
            }
        }
        return true
    }
    
    
    private func MatchingDistance(firstSource: Int,
                                  firstSearch: Int,
                                  matches: [Int],
                                  isFlipped: Bool,
                                  
                                  sourceShape: ShapeModel,
                                  searchShape: ShapeModel) -> Bool {
        
        
        /// How could the first match be the same
        let sourceX = Int(sourceShape.placements[firstSource].x)
        let sourceY = Int(sourceShape.placements[firstSource].y)
        
        let searchX = Int(searchShape.placements[firstSearch].x)
        let searchY = Int(searchShape.placements[firstSearch].y)
        
        
        for sourceMatch in (firstSource+1)..<matches.count {
            //for i in (firstMatch+1)..<matchingWords.count {
            let searchMatch = matches[sourceMatch]
            
            if (searchMatch != -1) {
                let sourceX_diff = sourceX - Int(sourceShape.placements[sourceMatch].x)
                let sourceY_diff = sourceY - Int(sourceShape.placements[sourceMatch].y)
                
                let searchX_diff = searchX - Int(searchShape.placements[searchMatch].x)
                let searchY_diff = searchY - Int(searchShape.placements[searchMatch].y)
                
                if (isFlipped) {
                    if (sourceX_diff != searchY_diff || sourceY_diff != searchX_diff) {
                        return false
                    }
                } else {
                    if (sourceX_diff != searchX_diff || sourceY_diff != searchY_diff) {
                        return false
                    }
                }
            }
        }
        // We have passed all the distance checks
        return true
    }
    
    /// Is there a placement in the searchShape that has the same word as what we are looking for
    /// if so then what is the word position within the shape
    private func MatchingPlacementPosition(searchShape: ShapeModel,
                                           wordId: Int) -> Int {
        
        for i in 0..<searchShape.placements.count {
            if (searchShape.placements[i].w == wordId) {
                return i;
            }
        }
        return -1;
    }
}
