//
//  BranchAndBoundStrategyV2.swift
//
//
//  Created by Michael Geurtjens on 1/9/2023.
//

import Foundation
public class BranchAndBoundStrategyV3 {
    
    
    public static func getStartingData(gameId: Int, words: [String]) async -> (Int,[[Int]],[ShapeModel], WordIndexModelV2, TreeNodeModel, [Int], Int, Int){
        let game = GameList().getGame(gameId: gameId)!
        
        
        let widthMax = game.maxWidth
        let heightMax = game.maxHeight
        
        let winningScore = game.winningScore
        
        let wordsInt = WordCalculator.WordsToInt(words: words)
        
        var searchShapes = getShapes(gameId: gameId, words: words)
        
        
        let bestShapeExample = getBestWinningShape(gameId: gameId)
        
        var bestShapePos = getShapeBySequence(shapes: searchShapes, sequence: bestShapeExample.wordSequence)
        
        if bestShapePos == -1 {
            searchShapes = [bestShapeExample] + searchShapes
            bestShapePos = 0
        }
        
        let startingShape = searchShapes[bestShapePos]
        
        let wordIndex = WordIndexModelV2(shapes: searchShapes, wordCount: words.count)
        
        
        
        
        let scoresMin = StrategyCalculator.GetScoreMins(gameId: gameId)
        
        let sourceShapes = [startingShape]
        
        let childShapes = await MergeCalculatorV2.ExecuteDifferentShapesAsync(
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            searchWordIndex: wordIndex,
            sourceMax: sourceShapes.count,
            searchMax: searchShapes.count,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let (noDuplicates, _) = RemoveDuplicatesCalculator.execute(shapes: childShapes)
        
        let treeNode = TreeNodeModel(parentShape: startingShape, childShapes: noDuplicates, scoreMax: Int(childShapes[0].score), siblingCount: 0)
        
        
        
        return (winningScore, wordsInt, searchShapes, wordIndex, treeNode, scoresMin, game.maxWidth, game.maxHeight)
    }
    
    
    
    public static func execute(
        gameId: Int,
        words: [String],
        lookaheadDepth: Int,
        beamWidth: Int,
        repeatTimes: Int,
        winningScore: Int
    ) async -> Bool {
        
        let startTime = DateTimeCalculator.now()
        
        let (winningScore, wordsInt, searchShapes, wordIndex, treeNode, scoresMin, widthMax, heightMax) = await getStartingData(gameId: gameId, words: words)
        
        
        let bestShape = treeNode.parentShape
        print(bestShape.ToStringExtended(words: words, gameId: gameId, winningScore: winningScore))
        //print(bestShape.mergeHistory)
        

        
        /// We have to find the child nodes of the first tree node and send them
        
        
        var treeNodes = [treeNode]
        print("game: \(gameId), lookahead depth: \(lookaheadDepth), beam width: \(beamWidth)")
        for i in 0..<repeatTimes {
            
            treeNodes = SiblingMergeCalculator.executeAll(
                treeNodes: treeNodes,
                searchShapes: searchShapes,
                words: words,
                wordsInt: wordsInt,
                widthMax: widthMax,
                heightMax: heightMax,
                wordIndex: wordIndex,
                scoresMin: scoresMin)
            
            treeNodes = await SiblingMergeCalculator.executeLookaheadAndBeam(
                lookaheadDepth: lookaheadDepth,
                beamWidth: beamWidth,
                treeNodes: treeNodes,
                searchShapes: searchShapes,
                words: words,
                wordsInt: wordsInt,
                widthMax: widthMax,
                heightMax: heightMax,
                wordIndex: wordIndex,
                scoresMin: scoresMin)
                
            var bestScores: [Int] = []
            for treeNode in treeNodes {
                bestScores.append(treeNode.scoreMax)
            }
            print("cycle: \(i), bestScores: \(bestScores)")
            if bestScores.count > 0 && bestScores[0] >= winningScore {
                print("HUMAN SCORE \(gameId)")
                print(DateTimeCalculator.duration(start: startTime))
                return true
            } else if bestScores.count == 0 {
                print("FAILED \(gameId)")
                print(DateTimeCalculator.duration(start: startTime))
                return false
            } else if bestScores[0] == 0 {
                print("FAILED \(gameId)")
                print(DateTimeCalculator.duration(start: startTime))
                return false
            }
        }
            
            
        return false
    }
    
    public static func getShapes(gameId: Int, words: [String]) -> [ShapeModel] {
        var shapes = WinningShapesAllCalculatorV3.execute(gameId: gameId, words: words)
        ShapeCalculator.SortByScoreThenArea(shapes: &shapes)
        ShapeCalculator.SetMergeHistory(shapes: &shapes)
        return shapes
    }
    public static func getBestWinningShape(gameId: Int) -> ShapeModel {
        
        var (shapes, words, _, _) = WinningShapesCalculatorV1.getShapes(gameId: gameId)
        
        for shape in shapes {
            print(shape.ToText(words: words))
        }
        
        
        ShapeCalculator.SortByScoreThenArea(shapes: &shapes)
        
        let bestShape = shapes[0]
        
        return bestShape
    }
    
    public static func getShapeBySequence(shapes: [ShapeModel], sequence: String) -> Int {
        for shapeId in 0..<shapes.count {
            if shapes[shapeId].wordSequence == sequence {
                return shapeId
            }
        }
        return -1
    }
}
