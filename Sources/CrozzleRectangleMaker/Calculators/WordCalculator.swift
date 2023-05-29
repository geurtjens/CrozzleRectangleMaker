//
//  WordCalculator.swift
//  
//
//  Created by Michael Geurtjens on 23/5/2023.
//

import Foundation
/// calculations that are necessary for processing words in the word list
public struct WordCalculator {
    
    /// each word is returned backwards so that `ABC` becomes `CBA`
    public static func reverse(words:[String]) -> [String] {
        var reversedWords:[String] = []
        for word in words {
            let reversed = String(word.reversed())
            reversedWords.append(reversed)
        }
        return reversedWords
    }
    
    /// Calculates the lengths of each word in the list
    public static func lengths(words: [String]) -> [Int] {
        var result: [Int] = []
        for word in words {
            result.append(word.count)
        }
        return result;
    }
}
