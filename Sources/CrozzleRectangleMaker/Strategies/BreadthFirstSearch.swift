//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 20/9/2023.
//

import Foundation
public class BreadthFirstSearch {
    
    public static func executeAllInParallel() async {
        let successfulBreadthFirstSearch_Max_3_000_000 = [
            8612, 8703, 8705, 8710, 8712, 8802, 8803, 8805, 8808, 8811,
            8812, 8902, 8903, 8910, 8912, 9002, 9007, 9011, 9102, 9105,
            9106, 9109, 9110, 9111, 9112, 9201, 9202, 9203, 9207, 9208,
            9209, 9302, 9306, 9308, 9309, 9310, 9311, 9312
        ]
        
        let successfulBreadthFirstSearch_Max_5_000_000 = [
            9010
        ]

        let successfulBreadthFirstSearch_Max_8_000_000 = [
            8810, 9605
        ]

        let gameList = GameList()
        let startingBreadthFirstSearch = DateTimeCalculator.now()
        for game in gameList.games {
            if (successfulBreadthFirstSearch_Max_3_000_000.contains(game.gameId) || successfulBreadthFirstSearch_Max_5_000_000.contains(game.gameId) ||
                successfulBreadthFirstSearch_Max_8_000_000.contains(game.gameId)
            ) {  //&& game.gameId <= 9401 {
                await executeInParallel(gameId: game.gameId, maxLevels: 25, useCalculatedScoresMin: true, maxAllowableSize: 8_000_000)
                print("")
            }
        }
        let finishingBreadthFirstSearch = DateTimeCalculator.now()
        print("Breadth First Search in Parallel duration: \(DateTimeCalculator.duration(start: startingBreadthFirstSearch, finish: finishingBreadthFirstSearch))")
    }
    
    public static func executeAllInSerial() {
        let gamesWithMax_3_000_000 = [
            8612, 8703, 8705, 8710, 8712, 8802, 8803, 8805, 8808, 8811,
            8812, 8902, 8903, 8910, 8912, 9002, 9007, 9011, 9102, 9105,
            9106, 9109, 9110, 9111, 9112, 9201, 9202, 9203, 9207, 9208,
            9209, 9302, 9306, 9308, 9309, 9310, 9311, 9312
        ]
        
        let gamesWithMax_5_000_000 = [
            9010
        ]

        let gamesWithMax_8_000_000 = [
            8810, 9605
        ]

        let listOfGames =
                gamesWithMax_3_000_000 +
                gamesWithMax_5_000_000 +
                gamesWithMax_8_000_000
        
        let gameList = GameList()
        let startingBreadthFirstSearch = DateTimeCalculator.now()
        for game in gameList.games {
            if listOfGames.contains(game.gameId) {
                
                executeInSerial(gameId: game.gameId, maxLevels: 25, useCalculatedScoresMin: true, maxAllowableSize: 8_000_000)
                print("")
                
            }
        }
        let finishingBreadthFirstSearch = DateTimeCalculator.now()
        print("Breadth First Search In Serial duration: \(DateTimeCalculator.duration(start: startingBreadthFirstSearch, finish: finishingBreadthFirstSearch))")
    }
    
    
    
