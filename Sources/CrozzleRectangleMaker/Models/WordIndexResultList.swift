//
//  WordIndexResultList.swift
//  
//
//  Created by Michael Geurtjens on 29/7/2023.
//

import Foundation
public struct WordIndexResultList {
    public let sourceShapeId: Int
    public let searchShapeId: Int
    public let matchingOrientation: Bool
    public let matches: [WordIndexResultModel]
    public let width: UInt8
    public let height: UInt8
}
