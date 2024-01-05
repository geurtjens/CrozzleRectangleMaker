//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 23/12/2023.
//

import Foundation
public class GetStartingData {
    
    
//    public static func ExecuteWinningWords(gameId: Int, useGuidedScores: Bool) async -> (Int,[[Int]],[ShapeModel], WordIndexModelV2, [Int], Int, Int)
//    {
//        let game = GameList().getGame(gameId: gameId)!
//        
//        let widthMax = game.widthMax
//        let heightMax = game.heightMax
//        let winningScore = game.winningScore
//        let words = game.winningWords
//        
//        let wordsInt = WordCalculator.WordsToInt(words: words)
//        
//        /// Returns `searchShapes` which have `mergeHistories`
//        let searchShapes = await getSearchShapes(gameId: gameId, words: words)
//        
//        var winningShapes = getWinningShapes(gameId: gameId)
//        
//        ShapeCalculator.setMergeHistories(
//            shapes: &winningShapes,
//            referenceShapes: searchShapes)
//        
//        let wordIndex = WordIndexModelV2(shapes: searchShapes, wordCount: words.count)
//        
//        var scoresMin = StrategyCalculator.GetScoreMins(gameId: gameId)
//        if useGuidedScores == false {
//            scoresMin = Array(repeating: 0, count: 40)
//        }
//        
//        return (winningScore, wordsInt, searchShapes, wordIndex, scoresMin, widthMax, heightMax)
//    }
//    
//    public static func GetRootNodes(rootShape: Int, rootWidth: Int, winningShapes: [ShapeModel]) -> [TreeNodeModel] {
//        let startingShapes = GetRootShapes(rootShape: rootShape, rootWidth: rootWidth, winningShapes: winningShapes)
//        
//        
//    }
//    
//    public static func GetRootShapes(rootShape: Int, rootWidth: Int, winningShapes: [ShapeModel]) -> [ShapeModel] {
//        var result: [ShapeModel] = []
//        
//        if rootWidth == 1 {
//            result.append(winningShapes[rootShape])
//        } else if rootWidth > 1 {
//            for i in 0..<rootWidth {
//                if i < winningShapes.count {
//                    result.append(winningShapes[i])
//                }
//            }
//        }
//        return result
//    }
//    
//    public static func ExecuteTreeNodes(
//        startingShapes: [ShapeModel],
//        searchShapes: [ShapeModel],
//        wordIndex: WordIndexModelV2,
//        words: [String],
//        wordsInt: [[Int]],
//        scoresMin: [Int],
//        widthMax: Int,
//        heightMax: Int
//    ) async -> [TreeNodeModel]
//    {
//        var result: [TreeNodeModel] = []
//        
//        for startingShapeId in 0..<startingShapes.count {
//            
//            let childShapes = await MergeCalculatorV2.ExecuteDifferentShapesAsync(
//                sourceShapes: [startingShapes[startingShapeId]],
//                searchShapes: searchShapes,
//                searchWordIndex: wordIndex,
//                sourceMax: 1,
//                searchMax: searchShapes.count,
//                words: words,
//                wordsInt: wordsInt,
//                scoresMin: scoresMin,
//                widthMax: widthMax,
//                heightMax: heightMax)
//            
//            let (noDuplicates, _) = RemoveDuplicatesCalculator.execute(
//                shapes: childShapes)
//            
//            let treeNode = TreeNodeModel(
//                parentShape: startingShapes[startingShapeId],
//                childShapes: noDuplicates,
//                bestDescendant: childShapes[0],
//                siblingCount: 0)
//            
//            result.append(treeNode)
//        }
//        return result
//    }
    
    
    
    
    /// Get the starting shapes and parameters for the game
    /// - Parameters:
    ///   - gameId: game identifier which tells us the widthMax and heightMax etc
    ///   - words: words used in the puzzle
    ///   - rootWidth: when a positive number it gets the best `rootWidth` number of winning games.  But if its 0 or -1 then it is repurposed to be an exact winning shape so 0 is the same as rootWidth of 1 but -1 will start with a starting shape of winningShapes[1] for example
    ///   - useGuidedScores: guided scores can be turned off if you dont want to start with the highest scoring winning shape
    /// - Returns: lots of data used by the calculation
    public static func Execute(
        gameId: Int,
        words: [String],
        rootShape: Int,
        rootWidth: Int,
        useGuidedScores: Bool) async -> (Int,[[Int]],[ShapeModel], WordIndexModelV2, [TreeNodeModel], [Int], Int, Int)
    {
        
        /// Get game parameters of widthMax, heightMax, winningScore
        let game = GameList().getGame(gameId: gameId)!
        
        let widthMax = game.widthMax
        let heightMax = game.heightMax
        let winningScore = game.winningScore
        
        let wordsInt = WordCalculator.WordsToInt(words: words)
        
        /// Returns `searchShapes` which have `mergeHistories`
        let searchShapes = await getSearchShapes(gameId: gameId, words: words)
        
        var winningShapes = getWinningShapes(gameId: gameId)
        
        ShapeCalculator.setMergeHistories(
            shapes: &winningShapes,
            referenceShapes: searchShapes)
        
        //let winningShapeIds = ShapeCalculator.getLastMergeHistoryShapeId(shapes: winningShapes)
        
        var startingShapes: [ShapeModel] = []
        
        if rootWidth == 1 {
            startingShapes.append(winningShapes[rootShape])
        } else if rootWidth > 1 {
            for i in 0..<rootWidth {
                if i < winningShapes.count {
                    startingShapes.append(winningShapes[i])
                }
            }
        }
        
        let wordIndex = WordIndexModelV2(shapes: searchShapes, wordCount: words.count)
        
        var scoresMin = StrategyCalculator.GetScoreMins(gameId: gameId)
        if useGuidedScores == false {
            scoresMin = Array(repeating: 0, count: 40)
        }
        
        var treeNodes: [TreeNodeModel] = []
        
        for startingShapeId in 0..<startingShapes.count {
            
            var childShapes = await MergeCalculatorV2.ExecuteDifferentShapesAsync(
                sourceShapes: [startingShapes[startingShapeId]],
                searchShapes: searchShapes,
                searchWordIndex: wordIndex,
                sourceMax: 1,
                searchMax: searchShapes.count,
                words: words,
                wordsInt: wordsInt,
                scoresMin: scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            childShapes = RemoveDuplicatesCalculator.execute(
                shapes: childShapes)
            
            let treeNode = TreeNodeModel(
                parentShape: startingShapes[startingShapeId],
                childShapes: childShapes,
                bestDescendant: childShapes[0],
                siblingCount: 0)
            
            treeNodes.append(treeNode)
        }
        
        
        return (winningScore, wordsInt, searchShapes, wordIndex, treeNodes, scoresMin, widthMax, heightMax)
    }
    
    public static func getSearchShapes(
        gameId: Int,
        words: [String]) async -> [ShapeModel]
    {
        var shapes = await WinningShapesAllCalculatorV3Async.execute(
            gameId: gameId,
            words: words)
        
        
        // We want a way by which the Merge History will be the same whether the code is written in C# or Swift so the word sequence which is always unique gives us a consistent numbering scheme for the MergeHistory.
        ShapeCalculator.SortByScoreThenWordSequence(
            shapes: &shapes)
        
        ShapeCalculator.setMergeHistory(
            shapes: &shapes)
        
        return shapes
    }
    
    public static func getWinningShapes(gameId: Int) -> [ShapeModel] {
        var (winningShapes, _, _, _) = WinningShapesCalculatorV1.getShapes(gameId: gameId)
        
        ShapeCalculator.SortByScoreThenArea(shapes: &winningShapes)
        
        return winningShapes
    }
}
