//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 23/5/2023.
//

import Foundation
public struct EdgeModel : ShapeProtocol {
    
    let horizontalWordId: UInt8
    let horizontalPosition: UInt8
    let horizontalLength: UInt8
    
    let verticalWordId: UInt8
    let verticalPosition: UInt8
    let verticalLength: UInt8
    
    public let width: Int
    public let height: Int
    public let score: Int

    
    public func ToPlacement() -> [PlacementModel] {
        let horizontal = PlacementModel(
            i:Int(horizontalWordId),
            h: true,
            x: 0,
            y: Int(verticalPosition) + 1
        )
        let vertical = PlacementModel(
            i: Int(verticalWordId),
            h: false,
            x: Int(horizontalPosition) + 1,
            y: 0
        )
        return [horizontal, vertical]
    }

      
}
