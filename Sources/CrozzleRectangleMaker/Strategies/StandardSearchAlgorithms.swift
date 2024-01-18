//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 15/9/2023.
//

import Foundation
public class StandardSearchAlgorithms {
    public static func winnings(gameId: Int) -> ([ShapeModel],[String],Int, Int, Int) 
    {
        let game = GameList().getGame(gameId: gameId)!
        let winningScore = game.winningScore
        let words = game.winningWords
        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let searchShapes = SearchShapesCalculator.execute(gameId: gameId, words: words)
        
        return (searchShapes, words, widthMax, heightMax, winningScore)
    }
    
    public static func winningsMore(gameId: Int) -> ([ShapeModel],[String],Int, Int, Int, Int) {
        
        let game = GameList().getGame(gameId: gameId)!
        
        let words = game.winningWords
        
        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let shapesInWinningGame = SearchShapesCalculator.executeUsingWinningWords(gameId: gameId).sorted { $0.score > $1.score}
        
        // now we must find this best winning shape within the shapes
        let startingShape = shapesInWinningGame[0]
        
        let winningScore = game.winningScore
        
        var searchShapes = SearchShapesCalculator.execute(gameId: gameId, words: game.winningWords)
        searchShapes.sort { $0.score > $1.score }
        ShapeCalculator.setMergeHistory(shapes: &searchShapes)
        
        var startingShapeId = 0
        
        for shapeId in 0..<searchShapes.count {
            if startingShape.wordSequence == searchShapes[shapeId].wordSequence {
                startingShapeId = shapeId
            }
        }
        
        return (searchShapes, words, widthMax, heightMax, winningScore, startingShapeId)
    }
    
    public static func depthFirstSearchV1(gameId: Int) -> (ShapeModel, Int, Int, Bool) {

        let (winningShapes, words, widthMax, heightMax, winningScore) = winnings(gameId: gameId)
        
        let wordsInt = WordCalculator.WordsToInt(words: words)
        
        var searchShapes = winningShapes
        searchShapes.sort { $0.score > $1.score }
        ShapeCalculator.setMergeHistory(shapes: &searchShapes)
        
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

        let (searchShapes, words, widthMax, heightMax, winningScore, startingShapeId) = winningsMore(gameId: gameId)
        
        let wordsInt = WordCalculator.WordsToInt(words: words)
        
        let wordIndex = WordIndexModelV2(shapes: searchShapes, wordCount: words.count)
        
        let firstShape = searchShapes[startingShapeId]
        
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
                
                
                if queue.dequeueHistory.count % 1000 == 0 {
                    print("dequeueHistory:\(queue.dequeueHistory.count)")
                }
            }
        }
        
        let isWinner = highestScoringShape.score >= winningScore
        
        
        return (highestScoringShape, queue.enqueueCount, queue.dequeueCount, isWinner)
        
        
    }
    
    
    public static func hillClimbingSearchExtendedV1(gameId: Int) -> (ShapeModel, Int, Int, Bool) {

        let (searchShapes, words, widthMax, heightMax, winningScore,startingShapeId) = winningsMore(gameId: gameId)
        
        let wordsInt = WordCalculator.WordsToInt(words: words)
        
        let wordIndex = WordIndexModelV2(shapes: searchShapes, wordCount: words.count)
        
        let firstShape = searchShapes[startingShapeId]
        
        var queue = ShapePriorityQueue()
        
        var highestScoringShape = firstShape
        var previousHighestShape = firstShape
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
                    previousHighestShape = highestScoringShape
                    highestScoringShape = newShapes[0]
                    print(highestScoringShape.ToStringExtended(words: words, gameId: gameId, winningScore: winningScore))
                    print("queueCount: \(queue.count()), highestScore: \(queue.elements[0].score), dequeueHistory: \(queue.dequeueHistory.count)")
                }
                
                for shape in newShapes {
                    if shape.score > previousHighestShape.score {
                        queue.enqueue(shape)
                    }
                }
                queue.sort()
                
                
                if queue.dequeueHistory.count % 1000 == 0 {
                    print("dequeueHistory:\(queue.dequeueHistory.count)")
                }
            }
        }
        
        let isWinner = highestScoringShape.score >= winningScore
        
        
        return (highestScoringShape, queue.enqueueCount, queue.dequeueCount, isWinner)
        
        
    }
    
    public static func beamSearchExtendedV1(gameId: Int, beamWidth: Int) -> (ShapeModel, Int, Int, Bool) {

        let (searchShapes, words, widthMax, heightMax, winningScore, startingShapeId) = winningsMore(gameId: gameId)
        
        let wordsInt = WordCalculator.WordsToInt(words: words)
        
        
        let wordIndex = WordIndexModelV2(shapes: searchShapes, wordCount: words.count)
        
        let firstShape = searchShapes[startingShapeId]
        
        var queue = ShapePriorityQueue()
        
        var highestScoringShape = firstShape
        for shapeId in 0..<searchShapes.count {
            if shapeId < beamWidth {
                queue.enqueue(searchShapes[shapeId])
            }
        }
        queue.sort()
        
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
                    var queueElementsScore = UInt16(0)
                    if queue.elements.count > 0 {
                        queueElementsScore = queue.elements[0].score
                    }
                    print("queueCount: \(queue.count()), highestScore: \(queueElementsScore), dequeueHistory: \(queue.dequeueHistory.count)")
                }
                
                for shapeId in 0..<newShapes.count {
                    if shapeId < beamWidth {
                        queue.enqueue(newShapes[shapeId])
                    }
                }
                queue.sort()
                
                
                if queue.dequeueHistory.count % 1000 == 0 {
                    print("queueCount: \(queue.count()), dequeueHistory: \(queue.dequeueHistory.count)")
                }
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
        ShapeCalculator.setMergeHistory(shapes: &searchShapes)
        
        
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
