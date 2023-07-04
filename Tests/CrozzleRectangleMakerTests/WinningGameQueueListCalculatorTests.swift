//
//  WinningGameQueueListCalculator.swift
//  
//
//  Created by Michael Geurtjens on 4/7/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class WinningGameQueueListCalculatorTests: XCTestCase {

    func testExecute() async {
        let gameList = GameList()
        
        for game in gameList.games {
            let words = game.winningWords
            
            await StrategyCalculator.TryMergeWithLowerOnly(game: game, words: words, queueLength: 5_000)
            
        }
    }

}
