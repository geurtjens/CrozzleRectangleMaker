//
//  PlacementModel.swift
//  
//
//  Created by Michael Geurtjens on 18/5/2023.
//

import Foundation
public struct PlacementModel {
    
    public var i: Int { get { return Int(_i) } }
    public var x: Int { get { return Int(_x) } }
    public var y: Int { get { return Int(_y) } }
    public var l: Int { get { return Int(_length)}}
    public let h: Bool // Is horizontal
    
    let _i: UInt8 // word id
     
    let _x: UInt8
    let _y: UInt8
    let _length: UInt8
    init(i: Int, h: Bool, x: Int, y: Int, length: UInt8) {
        self._i = UInt8(i)
        self.h = h
        self._x = UInt8(x)
        self._y = UInt8(y)
        self._length = length
    }
}
