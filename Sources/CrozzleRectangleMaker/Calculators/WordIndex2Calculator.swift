//
//  WordIndex2Calculator.swift
//  
//
//  Created by Michael Geurtjens on 29/7/2023.
//

import Foundation
public class WordIndex2Calculator {
    
    /// We want to find all the shapes for each word so we can easily identify what shapes to look through when we merge
    public static func createWordIndex(shapes: [ShapeModel], totalWords: Int, stride: Int) -> [[WordIndexModel]] {
        var result: [[WordIndexModel]] = Array(repeating: [], count: totalWords)

        let shapeCount = shapes.count
        for shapeId in 0..<shapeCount {
            for placementPos in 0..<stride {
                result[Int(shapes[shapeId].placements[placementPos].w)].append(WordIndexModel(searchShape: shapeId, searchPos: UInt8(placementPos)))
            }
        }
        return result
    }
    
    
    public static func getWordMatchModels(sourceShape: ShapeModel, searchIndex: [[WordIndexModel]], searchMin: Int, searchMax: Int) -> [WordMatchModel] {
        var result: [WordMatchModel] = []
        for i in 0..<sourceShape.placements.count {
            
            let w = Int(sourceShape.placements[i].w)
            
            let shapesWithThatWordId = searchIndex[w]
            for wordIndexModel in shapesWithThatWordId {
                result.append(WordMatchModel(searchShape: wordIndexModel.searchShape, searchPos: wordIndexModel.searchPos, sourcePos: UInt8(i)))
            }
        }
        
        result = result.filter { $0.searchShape >= searchMin && $0.searchShape <= searchMax}
        
        return result
    }
    
    public static func getDictionaryGroupBy(sourceShapeId: Int, wordMatchModels: [WordMatchModel]) -> [WordIndexResultItem] {
        let dictionary = Dictionary( grouping: wordMatchModels, by: { $0.searchShape } )
        
        var list: [WordIndexResultItem] = []
        for item in dictionary {
            var matches: [WordIndexResultModel] = []
            for value in item.value {
                matches.append(WordIndexResultModel(searchPos: value.searchPos, sourcePos: value.sourcePos))
            }
            list.append(WordIndexResultItem(sourceShapeId: sourceShapeId, searchShapeId: item.key, matches: matches))
        }
        list.sort { $0.searchShapeId < $1.searchShapeId }
        return list
    }
    
    public static func findShapesContainingCommonWords(
        sourceShape: ShapeModel,
        sourceShapeId: Int,
        searchShapes: [ShapeModel],
        searchWordIndex: [[WordIndexModel]],
        searchMin: Int,
        searchMax: Int,
        widthMax: Int,
        heightMax: Int) -> [WordIndexResultList]
    {
        let wordMatchModels = getWordMatchModels(
            sourceShape: sourceShape,
            searchIndex: searchWordIndex,
            searchMin: searchMin,
            searchMax: searchMax)

        let instructions = getDictionaryGroupBy(sourceShapeId: sourceShapeId, wordMatchModels: wordMatchModels)
        
        var list: [WordIndexResultList] = []
        for instruction in instructions {
        
            let matchingResult = createIfValid(
                matches: instruction.matches,
                sourceShape: sourceShape,
                searchShape: searchShapes[instruction.searchShapeId],
                sourceShapeId: sourceShapeId,
                searchShapeId: instruction.searchShapeId,
                widthMax: widthMax,
                heightMax: heightMax)
            
            if matchingResult != nil {
                list.append(matchingResult!)
            }
        }

        list.sort() { $0.searchShapeId < $1.searchShapeId }
        return list
    }
    
    public static func createIfValid(
        matches: [WordIndexResultModel],
        sourceShape: ShapeModel,
        searchShape: ShapeModel,
        sourceShapeId: Int,
        searchShapeId: Int,
        widthMax: Int,
        heightMax: Int) -> WordIndexResultList?
    {
        
        let sourceFirstPos = Int(matches[0].sourcePos)
        let searchFirstPos = Int(matches[0].searchPos)
        
        let (sizeIsValid, width, height, firstIsFlipped) = MergeSizeValidation.execute(
            sourceShape: sourceShape,
            sourcePos: sourceFirstPos,
            searchShape: searchShape,
            searchPos: searchFirstPos,
            widthMax: widthMax,
            heightMax: heightMax
        )
        
        if !sizeIsValid {
            return nil
        }
        
        let directionIsValid = MergeMatchingDirectionCalculator.MatchingDirection(
            matches: matches,
            firstIsFlipped: firstIsFlipped,
            sourceShape: sourceShape,
            searchShape: searchShape)
        
        if !directionIsValid {
            return nil
        }
        
        let matchingDistance = MergeMatchingDistance.MatchingDistance(
            matches: matches,
            matchingOrientation: firstIsFlipped,
            sourceShape: sourceShape,
            searchShape: searchShape)
        
        if !matchingDistance {
            return nil
        }

        let p1 = sourceShape.placements[sourceFirstPos]
        let p2 = searchShape.placements[searchFirstPos]

        // get the offsets and then combine the placements and make the shape like we used to
        let (x1, y1, x2, y2) = GetOffsets(p1: p1, p2: p2)
        
        
        let sourceDuplicates = matches.map { $0.sourcePos }
        
        // We will remove the items from source as this will always be the smallest number of them
        
        
        // This validation step should be that it makes a valid shape by placing the placements into a grid and seeing what happens
        
        return WordIndexResultList(
            sourceShapeId: sourceShapeId,
            searchShapeId: searchShapeId,
            matchingOrientation: firstIsFlipped,
            matches: matches,
            width: UInt8(width),
            height: UInt8(height))
    }
    
    public static func GetOffsets(p1: PlacementModel, p2: PlacementModel) -> (UInt8, UInt8, UInt8, UInt8) {
        
        var x1: UInt8 = 0
        var x2: UInt8 = 0
        var y1: UInt8 = 0
        var y2: UInt8 = 0
        
        if p1.x > p2.x {
            x2 = UInt8(p1.x - p2.x)
        } else if p2.x > p1.x {
            x1 = UInt8(p2.x - p1.x)
        }
        
        if p1.y > p2.y {
            y2 = UInt8(p1.y - p2.y)
        } else if p2.y > p1.y {
            y1 = UInt8(p2.y - p1.y)
        }
        
        return (x1, y1, x2, y2)
    }
}
