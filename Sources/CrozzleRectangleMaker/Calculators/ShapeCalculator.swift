//
//  ShapeCalculator.swift
//  
//
//  Created by Michael Geurtjens on 25/5/2023.
//

import Foundation
public struct ShapeCalculator {
    public static func Flip(shape: ShapeModel) -> ShapeModel {
        var placements:[PlacementModel] = []
        
        for p in shape.placements {
            let reversed = PlacementModel(i: p.i, h: !p.h, x: p.y, y: p.x, length: UInt8(p.l))
            placements.append(reversed)
        }
        
        let shape = ShapeModel(score: shape.score, width: shape.height, height: shape.width, placements: placements)
        return shape
    }
}
