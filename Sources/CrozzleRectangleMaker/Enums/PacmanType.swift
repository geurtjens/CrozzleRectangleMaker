//
//  PacmanType.swift
//  
//
//  Created by Michael Geurtjens on 6/6/2023.
//

import Foundation
public enum PacmanType {
    /// rectangle with all sides except for `topLeft` connected
    case topLeft
    /// rectangle with all sides except for `topRight` connected
    case topRight
    /// rectangle with all sides except for `bottomLeft` connected
    case bottomRight
}
