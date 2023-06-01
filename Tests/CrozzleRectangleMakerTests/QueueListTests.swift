//
//  QueueListTests.swift
//  
//
//  Created by Michael Geurtjens on 1/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class QueueListTests: XCTestCase {
    
    /// Merge 2 word shapes gives 3 word shapes, then merge 3 words shapes with `notTheseWordCounts: [4]` which will allow the 5 word shapes to be added but not any 4 word shapes added
    func test_NotTheseWords() async throws {
        if let game = game {
            let scoresMin = [0, 10, 28, 38, 104, 0, 0, 0, 0, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
            var result = QueueList(game: game, scoresMin: scoresMin)
            
            //print(scoresMin[2])
            let words2 = QueueListCalculator.get_2_word_shapes(
                words: words,
                scoreMin: scoresMin[2],
                widthMax: widthMax,
                heightMax: heightMax,
                wordsMax: wordsMax)
            
            result.add(shapes: words2)
            
            await result.mergeWithItselfAsync(wordCount: 2, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax)
            await result.mergeWithItselfAsync(wordCount: 3, words: words, scoresMin: scoresMin, widthMax: widthMax, heightMax: heightMax, notTheseWordCounts: [4])
            
            XCTAssertEqual(0, result.queues[4].shapes.count)
            XCTAssertEqual(78222, result.queues[5].shapes.count)
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
            words = gameItem.words()
            lengths = WordCalculator.lengths(words: words)
            game = gameItem
        }
    }
}
