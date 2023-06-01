//
//  GameListTests.swift
//  
//
//  Created by Michael Geurtjens on 2/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class GameListTests: XCTestCase {

    func test_Init() {
        let gameList = GameList()
        
        for game in gameList.games {
            if game.winningWords.count == 0 || game.nonWinningWords.count == 0 {
                print(game.gameId)
            }
        }
    }

}
