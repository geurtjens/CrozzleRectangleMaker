//
//  WordsUsedType.swift
//  
//
//  Created by Michael Geurtjens on 2/6/2023.
//

import Foundation
public enum WordsUsedType {
    /// use all words available
    case all
    /// only use the winning words to generate our shapes
    case winningWordsOnly
    /// whatever wordsMax says
    case specificNumberOfWords
}
