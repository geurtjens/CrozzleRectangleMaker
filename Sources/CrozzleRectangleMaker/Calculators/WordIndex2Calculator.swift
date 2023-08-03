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
        words: [String],
        sourceShape: ShapeModel,
        sourceShapeId: Int,
        searchShapes: [ShapeModel],
        searchWordIndex: [[WordIndexModel]],
        searchMin: Int,
        searchMax: Int,
        scoresMin: [Int],
        widthMax: Int,
        heightMax: Int) -> [ShapeModel]
    {
        let wordMatchModels = getWordMatchModels(
            sourceShape: sourceShape,
            searchIndex: searchWordIndex,
            searchMin: searchMin,
            searchMax: searchMax)

        let instructions = getDictionaryGroupBy(sourceShapeId: sourceShapeId, wordMatchModels: wordMatchModels)
        
        var shapes: [ShapeModel] = []
        for instruction in instructions {
        
            let potentialShape = createIfValid(
                words: words,
                matches: instruction.matches,
                sourceShape: sourceShape,
                searchShape: searchShapes[instruction.searchShapeId],
                sourceShapeId: sourceShapeId,
                searchShapeId: instruction.searchShapeId,
                scoresMin: scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            if potentialShape != nil {
                shapes.append(potentialShape!)
            }
        }

        
        return shapes
    }
    
    public static func createIfValid(
        words: [String],
        matches: [WordIndexResultModel],
        sourceShape: ShapeModel,
        searchShape: ShapeModel,
        sourceShapeId: Int,
        searchShapeId: Int,
        scoresMin: [Int],
        widthMax: Int,
        heightMax: Int) -> ShapeModel?
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
        let (x1, y1, x2, y2, isFlipped) = MergeOffsetCalculator.GetOffsets(p1: p1, p2: p2)
        
        
        let (sourcePlacements, searchPlacements) = extractPlacements(
            matches: matches,
            sourceShape: sourceShape,
            searchShape: searchShape,
            x1: x1, y1: y1, x2: x2, y2: y2, isFlipped: isFlipped)
        
        let isOverlapping = OverlappingPlacementsCalculator.isOverlapping(sourcePlacements: sourcePlacements, searchPlacements: searchPlacements)
        if isOverlapping {
            return nil
        }
        
        let potentialShape = ShapeModel(score:10, width: UInt8(width), height: UInt8(height), placements: sourcePlacements + searchPlacements)
        
        let (validShape,_) = ShapeCalculator.ToValidShape(shape: potentialShape, words: words)
        
        if let validShape = validShape {
            // is shape is not nil so it must be a valid shape
            let wordCount = validShape.placements.count
            let scoreMin = scoresMin[wordCount]
            if validShape.score >= scoreMin {
                return validShape
            }
        }
        
        
        return nil
    }
    
    
    public static func extractPlacements(matches: [WordIndexResultModel], sourceShape: ShapeModel, searchShape: ShapeModel, x1: UInt8, y1: UInt8, x2: UInt8, y2: UInt8, isFlipped: Bool) -> ([PlacementModel], [PlacementModel]) {
        
        let sourceDuplicates = matches.map { $0.sourcePos }
        var sourcePlacements: [PlacementModel] = []
        for i in 0..<sourceShape.placements.count {
            if sourceDuplicates.contains(UInt8(i)) == false {
                let p = sourceShape.placements[i]
                // Apply placement to the thing
                
                sourcePlacements.append(PlacementModel(w: p.w, x: p.x + x1, y: p.y + y1, z: p.z, l: p.l))
               
            }
        }
        
        var searchPlacements: [PlacementModel] = []
        for i in 0..<searchShape.placements.count {
            let p = searchShape.placements[i]
            
            if isFlipped == false {
                searchPlacements.append(PlacementModel(w: p.w, x: p.x + x2, y: p.y + y2, z: p.z, l: p.l))
            } else {
                
                searchPlacements.append(PlacementModel(w: p.w, x: p.y + y2, y: p.x + x2, z: !p.z, l: p.l))
            }
        }
        
        return (sourcePlacements, searchPlacements)
    }
    
}
