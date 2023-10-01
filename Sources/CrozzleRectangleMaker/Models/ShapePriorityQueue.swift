//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 15/9/2023.
//

import Foundation
public struct ShapePriorityQueue {

    public var enqueueCount = 0
    public var dequeueCount = 0
    
    public var elements: [ShapeModel] = []

    public var dequeueHistory: Set<String> = []
    
    mutating func enqueue(_ value: ShapeModel) {
        if dequeueHistory.contains(value.wordSequence) == false {
            elements.insert(value, at: 0)
            enqueueCount += 1
        }
    }

    mutating func dequeue() -> ShapeModel? {
        guard !elements.isEmpty else {
            return nil
        }
        dequeueCount += 1
        
        let element = elements.removeFirst()
        dequeueHistory.insert(element.wordSequence)
        return element
    }

    func isEmpty() -> Bool {
        return elements.count == 0
    }
    
    mutating func sort() {
        elements.sort { $0.score > $1.score }
    }
    
    func count() -> Int {
        return elements.count
    }
}
