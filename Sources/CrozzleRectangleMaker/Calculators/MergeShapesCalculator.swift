//
//  MergeShapesCalculator.swift
//  
//
//  Created by Michael Geurtjens on 10/6/2023.
//

import Foundation
public class MergeShapesCalculator {
    
    private static let widthMax = 17
    private static let heightMax = 12
    public static func Merge_Two_Shapes(smaller: [ShapeModel], larger: [ShapeModel], words:[String]) -> [ShapeModel] {
        
        var smaller_gpu = GpuShapeModel(shapes:smaller, totalWords: words.count)
        
        var larger_gpu = GpuShapeModel(shapes:larger, totalWords: words.count)
        
        if smaller_gpu.stride > larger_gpu.stride {
            // we are doing a swap of larger with smaller if smaller is bigger than larger
            let old_larger_gpu = larger_gpu
            
            larger_gpu = smaller_gpu
            smaller_gpu = old_larger_gpu
        }
        let scoresMin = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        let result = ExecuteMergeCalculator.ExecuteDifferentShapes(
            source: smaller_gpu,
            search: larger_gpu,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        for item in result {
            print(item.ToString(words: words))
        }
        return result
    }
}
