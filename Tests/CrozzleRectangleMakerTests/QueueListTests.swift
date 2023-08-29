//
//  QueueListTests.swift
//  
//
//  Created by Michael Geurtjens on 1/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class QueueListTests: XCTestCase {
    
    
    func test_Merging_2_Words_Twice() async throws {
        if let game = game {
            let scoresMin = [0, 10, 28, 38, 104, 0, 0, 0, 0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
            
            let constraints = ConstraintsModel(
                words: words,
                scoresMin: scoresMin,
                queueLengthMax: 2000,
                priorityFunction: .score_area)
            var result = QueueList(game: game, constraints: constraints)
            
            //print(scoresMin[2])
            let edges = QueueListCalculator.get_2_word_shapes(
                words: result.game.words,
                scoreMin: scoresMin[2],
                widthMax: widthMax,
                heightMax: heightMax,
                wordsMax: wordsMax)
            
            XCTAssertEqual(203, edges.count)
            
            result.add(shapes: edges)
            
            XCTAssertEqual(203, result.queues[2].shapes.count)
            
            let words2Twice = QueueListCalculator.get_2_word_shapes(
                words: result.game.words,
                scoreMin: scoresMin[2],
                widthMax: widthMax,
                heightMax: heightMax,
                wordsMax: wordsMax)
            
            XCTAssertEqual(203, words2Twice.count)
            
            result.add(shapes: words2Twice)
            // This should not really happen as creating the same thing twice should not produce a different score
            XCTAssertEqual(203, result.queues[2].shapes.count)
            
            // it could have exactly the same words sorted but different in those other ways.  The sort order is not yet perfect
            
            let shapes = await result.mergeWithItselfAsync(index: 2)
            result.add(shapes: shapes)
            XCTAssertEqual(1687, result.queues[3].shapes.count)
            
            let shapes2 = await result.mergeWithItselfAsync(index: 2)
            result.add(shapes: shapes2)
            XCTAssertEqual(1687, result.queues[3].shapes.count)
            
        }
        
        
        /// Merge 2 word shapes gives 3 word shapes, then merge 3 words shapes with `notTheseWordCounts: [4]` which will allow the 5 word shapes to be added but not any 4 word shapes added
        func test_NotTheseWords() async throws {
            if let game = game {
                let scoresMin = [0, 10, 28, 38, 104, 0, 0, 0, 0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
                
                let constraints = ConstraintsModel(
                    words: words,
                    scoresMin: scoresMin,
                    queueLengthMax: 1000,
                    priorityFunction: .score_area)
                
                var result = QueueList(game: game, constraints: constraints)
                
                //print(scoresMin[2])
                let words2 = QueueListCalculator.get_2_word_shapes(
                    words: words,
                    scoreMin: scoresMin[2],
                    widthMax: widthMax,
                    heightMax: heightMax,
                    wordsMax: wordsMax)
                
                result.add(shapes: words2)
                
                let shapes2 = await result.mergeWithItselfAsync(index: 2)
                result.add(shapes: shapes2)
                let shapes3 = await result.mergeWithItselfAsync(index: 3, notTheseWordCounts: [4])
                result.add(shapes: shapes3)
                XCTAssertEqual(0, result.queues[4].shapes.count)
                XCTAssertEqual(78222, result.queues[5].shapes.count)
            }
        }
    }
    
    func test_NextStep() async {
        let _ = await StrategyCalculator.NextStep(queueLength:1000, priorityFunction: .score_area, repeatTimes: 1)
    }
    
    func test_MergeWinningShapes_EverythingWithEverything() async {
        await StrategyCalculator.BasicStrategy()
    }
    func test_MergeEverythingWithEverything() async throws {
        if let game = game {
            let scoresMin = [0, 10, 28, 38, 104, 0, 0, 0, 0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
            
            let constraints = ConstraintsModel(
                words: words,
                scoresMin: scoresMin,
                queueLengthMax: 2000,
                priorityFunction: .score_area)
            
            var queueList = await QueueListCalculator.Execute(game: game, constraints: constraints)
            await queueList.mergeWithItselfAll()
            
            for i in 0..<40 {
                if queueList.queues[i].shapes.count > 0 {
                    await queueList.mergeEverythingBelowWithAsync(index: i)
                    queueList.printBest()
                }
            }
        }
    }
    
    func test_ExecuteAndMergeItself() async throws {
        if let game = game {
            let scoresMin = [0, 10, 28, 38, 104, 0, 0, 0, 0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
            
            let constraints = ConstraintsModel(
                words: words,
                scoresMin: scoresMin,
                queueLengthMax: 2000,
                priorityFunction: .score_area)
            
            var queueList = await QueueListCalculator.Execute(game: game, constraints: constraints)
            await queueList.mergeWithItselfAll()
            
            if let bestShape = queueList.getBestShape() {
                
                let index = bestShape.placements.count
                await queueList.mergeEverythingBelowWithAsync(index: index)
                queueList.printBest()
                
                if let bestShape2 = queueList.getBestShape() {
                    
                    let index2 = bestShape2.placements.count
                    await queueList.mergeEverythingBelowWithAsync(index: index2)
                    queueList.printBest()
                    
                    for _ in 0..<10 {
                        let index3 = bestShape2.placements.count
                        queueList.add(shapes: await queueList.mergeTwoAsync(mergeIndex: 2, withIndex: index3))
                        queueList.printBest()
                    }
                }
            }
            
            
        }
    }
    
    func test_QueueLengthMax() async throws {
        if let game = game {
            let scoresMin = [0, 10, 28, 38, 104, 0, 0, 0, 0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
            
            let constraints = ConstraintsModel(
                words: words,
                scoresMin: scoresMin,
                queueLengthMax: 25,
                priorityFunction: .score_area)
            
            var queueList = QueueList(game: game, constraints: constraints)
            
            let shapes = QueueListCalculator.get_2_word_shapes(words: game.words, scoreMin: 0, widthMax: widthMax, heightMax: heightMax)
            queueList.add(shapes:shapes)
            
            XCTAssertEqual(25,queueList.queues[2].shapes.count)
            
        }
    }

    
    
    
    /// standard values for all tests
    var game: GameModel?
    let wordsMax = WordData.winningWordsCount_8612
    let widthMax = 17
    let heightMax = 12
    let scoreMin = 0
    var words:[String] = []
    var lengths: [Int] = []
    
    override func setUpWithError() throws {
        let gameList = GameList()
        if let gameItem = gameList.getGame(gameId: 8612) {
            words = gameItem.words
            lengths = WordCalculator.lengths(words: words)
            game = gameItem
        }
    }
}
