//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 9/6/2023.
//

import Foundation
public class StrategyCalculator {
    
    public static func BasicStrategy() async {

        let gameList = GameList()
        for game in gameList.games {
            
            print("GAME \(game.gameId) with high score of \(game.winningScore)")
            
            let (winningShapes, words, _, _) = GameList.getShapes(gameId: game.gameId)
            
            let scoresMin = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
            
            let constraints = ConstraintsModel(
                scoresMin: scoresMin,
                wordsMax: 0,
                wordsToUse: .winningWordsOnly,
                queueLengthMax: 2000,
                priorityFunction: .score_area)
            var maxShape: ShapeModel? = nil
            var queue = QueueList(game: game, constraints: constraints)
            queue.add(shapes: winningShapes)
            
            let highScore = game.winningScore
            var maxScore: UInt16 = 0
            var i = 0
            var count = 0
            var previousCount = 0
            //(maxShape, previousCount) = queue.status()
            await queue.mergeWithItselfAll()
            while maxScore < highScore && i < 40 {
                
                
                if queue.queues[i].shapes.count > 0 {
                    await queue.mergeEverythingBelowWith(index: i)
                    
                    if let bestShape = queue.getBestShape() {
                        if bestShape.score > maxScore {
                            maxScore = bestShape.score
                            print(bestShape.ToStringExtended(words: words, gameId: game.gameId, winningScore: game.winningScore))
                        }
                        if maxScore == highScore {
                            print("High Score Reached")
                        }
                    }
                }
                i += 1
            }
            (maxShape, count) = queue.status()
            if count == previousCount {
                break
            } else {
                
                print("GAME \(game.gameId) with high score of \(game.winningScore)")
                previousCount = count
            }
        }
        
       
    }
    
    public static func Create_Fork(edges: [ShapeModel], words: [String]) -> ShapeModel {
        
        let widthMax = 17
        let heightMax = 12
        
        let white_family = ShapeCalculator.filterInclude(shapes: edges, containing: ["WHITE","FAMILY"], from: words)[0]
        print(white_family.ToString(words: words))
        
        let white_snow = ShapeCalculator.filterInclude(shapes: edges, containing: ["WHITE","SNOW"], from: words)[0]
        print(white_snow.ToString(words: words))
        
        let white_cake = ShapeCalculator.filterInclude(shapes: edges, containing: ["WHITE","CAKE"], from: words)[0]
        print(white_cake.ToString(words: words))
        
        let fork = [white_snow, white_family, white_cake]
        
        let gpuFork = GpuShapeModel(shapes: fork, totalWords: words.count, stride: 2)
        
        let mergeFork = ExecuteMergeCalculator.ExecuteSameShape(shapes: gpuFork, words: words, scoresMin: [0,0,0,0,0,0,0,0,0,0], widthMax: widthMax, heightMax: heightMax)
        
//        for item in mergeFork {
//            print(item.ToString(words: words))
//        }
        
        let gpuFork2 = GpuShapeModel(shapes: mergeFork, totalWords: words.count, stride:3)
        
        var mergeFork2 = ExecuteMergeCalculator.ExecuteSameShape(shapes: gpuFork2, words: words, scoresMin: [0,0,0,0,0,0,0,0,0,0], widthMax: widthMax, heightMax: heightMax)
        
        ShapeCalculator.SortWithWordSequence(shapes: &mergeFork2)
        
        let _ = RemoveDuplicatesCalculator.findDuplicates(shapes: &mergeFork2)
        
        
        let withoutDuplicates = RemoveDuplicatesCalculator.removeDuplicates(shapes: mergeFork2)
            
        
        
//        for item in withoutDuplicates {
//            print(item.ToString(words: words))
//        }
        
        return withoutDuplicates[0]
    }
}
