//
//  LetterIndexItemModel.swift
//  
//
//  Created by Michael Geurtjens on 14/8/2023.
//

import Foundation
/// Used to store the exact positions of a particular letter in each of the words of the game
public struct LetterIndexItemModel {
    /// The position of the word in the sequence
    let id: Int
    /// The position of the letter from the start of the word
    let start: Int
    /// The position of the letter from the end of the word
    let end: UInt8
}
