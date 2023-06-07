//
//  WordCalculator.swift
//  
//
//  Created by Michael Geurtjens on 23/5/2023.
//

import Foundation
/// calculations that are necessary for processing words in the word list
public class WordCalculator {
    
    /// each word is returned backwards so that `ABC` becomes `CBA`
    public static func reverse(words:[String]) -> [String] {
        var reversedWords:[String] = []
        for word in words {
            let reversed = String(word.reversed())
            reversedWords.append(reversed)
        }
        return reversedWords
    }
    
    public static func removeLastWords(words: [String], countMax: Int) -> [String] {
        var result: [String] = []
        
        for i in 0..<countMax {
            result.append(words[i])
        }
        return result
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
