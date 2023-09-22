//
//  BranchAndBoundStrategyV2.swift
//
//
//  Created by Michael Geurtjens on 1/9/2023.
//

import Foundation
public class BranchAndBoundStrategyV3 {
    
    
    public static func executeGames(games: [Int], depth: Int, width: Int, maxDepth: Int) async {
        
        let startTime = DateTimeCalculator.now()
        
        let gameList = GameList()
        
        var successfulGames: [Int] = []
        print("depth: \(depth), width: \(width), maxDepth: \(maxDepth), games to process: \(games.count)")
        print(games)
        for game in gameList.games {
            if games.contains(game.gameId) {
                
                let bestShape = await execute(
                    gameId: game.gameId,
                    words: game.winningWords,
                    lookaheadDepth: depth,
                    beamWidth: width,
                    repeatTimes: maxDepth,
                    winningScore: game.winningScore)
                
                if bestShape.score >= game.winningScore {
                    successfulGames.append(game.gameId)
                }
            }
        }
        print(successfulGames)
        print("depth: \(depth), width: \(width), games successful: \(successfulGames.count), time: \(DateTimeCalculator.duration(start: startTime))")
        if successfulGames.count == games.count {
            print("ALL GAMES SUCCEEDED")
        } else {
            let missing = Array(Set(games).subtracting(Set(successfulGames))).sorted()
            print("MISSING \(missing)")
            print("FOUND \(successfulGames)")
        }
    }
    
    public static func getStartingData(gameId: Int, words: [String]) async -> (Int,[[Int]],[ShapeModel], WordIndexModelV2, TreeNodeModel, [Int], Int, Int, [Int]){
        let game = GameList().getGame(gameId: gameId)!
        
        
        let widthMax = game.maxWidth
        let heightMax = game.maxHeight
        
        let winningScore = game.winningScore
        
        let wordsInt = WordCalculator.WordsToInt(words: words)
        
        var searchShapes = getShapes(gameId: gameId, words: words)
        
        
        var (winningShapes, _, _, _) = WinningShapesCalculatorV1.getShapes(gameId: gameId)
        ShapeCalculator.SortByScoreThenArea(shapes: &winningShapes)
        
        var winningShapeIds = getWinningShapesShapeIds(winningShapes: winningShapes, searchShapes: searchShapes)

        let bestShapePos = winningShapeIds[0]

        
//
//
//
//        if bestShapePos == -1 {
//            searchShapes = [bestShapeExample] + searchShapes
//            bestShapePos = 0
//        }
        
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
        
        let treeNode = TreeNodeModel(
            parentShape: startingShape,
            childShapes: noDuplicates,
            bestDescendant: childShapes[0],
            siblingCount: 0)
        
        
        
        return (winningScore, wordsInt, searchShapes, wordIndex, treeNode, scoresMin, game.maxWidth, game.maxHeight, winningShapeIds)
    }
    
    
    
    public static func execute(
        gameId: Int,
        words: [String],
        lookaheadDepth: Int,
        beamWidth: Int,
        repeatTimes: Int,
        winningScore: Int
    ) async -> ShapeModel {
        
        let startTime = DateTimeCalculator.now()
        
        let (winningScore, wordsInt, searchShapes, wordIndex, treeNode, scoresMin, widthMax, heightMax, winningShapeIds) = await getStartingData(gameId: gameId, words: words)
        
        
        var bestShape = treeNode.parentShape
        print(bestShape.ToStringExtended(words: words, gameId: gameId, winningScore: winningScore))
        //print(bestShape.mergeHistory)
        
        let requiredShapes = Set(winningShapeIds)
        
        /// We have to find the child nodes of the first tree node and send them
        
        var requiredBeam = 0
        
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
                
            /// Find tree node that contains all winning shapes and nothing else.  You can comment this out if you dont need to know
            let firstValidTreeNode = findFirstValidTreeNode(
                requiredShapes: requiredShapes,
                treeNodes: treeNodes)
            
            if requiredBeam < firstValidTreeNode {
                requiredBeam = firstValidTreeNode
            }
            
            if treeNodes.count > 0 {
                var bestShapes: [ShapeModel] = []
                var bestScores: [UInt16] = []
                for treeNode in treeNodes {
                    bestShapes.append(treeNode.bestDescendant)
                    bestScores.append(treeNode.bestDescendant.score)
                }
                ShapeCalculator.Sort(shapes: &bestShapes)
                
                if bestShape.score < bestShapes[0].score {
                    bestShape = bestShapes[0]
                }
                
                
                print("cycle: \(i), bestScores: \(bestScores)")
                
                
            }
            
            if bestShape.score >= winningScore {
                print("Required Beam = \(requiredBeam + 1)")
                print("HUMAN SCORE \(gameId)")
                print(DateTimeCalculator.duration(start: startTime))
                return bestShape
                
            } else if treeNodes.count == 0 {
                print("FAILED \(gameId)")
                print(DateTimeCalculator.duration(start: startTime))
                return bestShape
            }
        }
            
            
        return bestShape
    }
    
    public static func findFirstValidTreeNode(requiredShapes: Set<Int>, treeNodes: [TreeNodeModel]) -> Int
    {
        for i in 0..<treeNodes.count {
            let treeNodeMergeHistory = Set(treeNodes[i].bestDescendant.mergeHistory)
            
            let unrequiredShapes = treeNodeMergeHistory.subtracting(requiredShapes)
            
            if unrequiredShapes.count == 0 {
                return i
            }
        }
        return -1
    }
            
    public static func getShapes(gameId: Int, words: [String]) -> [ShapeModel] {
        var shapes = WinningShapesAllCalculatorV3.execute(gameId: gameId, words: words)
        ShapeCalculator.SortByScoreThenArea(shapes: &shapes)
        ShapeCalculator.SetMergeHistory(shapes: &shapes)
        return shapes
    }
    public static func getWinningShapesShapeIds(winningShapes: [ShapeModel], searchShapes: [ShapeModel]) -> [Int] {
        
        
        
//        for shape in shapes {
//            print(shape.ToText(words: words))
//        }
        
        
        
        
        var mergeHistory: [Int] = []
        
        for i in 0..<winningShapes.count {
            var shapePos = getShapeBySequence(shapes: searchShapes, sequence: winningShapes[i].wordSequence)
            if shapePos == -1 {
                print("Something wrong, winning shapes are not in searchShapes")
            } else {
                mergeHistory += searchShapes[shapePos].mergeHistory
            }
            
        }
        
        // The mergeHistory is sorted by score and so its not the actual sequence of words.  So order doesnt matter except for choosing the first word
        
        return mergeHistory
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
