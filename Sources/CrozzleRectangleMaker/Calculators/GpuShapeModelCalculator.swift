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
}
