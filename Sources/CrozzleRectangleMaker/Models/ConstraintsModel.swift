//
//  ConstraintsModel.swift
//  
//
//  Created by Michael Geurtjens on 2/6/2023.
//

import Foundation
public struct ConstraintsModel {
    public let words: [String]
    public let scoresMin: [Int]
//    public var widthMax: Int = 17
//    public var heightMax: Int = 12
    public var queueLengthMax: Int
    public var priorityFunction: PriorityFunction
    public var shapeConstraints: [ShapeConstraintModel]
    public var recalculateStatisticsWhenAddingToQueue = false
    public let maxQueues = 40
    
    public init(words: [String], scoresMin: [Int], queueLengthMax: Int, priorityFunction: PriorityFunction) {
        self.words = words
        self.scoresMin = scoresMin
        self.queueLengthMax = queueLengthMax
        self.priorityFunction = priorityFunction
        self.shapeConstraints = []
    }
    
    public init(words: [String], shapeConstraints: [ShapeConstraintModel], scoresMin: [Int], queueLengthMax: Int, priorityFunction: PriorityFunction) {
        self.words = words
        self.shapeConstraints = shapeConstraints
        self.scoresMin = scoresMin
        self.queueLengthMax = queueLengthMax
        self.priorityFunction = priorityFunction
        self.shapeConstraints = []
    }
}