    public static func executeInSerial(
        gameId: Int,
        maxLevels: Int = 20,
        useCalculatedScoresMin: Bool = true,
        exitWhenHumanScoreFound: Bool = true,
        maxAllowableSize: Int = 1_500_000) {
        
        
        
        let startTime = DateTimeCalculator.now()
        
        let (parentShape, childShapes, searchShapes, scoresMin, words, widthMax, heightMax, winningScore, wordIndex, wordsInt) = SiblingMergeCalculator.GetStartingData(gameId: gameId)
        
        var totalNodes = 1 + childShapes.count
        
        var scoresMin2 = scoresMin
        if useCalculatedScoresMin == false {
            scoresMin2 = Array(repeating: 0, count: 40)
        }
        
        let treeNode = TreeNodeModel(
            parentShape: parentShape,
            childShapes: childShapes,
            bestDescendant: childShapes[0],
            siblingCount: 0)
        
        print("\nBreadth First Search in Serial\ngameId: \(gameId), search shapes: \(searchShapes.count), winning score: \(winningScore)")
        print("level: 0, score: \(treeNode.parentShape.score), size: 1")
            print("level: 1, score: \(treeNode.bestDescendant.score), size: \(treeNode.childShapes.count)")
        var previous = [treeNode]
        for i in 2..<maxLevels {
            
            let treeNodes = executeLevelInSerial(treeNodes: previous, searchShapes: searchShapes, words: words, wordsInt: wordsInt, widthMax: widthMax, heightMax: heightMax, wordIndex: wordIndex, scoresMin: scoresMin2)
            
            
            let (treeNodesWithoutDuplicates, duplicateCount) = RemoveDuplicatesCalculator.execute(treeNodes: treeNodes)
            
            totalNodes += treeNodesWithoutDuplicates.count
            
            let size = SiblingMergeCalculator.countLeafs(treeNodes: treeNodesWithoutDuplicates)
            let score = SiblingMergeCalculator.getBestScore(treeNodes: treeNodesWithoutDuplicates)
            
            previous = treeNodesWithoutDuplicates
            
            if score >= winningScore {
                print("level: \(i), score: \(score), size: \(size), duplicates removed: \(duplicateCount), HUMAN SCORE REACHED for \(gameId)")
                
                if exitWhenHumanScoreFound {
                    let finishTime = DateTimeCalculator.now()
                    print("\(totalNodes) nodes traversed in: \(DateTimeCalculator.duration(start: startTime, finish: finishTime))")
                    return
                }
            }
            print("level: \(i), score: \(score), size: \(size), duplicates removed: \(duplicateCount)")
            
            if size > maxAllowableSize {
                print("size is greater than max size of \(maxAllowableSize) so exiting")
                let finishTime = DateTimeCalculator.now()
                print("\(totalNodes) nodes traversed in: \(DateTimeCalculator.duration(start: startTime, finish: finishTime))")
                return
            }
            
            if size == 0 {
                let finishTime = DateTimeCalculator.now()
                print("\(totalNodes) nodes traversed in: \(DateTimeCalculator.duration(start: startTime, finish: finishTime))")
                return
            }
        }
        let finishTime = DateTimeCalculator.now()
        print("\(totalNodes) nodes traversed in: \(DateTimeCalculator.duration(start: startTime, finish: finishTime))")
    }
    
    
    public static func executeInParallel(
        gameId: Int,
        maxLevels: Int = 20,
        useCalculatedScoresMin: Bool = true,
        exitWhenHumanScoreFound: Bool = true,
        maxAllowableSize: Int = 1_500_000) async {
        
        
        let startTime = DateTimeCalculator.now()
        
        let (parentShape, childShapes, searchShapes, scoresMin, words, widthMax, heightMax, winningScore, wordIndex, wordsInt) = SiblingMergeCalculator.GetStartingData(gameId: gameId)
        
        var totalNodes = 1 + childShapes.count
        
        var scoresMin2 = scoresMin
        if useCalculatedScoresMin == false {
            scoresMin2 = Array(repeating: 0, count: 40)
        }
        
        let treeNode = TreeNodeModel(
            parentShape: parentShape,
            childShapes: childShapes,
            bestDescendant: childShapes[0],
            siblingCount: 0)
        
        print("\nBreadth First Search in Parallel\ngameId: \(gameId), search shapes: \(searchShapes.count), winning score: \(winningScore)")
        print("level: 0, score: \(treeNode.parentShape.score), size: 1")
        print("level: 1, score: \(treeNode.bestDescendant.score), size: \(treeNode.childShapes.count)")
        var previous = [treeNode]
        for i in 2..<maxLevels {
//            let treeNodes = executeAll(treeNodes: previous, searchShapes: searchShapes, words: words, wordsInt: wordsInt, widthMax: widthMax, heightMax: heightMax, wordIndex: wordIndex, scoresMin: scoresMin2)
            let treeNodes = await executeLevelInParallel(
                treeNodes: previous,
                searchShapes: searchShapes,
                words: words,
                wordsInt: wordsInt,
                widthMax: widthMax,
                heightMax: heightMax,
                wordIndex: wordIndex,
                scoresMin: scoresMin2)
            
            let (treeNodesWithoutDuplicates, duplicateCount) = RemoveDuplicatesCalculator.execute(treeNodes: treeNodes)
            
            totalNodes += treeNodesWithoutDuplicates.count
            
            let size = SiblingMergeCalculator.countLeafs(treeNodes: treeNodesWithoutDuplicates)
            let score = SiblingMergeCalculator.getBestScore(treeNodes: treeNodesWithoutDuplicates)
            
            previous = treeNodesWithoutDuplicates
            
            if score >= winningScore {
                print("level: \(i), score: \(score), size: \(size), duplicates removed: \(duplicateCount), HUMAN SCORE REACHED for \(gameId)")
                
                if exitWhenHumanScoreFound {
                    let finishTime = DateTimeCalculator.now()
                    print("\(totalNodes) nodes traversed in: \(DateTimeCalculator.duration(start: startTime, finish: finishTime))")
                    return
                }
            }
            print("level: \(i), score: \(score), size: \(size), duplicates removed: \(duplicateCount)")
            
            if size > maxAllowableSize {
                print("size is greater than max size of \(maxAllowableSize) so exiting")
                let finishTime = DateTimeCalculator.now()
                print("\(totalNodes) nodes traversed in: \(DateTimeCalculator.duration(start: startTime, finish: finishTime))")
                return
            }
            
            if size == 0 {
                let finishTime = DateTimeCalculator.now()
                print("\(totalNodes) nodes traversed in: \(DateTimeCalculator.duration(start: startTime, finish: finishTime))")
                return
            }
        }
        let finishTime = DateTimeCalculator.now()
        print("\(totalNodes) nodes traversed in: \(DateTimeCalculator.duration(start: startTime, finish: finishTime))")
    }
    
    
    public static func executeLevelInSerial(
        treeNodes: [TreeNodeModel],
        searchShapes: [ShapeModel],
        words: [String],
        wordsInt: [[Int]],
        widthMax: Int,
        heightMax: Int,
        wordIndex: WordIndexModelV2,
        scoresMin: [Int]) -> [TreeNodeModel] {
            
        var result:[TreeNodeModel] = []
            
        for treeNodeId in 0..<treeNodes.count {
               
            let treeNodes = SiblingMergeCalculator.execute(treeNode: treeNodes[treeNodeId], searchShapes: searchShapes, words: words, wordsInt: wordsInt, widthMax: widthMax, heightMax: heightMax, wordIndex: wordIndex, scoresMin: scoresMin)
            
            result += treeNodes
        }
        return result
    }
    
    
    public static func executeLevelInParallel(
        treeNodes: [TreeNodeModel],
        searchShapes: [ShapeModel],
        words: [String],
        wordsInt: [[Int]],
        widthMax: Int,
        heightMax: Int,
        wordIndex: WordIndexModelV2,
        scoresMin: [Int]) async -> [TreeNodeModel] {
        
        async let a0 = executeAsync(
            zeroToNine: 0,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a1 = executeAsync(
            zeroToNine: 1,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a2 = executeAsync(
            zeroToNine: 2,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a3 = executeAsync(
            zeroToNine: 3,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a4 = executeAsync(
            zeroToNine: 4,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a5 = executeAsync(
            zeroToNine: 5,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a6 = executeAsync(
            zeroToNine: 6,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a7 = executeAsync(
            zeroToNine: 7,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a8 = executeAsync(
            zeroToNine: 8,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a9 = executeAsync(
            zeroToNine: 9,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
       
        return await a0 + a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9
    }
    
    public static func executeAsync( zeroToNine: Int,
                                                treeNodes: [TreeNodeModel],
                                                searchShapes: [ShapeModel],
                                                words: [String],
                                                wordsInt: [[Int]],
                                                widthMax: Int,
                                                heightMax: Int,
                                                wordIndex: WordIndexModelV2,
                                     scoresMin: [Int]) async -> [TreeNodeModel] {
        var result:[TreeNodeModel] = []
        
        // The difference is that each cpu works on 0,10,20 .. or 1, 11, 21 and so we divide the task
        for treeNodeId in stride(from: zeroToNine, to:treeNodes.count, by: 10) {
            
            let treeNodes = SiblingMergeCalculator.execute(treeNode: treeNodes[treeNodeId], searchShapes: searchShapes, words: words, wordsInt: wordsInt, widthMax: widthMax, heightMax: heightMax, wordIndex: wordIndex, scoresMin: scoresMin)
            result += treeNodes
            
        }
        return result
    }
}
