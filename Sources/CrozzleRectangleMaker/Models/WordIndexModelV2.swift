//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 27/8/2023.
//

import Foundation

/// `WordIndexModelV2` is used to `findMatches`between a `sourceShape` and a collection of `searchShapes` to returns  `[MergeInstructionModel]`.
///  These instructions contain a potential merge between the `sourceShape` and `searchShape`.
///
/// If there is only 1 common word between them then we find the `firstSourcePos` and `firstSearchPos`.
///
/// If there are more than 1 common word then we first check that the number of common words is not the same as the number of words in the `sourceShape` otherwise it would be a subset of the `searchShape` and so impossible to merge.
/// We check that each matching word `isSameDistance` from `firstSourcePos` in `sourceShape` as it is from `firstSearchPos` in `searchShape`.
/// We check that each matching word `isSameDirection` as direction between `firstSourcePos` and `firstSearchPos`.  So if these two are opposite direction then all other common words should be opposite direction.  And if they are same direction then the other common words should be same direction.
///
/// This struct stores an `index` of words used in  `[ShapeModel]`collection.
/// When we want to find shapes we can merge with a `sourceShape` we can `findMatches` by getting them out of the `index`
/// `findMatches` finds all matching words for all of the words found in the `sourceShape`.  So we can then go through this list and calculate how many words are common and act accordingly.
///
/// Uses its `index` to `processMatches` to find both `singleWordMatch` and `multiWordMatch`
public struct WordIndexModelV2 {
    
    public let index: [[Int]]
    
    
    /// Use this when you do not know the size of the shapes, so we can have multiple sized shapes for example
    /// For bulk loads this can take an extra 7 seconds so if all shapes are same size then use the other init
    public init(shapes: [ShapeModel],
                wordCount: Int) {
        
        var indexTemp: [[Int]] = Array(repeating: [], count: wordCount)
        
        for shapeId in 0..<shapes.count {
            for placementId in 0..<shapes[shapeId].placements.count {
                let w = Int(shapes[shapeId].placements[placementId].w);
                indexTemp[w].append(shapeId);
            }
        }
        self.index = indexTemp
    }
    
    /// Use this when you know the size of the shape
    public init(shapes: [ShapeModel],
                wordsPerShape: Int,
                wordCount: Int) {
        
        var indexTemp: [[Int]] = Array(repeating: [], count: wordCount)
        
        for shapeId in 0..<shapes.count {
            for placementId in 0..<wordsPerShape {
                let w = Int(shapes[shapeId].placements[placementId].w);
                indexTemp[w].append(shapeId);
            }
        }
        self.index = indexTemp
    }
    
    
//    public func findMatches(words: [Int],
//                            sourceShape: ShapeModel,
//                            sourceShapeId: Int,
//                            searchMin: Int,
//                            searchMax: Int,
//                            searchShapes: [ShapeModel]) -> [MergeInstructionModel] {
//        
//        // Find potential matches by using the index against all words in shape
//        let matches = findMatchUsingIndex(sourceShape: sourceShape, searchMin: searchMin, searchMax: searchMax)
//        
//        if matches.count == 0 {
//            return []
//        }
//        
//        var result: [MergeInstructionModel] = [];
//        
//        var searchShapeId = matches[0]
//        var previous = matches[0]
//        var matchCount = 1
//        for i in 1..<matches.count {
//            searchShapeId = matches[i]
//            if (previous == searchShapeId) {
//                matchCount += 1
//            } else {
//                let item = ValidateMergeCalculator.Execute(
//                    matchCount: matchCount,
//                    sourceShape: sourceShape,
//                    sourceShapeId: sourceShapeId,
//                    searchShape:searchShapes[previous],
//                    searchShapeId: previous)
//                
//                if item != nil {
//                    result.append(item!)
//                }
//                
//                previous = searchShapeId
//                matchCount = 1
//            }
//        }
//        
//        if searchShapeId != previous {
//            print("What should we do here then with previous and searchShapeId being different")
//        }
//        // Process last one, should this be previous or should it be searchShapeId?
//        let item = ValidateMergeCalculator.Execute(
//            matchCount: matchCount,
//            sourceShape: sourceShape,
//            sourceShapeId: sourceShapeId,
//            searchShape:searchShapes[searchShapeId],
//            searchShapeId: searchShapeId)
//        
//        if item != nil {
//            result.append(item!)
//        }
//        
//        return result
//    }
        
    
    public func findMatchCount(sourceShape: ShapeModel, searchShape: ShapeModel) -> Int {
        var matchCount = 0
        for sourcePlacement in sourceShape.placements {
            for searchPlacement in searchShape.placements {
                if sourcePlacement.w == searchPlacement.w {
                    matchCount += 1
                }
            }
        }
        return matchCount
    }
    
    
    public func checkMatchesForLeafs(matches: [Int], sourceShape: ShapeModel, sourceShapeId: Int, searchShapes: [ShapeModel]) -> [MergeInstructionModel] {
        var result: [MergeInstructionModel] = [];
        
        
        for searchShapeId in matches {
            
            let matchCount = findMatchCount(sourceShape: sourceShape, searchShape: searchShapes[searchShapeId])
            
            if matchCount != sourceShape.placements.count && matchCount != searchShapes[searchShapeId].placements.count {
                
                if let item = ValidateMergeCalculator.Execute(
                    matchCount: matchCount,
                    sourceShape: sourceShape,
                    sourceShapeId: sourceShapeId,
                    searchShape:searchShapes[searchShapeId],
                    searchShapeId: searchShapeId) 
                {
                    result.append(item)
                }
            }
        }
        
        return result
    }
    
