//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 22/9/2023.
//

import Foundation
public class TreeNodeCalculator {
    public static func sortByBestDescendant(treeNodes: inout [TreeNodeModel]) {
        treeNodes.sort {
            if $0.bestDescendant.score == $1.bestDescendant.score {
                return $0.bestDescendant.area < $1.bestDescendant.area
            } else {
                return $0.bestDescendant.score > $1.bestDescendant.score
            }
        }
    }
}
