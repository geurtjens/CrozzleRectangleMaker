//
//  EdgeCalculator.swift
//  
//
//  Created by Michael Geurtjens on 23/5/2023.
//

import Foundation
public class EdgeCalculator {

    /// Finds all edges found within an array of words
    /// - Parameter wordList: A list of words
    /// - Returns: A list of valid edges
    public static func Execute(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [EdgeModel] {
        let wordListSize = words.count
        
        var result: [EdgeModel] = []
        
        for horizontalWordId in 0..<wordListSize {
            
            let horizontalWord = words[horizontalWordId]
            
            for horizontalLetter in 0..<horizontalWord.count {
                
                for verticalWordId in (horizontalWordId + 1)..<wordListSize {
                    
                    let verticalWord = words[verticalWordId];
                    
                    for verticalLetter in 0..<verticalWord.count {
                        
                        if verticalWord[verticalLetter] == horizontalWord[horizontalLetter] {
                            
                            let score = ScoreCalculator.score(forLetter:horizontalWord[horizontalLetter]) + 20
                            
                            if score >= scoreMin {
                                
                                let width = horizontalWord.count + 2
                                
                                let height = verticalWord.count + 2
                            
                                if (width <= widthMax && height <= heightMax) || (width <= heightMax && height <= widthMax) {
                                    
                                    result.append(EdgeModel(
                                        horizontalWordId: UInt8(horizontalWordId),
                                        horizontalPosition: UInt8(horizontalLetter),
                                        horizontalLength: UInt8(horizontalWord.count),
                                        
                                        verticalWordId: UInt8(verticalWordId),
                                        verticalPosition: UInt8(verticalLetter),
                                        verticalLength: UInt8(verticalWord.count),
                                        
                                        width: width,
                                        height: height,
                                        score: score
                                    ))
                                }
                            }
                        }
                    }
                }
            }
        }
        return result
    }
}
