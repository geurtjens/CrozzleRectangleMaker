//
//  DuplicateCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 21/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class DuplicateCalculatorTests: XCTestCase {

    func test_Merging_2_Words_Twice() {
        if let game = GameList().getGame(gameId: 8612) {
            
            let edges = QueueListCalculator.get_2_word_shapes(
                words: game.winningWords,
                scoreMin: 28,
                widthMax: game.widthMax,
                heightMax: game.heightMax)
            
            XCTAssertEqual(203, edges.count)
            
            var result = edges + edges
            
            RemoveDuplicatesCalculator.execute(shapes: &result)
            //XCTAssertEqual(203, duplicateCount)
            XCTAssertEqual(203, result.count)

        }
    }

}
