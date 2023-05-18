//
//  File 2.swift
//  
//
//  Created by Michael Geurtjens on 17/5/2023.
//

import Foundation
public struct TopLeftBottomRightModel : ShapeProtocol {
    
    public let score: Int
    public let width: Int
    public let height: Int
    
    public let top: Int
    public let topLetterPos: Int
    
    public let bottom: Int
    public let bottomLetterPos: Int
    
    public let left: Int
    public let leftLetterPos: Int
    
    public let right: Int
    public let rightLetterPos: Int
    
    public let interlockWidth: Int
    public let interlockHeight: Int
    public let type: RectangleType
    
    public func ToText(words:[String]) -> String {
        let shape = ToShape()
        let text = ShapeCalculator.ConvertToText(shape: shape, words: words)
        return text
    }
    
    public func ToShape() -> ShapeModel {
        switch type {
        case .bottomLeft:
            return ShapeCalculator.ConvertToShape(bottomLeft: self)
        case .bottomRight:
            return ShapeCalculator.ConvertToShape(rectangle: self)
        case .rectangle:
            return ShapeCalculator.ConvertToShape(rectangle: self)
        case .topLeft:
            return ShapeCalculator.ConvertToShape(topLeft: self)
        case .topRight:
            return ShapeCalculator.ConvertToShape(topRight: self)
        }
    }
}

