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
    
    public static func findMergedShapes(
        words: [String],
        sourceShape: ShapeModel,
        sourceShapeId: Int,
        searchShapes: [ShapeModel],
        searchIndex: [[WordIndexModel]],
        searchMin: Int,
        searchMax: Int,
        scoresMin: [Int],
        widthMax: Int,
        heightMax: Int) -> [ShapeModel]
    {
        let wordMatchModels = getWordMatchModels(
            sourceShape: sourceShape,
            searchIndex: searchIndex,
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
        
        let (sizeIsValid, width, height, firstIsFlipped) = MergeSizeValidation2.execute(
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
        
        let sourcePlacement = sourceShape.placements[sourceFirstPos]
        let searchPlacement = searchShape.placements[searchFirstPos]
        
        // get the offsets and then combine the placements and make the shape like we used to
        let (sourceOffsetX, sourceOffsetY, searchOffsetX, searchOffsetY, sourceIsFlipped) = MergeOffsetCalculator.GetOffsets(
            sourcePlacement: sourcePlacement, searchPlacement: searchPlacement)
        // You have to assume that source is going to be flipped and so you must get searchOffsetX to be moved
        
        let (sourcePlacements, searchPlacements) = extractPlacements(
            matches: matches,
            sourceShape: sourceShape,
            searchShape: searchShape,
            sourceOffsetX: sourceOffsetX,
            sourceOffsetY: sourceOffsetY,
            searchOffsetX: searchOffsetX,
            searchOffsetY: searchOffsetY,
            sourceIsFlipped: sourceIsFlipped)
        
        let isOverlapping = OverlappingPlacementsCalculator.isOverlapping(sourcePlacements: sourcePlacements, searchPlacements: searchPlacements)
        if isOverlapping {
            return nil
        }
        
        // Sometimes it gets the opposite of what it is supposed to be
        let placements = sourcePlacements + searchPlacements
        
        if width != placements.width() || height != placements.height() {
            if width == placements.height() && height == placements.width() {
                print("switched, width:\(width), placementsWidth:\(placements.width()), height:\(height), placementsHeight:\(placements.height())")
            } else {
                print(sourceShape.ToCode(words: words))
                print(searchShape.ToCode(words: words))
                print(sourceShape.Flip().ToCode(words: words))
                print("width:\(width), height:\(height), placementsWidth:\(placements.width()), placementsHeight:\(placements.height())")
                
            }
        }
        
        let potentialShape = ShapeModel(score:10, width: UInt8(width), height: UInt8(height), placements: placements)
        
        let otherShape = ShapeModel(score: 10, width: placements.width(), height: placements.height(), placements: placements)
        print(otherShape.ToString(words: words))
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
    
    
    public static func extractPlacements(shape: ShapeModel, positionsDuplicated: [UInt8], flip: Bool, offsetX: UInt8, offsetY: UInt8) -> [PlacementModel] {
        if flip == true {
            return extractPlacementsAndFlip(
                shape: shape,
                positionsDuplicated: positionsDuplicated,
                offsetX: offsetX,
                offsetY: offsetY)
        } else {
            return extractPlacements(
                shape: shape,
                positionsDuplicated: positionsDuplicated,
                offsetX: offsetX,
                offsetY: offsetY)
        }
    }
    
    
    public static func extractPlacementsAndFlip(shape: ShapeModel, positionsDuplicated: [UInt8], offsetX: UInt8, offsetY: UInt8) -> [PlacementModel] {
        var result: [PlacementModel] = []
        
        for i in 0..<shape.placements.count {
            if positionsDuplicated.contains(UInt8(i)) == false {
                let p = shape.placements[i]
                result.append(PlacementModel(w: p.w, x: p.y + offsetX, y: p.x + offsetY, z: !p.z, l: p.l))
                //result.append(PlacementModel(w: p.w, x: p.y + offsetY, y: p.x + offsetX, z: !p.z, l: p.l))
            }
        }
            
        return result
    }
    
    public static func extractPlacements(shape: ShapeModel, positionsDuplicated: [UInt8], offsetX: UInt8, offsetY: UInt8) -> [PlacementModel] {
        var result: [PlacementModel] = []
        
        for i in 0..<shape.placements.count {
            if positionsDuplicated.contains(UInt8(i)) == false {
                let p = shape.placements[i]
                result.append(PlacementModel(w: p.w, x: p.x + offsetX, y: p.y + offsetY, z: p.z, l: p.l))
            }
        }
        return result
    }
    
    public static func extractPlacements(shape: ShapeModel, flip: Bool, x: UInt8, y: UInt8) -> [PlacementModel] {
        var result: [PlacementModel] = []
        if flip == true {
            for i in 0..<shape.placements.count {
                let p = shape.placements[i]
                result.append(PlacementModel(w: p.w, x: p.y + y, y: p.x + x, z: !p.z, l: p.l))
            }
            
        } else {
            for i in 0..<shape.placements.count {
                let p = shape.placements[i]
                result.append(PlacementModel(w: p.w, x: p.x + x, y: p.y + y, z: p.z, l: p.l))
            }
        }
        return result
    }
    
    public static func extractPlacements(shape: ShapeModel, offsetX: UInt8, offsetY: UInt8) -> [PlacementModel] {
        var result: [PlacementModel] = []
        
        for i in 0..<shape.placements.count {
            let p = shape.placements[i]
            result.append(PlacementModel(w: p.w, x: p.x + offsetX, y: p.y + offsetY, z: p.z, l: p.l))
        }
        
        return result
    }
    
    public static func extractPlacements(
        matches: [WordIndexResultModel],
        sourceShape: ShapeModel,
        searchShape: ShapeModel,
        sourceOffsetX: UInt8,
        sourceOffsetY: UInt8,
        searchOffsetX: UInt8,
        searchOffsetY: UInt8,
        sourceIsFlipped: Bool) -> ([PlacementModel], [PlacementModel])
    {
        
        let sourceDuplicates = matches.map { $0.sourcePos }
        
        let sourcePlacements = extractPlacements(
            shape: sourceShape,
            positionsDuplicated: sourceDuplicates,
            flip: sourceIsFlipped,
            offsetX: sourceOffsetX,
            offsetY: sourceOffsetY)

        // We never flip the searchPlacements by convention
        let searchPlacements = extractPlacements(
            shape: searchShape,
            offsetX: searchOffsetX,
            offsetY: searchOffsetY)
        
        return (sourcePlacements, searchPlacements)
    }
    
}
