//
//  RectangleType.swift
//  
//
//  Created by Michael Geurtjens on 18/5/2023.
//

import Foundation
/// Contains all possible rectangle types
public enum RectangleType {
    /// rectangle with all sides connected
    case rectangle
    /// rectangle with all sides except for `topLeft` connected
    case topLeft
    /// rectangle with all sides except for `topRight` connected
    case topRight
    /// rectangle with all sides except for `bottomLeft` connected
    case bottomLeft
    /// rectangle with all sides except for `bottomRight` connected
    case bottomRight
}
