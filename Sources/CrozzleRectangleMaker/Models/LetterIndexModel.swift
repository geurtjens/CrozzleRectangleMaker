//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 14/8/2023.
//

import Foundation
public struct LetterIndexModel {
    
    public let index: [[LetterIndexItemModel]]
    
    public init(words: [String]) {
        var letterArray: [[LetterIndexItemModel]] = Array(repeating: [], count: 26)
        
        for wordId in 0..<words.count {
            let word = words[wordId]
            let wordLength = word.count
            for letterPos in 0..<wordLength {
                let letter = word[letterPos]
                
                let letterArrayPos = Int(letter.asciiValue! - 65)
                
                let fromEndPos = wordLength - letterPos - 1
                
                let letterIndexItem = LetterIndexItemModel(wordId: wordId, fromStartPos: letterPos, fromEndPos: UInt8(fromEndPos))
                
                letterArray[letterArrayPos].append(letterIndexItem)
            }
        }
        self.index = letterArray
    }
    
    public func find(letter: Character) -> [LetterIndexItemModel] {
        let letterPos = Int(letter.asciiValue! - 65)
        
        return self.index[letterPos]
    }
}
