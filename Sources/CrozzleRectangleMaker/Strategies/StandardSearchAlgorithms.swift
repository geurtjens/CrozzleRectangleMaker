//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 15/9/2023.
//

import Foundation
public class StandardSearchAlgorithms {
    private static func winnings(gameId: Int) -> ([ShapeModel],[String],Int, Int, Int) {
        let (shapes,words,widthMax,heightMax) = WinningShapesCalculatorV1.getShapes(gameId: gameId)
        
        let winningScore = GameList().getGame(gameId: gameId)!.winningScore
        
        return (shapes, words, widthMax, heightMax, winningScore)
    }
    
    private static func winningsMore(gameId: Int) -> ([ShapeModel],[String],Int, Int, Int) {
        
        let game = GameList().getGame(gameId: gameId)!
        
        let words = game.winningWords
        
        let widthMax = game.maxWidth
        let heightMax = game.maxHeight
        
        let winningScore = game.winningScore
        
        let shapes = WinningShapesAllCalculatorV3.execute(gameId: gameId, words: game.winningWords)
        
        return (shapes, words, widthMax, heightMax, winningScore)
    }
    
    public static func depthFirstSearchV1(gameId: Int) -> (ShapeModel, Int, Int, Bool) {

        let (winningShapes, words, widthMax, heightMax, winningScore) = winnings(gameId: gameId)
        
        let wordsInt = WordCalculator.WordsToInt(words: words)
        
        var searchShapes = winningShapes
        searchShapes.sort { $0.score > $1.score }
        ShapeCalculator.SetMergeHistory(shapes: &searchShapes)
        
        let wordIndex = WordIndexModelV2(shapes: searchShapes, wordCount: words.count)
        
        let firstShape = searchShapes[0]
        
        var queue = SwiftQueue<ShapeModel>()
        
        var highestScoringShape = firstShape
        
        queue.enqueue(firstShape)
        
        let scoresMin: [Int] = Array(repeating: 0, count: 40)
        
        while !queue.isEmpty() && highestScoringShape.score < winningScore {
            
            let currentShape = queue.dequeue()!
            
            
            let newShapes = MergeCalculatorV2.ExecuteDifferentShapesSync(
                sourceShapes: [currentShape],
                searchShapes: searchShapes,
                searchWordIndex: wordIndex,
                sourceMax: 1,
                searchMax: searchShapes.count,
                words: words,
                wordsInt: wordsInt,
                scoresMin: scoresMin,
                widthMax: widthMax, heightMax: heightMax)
            
            if newShapes.count > 0 {
                
                //newShapes.sort { $0.score > $1.score }
                
                if highestScoringShape.score < newShapes[0].score {
                    highestScoringShape = newShapes[0]
                    print(highestScoringShape.ToStringExtended(words: words, gameId: gameId, winningScore: winningScore))
                }
                
                for shape in newShapes {
                    queue.enqueue(shape)
                }
            }
        }
        
        let isWinner = highestScoringShape.score >= winningScore
        
        
        return (highestScoringShape, queue.enqueueCount, queue.dequeueCount, isWinner)
        
        
    }
    
    public static func depthFirstSearchExtendedV1(gameId: Int) -> (ShapeModel, Int, Int, Bool) {

        let (winningShapes, words, widthMax, heightMax, winningScore) = winningsMore(gameId: gameId)
        
        let wordsInt = WordCalculator.WordsToInt(words: words)
        
        var searchShapes = winningShapes
        searchShapes.sort { $0.score > $1.score }
        ShapeCalculator.SetMergeHistory(shapes: &searchShapes)
        
        let wordIndex = WordIndexModelV2(shapes: searchShapes, wordCount: words.count)
        
        let firstShape = searchShapes[0]
        
        var queue = ShapePriorityQueue()
        
        var highestScoringShape = firstShape
        
        for shape in searchShapes {
            queue.enqueue(shape)
        }
        queue.sort()
        
        let scoresMin: [Int] = Array(repeating: 0, count: 40)
        
        while !queue.isEmpty() && highestScoringShape.score < winningScore {
            
            let currentShape = queue.dequeue()!
            
            
            let newShapes = MergeCalculatorV2.ExecuteDifferentShapesSync(
                sourceShapes: [currentShape],
                searchShapes: searchShapes,
                searchWordIndex: wordIndex,
                sourceMax: 1,
                searchMax: searchShapes.count,
                words: words,
                wordsInt: wordsInt,
                scoresMin: scoresMin,
                widthMax: widthMax, heightMax: heightMax)
            
            if newShapes.count > 0 {
                
                //newShapes.sort { $0.score > $1.score }
                
                if highestScoringShape.score < newShapes[0].score {
                    highestScoringShape = newShapes[0]
                    print(highestScoringShape.ToStringExtended(words: words, gameId: gameId, winningScore: winningScore))
                    print("queueCount: \(queue.count()), highestScore: \(queue.elements[0].score), dequeueHistory: \(queue.dequeueHistory.count)")
                }
                
                for shape in newShapes {
                    queue.enqueue(shape)
                }
                queue.sort()
                
            }
        }
        
        let isWinner = highestScoringShape.score >= winningScore
        
        
        return (highestScoringShape, queue.enqueueCount, queue.dequeueCount, isWinner)
        
        
    }
    
    public static func depthFirstSearchV2(gameId: Int) -> (ShapeModel, Int, Int, Bool) {
        
        
        let (winningShapes, words, widthMax, heightMax, winningScore) = winnings(gameId: gameId)
        
        let wordsInt = WordCalculator.WordsToInt(words: words)
        
        var searchShapes = winningShapes
        searchShapes.sort { $0.score > $1.score }
        ShapeCalculator.SetMergeHistory(shapes: &searchShapes)
        
        
        let wordIndex = WordIndexModelV2(shapes: searchShapes, wordCount: words.count)
        
        let firstShape = searchShapes[0]
        
        var queue = SwiftQueue<ShapeModel>()
        
        var highestScoringShape = firstShape
        
        queue.enqueue(firstShape)
        
        let scoresMin: [Int] = Array(repeating: 0, count: 40)
        
        while !queue.isEmpty() && highestScoringShape.score < winningScore {
            
            let currentShape = queue.dequeue()!
            
            
            var newShapes = MergeCalculatorV2.ExecuteDifferentShapesSync(
                sourceShapes: [currentShape],
                searchShapes: searchShapes,
                searchWordIndex: wordIndex,
                sourceMax: 1,
                searchMax: searchShapes.count,
                words: words,
                wordsInt: wordsInt,
                scoresMin: scoresMin,
                widthMax: widthMax, heightMax: heightMax)
            
            if newShapes.count > 0 {
                
                newShapes.sort { $0.score > $1.score }
                
                if highestScoringShape.score < newShapes[0].score {
                    highestScoringShape = newShapes[0]
                    print(highestScoringShape.ToStringExtended(words: words, gameId: gameId, winningScore: winningScore))
                }
                
                for shape in newShapes {
                    queue.enqueue(shape)
                }
            }
        }
        
        let isWinner = highestScoringShape.score >= winningScore
        
        
        return (highestScoringShape, queue.enqueueCount, queue.dequeueCount, isWinner)
        
        
    }
}
