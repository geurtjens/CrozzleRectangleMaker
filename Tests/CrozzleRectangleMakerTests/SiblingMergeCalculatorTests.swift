//
//  SiblingMergeCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 16/9/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class SiblingMergeCalculatorTests: XCTestCase {

    
    func testExecute() {
        let gameList = GameList()
        for game in gameList.games {
            SiblingMergeCalculator.Execute(gameId: game.gameId, maxLevels: 20)
        }
    }
    
    

}
