//
//  MergeCalculator.swift
//  
//
//  Created by Michael Geurtjens on 24/5/2023.
//

import Foundation
/// Merges two shapes together
public class MatchingWordsCalculator {
    
    
    /// Get merge instructions for when we have two different lists of shapes
    /// - Parameters:
    ///   - source: The shapes with the smaller number of words
    ///   - sourceShapeId: The actual shape id from the source shapes that we want the instructions for
    ///   - search: Shapes with the larger number of words that we are trying to find a match with the source shape
    ///   - searchWordIndex: An index with an entry for each word id and within that entry is all shapes that can connect with it from the search shapes
    /// - Returns: Details about two shapes that will probably merge together
    public static func GetMergeInstructions(sourceShapes: GpuShapeModel, sourceShapeId: Int, searchShapes: GpuShapeModel, searchWordIndex:[[Int]], searchMax: Int) -> [MergeInstructionModel]{
        let matches: [Int] = ExecuteOne(
            sourceShapes: sourceShapes,
            sourceShapeId: sourceShapeId,
            searchShapes: searchShapes,
            searchWordIndex: searchWordIndex,
            searchMin: 0,
            searchMax: searchMax)
        
        let instructions = getMergeInstructions(
            sourceShapes: sourceShapes,
            sourceShapeId: sourceShapeId,
            searchShapes: searchShapes,
            matches: matches)
        
        return instructions
    }
    
    /// Get merge instructions for when we are merging with the same list of shapes.  Merge instructions happens only for shapes that are after the source shape id
    /// - Parameters:
    ///   - source: Shapes that we are trying to find intelligent sounding merges
    ///   - sourceShapeId: The location within the source array that we are searching
    ///   - sourceWordIndex: An index containing the location of what shapes contain what word.
    /// - Returns: Details about two shapes in the same set of shapes that we probably merge together
    public static func GetMergeInstructions(
        sourceShapes: GpuShapeModel,
        sourceShapeId: Int,
        sourceWordIndex:[[Int]],
        searchMax: Int) -> [MergeInstructionModel]
    {
        let matches: [Int] = ExecuteOne(
            sourceShapes: sourceShapes,
            sourceShapeId: sourceShapeId,
            searchShapes: sourceShapes,
            searchWordIndex: sourceWordIndex,
            searchMin: sourceShapeId+1, // We are searching for everything after the one we are starting with
            searchMax: searchMax)
        
        let instructions = getMergeInstructions(
            sourceShapes: sourceShapes,
            sourceShapeId: sourceShapeId,
            searchShapes: sourceShapes,
            matches: matches)
        
        return instructions
    }
    
    
    public static func ExecuteOne(
        sourceShapes: GpuShapeModel,
        sourceShapeId: Int,
        searchShapes: GpuShapeModel,
        searchWordIndex: [[Int]],
        searchMin: Int,
        searchMax: Int) -> [Int]
    {
        let (multiWordMatch, singleWordMatch) = MatchCommonWordsCalculator.execute(
            sourceShapes: sourceShapes,
            sourceShapeId: sourceShapeId,
            searchWordIndex: searchWordIndex,
            searchMin: searchMin,
            searchMax: searchMax
        )
        
        let (wordId, isHorizontal, x, y) = sourceShapes.getItem(shapePosition: sourceShapeId)
        
        let validatedMultiWordMatch = MultiWordMatchCalculator.ValidateMultiWordMatches(
            sourceShapeId: sourceShapeId,
            wordId: wordId,
            isHorizontal: isHorizontal,
            x: x,
            y: y,
            searchShapes: searchShapes,
            multiWordMatch: multiWordMatch)
        
        let result = singleWordMatch + validatedMultiWordMatch
        
        return result
    }
    
    
    public static func ExecuteOne(
        matchingWordCount: Int,
        sourceShapes: GpuShapeModel,
        sourceShapeId: Int,
        searchShapes: GpuShapeModel,
        searchWordIndex: [[Int]],
        searchMin: Int,
        searchMax: Int) -> [Int]
    {
        let (multiWordMatch, singleWordMatch) = MatchCommonWordsCalculator.execute(
            matchingWordCount: matchingWordCount,
            sourceShapes: sourceShapes,
            sourceShapeId: sourceShapeId,
            searchWordIndex: searchWordIndex,
            searchMin: searchMin,
            searchMax: searchMax
        )
        
        let (wordId, isHorizontal, x, y) = sourceShapes.getItem(shapePosition: sourceShapeId)
        
        let validatedMultiWordMatch = MultiWordMatchCalculator.ValidateMultiWordMatches(
            sourceShapeId: sourceShapeId,
            wordId: wordId,
            isHorizontal: isHorizontal,
            x: x,
            y: y,
            searchShapes: searchShapes,
            multiWordMatch: multiWordMatch)
        
        let result = singleWordMatch + validatedMultiWordMatch
        
        return result
    }
    
    /// creates the merge instructions that we can then use to derive the merges
    public static func getMergeInstructions(
        sourceShapes: GpuShapeModel,
        sourceShapeId: Int,
        searchShapes: GpuShapeModel,
        matches: [Int]) -> [MergeInstructionModel]
    {
        
        let strideSource = sourceShapes.stride
        let strideSearch = searchShapes.stride
        
        var result: [MergeInstructionModel] = []
        
        
        for searchShapeId in matches {
            let sourceStartPos = sourceShapeId * strideSource
            let searchStartPos = searchShapeId * strideSearch
            
            // We want to find the starting position for each of them
            var i = 0
            var k = 0
            
            var sourceArray: [Int] = []
            var searchArray: [Int] = []
            while i < strideSource && k < strideSearch {
                if sourceShapes.wordId[sourceStartPos + i] == searchShapes.wordId[searchStartPos + k] {
                    sourceArray.append(sourceStartPos + 1)
                    searchArray.append(searchStartPos + k)
                } else if sourceShapes.wordId[sourceStartPos + i] < searchShapes.wordId[searchStartPos + k] {
                    i += 1
                } else {
                    k += 1
                }
            }
            
            if sourceArray.count == 0 {
                
                print("we didnt find any matching words here")
                break
            }
            
            // I am hoping now that we have the exact locations of the matching word in both structures
            let sourceIndex = sourceArray[0]
            let searchableIndex = searchArray[0]
            
            // We know if the first word is rotated
            let flipped = (sourceShapes.isHorizontal[sourceIndex] != searchShapes.isHorizontal[searchableIndex])
            
            let mergeInstruction = MergeInstructionModel(
                sourceShapeId: sourceShapeId,
                searchShapeId: searchShapeId,
                matchingWordCount: UInt8(sourceArray.count),
                sourceMatchingWordPosition: UInt8(i),
                searchMatchingWordPosition: UInt8(k),
                flipped: flipped)
                
            result.append(mergeInstruction)
        }
        return result
    }
}
