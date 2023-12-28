//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 16/9/2023.
//

/// We have `expanded a shape` to get a lot of new shapes.  All these shapes come from the same `parent shape` and so are `sibling shapes`.
/// We know that they all can expand the parent and in fact are `different choices for expanding the parent`.
/// So can these different choices also `expand the sibling`
/// Now if `sibling A can expand sibling B` then it follows that `sibling B will expand sibling A` and create a duplicate


import Foundation
public class SiblingMergeCalculator {
    
    
    public static func GetStartingData(gameId: Int) -> (ShapeModel, [ShapeModel], [ShapeModel], [Int], [String], Int, Int, Int, WordIndexModelV2,[[Int]]) {
        let (winningShapes, words, widthMax, heightMax, winningScore, startingShapeId) = StandardSearchAlgorithms.winningsMore(gameId: gameId)
        
        let wordsInt = WordCalculator.WordsToInt(words: words)
        
        let searchShapes = winningShapes
        
        
        let wordIndex = WordIndexModelV2(shapes: searchShapes, wordCount: words.count)
        
        let parentShape = searchShapes[startingShapeId]
        
        
        let scoresMin = StrategyCalculator.GetScoreMins(gameId: gameId)
        
        var childShapes = MergeCalculatorV2.ExecuteDifferentShapesSync(
            sourceShapes: [parentShape],
            searchShapes: searchShapes,
            searchWordIndex: wordIndex,
            sourceMax: 1,
            searchMax: searchShapes.count,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        childShapes.sort { $0.score > $1.score }
        
        return (parentShape, childShapes, searchShapes, scoresMin, words, widthMax, heightMax, winningScore, wordIndex, wordsInt)
    }
    
    
    public static func getAllMatchingShapes(
        wordIndex: WordIndexModelV2,
        sourceShape: ShapeModel,
        searchShapes: [ShapeModel],
        words: [String],
        wordsInt: [[Int]],
        scoresMin: [Int],
        widthMax: Int,
        heightMax: Int) async -> [ShapeModel]
    {
        
        let newShapes = await MergeCalculatorV2.ExecuteDifferentShapesAsync(
            sourceShapes: [sourceShape],
            searchShapes: searchShapes,
            searchWordIndex: wordIndex,
            sourceMax: 1,
            searchMax: searchShapes.count,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        return newShapes
    }
}
