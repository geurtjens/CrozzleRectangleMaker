//
//  WordCalculator.swift
//  
//
//  Created by Michael Geurtjens on 23/5/2023.
//

import Foundation
/// calculations that are necessary for processing words in the word list
public class WordCalculator {
    
    /// We have a list of words that we want the wordId for
    public static func extractPositions(ofWords search: [String], from words: [String] ) -> [UInt8] {
        var result: [UInt8] = []
        var notFound: [String] = []
        for word in search {
            let wordId = extractWordId(search: word, words:words)
            if wordId >= 0 {
                result.append(UInt8(wordId))
            }
            else {
                notFound.append(word)
            }
        }
        
        if notFound.count > 0 {
            print("Words Not found in extractPositions are: \(notFound)")
        }
        return result
    }
    
    /// We have a list of words that we want the wordId for
    public static func extractWordId(search: String, words: [String] ) -> Int {
        for i in 0..<words.count {
            if words[i] == search {
                return i
            }
        }
        return -1
    }
    
    /// each word is returned backwards so that `ABC` becomes `CBA`
    public static func reverse(words:[String]) -> [String] {
        var reversedWords:[String] = []
        for word in words {
            let reversed = String(word.reversed())
            reversedWords.append(reversed)
        }
        return reversedWords
    }
    
    public static func reverse(wordsInt words:[[Int]]) -> [[Int]] {
        var reversedWords:[[Int]] = []
        for word in words {
            reversedWords.append(reverse(wordInt: word))
        }
        return reversedWords
    }
    
    public static func reverse(wordInt word: [Int]) -> [Int] {
        var result:[Int] = []
        
        let n: Int = word.count;
        
        for i in stride(from: n - 1, to: 0, by: -1) {
            result.append(word[i])
        }
        
        return result;
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
    
    public static func lengths(int words: [[Int]]) -> [Int] {
        var result: [Int] = []
        for word in words {
            result.append(word.count)
        }
        return result;
    }
    
    
    public static func WordsToUInt8(words: [String])-> [[UInt8]] {
        var result: [[UInt8]] = []
        for word in words {
            result.append(WordToUInt8(word: word))
        }
        return result;
    }
    
    public static func WordToUInt8(word: String)-> [UInt8] {
        var result: [UInt8] = []
        for letter in word {
            result.append(letter.asciiValue!)
        }
        return result;
    }
    
    public static func WordsToInt(words: [String])-> [[Int]] {
        var result: [[Int]] = []
        for word in words {
            result.append(WordToInt(word: word))
        }
        return result;
    }
    
    public static func WordToInt(word: String)-> [Int] {
        var result: [Int] = []
        for letter in word {
            result.append(Int(letter.asciiValue!))
        }
        return result;
    }
    
    public static func lengths8(words: [String]) -> [UInt8] {
        var result: [UInt8] = []
        for word in words {
            result.append(UInt8(word.count))
        }
        return result;
    }
    
    public static func lowercase(words: [String]) -> [String] {
        var result: [String] = []
        for word in words {
            result.append(word.lowercased() + "_")
        }
        return result
    }
}
