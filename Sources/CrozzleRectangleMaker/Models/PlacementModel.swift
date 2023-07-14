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
    public let i: UInt8
    
    /// is Horizontal so this is true if the word is to be placed horizontally else false if vertically
    public let h: Bool
    /// x coordinate within the grid that the word should begin
    public let x: UInt8
    /// y coordinate within the grid that the word should begin
    public let y: UInt8
    /// length of the word
    public let l: UInt8
    
}
