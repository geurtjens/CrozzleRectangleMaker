//
//  QueueListCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 23/5/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class QueueListCalculatorTests: XCTestCase {

    
    
    
    func test_get_2_word_shapes() throws {
        
        let shapes = QueueListCalculator.get_2_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        XCTAssertEqual(2, shapes[0].placements.count)
        XCTAssertEqual(10757, shapes.count)
    }
    
    
    func test_get_4_word_shapes() async throws {
        
        let shapes = await QueueListCalculator.get_4_word_shapes(
            words: words,
            scoreMin: 104,
            widthMax: widthMax,
            heightMax: heightMax)
        XCTAssertEqual(4, shapes[0].placements.count)
        XCTAssertEqual(17427, shapes.count)
    }
    
    
    func test_get_5_word_shapes() throws {
        
        let shapes = QueueListCalculator.get_5_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        XCTAssertEqual(5, shapes[0].placements.count)
        XCTAssertEqual(292, shapes.count)
    }
    
    
    func test_get_6_word_shapes() throws {
        
        let shapes = QueueListCalculator.get_6_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        XCTAssertEqual(6, shapes[0].placements.count)
        XCTAssertEqual(52, shapes.count)
    }
    
    
    func test_get_7_word_shapes() throws {
        
        let shapes = QueueListCalculator.get_7_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        XCTAssertEqual(7, shapes[0].placements.count)
        XCTAssertEqual(6, shapes.count)
    }
    
    
    func test_get_8_word_shapes() throws {
        
        let shapes = QueueListCalculator.get_8_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)

        XCTAssertEqual(0, shapes.count)
    }
    
    func test_execute() async throws {

        if let game = game {
            
            let scoresMin = [0, 10, 36, 96, 104, 0, 0, 0, 0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
            let constraints = ConstraintsModel(scoresMin: scoresMin, wordsMax: 0, wordsToUse: .winningWordsOnly)
            let result = await QueueListCalculator.Execute(
                game: game,
                constraints: constraints)
            
            
            
            XCTAssertEqual(words.count, result.game.wordCount)
           
            XCTAssertEqual(40, result.queues.count)
            for i in 2..<40 {
                let queue = result.queues[i]
                if queue.shapes.count > 0 {
                    let firstShape = queue.shapes[0]
                    let (text, score) = ShapeCalculator.ToText(shape: firstShape, words: words)
                    print(score)
                    print(firstShape.placements.count)
                    print(text)
                }
                XCTAssertEqual(i, queue.stride)
                //XCTAssertEqual(1000, queue.scoreMin)
                
            }
        }
    }
    
    var game: GameModel?
    /// standard values for all tests
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
