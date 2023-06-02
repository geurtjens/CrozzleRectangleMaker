//
//  ConstraintsModel.swift
//  
//
//  Created by Michael Geurtjens on 2/6/2023.
//

import Foundation
public struct ConstraintsModel {
    public let scoresMin: [Int]
    public var wordsMax: Int
    public var wordsToUse: WordsUsedType
    
    public init(scoresMin: [Int], wordsMax: Int, wordsToUse: WordsUsedType) {
        self.scoresMin = scoresMin
        self.wordsMax = wordsMax
        self.wordsToUse = wordsToUse
    }
}
