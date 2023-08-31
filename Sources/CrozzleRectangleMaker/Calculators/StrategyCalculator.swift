//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 9/6/2023.
//

import Foundation
public class StrategyCalculator {
    
    
    public static func tryMergeWithLowerOnly(gamesToProcess: [Int], queueLength: Int, repeatTimes: Int = 1) async {
        let gameList = GameList()
        let startTime = DateTimeCalculator.now()
        for game in gameList.games {
            let words = game.winningWords
            
            if gamesToProcess.contains(game.gameId) {
                print("## GAME: \(game.gameId), queue: \(queueLength)")
                
                let _ = await TryMergeWithLowerOnly(game: game, words: words, queueLength: queueLength, highScore: game.winningScore, repeatTimes: repeatTimes)
                
                print("")
                print("")
            }
        }
        let finishTime = DateTimeCalculator.now()
        let duration = DateTimeCalculator.duration(start: startTime, finish: finishTime)
        print("TOTAL DURATION \(queueLength) = \(duration)")
    }
    
    public static func mergeWithOriginalShapesOnly(gamesToProcess: [Int], queueLength: Int, repeatTimes: Int = 1) async {
        let gameList = GameList()
        let startTime = DateTimeCalculator.now()
        for game in gameList.games {
            let words = game.winningWords
            
            if gamesToProcess.contains(game.gameId) {
                print("## GAME: \(game.gameId), queue: \(queueLength)")
                
                let _ = await mergeWithOriginalShapeOnly(game: game, words: words, queueLength: queueLength, highScore: game.winningScore, repeatTimes: repeatTimes)
                
                print("")
                print("")
            }
        }
        let finishTime = DateTimeCalculator.now()
        let duration = DateTimeCalculator.duration(start: startTime, finish: finishTime)
        print("TOTAL DURATION \(queueLength) = \(duration)")
    }
    
    public static func tryMergeWithItselfAndBelow(gamesToProcess: [Int], queueLength: Int, repeatTimes: Int = 1) async {
        let gameList = GameList()
        let startTime = DateTimeCalculator.now()
        for game in gameList.games {
            let words = game.winningWords
            
            if gamesToProcess.contains(game.gameId) {
                print("## GAME: \(game.gameId), queue: \(queueLength)")
                
                let _ = await TryMergeWithItselfAndBelow(game: game, words: words, queueLength: queueLength, highScore: game.winningScore, repeatTimes: repeatTimes)
                
                print("")
                print("")
            }
        }
        let finishTime = DateTimeCalculator.now()
        let duration = DateTimeCalculator.duration(start: startTime, finish: finishTime)
        print("TOTAL DURATION \(queueLength) = \(duration)")
    }
    
    
    
    
    
    public static func gamesThatHaventWonYet() async {
        /// We added extra 8612 and 8710`
        let gamesWon = [8612,   8705,8710,8712,
                        8803,8805,8808,8809,8811,8812,
                        8902,8903,8904,8906,8910,8911,8912,
                        9004,9005,9007,9008,9009,9012,
                        9102,9103,9105,9108,9110,9111,9112,
                        9201,9202,9203,9207,9208,9210,9212,
                        9302,9303,9306,9307,9308,9309,9310,9311,9312,
                        9401,9404,9407,9408,
                        9502]
        
        
        let gameList = GameList()
        //var result = ""
        for game in gameList.games {
            //if gamesWon.contains(game.gameId) == false {
                let words = game.winningWords
                
            let _ = await StrategyCalculator.TryMergeWithLowerOnly(game: game, words: words, queueLength: 5_000, highScore: game.winningScore)
                //result += "\n"
                //let shape = queueList.getBestShapeByScore()
//                if shape != nil {
//                    result += shape?.ToStringExtended(words: words, gameId: game.gameId, winningScore: game.winningScore) ?? ""
//                }
            //}
        }
    }
    
    
    public static func shapesFor8612(queueLength: Int, words: [String]) -> QueueList {
        let shapeConstraints: [ShapeConstraintModel] = [
            ShapeConstraintModel(name:"edge", scoreMin: 22, widthMax: 10, heightMax:8),
            ShapeConstraintModel(name: "rectangle3x4", scoreMin: 136, widthMax: 10, heightMax: 8),
            ShapeConstraintModel(name: "rectangle3x4_BottomLeft", scoreMin: 64, widthMax: 10, heightMax: 7),
            ShapeConstraintModel(name: "rectangle4x5", scoreMin: 90, widthMax: 11, heightMax:8),
            ShapeConstraintModel(name: "square3x3", scoreMin: 52, widthMax:11, heightMax: 8)
            ]
        let game = GameList().getGame(gameId: 8612)!
        
        let scoresMin = StrategyCalculator.GetScoreMins(gameId: 8612)
        let constraints = ConstraintsModel(
            words: words,
            shapeConstraints: shapeConstraints,
            scoresMin: scoresMin,
            
            queueLengthMax: queueLength,
            priorityFunction: .score_area)
        
        let queueList = QueueList(game: game, constraints: constraints)
        
        
        return queueList
    }
    
