//
//  RectangleModel.swift
//  
//
//  Created by Michael Geurtjens on 17/5/2023.
//

import Foundation
/// This structure can create a shape.  It is what the `RectangleCalculator` creates
public struct RectangleModel : ShapeProtocol {
   
    /// score awarded for this shape by the rules of crozzle
    public let score: UInt16
    /// width of grid when shape rendered as a grid
    public let width: UInt8
    /// height of grid when shape rendered as a grid
    public let height: UInt8
    
    /// position of word in words list that is occupying `top` of rectangle
    public let top: UInt8
    /// letter position of first interlockin letter in `top` word
    public let topLetterPos: UInt8
    /// length of word that occupies`top` of rectangle
    public let topLength: UInt8
    
    /// position of word in words list that occupies `bottom` of rectangle
    public let bottom: UInt8
    /// letter position of first interlockin letter in `bottom` word
    public let bottomLetterPos: UInt8
    /// length of word that occupies `bottom` of rectangle
    public let bottomLength: UInt8
    
    /// position of word in words list that occupies `left` of rectangle
    public let left: UInt8
    /// letter position of first interlockin letter in `left` word
    public let leftLetterPos: UInt8
    
    /// length of word that occupies`left` of rectangle
    public let leftLength: UInt8
    
    /// position of word in words list that occupyies `right` of rectangle
    public let right: UInt8
    /// letter position of first interlockin letter in `right` word
    public let rightLetterPos: UInt8
    /// length of word that occupies `right` of rectangle
    public let rightLength: UInt8
    
    /// number of letters from first interlock to last interlock of `top` and `bottom` words of rectangle or square shape
    public let interlockWidth: UInt8
    /// number of letters from first interlock to last interlock of `left` and `right` words of rectangle or square shape
    public let interlockHeight: UInt8
    
    /// type of shape rendered. valid values are `rectangle`,`topLeft`, `topRight`, `bottomLeft`, `bottomRight`
    public let type: RectangleType
    
    public init(score: Int, width: Int, height: Int,
                top: Int, topLetterPos: Int, topLength: Int,
                bottom: Int, bottomLetterPos: Int, bottomLength: Int,
                left: Int, leftLetterPos: Int, leftLength: Int,
                right: Int, rightLetterPos: Int, rightLength: Int,
                interlockWidth: Int, interlockHeight: Int, type: RectangleType) {

        self.score = UInt16(score)
        self.width = UInt8(width)
        self.height = UInt8(height)
        self.top = UInt8(top)
        self.topLetterPos = UInt8(topLetterPos)
        self.topLength = UInt8(topLength)
        self.bottom = UInt8(bottom)
        self.bottomLetterPos = UInt8(bottomLetterPos)
        self.bottomLength = UInt8(bottomLength)
        self.left = UInt8(left)
        self.leftLetterPos = UInt8(leftLetterPos)
        self.leftLength = UInt8(leftLength)
        self.right = UInt8(right)
        self.rightLetterPos = UInt8(rightLetterPos)
        self.rightLength = UInt8(rightLength)
        self.interlockWidth = UInt8(interlockWidth)
        self.interlockHeight = UInt8(interlockHeight)
        self.type = type
    }
    
    /// Converts rectangle model into placements so they can be placed into a grid.  These placements will be sorted by word id which in placement model is `i`.
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
    
    /// converting the shape into CSV
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

