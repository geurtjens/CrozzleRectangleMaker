//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 17/9/2023.
//

import Foundation
public struct TreeNodeList {
    public var levels: [TreeNodeModel] = []
    
    public var currentNodeInLevel: Int = 0
    
    /// This should really be in a separate structure so we can have many of them
    public var currentLevel: Int = 0
    
}