    public static func TryMergeWithItselfAndBelow(game: GameModel, words: [String], queueLength: Int, highScore: Int, repeatTimes: Int = 1) async -> QueueList {
       
            
        //let words = game.winningWords
        
        //let _ = await StrategyCalculator.NextStep(words: game.winningWords, queueLength: 20000, priorityFunction: .score_area, repeatTimes: 5)
        
        
        
        let startNano = DateTimeCalculator.now()
            
        var queue = GetQueue(game: game, words: words, queueLength: queueLength, priorityFunction: .score_area)
        
        //    for i in 5..<30 {
        //        queue.queues[i].search_TopScorePercent = 2.0
        //    }
            
        var maxShape: ShapeModel? = nil
        var maxScore: UInt16 = 0
        
        var count = 0
        var previousCount = 0
        if FeatureFlags.verbose {
            print("")
            print("")
            print("GAME \(game.gameId) with high score of \(game.winningScore) using \(words.count) words")
        }
        /// gives us the highest score so far
        (maxShape, _) = queue.status()
//        if let maxShape = maxShape {
//            let text = maxShape.ToStringExtended(words: words, gameId: queue.game.gameId, winningScore: queue.game.winningScore)
//            print(text)
//        }
        
        for repeatTime in 0..<repeatTimes {
    //        let mergeWithItselfStartNano = DateTimeCalculator.now()
    //        DateTimeCalculator.printDate("mergeWithItselfAll() started at")
            await queue.mergeWithItselfAll()
    //        let mergeWithItselfFinishNano = DateTimeCalculator.now()
    //        let mergeWithItselfDuration = DateTimeCalculator.duration(start: mergeWithItselfStartNano, finish: mergeWithItselfFinishNano)
    //        DateTimeCalculator.printDate("mergeWithItselfAll() took \(mergeWithItselfDuration) and finished at")
    //        (maxShape, _) = queue.status()
//            if let maxShape = maxShape {
//                let text = maxShape.ToStringExtended(words: words, gameId: game.gameId, winningScore: game.winningScore)
//                print(text)
//            }
    //        for i in 5..<30 {
    //            queue.queues[i].search_TopScorePercent = 2.0
    //        }
            var i = 0
            while maxScore < highScore && i < 40  {
                
                if queue.queues[i].shapes.count > 0 {
                    let startNano = DateTimeCalculator.now()
                    DateTimeCalculator.printDate("mergeEverythingBelowWith(index: \(i)) started at")
                    await queue.mergeEverythingBelowWithAsync(index: i)
                    let finishNano = DateTimeCalculator.now()
                    let duration = DateTimeCalculator.duration(start: startNano, finish: finishNano)
                    DateTimeCalculator.printDate("mergeEverythingBelowWith(index: \(i)) took \(duration) and finished at")
                    (maxShape, _) = queue.status()
                }
                i += 1
            }
            (maxShape, count) = queue.status()
            if count == previousCount {
                //break
            } else {
                if FeatureFlags.verbose {
                    print("GAME \(game.gameId) with high score of \(game.winningScore)")
                }
                // it shows all tiny variations of the same shape being built.  Quite interesting to see really.
                previousCount = count
            }
            if repeatTimes > 1 {
                print("Repeat Time: \(repeatTime+1) of \(repeatTimes)")
            }
        }
        let _ = queue.getBestShape()
        
        let finishNano = DateTimeCalculator.now()
               
        let duration = DateTimeCalculator.duration(start: startNano, finish: finishNano)
        print("Duration \(duration)")
        
        return queue
    }
    
    public static func mergeWithOriginalShapeOnly(game: GameModel, words: [String], queueLength: Int, highScore: Int, repeatTimes: Int = 1) async -> QueueList {
       
        let startNano = DateTimeCalculator.now()
            
        let scoresMin = StrategyCalculator.GetScoreMins(gameId: game.gameId)

        let constraint = ConstraintsModel(
            words: words,
            scoresMin: scoresMin,
            queueLengthMax: queueLength,
            priorityFunction: .score_area)

        var queue = QueueList(game: game, constraints: constraint)

        var shapes = WinningGameQueueListCalculatorV3.Shapes(gameId: game.gameId, words: words)
        ShapeCalculator.SortByScoreThenArea(shapes: &shapes)
        ShapeCalculator.SetMergeHistory(shapes: &shapes)
        
        queue.originalShapes = shapes
        queue.add(shapes: shapes)
        
        var count = 0
        var previousCount = 0
        if FeatureFlags.verbose {
            print("")
            print("")
            print("GAME \(game.gameId) with high score of \(game.winningScore) using \(words.count) words")
        }
        /// gives us the highest score so far
        (_, _) = queue.status()
       
        let shape = await queue.mergeWithOriginalShapesAsync(winningScore: highScore, attempts: repeatTimes)
        print("Merge History: \(shape.mergeHistory)")
                    
        for i in shape.mergeHistory {
            print(queue.originalShapes[i].ToText(words: words))
        }
                               
        let duration2 = DateTimeCalculator.duration(start: startNano, finish: DateTimeCalculator.now())
        print("Duration \(duration2)")
        return queue
                    

    }
    
    
    public static func TryMergeWithLowerOnly(game: GameModel, words: [String], queueLength: Int, highScore: Int, repeatTimes: Int = 1) async -> QueueList {
       
            
        //let words = game.winningWords
        
        //let _ = await StrategyCalculator.NextStep(words: game.winningWords, queueLength: 20000, priorityFunction: .score_area, repeatTimes: 5)
        
        
        
        let startNano = DateTimeCalculator.now()
            
        var queue = GetQueue(game: game, words: words, queueLength: queueLength, priorityFunction: .score_area)
        
        
        var maxShape: ShapeModel? = nil
        var maxScore: UInt16 = 0
        
        var count = 0
        var previousCount = 0
        if FeatureFlags.verbose {
            print("")
            print("")
            print("GAME \(game.gameId) with high score of \(game.winningScore) using \(words.count) words")
        }
        /// gives us the highest score so far
        (maxShape, _) = queue.status()
//        if let maxShape = maxShape {
//            let text = maxShape.ToStringExtended(words: words, gameId: queue.game.gameId, winningScore: queue.game.winningScore)
//            print(text)
//        }
        
        for repeatTime in 0..<repeatTimes {
    //        let mergeWithItselfStartNano = DateTimeCalculator.now()
    //        DateTimeCalculator.printDate("mergeWithItselfAll() started at")
    //        await queue.mergeWithItselfAll()
    //        let mergeWithItselfFinishNano = DateTimeCalculator.now()
    //        let mergeWithItselfDuration = DateTimeCalculator.duration(start: mergeWithItselfStartNano, finish: mergeWithItselfFinishNano)
    //        DateTimeCalculator.printDate("mergeWithItselfAll() took \(mergeWithItselfDuration) and finished at")
    //        (maxShape, _) = queue.status()
//            if let maxShape = maxShape {
//                let text = maxShape.ToStringExtended(words: words, gameId: game.gameId, winningScore: game.winningScore)
//                print(text)
//            }
    //        for i in 5..<30 {
    //            queue.queues[i].search_TopScorePercent = 2.0
    //        }
            var i = 0
            while maxScore < highScore && i < 40  {
                
                if queue.queues[i].shapes.count > 0 {
                    let startNano = DateTimeCalculator.now()
                    DateTimeCalculator.printDate("mergeEverythingBelowWith(index: \(i)) started at")
                    await queue.mergeEverythingBelowWithAsync(index: i)
                    let finishNano = DateTimeCalculator.now()
                    let duration = DateTimeCalculator.duration(start: startNano, finish: finishNano)
                    DateTimeCalculator.printDate("mergeEverythingBelowWith(index: \(i)) took \(duration) and finished at")
                    (maxShape, _) = queue.status()
                }
                i += 1
            }
            (maxShape, count) = queue.status()
            if count == previousCount {
                //break
            } else {
                if FeatureFlags.verbose {
                    print("GAME \(game.gameId) with high score of \(game.winningScore)")
                }
                // it shows all tiny variations of the same shape being built.  Quite interesting to see really.
                previousCount = count
            }
            if repeatTimes > 1 {
                print("Repeat Time: \(repeatTime+1) of \(repeatTimes)")
            }
        }
        let _ = queue.getBestShape()
        
        let finishNano = DateTimeCalculator.now()
               
        let duration = DateTimeCalculator.duration(start: startNano, finish: finishNano)
        print("Duration \(duration)")
        
        return queue
    }
    
