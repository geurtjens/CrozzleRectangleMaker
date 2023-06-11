//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 11/6/2023.
//

import Foundation
public struct JsonShapeModel: Codable {
    public let id: Int
    public let name: String
    public let score: Int
    public let potential: Int
    public let h:[String]
    public let v:[String]
    public let text: String
    public let isWinner: Bool
    public let position: Int
    public let activated: Bool
    public let highlighted: Bool
    public let hPos: [xy]
    public let vPos: [xy]
    public let hid: [Int]
    public let vid: [Int]
    public let pattern: String
    public let interlocks: [xy]
    public let offset: xy
    public let size: xy
    public let grid: [String]
}

public struct xy : Codable {
    public let x: Int
    public let y: Int
}
