//
//  GpuShapeModelCalculator.swift
//  
//
//  Created by Michael Geurtjens on 21/6/2023.
//

import Foundation
/// Short hand way of creating the GpuShapeModel and WordIndex at the same time and with one line of code
public class GpuShapeModelCalculator {
    public static func Create(shapes: [ShapeModel], totalWords: Int, stride: Int) -> (GpuShapeModel, [[Int]]) {
        let gpuShapeModel = GpuShapeModel(shapes: shapes, totalWords: totalWords, stride: stride)
        let wordIndex = WordIndexCalculator.createWordIndex(totalWords: totalWords, stride: stride, shapeCount: gpuShapeModel.count, words: gpuShapeModel.wordId)
        return (gpuShapeModel, wordIndex)
    }
    
    public static func Create(shapes: [ShapeModel], totalWords: Int) -> (GpuShapeModel, [[Int]]) {
        let gpuShapeModel = GpuShapeModel(shapes: shapes, totalWords: totalWords)
        let wordIndex = WordIndexCalculator.createWordIndex(totalWords: totalWords, stride: gpuShapeModel.stride, shapeCount: gpuShapeModel.count, words: gpuShapeModel.wordId)
        return (gpuShapeModel, wordIndex)
    }
    
    
//    public static func findOffsets(sourceX: Int, sourceY: Int, searchX: Int, searchY: Int, sameOrientation: Bool, width: Int, height: Int) {
//        let
//    }
    
    public static func getScoreAndText(
        sourceShapeId: Int,
        searchShapeId: Int,
        matchingOrientation: Bool,
        matches: [WordIndexResultModel],
        width: Int,
        height: Int,
        
        sourceShapes: GpuShapeModel,
        searchShapes: GpuShapeModel,
        words: [String]) -> (UInt16, String)
    {
        
        
        
        
        //var score = 0
        
        let widthEOL = width + 1
        
        let gridSize = widthEOL * height
        
        var grid:[Character] = Array(repeating: " ", count: Int(gridSize))
        
        // Place all end of line characters into the space
        for i in 0..<height {
            grid[i * widthEOL] = "\n"
        }
        
        
        // We want a way of adding all positions but just including the repeating ones once
        
        
        let sourceBasePos = sourceShapeId * Int(sourceShapes.stride)
        let searchBasePos = searchShapeId * Int(searchShapes.stride)
        
//        let sourceStartPos = sourceBasePos + Int(matches[0].sourcePos)
//        let searchStartPos = searchBasePos + Int(matches[0].searchPos)
        
//        let sourceStartX = sourceShapes.x[sourceStartPos]
//        let sourceStartY = sourceShapes.y[sourceStartPos]
//
//        let searchStartX = searchShapes.x[searchStartPos]
//        let searchStartY = searchShapes.y[searchStartPos]
        
        
        
        
        
        // We will include everything from source
        var sourcePlacements: [wxyz] = []
       
        
        // Now we place all the source positions, we should also be making some kind of offset calculations first
        for i in 0..<sourceShapes.stride {
            
            let wordPos = sourceBasePos + i
            
            let w = sourceShapes.wordId[wordPos]
            let x = sourceShapes.x[wordPos]
            let y = sourceShapes.y[wordPos]
            let z = sourceShapes.isHorizontal[wordPos]
            
            sourcePlacements.append(wxyz(w: w, x: x, y: y, z: z))
        }
        
        // we need to find out what the offsets are.  if we are going to flip one then make it the one that gives us landscape
        
        
        
        
        
        // Ideally we are not forming data structures as we cannot do that within a GPU and this will become a gpu algorithm eventually
        // With our search positions we want to include only those that are not matched
        
       
        
        
        let alreadyMatched = matches.map { Int($0.searchPos) }
        
        var searchPlacements: [wxyz] = []
        for i in 0..<searchShapes.stride {
            if alreadyMatched.contains(i) == false {
                
                let wordPos = searchBasePos + i
                
                let w = searchShapes.wordId[wordPos]
                let x = searchShapes.x[wordPos]
                let y = searchShapes.y[wordPos]
                let z = searchShapes.isHorizontal[wordPos]
                
                searchPlacements.append(wxyz(w: w, x: x, y: y, z: z))
            }
        }
        
        
        
        
        
        
//        for placement in shape.placements {
//
//            // the word must include the blocking characters at either end of the shape
//            let word = "." + words[Int(placement.i)] + "."
//
//            var gridPos = 0
//
//            for i in 0..<word.count {
//                let letter = word[i]
//
//                if placement.z {
//                    gridPos = Int(placement.x) + i + (Int(placement.y) * widthEOL + 1)
//                } else {
//                    gridPos = Int(placement.x) + 1 + (Int(placement.y) + i) * widthEOL
//                }
//
//                if grid[gridPos] != " " && grid[gridPos] != letter {
//                    grid[gridPos] = "#"
//                    return (UInt16(0),"")
//                } else if grid[gridPos] == " " {
//                    grid[gridPos] = letter
//                } else if grid[gridPos] == letter {
//                    score += ScoreCalculator.score(forLetter: letter)
//                }
//            }
//        }
//        let gridString = String(grid)
//
//        // Remove the first character as it is a \n
//        let range = gridString.index(after: gridString.startIndex)..<gridString.endIndex
//        let result = String(gridString[range])
//
//        if result.contains("#") {
//            score = 0
//        } else {
//            score += shape.placements.count * 10
//        }
//        return (UInt16(score), result)
        return (0,"")
    }
    
    
    
    
    
}
