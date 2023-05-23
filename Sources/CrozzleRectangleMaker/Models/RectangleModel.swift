//
//  RectangleModel.swift
//  
//
//  Created by Michael Geurtjens on 17/5/2023.
//

import Foundation
public struct RectangleModel : ShapeProtocol {
        
    // 75 MB vs 161 MB
    // This trick allows me to store smaller sized variables and so do type conversion at source
    public var score: Int { get { return Int(_score) } }
    public var width: Int { get { return Int(_width) } }
    public var height: Int { get { return Int(_height) } }
    
    private let _score: UInt16
    private let _width: UInt8
    private let _height: UInt8
    
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
//        self.score = score
//        self.width = width
//        self.height = height
        
        
        self._score = UInt16(score)
        self._width = UInt8(width)
        self._height = UInt8(height)
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
    
//    public func ToText(words:[String]) -> String {
//        let shape = ToShape()
//        let text = ShapeCalculator.ConvertToText(shape: shape, words: words)
//        return text
//    }
//
//    public func ToTextFlipped(words:[String]) -> String {
//        let shape = ToShape()
//        let text = ShapeCalculator.ConvertToTextFlipped(shape: shape, words: words)
//        return text
//    }
    
    public func ToPlacement() -> [PlacementModel] {
        switch type {
        case .bottomLeft:
            return PlacementCalculator.ConvertToPlacements(bottomLeft: self)
        case .bottomRight:
            return PlacementCalculator.ConvertToPlacements(rectangle: self)
        case .rectangle:
            return PlacementCalculator.ConvertToPlacements(rectangle: self)
        case .topLeft:
            return PlacementCalculator.ConvertToPlacements(topLeft: self)
        case .topRight:
            return PlacementCalculator.ConvertToPlacements(topRight: self)
        }
    }
    
    public func ToCsv() -> String {
        var result = String(self.score) + "," + String(self.width) + "," + String(self.height) + ","
        
        let shape = self.ToShape()
        
        let placements = shape.placements.sorted { $0.i < $1.i }
        
        for placement in placements {
            result += String(placement.i) + ","
        }
        for placement in placements {
            if placement.h {
                result += "1,"
            } else {
                result += "0,"
            }
        }
        for placement in placements {
            result += String(placement.x) + ","
        }
        for placement in placements {
            result += String(placement.y) + ","
        }
        
        switch self.type {
        case .rectangle:
            result += "0"
        case .topLeft:
            result += "1"
        case .topRight:
            result += "2"
        case .bottomLeft:
            result += "3"
        case .bottomRight:
            result += "4"
        }
        return result
    }
}

