//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 23/5/2023.
//

import Foundation
public struct EdgeModel : ShapeProtocol {
    
    /// first word involved in the edge.  It will have the lower wordId out of both words being interlocked, to avoid duplicates
    public let horizontalWordId: UInt8
    /// position of the interlocking letter for the horizontal word
    public let horizontalPosition: UInt8
    /// length of the horizontal word
    public let horizontalLength: UInt8
    
    /// second word involved in the edge.  It will have the higher wordId out of both words being interlocked, to avoid duplicates
    public let verticalWordId: UInt8
    /// position of the interlocking letter for the vertical word
    public let verticalPosition: UInt8
    /// length of the vertical word
    public let verticalLength: UInt8
    
    /// When shape is rendered into text, this will be the width of the text
    public let width: UInt8
    /// When shape is rendered into text, this will be the height of the text
    public let height: UInt8
    /// Score of the shape
    public let score: UInt16

    /// Convert the edge into a list of placements, a placement is an instruction of where to put a single word
    public func ToPlacement() -> [PlacementModel] {
        let horizontal = PlacementModel(
            i:horizontalWordId,
            h: true,
            x: 0,
            y: verticalPosition + 1,
            length: horizontalLength
        )
        let vertical = PlacementModel(
            i: verticalWordId,
            h: false,
            x: horizontalPosition + 1,
            y: 0,
            length: verticalLength
        )
        return [horizontal, vertical]
    }
}
