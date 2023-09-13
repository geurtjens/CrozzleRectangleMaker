//
//  WinningGamesCalculator.swift
//  
//
//  Created by Michael Geurtjens on 14/6/2023.
//

import Foundation
public class WinningGamesCalculator {
    
    public static func WinningShape(gameId: Int) -> ShapeModel {
        let (shapes, words, widthMax, heightMax) = WinningShapesCalculatorV1.getShapes(gameId: gameId)
        let wordsInt = WordCalculator.WordsToInt(words: words)
        return MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: shapes, words: words, wordsInt: wordsInt, widthMax: widthMax, heightMax: heightMax)
    }

}
