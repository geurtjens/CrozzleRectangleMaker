//
//  WordCalculator.swift
//  
//
//  Created by Michael Geurtjens on 23/5/2023.
//

import Foundation
public struct WordCalculator {
    public static func reverse(words:[String]) -> [String] {
        var reversedWords:[String] = []
        for word in words {
            let reversed = String(word.reversed())
            reversedWords.append(reversed)
        }
        return reversedWords
    }
    public static func lengths(words: [String]) -> [Int] {
        var result: [Int] = []
        for word in words {
            result.append(word.count)
        }
        return result;
    }
}
