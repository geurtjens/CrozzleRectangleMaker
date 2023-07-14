//
//  MutationCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 28/6/2023.
//


/// First use MutationCalculatorCodeGenTests to regenerate the class for doing this.  I deleted it because it takes so long to compile

import XCTest
@testable import CrozzleRectangleMaker
final class MutationCalculatorTests: XCTestCase {

    func test_generateFiles() {

        MutationCalculator.generateFiles()

    }

    func test_loadMutations() {
        let mutations = MutationCalculator.loadMutations()
        XCTAssertEqual(63873,mutations.count)
    }
    
    func test_mutationsAgainstAllWords() {
        let mutations = MutationCalculator.loadMutations()
        
        let gameList = GameList()
        
        for game in gameList.games {
            if game.gameId < 9401 {
                let words = game.words
                let gameId = game.gameId * 10
                
                MutationCalculator.executeSingleGame(gameId: gameId, mutations: mutations, words: words)
                print("\(game.gameId) complete")
            }
        }
        XCTAssertEqual(63873,mutations.count)
    }
    
}


