//
//  PlacementModel.swift
//  
//
//  Created by Michael Geurtjens on 18/5/2023.
//

import Foundation
/// Contains instructions on how to place a word into a grid
public struct PlacementModel: Codable {

    /// word Id which is the position of the word in the given word list
    public let w: UInt8
    /// x coordinate within the grid that the word should begin
    public let x: UInt8
    /// y coordinate within the grid that the word should begin
    public let y: UInt8
    /// is Horizontal so this is true if the word is to be placed horizontally else false if vertically
    //public let z: Bool
    /// length of the word
    //public let l: UInt8
    
    public var z: Bool {
        return extra >= 100
    }
    private let extra: UInt8
    
    public var l: UInt8 {
        if extra >= 100 {
            return extra - 100
        } else {
            return extra
        }
    }
    
    public init(w: UInt8, x: UInt8, y: UInt8, z: Bool, l: UInt8) {
        self.w = w
        self.x = x
        self.y = y
        //self.z = z
        //self.l = l
        if z == true {
            extra = l + 100
        } else {
            extra = l
        }
        
    }
    
    
}
