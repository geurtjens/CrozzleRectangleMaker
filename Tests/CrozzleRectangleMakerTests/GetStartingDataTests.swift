//
//  GetStartingDataTests.swift
//  
//
//  Created by Michael Geurtjens on 27/12/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class GetStartingDataTests: XCTestCase {

    

    func test_Execute() async throws {
        let gameId = 8808
        let words = ["STUTZ", "SUZUKI", "BENZ", "VW", "MAZDA", "VORTEX", "ROCKY", "CAMRY", "SUPRA", "TURBO", "TELSTAR", "ASTRA", "BMW", "RENAULT", "ROLLS", "COLT", "ROMEO", "TARAGO", "AUDI", "MG", "SEDAN", "NOMAD", "SAAB", "GOLF", "ALFA", "LADA"]
        let rootWidth = 1
        let rootShape = 0
        let useGuidedScores = false
        
        let (_, wordsInt, searchShapes, wordIndex, rootTreeNodes, scoresMin, widthMax, heightMax) = await GetStartingData.Execute(
            gameId: gameId,
            words: words,
            rootShape: rootShape,
            rootWidth: rootWidth,
            useGuidedScores: useGuidedScores)
        
        XCTAssertEqual(1, rootTreeNodes.count)
        XCTAssertEqual(31, rootTreeNodes[0].childShapes.count)
        
        for shape in rootTreeNodes[0].childShapes {
            print("score: \(shape.score), width: \(shape.width), height: \(shape.height)")
            print(shape.ToText(words: words))
        }
    }

    

}
