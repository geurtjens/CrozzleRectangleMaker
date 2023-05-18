//
//  ShapeProtocol.swift
//  
//
//  Created by Michael Geurtjens on 18/5/2023.
//

import Foundation
public protocol ShapeProtocol {
    var score: Int {get}
    var width: Int {get}
    var height: Int {get}
    
    func ToShape() -> ShapeModel
    func ToText(words: [String]) -> String
}
