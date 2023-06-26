//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 26/6/2023.
//

import Foundation
/// Capture the location and contents of each interlock as found in the grid
public struct InterlockModel : Hashable {
    
    /// x position that the interlock was found within a grid
    public let x: Int
    
    /// y position that the interlock was found within a grid
    public let y: Int
    
    /// word found in horizontal direction
    public let horizontalWord: String
    
    /// word found in vertical direction
    public let verticalWord: String
    
    /// letter in horizontal word that is interlocked
    public let horizontalPos: Int
    
    /// letter in vertical word that is interlocked
    public let verticalPos: Int
    
    private func toString(word: String, pos: Int) -> String{
        var h = ""
        for i in 0..<word.count {
            if i == horizontalPos {
                h += String(word[i]).lowercased()
            } else {
                h += String(word[i]).uppercased()
            }
        }
        return h
    }
    
    public func toString() -> String {
        
        
        
        return "\(toString(word: horizontalWord, pos: horizontalPos)):\(toString(word: verticalWord, pos: verticalPos))"
    }
}
