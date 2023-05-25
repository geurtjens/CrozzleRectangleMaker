//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 23/5/2023.
//

import Foundation
public struct EdgeModel : ShapeProtocol {
    
    public let horizontalWordId: UInt8
    public let horizontalPosition: UInt8
    public let horizontalLength: UInt8
    
    public let verticalWordId: UInt8
    public let verticalPosition: UInt8
    public let verticalLength: UInt8
    
    public let width: Int
    public let height: Int
    public let score: Int

    
    public func ToPlacement() -> [PlacementModel] {
        let horizontal = PlacementModel(
            i:Int(horizontalWordId),
            h: true,
            x: 0,
            y: Int(verticalPosition) + 1,
            length: horizontalLength
        )
        let vertical = PlacementModel(
            i: Int(verticalWordId),
            h: false,
            x: Int(horizontalPosition) + 1,
            y: 0,
            length: verticalLength
        )
        return [horizontal, vertical]
    }

      
}
