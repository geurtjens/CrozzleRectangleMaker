//
//  TopLeftBottomRightModel.swift
//  
//
//  Created by Michael Geurtjens on 17/5/2023.
//

import Foundation
public struct TopLeftBottomRightModel : ShapeProtocol {
    
    public let score: Int
    public let width: Int
    public let height: Int
    
    public let top: UInt8
    public let topLetterPos: UInt8
    
    public let bottom: UInt8
    public let bottomLetterPos: UInt8
    
    public let left: UInt8
    public let leftLetterPos: UInt8
    
    public let right: UInt8
    public let rightLetterPos: UInt8
    
    public let interlockWidth: UInt8
    public let interlockHeight: UInt8
    public let type: RectangleType
    
    public init(score: Int, width: Int, height: Int, top: Int, topLetterPos: Int, bottom: Int, bottomLetterPos: Int, left: Int, leftLetterPos: Int, right: Int, rightLetterPos: Int, interlockWidth: Int, interlockHeight: Int, type: RectangleType) {
        self.score = score
        self.width = width
        self.height = height
        self.top = UInt8(top)
        self.topLetterPos = UInt8(topLetterPos)
        self.bottom = UInt8(bottom)
        self.bottomLetterPos = UInt8(bottomLetterPos)
        self.left = UInt8(left)
        self.leftLetterPos = UInt8(leftLetterPos)
        self.right = UInt8(right)
        self.rightLetterPos = UInt8(rightLetterPos)
        self.interlockWidth = UInt8(interlockWidth)
        self.interlockHeight = UInt8(interlockHeight)
        self.type = type
    }
    
    public func ToText(words:[String]) -> String {
        let shape = ToShape()
        let text = ShapeCalculator.ConvertToText(shape: shape, words: words)
        return text
    }
    
    public func ToTextFlipped(words:[String]) -> String {
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

