//
//  WinningGameQueueListCalculator.swift
//  
//
//  Created by Michael Geurtjens on 4/7/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class WinningGameQueueListCalculatorTests: XCTestCase {

//    func testExecute() {
//        measure {
//            let words = GameList().getGame(gameId: 8612)!.winningWords
//            let result = WinningGameQueueListCalculatorV3.Queue_8612(words: words, queueLength: 100, priorityFunction: .score_area)
//        }
//        // average time is 0.009
//    }
    
    func testExecuteV1() {
        measure {
            let words = GameList().getGame(gameId: 8612)!.winningWords
            let result = WinningGameQueueListCalculatorV1.Queue_8612(words: words, queueLength: 100, priorityFunction: .score_area)
        }
        // average time is 0.045
        /// It is really a trivial amount of time compared to all the merges we are doing
    }

}
