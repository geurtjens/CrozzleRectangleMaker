//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 17/9/2023.
//

import Foundation
public struct TreeNodeModel {
    public let parentShape: ShapeModel
    
    public let childShapes: [ShapeModel]
    
    public var bestDescendant : ShapeModel
    //public var scoreMax: Int

    /// How many siblings where used to calculate the children
    public let siblingCount: Int
    
    public var shapesCreated: Int = 0
    
    public var isValid = true
}
