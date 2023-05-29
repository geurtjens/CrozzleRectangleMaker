//
//  PlacementModel.swift
//  
//
//  Created by Michael Geurtjens on 18/5/2023.
//

import Foundation
public struct PlacementModel {
    
    //public var i: Int { get { return Int(_i) } }
    //public var x: Int { get { return Int(_x) } }
    //public var y: Int { get { return Int(_y) } }
    //public var l: Int { get { return Int(_length)}}
    
    
    public let i: UInt8 // word id
    public let h: Bool // Is horizontal
    public let x: UInt8
    public let y: UInt8
    public let l: UInt8
    init(i: UInt8, h: Bool, x: UInt8, y: UInt8, length: UInt8) {
        self.i = UInt8(i)
        self.h = h
        self.x = UInt8(x)
        self.y = UInt8(y)
        self.l = length
    }
}
