//
//  WordIndexModelV2.swift
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
    
    /// Use this when you know the size of the shape
    public init(
        shapes: [ShapeModel],
        wordsPerShape: Int,
        wordCount: Int)
    {
        self.index = ShapeIndexCalculator.CalcIndexWithWordsPerShape(
            searchShapes: shapes,
            wordCount: wordCount,
            wordsPerShape: wordsPerShape)
    }
    
    
    /// Use this when you do not know the size of the shapes, so we can have multiple sized shapes for example
    /// For bulk loads this can take an extra 7 seconds so if all shapes are same size then use the other init
    public init(
        shapes: [ShapeModel],
        wordCount: Int)
    {
        self.index = ShapeIndexCalculator.CalcIndex(
            searchShapes: shapes,
            wordCount: wordCount)
    }
    
    
    public init(
        searchShapes: [ShapeModel],
        wordCount: Int,
        gameId: Int)
    {
        let _index = ShapeIndexCalculator.CalcIndex(
            searchShapes: searchShapes,
            wordCount: wordCount)
        
        self.index = _index
    }
    
    
    public func checkMatchesForLeafs(
        matches: [Int],
        sourceShape: ShapeModel,
        sourceShapeId: Int,
        searchShapes: [ShapeModel]) -> [MergeInstructionModel]
    {
        var result: [MergeInstructionModel] = [];
        
        for searchShapeId in matches {
            
            let matchCount = findMatchCount(
                sourceShape: sourceShape,
                searchShape: searchShapes[searchShapeId])
            
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
       
    
    public func findMatchCount(
        sourceShape: ShapeModel,
        searchShape: ShapeModel) -> Int
    {
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
    
    public func checkMatchesAsync(
        matches: [Int],
        sourceShape: ShapeModel,
        sourceShapeId: Int,
        searchShapes: [ShapeModel]) async -> [MergeInstructionModel]
    {
        var result: [Int: MergeInstructionModel] = [:]
        
        await withTaskGroup(of: (Int, MergeInstructionModel?).self) {group in
            for matchId in 0..<matches.count {
                group.addTask {
                    
                    let matchCount = findMatchCount(sourceShape: sourceShape, searchShape: searchShapes[matches[matchId]])
                    
                    return (matchId, await ValidateMergeCalculator.ExecuteAsync(
                        matchCount: matchCount,
                        sourceShape: sourceShape,
                        sourceShapeId: sourceShapeId,
                        searchShape: searchShapes[matches[matchId]],
                        searchShapeId: matches[matchId]))
                }
            }
            for await (matchId, instruction) in group {
                if instruction != nil {
                    result[matchId] = instruction!
                }
            }
        }
        
        let sortedDictionary = result.sorted() {$0.key < $1.key}
        var finalResult: [MergeInstructionModel] = []
        for item in sortedDictionary {
            finalResult.append(item.value)
        }
        return finalResult
        
    }
    
    public func checkMatches(
        matches: [Int],
        sourceShape: ShapeModel,
        sourceShapeId: Int,
        searchShapes: [ShapeModel]) -> [MergeInstructionModel]
    {
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
    
    
    public func findMatches(
        containingWords: [Int],
        shapesToExclude: [Int],
        sourceShape: ShapeModel,
        sourceShapeId: Int,
        searchShapes: [ShapeModel]) -> [MergeInstructionModel]
    {
        
        // Find potential matches by using the index against all words in shape
        let matches = findMatchUsingIndex(words: containingWords, shapesToExclude: shapesToExclude)
        
        if matches.count == 0 {
            return []
        }
        
        return checkMatchesForLeafs(
            matches: matches,
            sourceShape: sourceShape,
            sourceShapeId: sourceShapeId,
            searchShapes: searchShapes)
    }
    
    
    public func findMatches(
        sourceShape: ShapeModel,
        sourceShapeId: Int,
        searchMin: Int,
        searchMax: Int,
        searchShapes: [ShapeModel]) -> [MergeInstructionModel]
    {
        
        // Find potential matches by using the index against all words in shape
        let matches = findMatchUsingIndex(
            sourceShape: sourceShape,
            searchMin: searchMin,
            searchMax: searchMax)
        
        if matches.count == 0 {
            return []
        }
        
        return checkMatches(
            matches: matches,
            sourceShape: sourceShape,
            sourceShapeId: sourceShapeId,
            searchShapes: searchShapes)
    }

    public func findMatchesAsync(
        sourceShape: ShapeModel,
        sourceShapeId: Int,
        searchShapes: [ShapeModel]) async -> [MergeInstructionModel]
    {
        // Find potential matches by using the index against all words in shape
        let matches = findMatchUsingIndex(sourceShape: sourceShape)
        
        if matches.count == 0 {
            return []
        }
        
        return await checkMatchesAsync(
            matches: matches,
            sourceShape: sourceShape,
            sourceShapeId: sourceShapeId,
            searchShapes: searchShapes)
    }
    
    public func findMatches(
        sourceShape: ShapeModel,
        sourceShapeId: Int,
        searchShapes: [ShapeModel]) -> [MergeInstructionModel]
    {
        // Find potential matches by using the index against all words in shape
        let matches = findMatchUsingIndex(sourceShape: sourceShape)
        
        if matches.count == 0 {
            return []
        }
        
        return checkMatches(
            matches: matches,
            sourceShape: sourceShape,
            sourceShapeId: sourceShapeId,
            searchShapes: searchShapes)
    }
    
    /// We go through each word and build up a list of shapes that contain the same words as the shape we are looking through
    private func findMatchUsingIndex(
        sourceShape: ShapeModel,
        searchMin: Int,
        searchMax: Int) -> [Int] 
    {
        
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
    
    
    private func findMatchUsingIndex(sourceShape: ShapeModel) -> [Int]
    {
        var matches: [Int] = [];
        
        for sourcePos in 0..<sourceShape.placements.count {
            
            let w = Int(sourceShape.placements[sourcePos].w)
                
            matches += self.index[w]
        }
        
        // Remove items out of score
        matches.sort()
        
        return matches;
    }
    
    private func findMatchUsingIndex(
        words: [Int],
        shapesToExclude: [Int]) -> [Int] {
        
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
}
