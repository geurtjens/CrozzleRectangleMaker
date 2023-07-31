//
//  WordIndex2Calculator.swift
//  
//
//  Created by Michael Geurtjens on 29/7/2023.
//

import Foundation
public class WordIndex2Calculator {
    
    /// We want to find all the shapes for each word so we can easily identify what shapes to look through when we merge
    public static func createWordIndex(totalWords: Int, stride: Int, shapeCount: Int, words:[UInt8]) -> [[WordIndexModel]] {
        var result: [[WordIndexModel]] = Array(repeating: [], count: totalWords)
        var i = 0
        for shapeId in 0..<shapeCount {
            for pos in 0..<stride {
                result[Int(words[i])].append(WordIndexModel(searchShape: shapeId, searchPos: UInt8(pos)))
                i += 1
            }
        }
        return result
    }
    
    
    public static func findShapesContainingCommonWords(
        sourceShapes: GpuShapeModel,
        sourceShapeId: Int,
        searchShapes: GpuShapeModel,
        searchWordIndex: [[WordIndexModel]],
        searchMin: Int,
        searchMax: Int,
        widthMax: Int,
        heightMax: Int
    ) -> [WordIndexResultList]
    {
        var result: [WordMatchModel] = []
        let startPos = sourceShapeId * sourceShapes.stride
        for i in 0..<sourceShapes.stride {
            let pos = startPos + i
            let wordId = Int(sourceShapes.wordId[pos])
            
            let shapesWithThatWordId = searchWordIndex[wordId]
            for wordIndexModel in shapesWithThatWordId {
                result.append(WordMatchModel(searchShape: wordIndexModel.searchShape, searchPos: wordIndexModel.searchPos, sourcePos: UInt8(i)))
            }
        }

        result = result.filter { $0.searchShape >= searchMin && $0.searchShape <= searchMax}
        
        let dictionary = Dictionary(grouping: result, by: { $0.searchShape } )
        
        var list: [WordIndexResultList] = []
        for item in dictionary {
            var matches: [WordIndexResultModel] = []
            for value in item.value {
                matches.append(WordIndexResultModel(searchPos: value.searchPos, sourcePos: value.sourcePos))
            }
            
            let matchingResult = createIfValid(matches: matches, sourceShapes: sourceShapes, sourceShapeId: sourceShapeId, searchShapes: searchShapes, searchShapeId: item.key, widthMax: widthMax, heightMax: heightMax)
            if matchingResult != nil {
                list.append(matchingResult!)
            }
        }

        list.sort() { $0.searchShapeId < $1.searchShapeId }
        return list
    }
    
    public static func createIfValid(matches: [WordIndexResultModel], sourceShapes: GpuShapeModel, sourceShapeId: Int, searchShapes: GpuShapeModel, searchShapeId: Int, widthMax: Int, heightMax: Int) -> WordIndexResultList? {
        
        let firstSourcePos = Int(matches[0].sourcePos)
        let firstSearchPos = Int(matches[0].searchPos)
        
        let (sizeIsValid, width, height) = MergeSizeValidation.execute(
            matches: matches,
            sourceShapes: sourceShapes,
            sourceShapeId: sourceShapeId,
            searchShapes: searchShapes,
            searchShapeId: searchShapeId,
            widthMax: widthMax,
            heightMax: heightMax
        )
        
        if sizeIsValid == false {
            return nil
        }
        
        let matchingOrientation = MergeMatchingDirectionCalculator.firstIsFlipped(
            sourceShapes: sourceShapes,
            sourceShapeId: sourceShapeId,
            sourcePos: firstSourcePos,
            searchShapes: searchShapes,
            searchShapeId: searchShapeId,
            searchPos: firstSearchPos)
        
        let directionIsValid = MergeMatchingDirectionCalculator.MatchingDirection(
            matches: matches,
            firstIsFlipped: matchingOrientation,
            sourceShapes: sourceShapes,
            sourceShapeId: sourceShapeId,
            searchShapes: searchShapes,
            searchShapeId: searchShapeId)
        
        if directionIsValid == false {
            return nil
        }
        let matchingDistance = MergeMatchingDistance.MatchingDistance(
            matches: matches,
            matchingOrientation: matchingOrientation,
            sourceShapes: sourceShapes,
            sourceShapeId: sourceShapeId,
            searchShapes: searchShapes,
            searchShapeId: searchShapeId)
        
        if matchingDistance == false {
            return nil
        }
        
        return WordIndexResultList(
            sourceShapeId: sourceShapeId,
            searchShapeId: searchShapeId,
            matchingOrientation: matchingOrientation,
            matches: matches,
            width: UInt8(width),
            height: UInt8(height))
    }
    
}
