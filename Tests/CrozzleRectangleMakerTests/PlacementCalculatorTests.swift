//
//  PlacementCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 10/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker

final class PlacementCalculatorTests: XCTestCase {

    
    
    
    func test_fromTextToPlacement_Fail() {
        
        let grid = [
            "      . .        ",
            "   .INN.J .      ",
            "    . A E T    . ",
            "   .HAZELNUT.. T ",
            " .JOY.A L R.STAR.",
            " A .MERRY.K  O E ",
            ".ZION.E .HE.CAKE.",
            " U  . T.TOYS.S . ",
            " R    H  L.NUTS. ",
            " E    .  L O .   ",
            " . .FAMILY.WHITE.",
            "         . .     "
            ]
        
        let words = [
            "ZION", "AZURE", "TOYS", "JOY", "HAZELNUT", "NUTS", "NAZARETH", "HYMN", "TURKEY", "SNOW",
            "MERRY", "TOAST", "STAR", "HOLLY", "JELLY", "FAMILY", "WHITE", "SING", "SAUCE", "PORK",
            "TREE", "EVE", "INN", "BELLS", "CAKE"]
        
        let (placements, isValid) = PlacementCalculator.fromTextToPlacements(grid: grid, words: words)
        
        XCTAssertFalse(isValid)
        XCTAssertEqual(6, placements.count)
    }
    
    func test_fromTextToPlacements() {
        guard let game = GameList().getGame(gameId: 8612) else {
            return
        }
        
        let winningGame = game.winningGame
        
        let words = game.winningWords
        
        let (placements, isValid) = PlacementCalculator.fromTextToPlacements(grid: winningGame, words: words)
        
        XCTAssertTrue(isValid)
        XCTAssertEqual(words.count, placements.count)
    }
    
}