    public static func GetQueue(game: GameModel, words: [String], queueLength: Int, priorityFunction: PriorityFunction) -> QueueList {
        let scoresMin = StrategyCalculator.GetScoreMins(gameId: game.gameId)

        let constraint = ConstraintsModel(
            words: words,
            scoresMin: scoresMin,
            queueLengthMax: queueLength,
            priorityFunction: .score_area)

        var queue = QueueList(game: game, constraints: constraint)

        let shapes = WinningGameQueueListCalculatorV3.Shapes(gameId: game.gameId, words: words)
        queue.add(shapes: shapes)
        return queue
    }
    
    public static func TryMergeWithLowerOnlySync(game: GameModel, words: [String], queueLength: Int, highScore: Int, repeatTimes: Int = 1) -> QueueList {
       
         let startNano = DateTimeCalculator.now()
            
        var queue = GetQueue(game: game, words: words, queueLength: queueLength, priorityFunction: .score_area)
            
        var maxShape: ShapeModel? = nil
        var maxScore: UInt16 = 0
        
        var count = 0
        var previousCount = 0
        if FeatureFlags.verbose {
            print("")
            print("")
            print("GAME \(game.gameId) with high score of \(game.winningScore) using \(words.count) words")
        }
        /// gives us the highest score so far
        (maxShape, _) = queue.status()
//        if let maxShape = maxShape {
//            let text = maxShape.ToStringExtended(words: words, gameId: queue.game.gameId, winningScore: queue.game.winningScore)
//            print(text)
//        }
        
        for repeatTime in 0..<repeatTimes {
    //        let mergeWithItselfStartNano = DateTimeCalculator.now()
    //        DateTimeCalculator.printDate("mergeWithItselfAll() started at")
    //        await queue.mergeWithItselfAll()
    //        let mergeWithItselfFinishNano = DateTimeCalculator.now()
    //        let mergeWithItselfDuration = DateTimeCalculator.duration(start: mergeWithItselfStartNano, finish: mergeWithItselfFinishNano)
    //        DateTimeCalculator.printDate("mergeWithItselfAll() took \(mergeWithItselfDuration) and finished at")
    //        (maxShape, _) = queue.status()
//            if let maxShape = maxShape {
//                let text = maxShape.ToStringExtended(words: words, gameId: game.gameId, winningScore: game.winningScore)
//                print(text)
//            }
    //        for i in 5..<30 {
    //            queue.queues[i].search_TopScorePercent = 2.0
    //        }
            var i = 0
            while maxScore < highScore && i < 40  {
                
                if queue.queues[i].shapes.count > 0 {
                    let startNano = DateTimeCalculator.now()
                    DateTimeCalculator.printDate("mergeEverythingBelowWith(index: \(i)) started at")
                    queue.mergeEverythingBelowWithSync(index: i)
                    let finishNano = DateTimeCalculator.now()
                    let duration = DateTimeCalculator.duration(start: startNano, finish: finishNano)
                    DateTimeCalculator.printDate("mergeEverythingBelowWith(index: \(i)) took \(duration) and finished at")
                    (maxShape, _) = queue.status()
                }
                i += 1
            }
            (maxShape, count) = queue.status()
            if count == previousCount {
                //break
            } else {
                if FeatureFlags.verbose {
                    print("GAME \(game.gameId) with high score of \(game.winningScore)")
                }
                // it shows all tiny variations of the same shape being built.  Quite interesting to see really.
                previousCount = count
            }
            if repeatTimes > 1 {
                print("Repeat Time: \(repeatTime+1) of \(repeatTimes)")
            }
        }
        let _ = queue.getBestShape()
        
        let finishNano = DateTimeCalculator.now()
               
        let duration = DateTimeCalculator.duration(start: startNano, finish: finishNano)
        print("Duration \(duration)")
        
        return queue
    }
    
    
    public static func Queue_8612(queueLength: Int, priorityFunction: PriorityFunction = .score_area) -> QueueList {
        let game = GameList().getGame(gameId: 8612)!
        
        let scoresMin = StrategyCalculator.GetScoreMins(gameId: 8612)
        let constraint = ConstraintsModel(
            words: game.winningWords,
            scoresMin: scoresMin,
            queueLengthMax: queueLength,
            priorityFunction: .score_area)
        
        var queue = QueueList(game: game, constraints: constraint)
        
        //let widthMax = game.maxWidth
        //let heightMax = game.maxHeight
        let words = game.winningWords
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 10,
            heightMax: 8))
        
        queue.add(shapes: edges)

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 136,
            widthMax: 10,
            heightMax: 7))
        
        queue.add(shapes: rectangle3x4)

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 64,
            widthMax: 10,
            heightMax: 7))

        queue.add(shapes: rectangle3x4_BottomLeft)
        
        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 90,
            widthMax: 11,
            heightMax: 8))

        queue.add(shapes: rectangle4x5)
        
        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 52,
            widthMax: 11,
            heightMax: 8))
        
        queue.add(shapes: square3x3)
        
        return queue
    }
    
    public static func NextStep(words: [String], queueLength: Int, priorityFunction: PriorityFunction, repeatTimes: Int) async -> ShapeModel {
        
        let startNano = DateTimeCalculator.now()
        
        var queue = Queue_8612(queueLength: queueLength, priorityFunction: priorityFunction)
        let game = queue.game
        
        var maxShape: ShapeModel? = nil
        let highScore = game.winningScore
        var maxScore: UInt16 = 0
        var i = 0
        var count = 0
        var previousCount = 0
        print("")
        print("")
        print("GAME \(game.gameId) with high score of \(game.winningScore) using \(words.count) words")
        (maxShape, _) = queue.status()
        if let maxShape = maxShape {
            let text = maxShape.ToStringExtended(words: words, gameId: queue.game.gameId, winningScore: queue.game.winningScore)
            print(text)
        }
        
        for _ in 0..<repeatTimes {
            let mergeWithItselfStartNano = DateTimeCalculator.now()
            DateTimeCalculator.printDate("mergeWithItselfAll() started at")
            await queue.mergeWithItselfAll()
            let mergeWithItselfFinishNano = DateTimeCalculator.now()
            let mergeWithItselfDuration = DateTimeCalculator.duration(start: mergeWithItselfStartNano, finish: mergeWithItselfFinishNano)
            DateTimeCalculator.printDate("mergeWithItselfAll() took \(mergeWithItselfDuration) and finished at")
            (maxShape, _) = queue.status()
            if let maxShape = maxShape {
                let text = maxShape.ToStringExtended(words: words, gameId: game.gameId, winningScore: game.winningScore)
                print(text)
            }
            while maxScore < highScore && i < 40  {
                
                
                if queue.queues[i].shapes.count > 0 {
                    let startNano = DateTimeCalculator.now()
                    DateTimeCalculator.printDate("mergeEverythingBelowWith(index: \(i)) started at")
                    await queue.mergeEverythingBelowWithAsync(index: i)
                    let finishNano = DateTimeCalculator.now()
                    let duration = DateTimeCalculator.duration(start: startNano, finish: finishNano)
                    DateTimeCalculator.printDate("mergeEverythingBelowWith(index: \(i)) took \(duration) and finished at")
                    (maxShape, _) = queue.status()
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
                //break
            } else {
                
                print("GAME \(game.gameId) with high score of \(game.winningScore)")
                
                // it shows all tiny variations of the same shape being built.  Quite interesting to see really.
                previousCount = count
            }
            
            if let bestShapeScore = queue.getBestShape() {
                if bestShapeScore.score >= highScore {
                    return bestShapeScore
                }
            }
        }
        let bestShapeScore = queue.getBestShape()
        
        let finishNano = DateTimeCalculator.now()
               
       let duration = DateTimeCalculator.duration(start: startNano, finish: finishNano)
       print("Duration \(duration)")
        
        return bestShapeScore!
    }
    
    public static func NextStepButGoingUpFromTwoThirds(words: [String], queueLength: Int, priorityFunction: PriorityFunction, repeatTimes: Int) async -> ShapeModel {
        
        var queue = Queue_8612(queueLength: queueLength, priorityFunction: priorityFunction)
        let game = queue.game
        
        var maxShape: ShapeModel? = nil
        let highScore = game.winningScore
        var maxScore: UInt16 = 0
        
        var count = 0
        var previousCount = 0
        print("")
        print("")
        print("GAME \(game.gameId) with high score of \(game.winningScore) using word count of \(words.count)")
        (maxShape, _) = queue.status()
        if let maxShape = maxShape {
            let text = maxShape.ToStringExtended(words: words, gameId: queue.game.gameId, winningScore: queue.game.winningScore)
            print(text)
        }
        
        for repeatTime in 0..<repeatTimes {
            
            DateTimeCalculator.printDate("mergeWithItselfAll() started at")
            await queue.mergeWithItselfAll()
            DateTimeCalculator.printDate("mergeWithItselfAll() finished at")
            (maxShape, _) = queue.status()
            if let maxShape = maxShape {
                let text = maxShape.ToStringExtended(words: words, gameId: game.gameId, winningScore: game.winningScore)
                print(text)
            }
            var i = 0
            if repeatTime == 0 {
                i = 15
            }
            while maxScore < highScore && i < 40  {
                
                
                if queue.queues[i].shapes.count > 0 {
                    DateTimeCalculator.printDate("mergeEverythingBelowWith(index: \(i)) started at")
                    
                    let startNano = DateTimeCalculator.now()
                    await queue.mergeEverythingBelowWithAsync(index: i)
                    let finishNano = DateTimeCalculator.now()
                    
                    let duration = DateTimeCalculator.duration(start: startNano, finish: finishNano)
                    DateTimeCalculator.printDate("mergeEverythingBelowWith(index: \(i)) took \(duration) and finished at")
                    (maxShape, _) = queue.status()
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
                //break
            } else {
                
                print("GAME \(game.gameId) with high score of \(game.winningScore)")
                
                // it shows all tiny variations of the same shape being built.  Quite interesting to see really.
                previousCount = count
            }
            
            if let bestShapeScore = queue.getBestShape() {
                if bestShapeScore.score >= highScore {
                    return bestShapeScore
                }
            }
        }
        let bestShapeScore = queue.getBestShape()
        return bestShapeScore!
    }
    
    
    
    public static func NextStep(queueLength: Int, priorityFunction: PriorityFunction, repeatTimes: Int) async -> ShapeModel {
        
        var queue = Queue_8612(queueLength: queueLength, priorityFunction: priorityFunction)
        let game = queue.game
        let words = game.winningWords
        
        var maxShape: ShapeModel? = nil
        let highScore = game.winningScore
        var maxScore: UInt16 = 0
        var i = 0
        var count = 0
        var previousCount = 0
        print("")
        print("")
        print("GAME \(game.gameId) with high score of \(game.winningScore)")
        (maxShape, _) = queue.status()
        if let maxShape = maxShape {
            let text = maxShape.ToStringExtended(words: words, gameId: queue.game.gameId, winningScore: queue.game.winningScore)
            print(text)
        }
        
        for _ in 0..<repeatTimes {
            
            DateTimeCalculator.printDate("mergeWithItselfAll() started at")
            await queue.mergeWithItselfAll()
            DateTimeCalculator.printDate("mergeWithItselfAll() finished at")
            (maxShape, _) = queue.status()
            if let maxShape = maxShape {
                let text = maxShape.ToStringExtended(words: words, gameId: game.gameId, winningScore: game.winningScore)
                print(text)
            }
            while maxScore < highScore && i < 40  {
                
                
                if queue.queues[i].shapes.count > 0 {
                    DateTimeCalculator.printDate("mergeEverythingBelowWith(index: \(i)) started at")
                    await queue.mergeEverythingBelowWithAsync(index: i)
                    DateTimeCalculator.printDate("mergeEverythingBelowWith(index: \(i)) finished at")
                    (maxShape, _) = queue.status()
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
                //break
            } else {
                
                print("GAME \(game.gameId) with high score of \(game.winningScore)")
                
                // it shows all tiny variations of the same shape being built.  Quite interesting to see really.
                previousCount = count
            }
            
            if let bestShapeScore = queue.getBestShape() {
                if bestShapeScore.score >= highScore {
                    return bestShapeScore
                }
            }
        }
        let bestShapeScore = queue.getBestShape()
        return bestShapeScore!
    }
    
    
    public static func BasicStrategy() async {

        var scoresMinDictionary: [(Int,[UInt16])] = []
        let gameList = GameList()
        for game in gameList.games {
            
            let (winningShapes, words, _, _) = GameList.getShapes(gameId: game.gameId)
            
            guard let winningShape = GameList.getWinningShape(gameId: game.gameId) else { return  }
            
            let scoresMin = StrategyCalculator.GetScoreMins(gameId: game.gameId)
            
            let constraints = ConstraintsModel(
                words: words,
                scoresMin: scoresMin,
                queueLengthMax: 2000,
                priorityFunction: .score_area)
            
            var queue = QueueList(game: game, constraints: constraints)
            queue.add(shapes: winningShapes)
            
            var maxShape: ShapeModel? = nil
            let highScore = game.winningScore
            var maxScore: UInt16 = 0
            var i = 0
            var count = 0
            var previousCount = 0
            print("")
            print("")
            print("GAME \(game.gameId) with high score of \(game.winningScore)")
            (maxShape, _) = queue.status()
            if let maxShape = maxShape {
                let text = maxShape.ToStringExtended(words: words, gameId: game.gameId, winningScore: game.winningScore)
                print(text)
            }
            print("MERGE WITH ITSELF")
            await queue.mergeWithItselfAll()
            (maxShape, _) = queue.status()
            if let maxShape = maxShape {
                let text = maxShape.ToStringExtended(words: words, gameId: game.gameId, winningScore: game.winningScore)
                print(text)
            }
            while maxScore < highScore && i < 40 {
                
                
                if queue.queues[i].shapes.count > 0 {
                    await queue.mergeEverythingBelowWithAsync(index: i)
                    
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
                let scoresMin = queue.createScoresMin(winningShape: winningShape)
                print(scoresMin)
                scoresMinDictionary.append((game.gameId,scoresMin))
                
                //queue.printAllShapes(words: words)
                // it shows all tiny variations of the same shape being built.  Quite interesting to see really.
                previousCount = count
            }
        }
        for item in scoresMinDictionary {
            print("        case \(item.0):")
            print("            return \(item.1)")
            
        }
        
       
    }
    
    public static func GetScoreMins(gameId: Int) -> [Int] {
        switch gameId {
        case 8612:
            return [0, 0, 22, 36, 52, 94, 130, 158, 148, 198, 224, 258, 284, 350, 368, 394, 440, 456, 474, 510, 524, 542, 568, 650, 668, 694, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8702:
            return [0, 0, 22, 34, 52, 70, 96, 122, 158, 190, 202, 228, 256, 280, 292, 318, 344, 370, 396, 410, 422, 448, 474, 510, 536, 556, 582, 608, 642, 684, 726, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8703:
            return [0, 0, 22, 34, 58, 80, 92, 182, 158, 176, 240, 218, 232, 302, 298, 312, 358, 380, 408, 424, 438, 488, 504, 552, 564, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8704:
            return [0, 0, 22, 64, 72, 90, 118, 146, 166, 180, 198, 226, 252, 288, 308, 336, 362, 390, 416, 456, 484, 510, 552, 578, 636, 686, 704, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8705:
            return [0, 0, 24, 0, 66, 92, 118, 144, 176, 196, 226, 240, 274, 292, 318, 352, 370, 404, 422, 448, 482, 500, 526, 568, 610, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8710:
            return [0, 0, 22, 48, 62, 86, 120, 134, 148, 170, 204, 226, 254, 270, 292, 318, 340, 366, 400, 434, 446, 472, 498, 524, 552, 590, 618, 644, 672, 714, 764, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8711:
            return [0, 0, 22, 40, 60, 78, 120, 144, 164, 198, 210, 236, 256, 298, 342, 372, 386, 418, 432, 464, 478, 506, 538, 552, 584, 598, 630, 644, 678, 706, 734, 768, 810, 0, 0, 0, 0, 0, 0, 0]
        case 8712:
            return [0, 0, 28, 0, 74, 100, 130, 164, 182, 204, 234, 254, 292, 310, 342, 366, 384, 414, 456, 486, 510, 540, 594, 624, 650, 680, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8802:
            return [0, 0, 28, 62, 60, 86, 114, 132, 150, 190, 204, 222, 258, 286, 304, 330, 372, 420, 448, 466, 492, 534, 606, 634, 652, 678, 720, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8803:
            return [0, 0, 24, 42, 56, 82, 100, 114, 170, 196, 214, 228, 270, 296, 362, 358, 384, 418, 444, 472, 498, 532, 558, 600, 626, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8804:
            return [0, 0, 22, 50, 68, 86, 112, 140, 166, 184, 218, 236, 250, 276, 316, 340, 354, 380, 402, 426, 450, 476, 504, 518, 544, 564, 590, 612, 654, 684, 706, 732, 768, 794, 836, 0, 0, 0, 0, 0]
        case 8805:
            return [0, 0, 22, 40, 66, 90, 108, 138, 164, 176, 202, 220, 246, 282, 300, 342, 390, 408, 438, 456, 474, 502, 520, 538, 558, 576, 602, 620, 646, 688, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8806:
            return [0, 0, 22, 42, 62, 88, 100, 126, 152, 178, 216, 244, 270, 286, 312, 326, 352, 378, 404, 430, 456, 480, 506, 532, 548, 574, 600, 626, 652, 678, 704, 748, 774, 816, 0, 0, 0, 0, 0, 0]
        case 8807:
            return [0, 0, 22, 40, 66, 90, 108, 120, 138, 164, 206, 224, 242, 262, 280, 306, 348, 382, 408, 442, 468, 510, 544, 570, 594, 620, 662, 696, 722, 764, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8808:
            return [0, 0, 28, 54, 48, 94, 112, 138, 172, 190, 216, 288, 302, 328, 354, 372, 402, 432, 464, 484, 510, 576, 594, 620, 648, 666, 696, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8809:
            return [0, 0, 22, 40, 54, 72, 98, 134, 152, 202, 220, 242, 260, 288, 310, 328, 354, 382, 416, 436, 456, 490, 524, 546, 564, 630, 648, 676, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8810:
            return [0, 0, 24, 50, 66, 84, 114, 132, 154, 180, 198, 236, 254, 280, 322, 342, 368, 394, 416, 442, 468, 494, 536, 572, 598, 640, 716, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8811:
            return [0, 0, 28, 54, 54, 84, 110, 130, 148, 174, 200, 226, 252, 286, 298, 324, 344, 370, 396, 422, 448, 474, 516, 560, 588, 630, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8812:
            return [0, 0, 24, 54, 60, 98, 118, 136, 174, 178, 214, 240, 266, 294, 310, 328, 354, 380, 416, 428, 442, 484, 504, 530, 544, 590, 604, 630, 694, 720, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8902:
            return [0, 0, 28, 46, 72, 98, 114, 150, 176, 192, 216, 236, 254, 280, 306, 348, 404, 424, 442, 468, 488, 514, 540, 582, 644, 670, 704, 746, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8903:
            return [0, 0, 24, 54, 82, 108, 126, 152, 180, 198, 240, 266, 308, 334, 376, 406, 448, 490, 536, 578, 652, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8904:
            return [0, 0, 22, 40, 66, 94, 130, 158, 182, 200, 236, 248, 266, 308, 354, 372, 398, 422, 450, 470, 488, 530, 566, 580, 598, 632, 650, 692, 768, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8905:
            return [0, 0, 22, 46, 66, 84, 96, 122, 148, 168, 180, 198, 224, 242, 260, 286, 312, 338, 350, 368, 410, 474, 492, 534, 584, 596, 614, 656, 722, 764, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8906:
            return [0, 0, 22, 40, 62, 82, 96, 114, 140, 164, 178, 194, 212, 238, 264, 290, 382, 402, 428, 454, 480, 522, 548, 592, 642, 710, 760, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8907:
            return [0, 0, 24, 42, 58, 94, 96, 136, 148, 180, 206, 234, 286, 318, 334, 350, 376, 394, 408, 436, 458, 476, 502, 536, 570, 612, 640, 674, 708, 750, 784, 818, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8908:
            return [0, 0, 22, 48, 76, 90, 108, 134, 160, 186, 212, 226, 240, 266, 292, 318, 358, 372, 398, 424, 450, 476, 502, 546, 590, 634, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8909:
            return [0, 0, 22, 40, 66, 94, 106, 158, 170, 202, 220, 246, 258, 276, 310, 340, 374, 420, 446, 472, 506, 536, 570, 616, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8910:
            return [0, 0, 28, 46, 52, 88, 98, 116, 166, 184, 212, 230, 248, 290, 310, 360, 380, 406, 424, 442, 484, 534, 576, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8911:
            return [0, 0, 22, 40, 60, 74, 100, 112, 138, 188, 214, 230, 240, 266, 282, 308, 330, 346, 364, 390, 432, 474, 500, 520, 538, 556, 582, 648, 666, 692, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 8912:
            return [0, 0, 24, 50, 84, 100, 124, 150, 180, 200, 226, 256, 280, 306, 332, 366, 392, 418, 460, 488, 520, 546, 574, 608, 636, 678, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9001:
            return [0, 0, 22, 42, 60, 84, 98, 140, 158, 172, 198, 240, 264, 278, 312, 326, 352, 394, 420, 450, 476, 556, 586, 612, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9002:
            return [0, 0, 24, 42, 98, 132, 156, 178, 212, 238, 296, 300, 326, 384, 382, 408, 460, 470, 496, 554, 580, 604, 630, 688, 714, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9003:
            return [0, 0, 22, 42, 52, 78, 96, 108, 150, 168, 180, 198, 212, 242, 296, 310, 340, 376, 408, 438, 474, 506, 536, 578, 630, 672, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9004:
            return [0, 0, 22, 46, 54, 66, 92, 124, 136, 162, 202, 214, 240, 282, 300, 326, 368, 394, 436, 478, 520, 562, 604, 634, 676, 720, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9005:
            return [0, 0, 22, 0, 68, 80, 122, 154, 158, 194, 212, 226, 268, 278, 320, 340, 396, 392, 442, 484, 494, 536, 556, 620, 608, 682, 0, 734, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9006:
            return [0, 0, 22, 48, 62, 86, 112, 130, 156, 168, 190, 208, 234, 252, 272, 298, 312, 346, 366, 392, 418, 432, 458, 486, 512, 582, 610, 658, 686, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9007:
            return [0, 0, 36, 62, 58, 118, 144, 110, 174, 222, 196, 222, 270, 296, 322, 348, 378, 404, 430, 472, 498, 558, 600, 626, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9008:
            return [0, 0, 22, 64, 58, 76, 122, 134, 174, 186, 204, 230, 270, 288, 314, 356, 382, 414, 440, 480, 498, 524, 566, 592, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9009:
            return [0, 0, 22, 48, 60, 86, 112, 134, 160, 186, 214, 240, 268, 294, 320, 362, 414, 426, 452, 466, 492, 518, 560, 634, 668, 694, 736, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9010:
            return [0, 0, 24, 50, 66, 98, 108, 134, 160, 188, 214, 246, 260, 286, 302, 328, 348, 374, 388, 414, 430, 456, 480, 506, 532, 558, 590, 616, 664, 696, 722, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9011:
            return [0, 0, 24, 50, 52, 78, 92, 134, 150, 174, 190, 216, 258, 288, 302, 330, 372, 386, 414, 438, 456, 484, 526, 582, 610, 652, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9012:
            return [0, 0, 22, 40, 62, 92, 118, 152, 172, 190, 222, 246, 276, 300, 314, 340, 370, 394, 424, 450, 464, 504, 524, 544, 594, 614, 634, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9101:
            return [0, 0, 22, 34, 52, 78, 96, 122, 148, 170, 192, 222, 242, 260, 286, 326, 338, 356, 398, 436, 462, 498, 514, 532, 574, 622, 662, 674, 692, 734, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9102:
            return [0, 0, 24, 46, 56, 70, 128, 146, 172, 206, 230, 248, 274, 294, 312, 338, 372, 408, 442, 458, 472, 506, 580, 594, 612, 646, 664, 678, 712, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9103:
            return [0, 0, 22, 0, 52, 92, 104, 130, 152, 158, 202, 200, 226, 250, 270, 304, 312, 338, 380, 408, 434, 450, 476, 518, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9104:
            return [0, 0, 22, 46, 68, 80, 106, 132, 152, 178, 230, 244, 270, 288, 306, 332, 356, 374, 392, 418, 450, 474, 492, 510, 536, 594, 626, 644, 670, 728, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9105:
            return [0, 0, 28, 0, 60, 108, 106, 134, 160, 180, 194, 212, 248, 266, 292, 322, 346, 376, 418, 452, 476, 506, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9106:
            return [0, 0, 28, 54, 62, 84, 134, 132, 154, 186, 208, 232, 256, 278, 350, 376, 402, 426, 448, 474, 500, 542, 608, 634, 676, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9107:
            return [0, 0, 22, 34, 58, 70, 82, 108, 160, 170, 182, 208, 236, 258, 276, 302, 322, 340, 366, 402, 422, 440, 466, 494, 536, 558, 584, 612, 640, 668, 710, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9108:
            return [0, 0, 28, 62, 64, 90, 116, 138, 164, 190, 216, 242, 272, 298, 324, 350, 376, 420, 446, 472, 498, 540, 618, 644, 670, 696, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9109:
            return [0, 0, 28, 102, 66, 86, 0, 140, 158, 210, 208, 226, 274, 278, 296, 332, 358, 382, 400, 426, 460, 502, 536, 602, 636, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9110:
            return [0, 0, 22, 40, 58, 104, 140, 124, 196, 0, 246, 274, 302, 332, 398, 414, 418, 482, 512, 528, 570, 598, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9111:
            return [0, 0, 28, 62, 56, 82, 108, 136, 162, 180, 250, 234, 320, 346, 356, 406, 432, 452, 484, 510, 536, 582, 0, 616, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9112:
            return [0, 0, 28, 54, 80, 104, 122, 164, 190, 208, 234, 260, 302, 338, 356, 374, 416, 474, 492, 510, 552, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9201:
            return [0, 0, 22, 94, 62, 88, 110, 136, 170, 212, 244, 266, 292, 314, 340, 362, 388, 422, 464, 522, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9202:
            return [0, 0, 24, 42, 60, 86, 104, 130, 148, 164, 190, 208, 234, 260, 302, 364, 390, 420, 446, 464, 490, 516, 558, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9203:
            return [0, 0, 22, 40, 52, 88, 108, 140, 168, 206, 248, 266, 302, 314, 340, 366, 392, 422, 450, 494, 520, 548, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9204:
            return [0, 0, 22, 34, 66, 102, 114, 132, 158, 200, 226, 252, 278, 300, 318, 344, 386, 408, 420, 446, 488, 508, 534, 566, 594, 606, 632, 674, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9205:
            return [0, 0, 24, 42, 74, 98, 112, 134, 220, 180, 198, 234, 248, 266, 308, 332, 346, 376, 418, 462, 476, 506, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9206:
            return [0, 0, 22, 62, 54, 66, 84, 110, 136, 172, 184, 202, 228, 248, 260, 278, 304, 324, 342, 368, 412, 448, 474, 528, 564, 590, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9207:
            return [0, 0, 36, 62, 80, 102, 128, 154, 180, 206, 242, 268, 300, 326, 362, 388, 438, 466, 492, 518, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9208:
            return [0, 0, 28, 54, 66, 84, 110, 128, 154, 180, 206, 240, 290, 316, 350, 382, 408, 442, 532, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9209:
            return [0, 0, 22, 78, 58, 84, 118, 144, 162, 188, 234, 254, 280, 310, 352, 376, 396, 414, 440, 466, 492, 534, 566, 608, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9210:
            return [0, 0, 22, 48, 64, 100, 126, 138, 164, 178, 204, 230, 258, 270, 312, 354, 374, 406, 432, 450, 476, 498, 524, 542, 584, 626, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9211:
            return [0, 0, 24, 0, 66, 84, 110, 122, 140, 168, 208, 222, 240, 268, 282, 300, 328, 352, 370, 398, 440, 468, 496, 574, 602, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9212:
            return [0, 0, 22, 62, 68, 80, 106, 132, 158, 208, 226, 244, 270, 312, 326, 352, 378, 404, 430, 456, 482, 508, 534, 576, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9301:
            return [0, 0, 22, 36, 48, 74, 88, 122, 148, 162, 188, 244, 256, 282, 296, 322, 348, 374, 404, 442, 468, 498, 542, 572, 602, 636, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9302:
            return [0, 0, 22, 48, 62, 88, 106, 132, 146, 172, 184, 226, 244, 286, 304, 346, 364, 430, 448, 524, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9303:
            return [0, 0, 22, 0, 64, 76, 102, 130, 154, 180, 208, 242, 258, 286, 320, 348, 366, 394, 428, 444, 472, 514, 552, 584, 638, 654, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9304:
            return [0, 0, 22, 40, 58, 72, 90, 108, 152, 180, 164, 214, 232, 244, 264, 292, 294, 322, 402, 422, 432, 458, 486, 560, 586, 614, 648, 676, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9305:
            return [0, 0, 22, 42, 62, 80, 106, 148, 174, 198, 216, 242, 260, 286, 312, 346, 372, 408, 436, 462, 496, 522, 558, 632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9306:
            return [0, 0, 22, 42, 68, 94, 128, 150, 188, 214, 270, 318, 336, 350, 370, 396, 454, 534, 554, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9307:
            return [0, 0, 22, 48, 50, 92, 110, 144, 156, 182, 216, 242, 284, 336, 362, 404, 438, 464, 498, 524, 566, 610, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9308:
            return [0, 0, 24, 62, 68, 82, 120, 140, 166, 192, 254, 274, 300, 326, 354, 394, 422, 464, 506, 556, 598, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9309:
            return [0, 0, 24, 50, 56, 74, 100, 118, 140, 158, 192, 252, 278, 296, 314, 340, 358, 380, 398, 426, 444, 478, 536, 570, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9310:
            return [0, 0, 36, 110, 76, 102, 128, 170, 196, 222, 252, 294, 324, 366, 440, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9311:
            return [0, 0, 22, 0, 68, 82, 100, 168, 180, 222, 246, 276, 306, 336, 360, 378, 408, 450, 480, 510, 552, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9312:
            return [0, 0, 22, 48, 74, 92, 130, 148, 174, 196, 214, 242, 306, 328, 346, 374, 402, 420, 448, 492, 506, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9401:
            return [0, 0, 22, 48, 74, 88, 114, 140, 162, 188, 230, 252, 270, 316, 334, 374, 400, 426, 452, 482, 508, 534, 564, 590, 628, 656, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9402:
            return [0, 0, 22, 54, 64, 82, 108, 142, 166, 188, 218, 234, 264, 286, 314, 344, 366, 396, 430, 458, 484, 510, 540, 572, 602, 636, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9403:
            return [0, 0, 22, 70, 54, 72, 106, 140, 174, 180, 214, 226, 260, 286, 298, 318, 352, 394, 390, 424, 452, 486, 528, 592, 606, 648, 668, 710, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9404:
            return [0, 0, 24, 62, 52, 78, 102, 120, 138, 158, 184, 204, 230, 256, 282, 308, 334, 368, 420, 446, 472, 498, 524, 550, 580, 606, 640, 680, 706, 740, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9406:
            return [0, 0, 24, 0, 68, 102, 128, 142, 160, 202, 220, 244, 314, 304, 370, 372, 430, 450, 474, 506, 534, 566, 590, 632, 650, 700, 718, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9407:
            return [0, 0, 22, 0, 88, 104, 146, 158, 172, 210, 240, 252, 290, 312, 332, 358, 390, 416, 452, 478, 510, 536, 594, 644, 656, 702, 714, 804, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9408:
            return [0, 0, 22, 54, 60, 78, 112, 128, 146, 164, 196, 212, 230, 256, 282, 302, 328, 356, 382, 412, 432, 458, 486, 512, 546, 576, 610, 636, 670, 700, 734, 768, 794, 828, 0, 0, 0, 0, 0, 0]
        case 9409:
            return [0, 0, 22, 34, 58, 100, 98, 180, 196, 222, 268, 280, 292, 348, 364, 376, 412, 444, 470, 482, 528, 564, 584, 618, 634, 674, 690, 766, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9410:
            return [0, 0, 22, 42, 78, 96, 130, 166, 186, 208, 228, 254, 280, 306, 326, 352, 378, 406, 432, 474, 504, 542, 572, 614, 644, 688, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9411:
            return [0, 0, 22, 34, 52, 78, 98, 110, 136, 170, 174, 200, 224, 250, 276, 288, 306, 332, 356, 370, 396, 422, 438, 464, 490, 516, 542, 568, 644, 670, 696, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9412:
            return [0, 0, 22, 48, 62, 86, 114, 140, 168, 182, 208, 222, 254, 274, 300, 314, 342, 388, 408, 436, 452, 478, 492, 520, 572, 586, 614, 650, 678, 712, 748, 776, 810, 846, 874, 0, 0, 0, 0, 0]
        case 9501:
            return [0, 0, 22, 46, 66, 82, 102, 144, 168, 186, 208, 238, 296, 286, 312, 356, 398, 420, 442, 462, 502, 520, 542, 562, 580, 602, 622, 648, 686, 708, 728, 756, 800, 0, 0, 0, 0, 0, 0, 0]
        case 9502:
            return [0, 0, 22, 54, 54, 72, 94, 116, 138, 154, 172, 194, 212, 232, 254, 272, 296, 318, 342, 368, 398, 424, 454, 488, 518, 590, 620, 654, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9503:
            return [0, 0, 22, 36, 62, 88, 114, 148, 168, 190, 216, 242, 266, 292, 318, 344, 370, 398, 420, 446, 472, 498, 524, 550, 578, 604, 632, 660, 686, 720, 746, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9504:
            return [0, 0, 22, 36, 54, 96, 110, 128, 162, 196, 214, 236, 256, 274, 296, 322, 348, 366, 388, 422, 444, 518, 544, 566, 588, 622, 644, 670, 700, 726, 760, 782, 824, 0, 0, 0, 0, 0, 0, 0]
        case 9505:
            return [0, 0, 22, 48, 66, 86, 112, 124, 150, 170, 196, 208, 234, 266, 280, 306, 332, 374, 388, 404, 446, 460, 502, 520, 546, 596, 638, 664, 698, 748, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9506:
            return [0, 0, 22, 36, 50, 80, 94, 108, 146, 160, 178, 206, 222, 250, 274, 302, 328, 356, 372, 400, 436, 460, 488, 514, 542, 558, 586, 662, 678, 706, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9507:
            return [0, 0, 22, 50, 62, 92, 108, 120, 148, 178, 194, 220, 246, 272, 302, 328, 402, 460, 474, 500, 516, 542, 568, 594, 616, 642, 668, 694, 720, 746, 776, 802, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9508:
            return [0, 0, 24, 50, 76, 98, 122, 176, 166, 192, 222, 248, 280, 306, 344, 366, 388, 414, 432, 458, 482, 500, 526, 556, 582, 614, 640, 678, 710, 736, 778, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9509:
            return [0, 0, 22, 40, 64, 90, 116, 136, 162, 178, 204, 230, 258, 284, 310, 334, 346, 372, 398, 424, 450, 478, 504, 530, 556, 590, 642, 668, 694, 728, 762, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9510:
            return [0, 0, 22, 0, 60, 78, 102, 120, 188, 218, 230, 260, 272, 302, 314, 350, 370, 392, 412, 454, 510, 538, 566, 586, 608, 638, 664, 706, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9511:
            return [0, 0, 22, 48, 60, 122, 118, 118, 172, 174, 190, 222, 250, 280, 274, 336, 330, 340, 394, 396, 442, 454, 476, 510, 520, 562, 576, 630, 660, 688, 742, 772, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9512:
            return [0, 0, 28, 70, 54, 94, 120, 142, 168, 186, 206, 234, 260, 284, 304, 332, 352, 390, 410, 434, 462, 492, 520, 554, 588, 622, 664, 714, 764, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9601:
            return [0, 0, 22, 38, 56, 94, 108, 122, 164, 182, 196, 238, 256, 298, 316, 334, 356, 374, 400, 430, 448, 474, 508, 534, 548, 594, 608, 642, 676, 702, 736, 770, 812, 0, 0, 0, 0, 0, 0, 0]
        case 9602:
            return [0, 0, 24, 42, 74, 94, 112, 138, 164, 184, 202, 228, 254, 276, 294, 320, 346, 376, 398, 424, 450, 480, 506, 572, 598, 628, 654, 684, 706, 732, 758, 788, 814, 844, 0, 0, 0, 0, 0, 0]
        case 9603:
            return [0, 0, 22, 70, 60, 86, 114, 130, 150, 168, 194, 220, 238, 264, 292, 324, 346, 374, 402, 430, 460, 484, 512, 542, 570, 604, 646, 680, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9604:
            return [0, 0, 22, 48, 68, 86, 94, 112, 142, 160, 208, 234, 254, 272, 298, 320, 346, 372, 398, 440, 488, 514, 540, 582, 626, 676, 720, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        case 9605:
            return [0, 0, 24, 62, 66, 92, 104, 130, 156, 182, 216, 230, 256, 282, 324, 350, 376, 408, 432, 446, 472, 498, 524, 550, 576, 604, 644, 670, 698, 740, 766, 840, 0, 0, 0, 0, 0, 0, 0, 0]
        default:
            return [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        }
    }
    
    public static func Create_Fork(edges: [ShapeModel], words: [String]) -> ShapeModel {
        
        let widthMax = 17
        let heightMax = 12
        let wordsInt = WordCalculator.WordsToInt(words: words)
        let white_family = ShapeCalculator.filterInclude(shapes: edges, containing: ["WHITE","FAMILY"], from: words)[0]
        print(white_family.ToString(words: words))
        
        let white_snow = ShapeCalculator.filterInclude(shapes: edges, containing: ["WHITE","SNOW"], from: words)[0]
        print(white_snow.ToString(words: words))
        
        let white_cake = ShapeCalculator.filterInclude(shapes: edges, containing: ["WHITE","CAKE"], from: words)[0]
        print(white_cake.ToString(words: words))
        
        let fork = [white_snow, white_family, white_cake]
        
        let (gpuFork, wordIndex) = GpuShapeModelCalculator.Create(shapes: fork, totalWords: words.count, stride: 2)
        
        let mergeFork = MergeCalculatorV1.ExecuteSameShape(sourceShapes: gpuFork, wordIndex: wordIndex,searchMax: gpuFork.count, words: words, wordsInt: wordsInt,scoresMin: [0,0,0,0,0,0,0,0,0,0], widthMax: widthMax, heightMax: heightMax)
        
//        for item in mergeFork {
//            print(item.ToString(words: words))
//        }
        
        let (gpuFork2,fork2Index) = GpuShapeModelCalculator.Create(shapes: mergeFork, totalWords: words.count, stride:3)
        
        var mergeFork2 = MergeCalculatorV1.ExecuteSameShape(sourceShapes: gpuFork2, wordIndex: fork2Index, searchMax: gpuFork2.count, words: words, wordsInt: wordsInt, scoresMin: [0,0,0,0,0,0,0,0,0,0], widthMax: widthMax, heightMax: heightMax)
        
        ShapeCalculator.SortWithWordSequence(shapes: &mergeFork2)
        
        let (withoutDuplicates, _) = RemoveDuplicatesCalculator.execute(shapes: mergeFork2)
        
//        for item in withoutDuplicates {
//            print(item.ToString(words: words))
//        }
        
        return withoutDuplicates[0]
    }
}
