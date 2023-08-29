//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 27/8/2023.
//

import Foundation
/// I tried to remake the creation of MergeInstructionModel in C++ and came up with a simpler algorithm which is what we will be matching here.

public struct WordIndexModelV2 {
    
    public let index: [[Int]]
    
    
    private func Process(matchCount: Int,
                         sourceShape: ShapeModel,
                         sourceShapeId: Int,
                         searchShape: ShapeModel,
                         searchShapeId:Int) -> MergeInstructionModel? {
        // We only have 1 match
        if (matchCount == 1) {
            let match = SingleWordMatch(sourceShape: sourceShape,
                                        sourceShapeId: sourceShapeId,
                                        searchShape: searchShape,
                                        searchShapeId: searchShapeId)
            
            return match
            
        } else if (matchCount > 1) {
            
            // We have more than one match
            if (matchCount < sourceShape.placements.count) {
                
                let multiWordMatch = ValidateMultiWordMatches(sourceShape: sourceShape,
                                                              sourceShapeId: sourceShapeId,
                                                              searchShape: searchShape,
                                                              searchShapeId: searchShapeId,
                                                              matchingWordCount: matchCount)
                
                return multiWordMatch
            } else {
                return nil
            }
        }
        return nil
        
    }
    
    public func FindMatches(sourceShape: ShapeModel,
                            sourceShapeId: Int,
                            searchMin: Int,
                            searchMax: Int,
                            searchShapes: [ShapeModel]) -> [MergeInstructionModel] {
        if FeatureFlags.findMatchesType == 0 {
            return FindMatchesV1(sourceShape: sourceShape, sourceShapeId: sourceShapeId, searchMin: searchMin, searchMax: searchMax, searchShapes: searchShapes)
        } else {
            return FindMatchesV2(sourceShape: sourceShape, sourceShapeId: sourceShapeId, searchMin: searchMin, searchMax: searchMax, searchShapes: searchShapes)
        }
    }
    
