//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 15/9/2023.
//

import Foundation
public struct SwiftQueue<T> {

    public var enqueueCount = 0
    public var dequeueCount = 0
    
    public var elements: [T] = []

    mutating func enqueue(_ value: T) {
        elements.insert(value, at: 0)
        enqueueCount += 1
    }

    mutating func dequeue() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        dequeueCount += 1
        return elements.removeFirst()
    }

    func isEmpty() -> Bool {
        return elements.count == 0
    }
    
    func count() -> Int {
        return elements.count
    }
    
    var head: T? {
        return elements.first
    }

    var tail: T? {
        return elements.last
    }
}
