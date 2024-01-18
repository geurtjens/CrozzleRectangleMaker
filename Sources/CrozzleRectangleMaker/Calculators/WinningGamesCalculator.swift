//
//  WinningGamesCalculator.swift
//  
//
//  Created by Michael Geurtjens on 14/6/2023.
//

import Foundation
public class WinningGamesCalculator {
    
    public static func WinningShape(gameId: Int) -> ShapeModel {
        
        let game = GameList().getGame(gameId: gameId)!
        //let winningScore = game.winningScore
        let words = game.winningWords
        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let searchShapes = SearchShapesCalculator.execute(gameId: gameId, words: words)
        
        let wordsInt = WordCalculator.WordsToInt(words: words)
        return MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: searchShapes, words: words, wordsInt: wordsInt, widthMax: widthMax, heightMax: heightMax)
    }

}