    public func FindMatchesV1(sourceShape: ShapeModel,
                            sourceShapeId: Int,
                            searchMin: Int,
                            searchMax: Int,
                            searchShapes: [ShapeModel]) -> [MergeInstructionModel] {
        
        let wordsPerShape = sourceShape.placements.count;
        
        // Find potential matches by using the index against all words in shape
        let matches = FindMatch(sourceShape: sourceShape,
                                wordsPerShape: wordsPerShape,
                                searchMin: searchMin,
                                searchMax: searchMax)
        
        if matches.count == 0 {
            return []
        }
        
        var result: [MergeInstructionModel] = [];
        
        var searchShapeId = matches[0]
        var previous = matches[0]
        var matchCount = 1
        for i in 1..<matches.count {
            searchShapeId = matches[i]
            if (previous == searchShapeId) {
                matchCount += 1
            } else {
                let item = Process(matchCount: matchCount, sourceShape: sourceShape, sourceShapeId: sourceShapeId, searchShape:searchShapes[previous], searchShapeId: previous)
                if item != nil {
                    result.append(item!)
                }
                
                previous = searchShapeId
                matchCount = 1
            }
        }
        
        if searchShapeId != previous {
            print("What should we do here then with previous and searchShapeId being different")
        }
        // Process last one, should this be previous or should it be searchShapeId?
        let item = Process(matchCount: matchCount, sourceShape: sourceShape, sourceShapeId: sourceShapeId, searchShape:searchShapes[searchShapeId], searchShapeId: searchShapeId)
        if item != nil {
            result.append(item!)
        }
        
        return result
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
    
    private func SingleWordMatch(sourceShape: ShapeModel,
                                 sourceShapeId: Int,
                                 searchShape: ShapeModel,
                                 searchShapeId: Int) -> MergeInstructionModel? {
        
        assert(sourceShape.placements.count <= searchShape.placements.count, "Source Shape should always have less than or equal words as search shape")
        
        for sourcePos in 0..<sourceShape.placements.count {
            
            /// Tells us the location of the word matching with the current word or else -1
            let searchPos = MatchingPlacementPosition(searchShape: searchShape,
                                                      wordId: Int(sourceShape.placements[sourcePos].w))
            
            if (searchPos != -1) {
                let flipped = sourceShape.placements[sourcePos].z != searchShape.placements[searchPos].z;
                
                return MergeInstructionModel(sourceShapeId: sourceShapeId,
                                             searchShapeId: searchShapeId,
                                             matchingWordCount: 1,
                                             sourceMatchingWordPosition: UInt8(sourcePos),
                                             searchMatchingWordPosition: UInt8(searchPos),
                                             flipped: flipped);
            }
        }
        return nil;
    }
    
    private func GetMatches(sourceShape: ShapeModel, searchShape: ShapeModel) -> ([Int],Int) {
        
        var firstSource = -1
        var matches: [Int] = [];
        
        for i in 0..<sourceShape.placements.count {
            
            /// Tells us the location of the word matching with the current word or else -1
            let matchedId = MatchingPlacementPosition(searchShape: searchShape,
                                                      wordId:Int(sourceShape.placements[i].w))
            matches.append(matchedId);
            
            if (matchedId != -1 && firstSource == -1) {
                firstSource = i
            }
        }
        return (matches, firstSource)
    }
    
    private func GetMatchesV2(sourceShape: ShapeModel, searchShape: ShapeModel) -> ([Int],Int,Int) {
        
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
    
    private func ValidateMultiWordMatches(sourceShape: ShapeModel,
                                          sourceShapeId: Int,
                                          searchShape: ShapeModel,
                                          searchShapeId: Int,
                                          matchingWordCount: Int) -> MergeInstructionModel? {
        
        // If we have the smaller and larger the wrong way around then call again but this time making smaller actually smaller
        
        assert(sourceShape.placements.count <= searchShape.placements.count, "Source Shape should always have less than or equal words as search shape")
        
        let (matches, firstSource) = GetMatches(sourceShape: sourceShape, searchShape: searchShape)
        
        let firstSearch = matches[firstSource]
        
        let firstIsFlipped = (sourceShape.placements[firstSource].z != searchShape.placements[firstSearch].z)
        
        let sameDirectionIsOk = SameDirection(firstSource: firstSource,
                                              firstSearch: firstSearch,
                                              matches: matches,
                                              firstIsFlipped: firstIsFlipped,
                                              sourceShape: sourceShape,
                                              searchShape: searchShape)
        
        if sameDirectionIsOk == false {
            return nil
        }
        
        
        
        
        
        let isMatchingDistance = MatchingDistance(firstSource: firstSource,
                                                  firstSearch: firstSearch,
                                                  matches: matches,
                                                  isFlipped: firstIsFlipped,
                                                  sourceShape:sourceShape,
                                                  searchShape:searchShape)
        
        
        
        
        // The last thing to worry about is the distance
        
        
        if isMatchingDistance == false {
            return nil
        } else {
            
            return MergeInstructionModel(sourceShapeId: sourceShapeId,
                                         searchShapeId: searchShapeId,
                                         matchingWordCount: UInt8(matchingWordCount),
                                         sourceMatchingWordPosition: UInt8(firstSource),
                                         searchMatchingWordPosition: UInt8(firstSearch),
                                         flipped: firstIsFlipped)
        }
        
    }
    
    
    
    private func ValidateMultiWordMatchesV2(
        sourceShape: ShapeModel,
        sourceShapeId: Int,
        firstSourcePos: Int,
        searchShape: ShapeModel,
        searchShapeId: Int,
        firstSearchPos: Int,
        matches: [Int],
        matchingWordCount: Int) -> MergeInstructionModel? {
        
        // If we have the smaller and larger the wrong way around then call again but this time making smaller actually smaller
        
        
        
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
                                         sourceMatchingWordPosition: UInt8(firstSourcePos),
                                         searchMatchingWordPosition: UInt8(firstSearchPos),
                                         flipped: firstIsFlipped)
        }
    }
    
    
    
    
    /// We go through each word and build up a list of shapes that contain the same words as the shape we are looking through
    private func FindMatch(sourceShape: ShapeModel,
                           wordsPerShape: Int,
                           searchMin: Int,
                           searchMax: Int) -> [Int] {
        
        
        var matchingShapeIds: [Int] = [];
        for placementId in 0..<wordsPerShape {
            let w = Int(sourceShape.placements[placementId].w);
            
            matchingShapeIds += self.index[w]
        }
        
        RemoveItemsOutOfScope(matches: &matchingShapeIds,
                              searchMin: searchMin,
                              searchMax: searchMax);
        
        matchingShapeIds.sort()
        
        return matchingShapeIds;
    }
    
    
    
    
    private func RemoveItemsOutOfScope(matches: inout [Int],
                                       searchMin: Int,
                                       searchMax: Int) {
        
        matches = matches.filter {$0 >= searchMin || $0 <= searchMax}
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    private func MatchingDistance(firstSource: Int,
                                  firstSearch: Int,
                                  matches: [Int],
                                  isFlipped: Bool,
                                  
                                  sourceShape: ShapeModel,
                                  searchShape: ShapeModel) -> Bool {
        
//        var sourceShape = sourceShape
//        if isFlipped {
//            sourceShape = sourceShape.Flip()
//        }
        
        
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
    
    
    
    /// Finds the lowerest position of valid index for us to search for based on the criteria we are given
    private func FindFirstValidIndexPos(indexForWord:[Int], searchMin: Int) -> Int {
        
        for i in 0..<indexForWord.count{
            if indexForWord[i] >= searchMin {
                return i
            }
        }
        return -1
    }
    
    /// Finds the lowerest position of valid index for us to search for based on the criteria we are given
    private func FindLastValidIndexPos(indexForWord:[Int], searchMax: Int) -> Int {
        
        for i in stride(from: indexForWord.count-1, through: 0, by: -1) {
            if indexForWord[i] <= searchMax {
                return i
            }
        }
        return -1
    }
    
    private func FindValidRangeOfIndexPos(indexForWord: [Int], searchMin: Int, searchMax: Int) -> (Int,Int) {
        let lowest = FindFirstValidIndexPos(indexForWord:indexForWord, searchMin: searchMin)
        let highest = FindLastValidIndexPos(indexForWord: indexForWord, searchMax: searchMax)
        return (lowest, highest)
    }
    
    
    private func ProcessV2(wordPos: Int,
                           sourceShape: ShapeModel,
                           sourceShapeId: Int,
                           searchShape: ShapeModel,
                           searchShapeId:Int) -> MergeInstructionModel? {
        
        // We do not want to include if we have already included when we processed an earlier word
        // so we make sure that the words that came before are not in this searchShape
        // How many words are matching
        
        assert(sourceShape.placements.count <= searchShape.placements.count, "Source Shape should always have less than or equal words as search shape")
        
        
        let (matches, firstSourcePos, matchCount) = GetMatchesV2(sourceShape: sourceShape, searchShape: searchShape)
        
        if matchCount == sourceShape.placements.count {
            return nil
        }
        if firstSourcePos < wordPos {
            return nil
        }
        
        let firstSearchPos = matches[firstSourcePos]
        
        // We only have 1 match
        if (matchCount == 1) {
            let match = SingleWordMatchV2(
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
                
                let multiWordMatch = ValidateMultiWordMatchesV2(sourceShape: sourceShape,
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
    
    
    
    
    public func FindMatchesV2(sourceShape: ShapeModel,
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
            
            let (lowestIndexPos, highestIndexPos) = FindValidRangeOfIndexPos(indexForWord: self.index[wordId], searchMin: searchMin, searchMax: searchMax)
            
            if lowestIndexPos != -1 {
               
                for i in lowestIndexPos..<highestIndexPos+1 {
                    let searchShapeId = self.index[wordId][i]
                    
                    let item = ProcessV2(wordPos: wordPos, sourceShape: sourceShape, sourceShapeId: sourceShapeId, searchShape:searchShapes[searchShapeId], searchShapeId: searchShapeId)
                    if item != nil {
                        result.append(item!)
                    }
                }
            }
        }
  
        return result
    }
    
    private func SingleWordMatchV2(
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
                                     sourceMatchingWordPosition: UInt8(firstSourcePos),
                                     searchMatchingWordPosition: UInt8(firstSearchPos),
                                     flipped: flipped);
        
    }
}
