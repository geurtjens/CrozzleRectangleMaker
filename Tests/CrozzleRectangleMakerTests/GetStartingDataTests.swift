//
//  GetStartingDataTests.swift
//  
//
//  Created by Michael Geurtjens on 27/12/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class GetStartingDataTests: XCTestCase {

    public func test_findSearchShapeCountAllWords() async {
        let gameList = GameList()
        for game in gameList.games {
            
            let searchShapes = await GetStartingData.getSearchShapes(gameId: game.gameId, words: game.words)
            print("gameId: \(game.gameId), searchShapes: \(searchShapes.count), wordCount: \(game.words.count)")
        }
    }

    func test_Execute() async throws {
        let gameId = 8808
        let words = ["STUTZ", "SUZUKI", "BENZ", "VW", "MAZDA", "VORTEX", "ROCKY", "CAMRY", "SUPRA", "TURBO", "TELSTAR", "ASTRA", "BMW", "RENAULT", "ROLLS", "COLT", "ROMEO", "TARAGO", "AUDI", "MG", "SEDAN", "NOMAD", "SAAB", "GOLF", "ALFA", "LADA"]
        let rootWidth = 1
        let rootShape = 0
        let useGuidedScores = false
        let useShapeScoreLimits = false
        
        let (_, _, _, _, rootTreeNodes, _, _, _) = await GetStartingData.Execute(
            gameId: gameId,
            words: words,
            rootShape: rootShape,
            rootWidth: rootWidth,
            useGuidedScores: useGuidedScores,
            useShapeScoreLimits: useShapeScoreLimits)
        
        XCTAssertEqual(1, rootTreeNodes.count)
        XCTAssertEqual(31, rootTreeNodes[0].childShapes.count)
        
        for shape in rootTreeNodes[0].childShapes {
            print("score: \(shape.score), width: \(shape.width), height: \(shape.height)")
            print(shape.ToText(words: words))
        }
    }

    

}
