//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 22/9/2023.
//

import Foundation
public class TreeNodeCalculator {
    
    public static func sortByBestDescendant(
        treeNodes: inout [TreeNodeModel])
    {
        treeNodes.sort {
            if $0.bestDescendant.score == $1.bestDescendant.score {
                return $0.bestDescendant.area < $1.bestDescendant.area
            } else {
                return $0.bestDescendant.score > $1.bestDescendant.score
            }
        }
    }
    
    
    public static func applyBeamWidth(
        treeNodes: [TreeNodeModel],
        beamWidth: Int) -> [TreeNodeModel]
    {
        var result: [TreeNodeModel] = []
        for treeNodeId in 0..<beamWidth {
            if treeNodeId < treeNodes.count {
                result.append(treeNodes[treeNodeId])
            }
        }
        return result
    }
    
    public static func getBestShape(
        treeNodes: [TreeNodeModel]) -> ShapeModel?
    {
        
        if treeNodes.count == 0 {
            return nil
        } else {
            return treeNodes[0].bestDescendant
        }
    }
    
    public static func getBestScore(
        treeNodes: [TreeNodeModel]) -> Int
    {
        
        if treeNodes.count == 0 {
            return 0
        } else {
            return Int(treeNodes[0].bestDescendant.score)
        }
    }
    
    public static func getBestParentNodeScore(
        treeNodes: [TreeNodeModel]) -> UInt16
    {
        var result: UInt16 = 0
        for treeNode in treeNodes {
            if treeNode.parentShape.score > result {
                result = treeNode.parentShape.score
            }
        }
        return result
    }
    
    
    /// Provide the first position within the tree nodes where `bestDescendant` contains a winning game
    /// - Parameters:
    ///   - requiredShapes: ShapeIds of shapes known to be in the winning game
    ///   - treeNodes: A list of tree nodes
    /// - Returns: First position of a `bestDescendant`that only contains winning shapes or  `-1`
    public static func findPositionOfFirstValidTreeNodeBestDescendant(
        requiredShapes: Set<Int>,
        treeNodes: [TreeNodeModel]) -> Int
    {
        for i in 0..<treeNodes.count {
            let treeNodeMergeHistory = Set(treeNodes[i].bestDescendant.mergeHistory)
            
            let unrequiredShapes = treeNodeMergeHistory.subtracting(requiredShapes)
            
            if unrequiredShapes.count == 0 {
                return i
            }
        }
        return -1
    }
    
    /// Provide the position of all tree nodes where `bestDescendant` contains a winning game.
    /// - Parameters:
    ///   - requiredShapes: ShapeIds of shapes known to be in the winning game
    ///   - treeNodes: A list of tree nodes
    /// - Returns: Position of all `bestDescendant` that contain only winning game shapes within the `treeNodes`
    public static func findPositionOfAllValidTreeNodeBestDescendants(
        requiredShapes: Set<Int>,
        treeNodes: [TreeNodeModel]) -> [Int]
    {
        var result: [Int] = []
        for i in 0..<treeNodes.count {
            let treeNodeMergeHistory = Set(treeNodes[i].bestDescendant.mergeHistory)
            
            let unrequiredShapes = treeNodeMergeHistory.subtracting(requiredShapes)
            
            if unrequiredShapes.count == 0 {
                result.append(i)
            }
        }
        return result
    }
    
    /// When we have common shapes then maybe these long set of shapes can be merged together
    /// So if we have `[1,2,3,4,5]` and another called `[5,6,7,8,9]` then its possible to get `[1,2,3,4,5,6,7,8,9]`
    /// - Parameters:
    ///   - treeNodes: A list of tree nodes
    ///   - maxCommonShapes: Maximum number of common shapes
    /// - Returns: treeNodeId, mergeableTreeNodeId, commonShapesBetweenBothOfThem
    public static func identifySiblingMerges(
        treeNodes: [TreeNodeModel],
        minCommonShapes: Int,
        maxCommonShapes: Int) -> [(Int,Int,[Int])] 
    {
        
        if treeNodes.count < 2 {
            return []
        }
            
            
        var result: [(Int,Int, [Int])] = []
        for sourceId in 0..<treeNodes.count {
            let sourceHistory = Set(treeNodes[sourceId].parentShape.mergeHistory)
            for searchId in sourceId+1..<treeNodes.count {
                let searchHistory = Set(treeNodes[searchId].parentShape.mergeHistory)
                
                let commonShapes = Array(sourceHistory.intersection(searchHistory)).sorted()
                let commonShapeCount = commonShapes.count
                if (commonShapeCount >= minCommonShapes &&
                    commonShapeCount <= maxCommonShapes) {
                    result.append((sourceId, searchId, Array(commonShapes).sorted()))
                }
            }
        }
        return result
    }
    
    
    public static func findFirstValidTreeNodeParent(
        requiredShapes: Set<Int>,
        treeNodes: [TreeNodeModel]) -> Int
    {
        for i in 0..<treeNodes.count {
            let treeNodeMergeHistory = Set(treeNodes[i].parentShape.mergeHistory)
            
            let unrequiredShapes = treeNodeMergeHistory.subtracting(requiredShapes)
            
            if unrequiredShapes.count == 0 {
                return i
            }
        }
        return -1
    }
    
    public static func findPositionOfAllValidTreeNodeParents(
        requiredShapes: Set<Int>,
        treeNodes: [TreeNodeModel]) -> [Int]
    {
        var result: [Int] = []
        for i in 0..<treeNodes.count {
            let treeNodeMergeHistory = Set(treeNodes[i].parentShape.mergeHistory)
            
            let unrequiredShapes = treeNodeMergeHistory.subtracting(requiredShapes)
            
            if unrequiredShapes.count == 0 {
                result.append(i)
            }
        }
        return result
    }
    
    public static func countShapesCreated(treeNodes: [TreeNodeModel]) -> Int {
        var result = treeNodes.count
        for treeNode in treeNodes {
            result += treeNode.childShapes.count
        }
        return result
    }
    
    public static func countLeafs(treeNodes: [TreeNodeModel]) -> Int {
        var count = 0
        for item in treeNodes {
            count += item.childShapes.count
        }
        return count
    }
    
    public static func findFirstValidTreeNodeFromChildren(
        requiredShapes: Set<Int>,
        treeNodes: [TreeNodeModel]) -> Int
    {
        var result = 9999
        for treeNodeId in 0..<treeNodes.count {
            let treeNode = treeNodes[treeNodeId]
            
            for treeNodeChildId in 0..<treeNode.childShapes.count {
                
                let treeNodeMergeHistory = Set(treeNode.childShapes[treeNodeChildId].mergeHistory)
                
                let unrequiredShapes = treeNodeMergeHistory.subtracting(requiredShapes)
                
                if unrequiredShapes.count == 0 {
                    if result > treeNodeChildId {
                        result = treeNodeChildId
                    }
                }
            }
        }
        
        /// We havent found any so return that there are none here
        if result == 9999 {
            result = -1
        }
        
        return result
    }
}
