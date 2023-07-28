//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 28/7/2023.
//

import Foundation
public class MatchCommonWordsCalculator {
    
    
    /// Search for shapes that have common words with the particular shape that we are trying to merge with
    /// - Parameters:
    ///   - sourceShapes: A list of shapes from which we extract details of the shape that we are going to try to merge with all possible shapes in searchableShapes
    ///   - sourceShapeId: The actual shape that we will be referencing and endevouring to match with
    ///   - searchableShapes: The total number of shapes that we might be able to merge with
    ///   - searchWordIndex: an array of words each with an array of shape positions that have that word in the shape.  If there are 91 words then it will contain 91 items and each item is an array of locations where the word appears.  So the array position 0 is for word zero and array position 90 for the last word.
    ///   - searchMin: lower limit of what shapes to start to try to merge with from the search shapes
    ///   - searchMax: upper limit of what shapes to try merge with from the search shapes
    /// - Returns: A list of shapes that combine with the source shape.  There is the list that tells how many words are matching and another list of one word matches
    public static func execute(
        sourceShapes: GpuShapeModel,
        sourceShapeId: Int,
        searchWordIndex: [[Int]],
        searchMin: Int,
        searchMax: Int) -> ([Int],[Int])
    {
        
        // First let us find shapes that have the same words in them
        let matchingShapes = findShapesContainingCommonWords(
            sourceShapes: sourceShapes,
            sourceShapeId: sourceShapeId,
            searchWordIndex: searchWordIndex,
            searchMin: searchMin,
            searchMax: searchMax)
        
        
        // So now we can work out how many words there are that are matching
        let (multiWordMatch,singleWordMatch) = countOfWordsInShapes(
            sourceShapeId: sourceShapeId,
            matchingShapes: matchingShapes,
            sourceStride: sourceShapes.stride)
        
        return (multiWordMatch, singleWordMatch)
    }
    
    public static func execute(
        matchingWordCount: Int,
        sourceShapes: GpuShapeModel,
        sourceShapeId: Int,
        searchWordIndex: [[Int]],
        searchMin: Int,
        searchMax: Int) -> ([Int],[Int])
    {
        
        // First let us find shapes that have the same words in them
        let matchingShapes = findShapesContainingCommonWords(sourceShapes: sourceShapes, sourceShapeId: sourceShapeId, searchWordIndex: searchWordIndex, searchMin: searchMin, searchMax: searchMax)
        
        
        // So now we can work out how many words there are that are matching
        let (multiWordMatch,singleWordMatch) = countOfWordsInShapes(
            matchingWordCount: matchingWordCount,
            sourceShapeId: sourceShapeId,
            matchingShapes: matchingShapes,
            sourceStride: sourceShapes.stride)
        
        return (multiWordMatch, singleWordMatch)
    }
    
    
    /// Find location of shapes that contain words that match with source shape
    /// - Parameters:
    ///   - sourceShapes: source of shapes we will merge
    ///   - sourceShapeId: location of source shape that we will merge
    ///   - searchWordIndex: identifies which shapes use each word in the search set of shapes.  Index has a list of shape locations for each word
    ///   - searchMin: the first shape we will try to merge with
    ///   - searchMax: the last shape we will try to merge with
    /// - Returns: index to shapes that contain the same words
    public static func findShapesContainingCommonWords(
        sourceShapes: GpuShapeModel,
        sourceShapeId: Int,
        searchWordIndex: [[Int]],
        searchMin: Int,
        searchMax: Int) -> [Int]
    {
        var shapesWithWords:[Int] = []
        let startPos = sourceShapeId * sourceShapes.stride
        for i in 0..<sourceShapes.stride {
            let pos = startPos + i
            let wordId = Int(sourceShapes.wordId[pos])
            let shapesWithThatWordId = searchWordIndex[wordId]
            if shapesWithThatWordId.count > 0 {
                shapesWithWords += shapesWithThatWordId
            }
        }

        shapesWithWords = shapesWithWords.filter { $0 >= searchMin && $0 <= searchMax}
        
        shapesWithWords.sort()
        return shapesWithWords
    }
    
    /// This version excludes those shapes that do not have the number of matching words that we are looking for
    public static func countOfWordsInShapes(
        matchingWordCount: Int,
        sourceShapeId: Int,
        matchingShapes: [Int],
        sourceStride: Int) -> ([Int],[Int])
    {
        if matchingShapes.count == 0 {
            return ([],[])
        }
        
        var multiWordMatch:[Int] = []
        
        var singleWordMatch: [Int] = []
        
        let dictionary = Dictionary(grouping: matchingShapes, by: { $0} )

        for item in dictionary {
            if item.value.count == 1 && matchingWordCount == 1{
                singleWordMatch.append(item.key)
            } else {
                if item.value.count < sourceStride && item.value.count == matchingWordCount {
                    // If matching word count == source stride then the shape would be a subset of the other and that is not what we want so we exclude it here
                    multiWordMatch.append(item.key)
                }
            }
        }
        return (multiWordMatch,singleWordMatch)
    }
    
    
    public static func countOfWordsInShapes(
        sourceShapeId: Int,
        matchingShapes: [Int],
        sourceStride: Int) -> ([Int],[Int])
    {
        if matchingShapes.count == 0 {
            return ([],[])
        }
        
        var multiWordMatch:[Int] = []
        
        var singleWordMatch: [Int] = []
        
        let dictionary = Dictionary(grouping: matchingShapes, by: { $0} )

        for item in dictionary {
            if item.value.count == 1 {
                singleWordMatch.append(item.key)
            } else {
                if item.value.count < sourceStride {
                    // If matching word count == source stride then the shape would be a subset of the other and that is not what we want so we exclude it here
                    multiWordMatch.append(item.key)
                }
            }
        }
        return (multiWordMatch, singleWordMatch)
    }
}