    public func checkMatches(matches: [Int], sourceShape: ShapeModel, sourceShapeId: Int, searchShapes: [ShapeModel]) -> [MergeInstructionModel] {
        var result: [MergeInstructionModel] = [];
        
        var searchShapeId = matches[0]
        var previous = matches[0]
        var matchCount = 1
        for i in 1..<matches.count {
            searchShapeId = matches[i]
            
            if (previous == searchShapeId) {
                matchCount += 1
            } else {
                let item = ValidateMergeCalculator.Execute(
                    matchCount: matchCount,
                    sourceShape: sourceShape,
                    sourceShapeId: sourceShapeId,
                    searchShape:searchShapes[previous],
                    searchShapeId: previous)
                
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
        let item = ValidateMergeCalculator.Execute(
            matchCount: matchCount,
            sourceShape: sourceShape,
            sourceShapeId: sourceShapeId,
            searchShape:searchShapes[searchShapeId],
            searchShapeId: searchShapeId)
        
        if item != nil {
            result.append(item!)
        }
        
        return result
    }
    
    
    public func findMatches(containingWords: [Int],
                            shapesToExclude: [Int],
                            sourceShape: ShapeModel,
                            sourceShapeId: Int,
                            searchShapes: [ShapeModel]) -> [MergeInstructionModel] {
        
        // Find potential matches by using the index against all words in shape
        let matches = findMatchUsingIndex(words: containingWords, shapesToExclude: shapesToExclude)
        
        if matches.count == 0 {
            return []
        }
        
        return checkMatchesForLeafs(matches: matches, sourceShape: sourceShape, sourceShapeId: sourceShapeId, searchShapes: searchShapes)
        
    }
    
    public func findMatches(sourceShape: ShapeModel,
                            sourceShapeId: Int,
                            searchMin: Int,
                            searchMax: Int,
                            searchShapes: [ShapeModel]) -> [MergeInstructionModel] {
        
        // Find potential matches by using the index against all words in shape
        let matches = findMatchUsingIndex(sourceShape: sourceShape, searchMin: searchMin, searchMax: searchMax)
        
        if matches.count == 0 {
            return []
        }
        
        return checkMatches(matches: matches, sourceShape: sourceShape, sourceShapeId: sourceShapeId, searchShapes: searchShapes)
        
    }
    
//    public static func processMatches(matchCount: Int,
//                                sourceShape: ShapeModel,
//                                sourceShapeId: Int,
//                                searchShape: ShapeModel,
//                                searchShapeId:Int) -> MergeInstructionModel? {
//        
//        // We only have 1 match
//        if (matchCount == 1) {
//            let match = singleWordMatch(
//                sourceShape: sourceShape,
//                sourceShapeId: sourceShapeId,
//                searchShape: searchShape,
//                searchShapeId: searchShapeId)
//            
//            return match
//            
//        } else if (matchCount > 1) {
//            
//            // We have more than one match
//            if (matchCount < sourceShape.placements.count) {
//                
//                let multiWordMatch = multiWordMatch(
//                    sourceShape: sourceShape,
//                    sourceShapeId: sourceShapeId,
//                    searchShape: searchShape,
//                    searchShapeId: searchShapeId,
//                    matchingWordCount: matchCount)
//                
//                return multiWordMatch
//            } else {
//                return nil
//            }
//        }
//        return nil
//        
//    }


    // While we are here lets see if they are the same orientation
    private static func isSameDirection(firstSourcePos: Int,
                               firstSearchPos: Int,
                               matches:[Int],
                               firstIsFlipped: Bool,
                               sourceShape: ShapeModel,
                               searchShape: ShapeModel) -> Bool {
        
        for sourcePos in (firstSourcePos + 1)..<matches.count {
            let searchPos = matches[sourcePos]
            if searchPos != -1 {
                
                let isFlipped = (sourceShape.placements[sourcePos].z != searchShape.placements[searchPos].z)
                if firstIsFlipped != isFlipped {
                    return false
                }
            }
        }
        return true
    }
    
    
    
    
    
    
    
    
    
    
    /// Is there a placement in the searchShape that has the same word as what we are looking for
    /// if so then what is the word position within the shape
    private static func MatchingPlacementPosition(searchShape: ShapeModel,
                                           wordId: Int) -> Int {
        
        for i in 0..<searchShape.placements.count {
            if (searchShape.placements[i].w == wordId) {
                return i;
            }
        }
        return -1;
    }
    
    private static func singleWordMatch(sourceShape: ShapeModel,
                                 sourceShapeId: Int,
                                 searchShape: ShapeModel,
                                 searchShapeId: Int) -> MergeInstructionModel? {
        
        for sourcePos in 0..<sourceShape.placements.count {
            
            /// Tells us the location of the word matching with the current word or else -1
            let searchPos = WordIndexModelV2.MatchingPlacementPosition(searchShape: searchShape,
                                                      wordId: Int(sourceShape.placements[sourcePos].w))
            
            if (searchPos != -1) {
                let flipped = sourceShape.placements[sourcePos].z != searchShape.placements[searchPos].z;
                
                return MergeInstructionModel(sourceShapeId: sourceShapeId,
                                             searchShapeId: searchShapeId,
                                             matchingWordCount: 1,
                                             firstSourcePos: UInt8(sourcePos),
                                             firstSearchPos: UInt8(searchPos),
                                             flipped: flipped);
            }
        }
        return nil;
    }
    
    
    public static func GetMatches(sourceShape: ShapeModel, searchShape: ShapeModel) -> ([Int],Int,Int,Int) {
        
        var firstSourcePos = -1
        var firstSearchPos = -1
        var matches: [Int] = [];
        var matchingWordCount: Int = 0
        for sourcePos in 0..<sourceShape.placements.count {
            
            /// Tells us the location of the word matching with the current word or else -1
            let searchPos = MatchingPlacementPosition(searchShape: searchShape,
                                                      wordId:Int(sourceShape.placements[sourcePos].w))
            matches.append(searchPos);
            
            if searchPos != -1 {
                if firstSourcePos == -1 {
                    firstSourcePos = sourcePos
                    firstSearchPos = searchPos
                }
                matchingWordCount += 1
            }
        }
        return (matches, firstSourcePos, firstSearchPos, matchingWordCount)
    }
    
    
//    private static func multiWordMatch(sourceShape: ShapeModel,
//                                          sourceShapeId: Int,
//                                          searchShape: ShapeModel,
//                                          searchShapeId: Int,
//                                          matchingWordCount: Int) -> MergeInstructionModel? {
//        
//        // If we have the smaller and larger the wrong way around then call again but this time making smaller actually smaller
//        
//        if matchingWordCount == sourceShape.placements.count || matchingWordCount == searchShape.placements.count {
//            // We have found some shape to be a subset of another shape
//            return nil
//        }
//        
//        
//        
//        let (matches, firstSourcePos, firstSearchPos, _) = WordIndexModelV2.GetMatches(sourceShape: sourceShape, searchShape: searchShape)
//        
//        let firstIsFlipped = (sourceShape.placements[firstSourcePos].z != searchShape.placements[firstSearchPos].z)
//        
//        let sameDirectionIsOk = isSameDirection(
//            firstSourcePos: firstSourcePos,
//            firstSearchPos: firstSearchPos,
//            matches: matches,
//            firstIsFlipped: firstIsFlipped,
//            sourceShape: sourceShape,
//            searchShape: searchShape)
//        
//        if sameDirectionIsOk == false {
//            return nil
//        }
//
//        
//        let isMatchingDistance = isSameDistance(firstSourcePos: firstSourcePos,
//                                                  firstSearchPos: firstSearchPos,
//                                                  matches: matches,
//                                                  isFlipped: firstIsFlipped,
//                                                  sourceShape:sourceShape,
//                                                  searchShape:searchShape)
//        
//        
//        if isMatchingDistance == false {
//            return nil
//        } else {
//            
//            return MergeInstructionModel(sourceShapeId: sourceShapeId,
//                                         searchShapeId: searchShapeId,
//                                         matchingWordCount: UInt8(matchingWordCount),
//                                         firstSourcePos: UInt8(firstSourcePos),
//                                         firstSearchPos: UInt8(firstSearchPos),
//                                         flipped: firstIsFlipped)
//        }
//    }
    
    
    /// We go through each word and build up a list of shapes that contain the same words as the shape we are looking through
    private func findMatchUsingIndex(sourceShape: ShapeModel,
                                     searchMin: Int,
                                     searchMax: Int) -> [Int] {
        
        var matches: [Int] = [];
        for sourcePos in 0..<sourceShape.placements.count {
            let w = Int(sourceShape.placements[sourcePos].w);
            
            matches += self.index[w]
        }
        
        // Remove items out of score
        matches = matches.filter {$0 >= searchMin || $0 <= searchMax}
        
        matches.sort()
        
        return matches;
    }
    
    private func findMatchUsingIndex(words: [Int], shapesToExclude: [Int]) -> [Int] {
        
        var matches: [Int] = [];
        for w in words {
            matches += self.index[w]
        }
        
        // This will remove any duplicates
        let matchesAsSet = Set(matches)
        
        let shapesToExcludeSet = Set(shapesToExclude)
        
        matches = Array(matchesAsSet.subtracting(shapesToExcludeSet))
        
        matches.sort()
        
        return matches;
    }
//    
//    
//    private static func isSameDistance(firstSourcePos: Int,
//                                  firstSearchPos: Int,
//                                  matches: [Int],
//                                  isFlipped: Bool,
//                                  sourceShape: ShapeModel,
//                                  searchShape: ShapeModel) -> Bool {
//    
//        /// How could the first match be the same
//        let sourceX = Int(sourceShape.placements[firstSourcePos].x)
//        let sourceY = Int(sourceShape.placements[firstSourcePos].y)
//        
//        let searchX = Int(searchShape.placements[firstSearchPos].x)
//        let searchY = Int(searchShape.placements[firstSearchPos].y)
//        
//        
//        for sourcePos in (firstSourcePos+1)..<matches.count {
//            //for i in (firstMatch+1)..<matchingWords.count {
//            let searchPos = matches[sourcePos]
//            
//            if (searchPos != -1) {
//                let sourceX_diff = sourceX - Int(sourceShape.placements[sourcePos].x)
//                let sourceY_diff = sourceY - Int(sourceShape.placements[sourcePos].y)
//                
//                let searchX_diff = searchX - Int(searchShape.placements[searchPos].x)
//                let searchY_diff = searchY - Int(searchShape.placements[searchPos].y)
//                
//                if (isFlipped) {
//                    if (sourceX_diff != searchY_diff || sourceY_diff != searchX_diff) {
//                        return false
//                    }
//                } else {
//                    if (sourceX_diff != searchX_diff || sourceY_diff != searchY_diff) {
//                        return false
//                    }
//                }
//            }
//        }
//        // We have passed all the distance checks
//        return true
//    }
//    
    
    
    // Finds all matches in the source shape and search shape and includes word count.  Maybe we dont need the word count?
//    public func findMatches(sourceShapes: [ShapeModel],
//                            sourceShapeId: Int,
//                            searchMin: Int,
//                            searchMax: Int,
//                            searchShapes: [ShapeModel]) -> [PotentialMatchModel] {
//        
//        var result:[PotentialMatchModel] = []
//        
//        for sourceShapeId in 0..<sourceShapes.count {
//            // Find potential matches by using the index against all words in shape
//            let matches = findMatchUsingIndex(sourceShape: sourceShapes[sourceShapeId], searchMin: searchMin, searchMax: searchMax)
//            
//            var searchShapeId = matches[0]
//            let previous = matches[0]
//            var matchCount = 1
//            
//            for i in 1..<matches.count {
//                searchShapeId = matches[i]
//                if (previous == searchShapeId) {
//                    matchCount += 1
//                } else {
//                    result.append(PotentialMatchModel(sourceShapeId: sourceShapeId, searchShapeId: searchShapeId, matchingWordCount: UInt8(matchCount)))
//                }
//            }
//        }
//        return result
//    }
}
