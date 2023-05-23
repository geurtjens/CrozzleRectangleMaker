//
//  ScoreCalculator.swift
//  
//
//  Created by Michael Geurtjens on 17/5/2023.
//

import Foundation
public struct ScoreCalculator {
    /// Score of one interlocked letter.  Always pass in a capital letter.
    /// - Parameter letter: A letter from "A" to "Z" which was interlocked
    /// - Returns: The score for interlocking that letter
    public static func score(forLetter letter: Character) -> Int {
        switch letter {
        case "A", "B", "C", "D", "E", "F":
            return 2
        case "G","H","I","J","K","L":
            return 4
        case "M","N","O","P","Q","R":
            return 8
        case "S","T","U","V","W","X":
            return 16
        case "Y":
            return 32
        case "Z":
            return 64
        default:
            return 0
        }
    }
    public static func square(topLeft: Character, topRight: Character, bottomLeft: Character, bottomRight: Character ) -> Int {
        let score = score(forLetter:topLeft) + score(forLetter:topRight) + score(forLetter:bottomLeft) + score(forLetter:bottomRight) + 40
        return score
    }
    public static func openTopLeft(topRight: Character, bottomLeft: Character, bottomRight: Character ) -> Int {
        let score = score(forLetter:topRight) + score(forLetter:bottomLeft) + score(forLetter:bottomRight) + 40
        return score
    }
    public static func openTopRight(topLeft: Character, bottomLeft: Character, bottomRight: Character ) -> Int {
        let score = score(forLetter:topLeft) + score(forLetter:bottomLeft) + score(forLetter:bottomRight) + 40
        return score
    }
    public static func openBottomRight(topLeft: Character, topRight: Character, bottomLeft: Character) -> Int {
        let score = score(forLetter:topLeft) + score(forLetter:bottomLeft) + score(forLetter:bottomLeft) + 40
        return score
    }
}
