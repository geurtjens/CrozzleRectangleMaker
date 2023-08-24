//
//  MergeShapesCalculator.swift
//  
//
//  Created by Michael Geurtjens on 10/6/2023.
//

import Foundation
public class MergeShapesCalculator {
     
    public static func Merge_Sequence_Of_Shapes(shapeAndSelectedPosition: [(ShapeModel,Int)],
                                                words:[String], wordsInt:[[Int]], widthMax: Int, heightMax: Int) -> ShapeModel {
        
        var currentShape = shapeAndSelectedPosition[0].0
        var results: [ShapeModel] = []
        for i in 1..<shapeAndSelectedPosition.count {
            let mergeShape = shapeAndSelectedPosition[i].0
            let index = shapeAndSelectedPosition[i].1

            if currentShape.placements.count < mergeShape.placements.count {
                if FeatureFlags.verbose {
                    print(currentShape.ToString(words: words))
                    print("Merging with")
                
                    print(mergeShape.ToString(words: words))
                }
                results = Merge_Two_Shapes(smaller: [currentShape], larger: [mergeShape], words: words, wordsInt: wordsInt, widthMax: widthMax, heightMax: heightMax)
            } else {
                if FeatureFlags.verbose {
                    print("Merging with")
                    print(mergeShape.ToString(words: words))
                }
                results = Merge_Two_Shapes(smaller: [mergeShape], larger: [currentShape], words: words, wordsInt:wordsInt, widthMax: widthMax, heightMax: heightMax)
                
            }
            if FeatureFlags.verbose {
                print("Found \(results.count) results")
            }
            if results.count == 1 {
                currentShape = results[0]
            } else {
                if FeatureFlags.verbose {
                    print("Out of \(results.count) shapes produced we choose \(index)")
                }
                currentShape = results[index]
            }
            if FeatureFlags.verbose {
                print(currentShape.ToString(words: words))
            }
        }
        return currentShape
    }
    
    public static func Merge_Sequence_Of_Shapes(shapes: [ShapeModel], words:[String], wordsInt: [[Int]], widthMax: Int, heightMax: Int) -> ShapeModel {
        
        var currentShape = shapes[0]
        print(currentShape.ToString(words: words))
        var results: [ShapeModel] = []
        for i in 1..<shapes.count {
            
            let mergeShape = shapes[i]

            if currentShape.placements.count < mergeShape.placements.count {
                
                print("Merging with")
                print(mergeShape.ToString(words: words))
                results = Merge_Two_Shapes(smaller: [currentShape], larger: [mergeShape], words: words, wordsInt: wordsInt, widthMax: widthMax, heightMax: heightMax)
            } else {
                
                print("Merging with")
                print(mergeShape.ToString(words: words))
                results = Merge_Two_Shapes(smaller: [mergeShape], larger: [currentShape], words: words, wordsInt: wordsInt, widthMax: widthMax, heightMax: heightMax)
                
            }
            
            
            if results.count > 1 {
                print("Out of \(results.count) shapes produced we choose 0, use shapeAndSelectedPosition variant if you want different")
            }
            currentShape = results[0]
            print(currentShape.ToString(words: words))
        }
        return currentShape
    }
    
    public static func Merge_Two_Shapes(smaller: [ShapeModel], larger: [ShapeModel], words:[String], wordsInt: [[Int]], widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        var (smaller_gpu, smaller_word_index) = GpuShapeModelCalculator.Create(shapes:smaller, totalWords: words.count)
        var (larger_gpu, larger_word_index) = GpuShapeModelCalculator.Create(shapes:larger, totalWords: words.count)
        
        if smaller_gpu.stride > larger_gpu.stride {
            // we are doing a swap of larger with smaller if smaller is bigger than larger
            let old_larger_gpu = larger_gpu
            let old_larger_word_index = larger_word_index
            
            larger_gpu = smaller_gpu
            larger_word_index = smaller_word_index
            
            smaller_gpu = old_larger_gpu
            smaller_word_index = old_larger_word_index
        }
        let scoresMin = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        let result = ExecuteMergeCalculator.ExecuteDifferentShapes(
            sourceShapes: smaller_gpu,
            searchShapes: larger_gpu,
            searchWordIndex: larger_word_index,
            sourceMax: smaller_gpu.count,
            searchMax: larger_gpu.count,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
//        for item in result {
//            print(item.ToString(words: words))
//        }
        return result
    }
}
