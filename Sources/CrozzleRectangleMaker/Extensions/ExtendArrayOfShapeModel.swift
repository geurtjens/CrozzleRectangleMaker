//
//  ExtendArrayOfShapeModel.swift
//  
//
//  Created by Michael Geurtjens on 11/6/2023.
//

import Foundation
extension Array where Element == ShapeModel {
    
    func containing(_ containing:[String], from: [String]) -> [ShapeModel] {
        let shapes = ShapeCalculator.filterInclude(shapes: self, containing: containing, from: from)
        return shapes
    }
    
    func ToTextWithMergeHistory(words: [String]){
        for shape in self {
            print(shape.ToText(words: words))
            print("Merge History: \(shape.mergeHistory)")
            print("")
        }
       
    }
}
