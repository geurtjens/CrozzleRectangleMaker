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
    public var queueLengthMax: Int
    public var priorityFunction: PriorityFunction
    
    
    public init(scoresMin: [Int], wordsMax: Int, wordsToUse: WordsUsedType, queueLengthMax: Int, priorityFunction: PriorityFunction) {
        self.scoresMin = scoresMin
        self.wordsMax = wordsMax
        self.wordsToUse = wordsToUse
        self.queueLengthMax = queueLengthMax
        self.priorityFunction = priorityFunction
    }
}
