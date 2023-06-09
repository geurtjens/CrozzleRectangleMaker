//
//  StrategyCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 9/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class StrategyCalculatorTests: XCTestCase {

    func test_Shapes8612() async throws {
        await StrategyCalculator.Shapes_8612()
    }
    
    func test_BrokenMerge() async {
        
        let largePlacements = [
                PlacementModel(i: 0, h: true, x: 0, y: 9, l:4),
                PlacementModel(i: 1, h: true, x: 5, y: 10, l:5),
                PlacementModel(i: 2, h: false, x: 6, y: 0, l:4),
                PlacementModel(i: 3, h: false, x: 5, y: 11, l:3),
                PlacementModel(i: 4, h: false, x: 7, y: 7, l:8),
                PlacementModel(i: 5, h: true, x: 0, y: 7, l:4),
                PlacementModel(i: 6, h: false, x: 1, y: 6, l:8),
                PlacementModel(i: 7, h: true, x: 6, y: 8, l:4),
                PlacementModel(i: 8, h: false, x: 8, y: 2, l:6),
                PlacementModel(i: 9, h: true, x: 0, y: 1, l:4),
                PlacementModel(i: 10, h: false, x: 9, y: 7, l:5),
                PlacementModel(i: 11, h: true, x: 5, y: 1, l:5),
                PlacementModel(i: 13, h: true, x: 0, y: 14, l:5),
                PlacementModel(i: 14, h: true, x: 4, y: 12, l:5),
                PlacementModel(i: 15, h: true, x: 0, y: 3, l:6),
                PlacementModel(i: 16, h: false, x: 4, y: 0, l:5),
                PlacementModel(i: 17, h: false, x: 4, y: 6, l:4),
                PlacementModel(i: 18, h: true, x: 5, y: 4, l:5),
                PlacementModel(i: 20, h: false, x: 10, y: 0, l:4),
                PlacementModel(i: 21, h: true, x: 0, y: 12, l:3),
                PlacementModel(i: 23, h: false, x: 3, y: 10, l:5),
                PlacementModel(i: 24, h: true, x: 0, y: 5, l:4)
            ]
        let largeShape = ShapeModel(score: 636, width: 12, height: 17, placements: largePlacements)
        
        let largeShapeReversed = ShapeCalculator.Flip(shape: largeShape)
        
        let smallPlacements = [
                PlacementModel(i: 8, h: true, x: 0, y: 3, l:6),
                PlacementModel(i: 19, h: false, x: 3, y: 0, l:4)
            ]
        let smallShape = ShapeModel(score: 28, width: 8, height: 6, placements: smallPlacements)
        
        
        let gameList = GameList()
        
        guard let game = gameList.getGame(gameId: 8612) else {
            return
        }
                
        let words = game.winningWords
        
        print(largeShape.ToString(words: words))
        
        print(smallShape.ToString(words: words))
        
        let smallShapeReversed = ShapeCalculator.Flip(shape: smallShape)
        
        print(smallShapeReversed.ToString(words: words))

        let value = StrategyCalculator.Merge_Two_Shapes(smaller: [smallShapeReversed], larger: [largeShape], words: words)
        
        print(value)
        
       
    }
}
