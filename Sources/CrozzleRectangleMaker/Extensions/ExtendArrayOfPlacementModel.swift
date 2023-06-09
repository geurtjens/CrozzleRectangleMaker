//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 15/6/2023.
//

import Foundation
extension Array where Element == PlacementModel {
    
    func width() -> UInt8 {
        return PlacementCalculator.width(fromPlacements: self)
    }
    
    func height() -> UInt8 {
        return PlacementCalculator.height(fromPlacements: self)
    }
    
    func toShape(score: UInt16) -> ShapeModel {
        return ShapeModel(score: score, width: width(), height: height(), placements: self)
    }
}
