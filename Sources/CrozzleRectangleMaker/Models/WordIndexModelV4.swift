//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 9/2/2024.
//

import Foundation
public struct WordIndexModelV4 {
    
    public let index: [[WordPositionModel]]
    public let searchShapes: [ShapeModel]
    
    public init(shapes: [ShapeModel], wordCount: Int)
    {
        var result: [[WordPositionModel]] = []
        
        for wordId in 0..<wordCount {
            var subindex: [WordPositionModel] = []
            for shapeId in 0..<shapes.count {
                for pos in 0..<shapes[shapeId].placements.count {
                    if shapes[shapeId].placements[pos].w == wordId {
                        subindex.append(WordPositionModel(searchShapeId: shapeId, wordPos: UInt8(pos)))
                    }
                }
            }
            result.append(subindex)
        }
        self.index = result
        self.searchShapes = shapes
    }
    
    public func searchSpace() -> Int {
        var result = 0
        for item in index {
            result += item.count
        }
        return result
    }
    
    public func findMatch(sourceShape: ShapeModel) -> [IndexResultModel]
    {
        var items: [IndexResultItem] = findMatchItems(sourceShape: sourceShape)
     
        items.sort {
            if $0.searchShapeId == $1.searchShapeId {
                return $0.sourcePos < $1.sourcePos
            } else {
                return $0.searchShapeId < $1.searchShapeId
            }
        }
        // Now we have to sort it based on shape id with a group by thing
        
        var result: [IndexResultModel] = []
        
        // So its sorted and now we just have to go down the sort list and construct what we need.
        var searchShapeId = items[0].searchShapeId

        var sourcePosList: [UInt8] = [items[0].searchPos]
        var searchPosList: [UInt8] = [items[0].sourcePos]
        
        for i in 1..<items.count {
            if items[i].searchShapeId == searchShapeId {
                sourcePosList.append(items[i].sourcePos)
                searchPosList.append(items[i].searchPos)
                
            } else {
                // if the found shape is not a subset of the sourceShape then add it
                if sourcePosList.count < sourceShape.placements.count &&
                   searchPosList.count < self.searchShapes[searchShapeId].placements.count {
                    result.append(IndexResultModel(
                        searchShapeId: searchShapeId,
                        sourcePosList: sourcePosList,
                        searchPosList: searchPosList))
                }
                              
                searchShapeId = items[i].searchShapeId
                sourcePosList = [items[i].sourcePos]
                searchPosList = [items[i].searchPos]
            }
        }
        
        /// What do we do for the last entry in the list if its same shape then increase common word count
        if items[items.count - 1].searchShapeId == items[items.count - 2].searchShapeId {
            sourcePosList.append(items[items.count - 1].sourcePos)
            searchPosList.append(items[items.count - 1].searchPos)
        }
        
        if (sourcePosList.count < sourceShape.placements.count &&
            searchPosList.count < self.searchShapes[searchShapeId].placements.count) {
            /// We should always add the last record separately
            result.append(IndexResultModel(
                searchShapeId: searchShapeId,
                sourcePosList: sourcePosList,
                searchPosList: searchPosList))
        }
        return result
    }
        
    
    public func findMatchItems(
        sourceShape: ShapeModel) -> [IndexResultItem]
    {
        var result: [IndexResultItem] = []
        for i in 0..<sourceShape.placements.count {
            let matchesForWord = self.index[Int(sourceShape.placements[i].w)]
            for item in matchesForWord {
                result.append(IndexResultItem(
                    searchShapeId: item.searchShapeId,
                    searchPos: item.wordPos,
                    sourcePos: UInt8(i))
                )
            }
        }
        return result
    }
}
