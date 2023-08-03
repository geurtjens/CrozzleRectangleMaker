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
    
    func test_fromTextToPlacementHorizontal_NAZARETH_SING() {
        
        let words = [
                "ZION", "AZURE", "TOYS", "JOY", "HAZELNUT", "NUTS", "NAZARETH", "HYMN", "TURKEY", "SNOW",
                "MERRY", "TOAST", "STAR", "HOLLY", "JELLY", "FAMILY", "WHITE", "SING", "SAUCE", "PORK",
                "TREE", "EVE", "INN", "BELLS" ,"CAKE"]
        let grid = [
                " . .      ",
                ".NAZARETH.",
                " U I      ",
                " T O      ",
                ".SING.    ",
                " . .      "
            ]
        
        let (horizontal, isValid) = PlacementCalculator.fromTextToPlacementsHorizontal(grid: grid, words: words)
        
        XCTAssertTrue(isValid)
        
        XCTAssertEqual(2, horizontal.count)
        
        let a = horizontal[0]
        let b = horizontal[1]
        
        XCTAssertEqual(6, a.w)
        XCTAssertEqual("NAZARETH", words[Int(a.w)])
        XCTAssertEqual(0, a.x)
        XCTAssertEqual(1, a.y)
        XCTAssertTrue(a.z)
        
        XCTAssertEqual(17, b.w)
        XCTAssertEqual("SING", words[Int(b.w)])
        XCTAssertEqual(0, b.x)
        XCTAssertEqual(4, b.y)
        XCTAssertTrue(b.z)
    }
    
    func test_fromTextToPlacementHorizontal_NAZARETH_BELLS() {
        
        let words = [
                "ZION", "AZURE", "TOYS", "JOY", "HAZELNUT", "NUTS", "NAZARETH", "HYMN", "TURKEY", "SNOW",
                "MERRY", "TOAST", "STAR", "HOLLY", "JELLY", "FAMILY", "WHITE", "SING", "SAUCE", "PORK",
                "TREE", "EVE", "INN", "BELLS" ,"CAKE"]
        let grid = [
            "      . .  ",
            ".NAZARETH. ",
            "      V O  ",
            "    .BELLS.",
            "      . L  ",
            "        Y  ",
            "        .  "
        ]
        
        let (horizontal, isValid) = PlacementCalculator.fromTextToPlacementsHorizontal(grid: grid, words: words)
        
        XCTAssertTrue(isValid)
        
        XCTAssertEqual(2, horizontal.count)
        
        let a = horizontal[0]
        let b = horizontal[1]
        
        XCTAssertEqual(6, a.w)
        XCTAssertEqual("NAZARETH", words[Int(a.w)])
        XCTAssertEqual(0, a.x)
        XCTAssertEqual(1, a.y)
        XCTAssertTrue(a.z)
        
        XCTAssertEqual(23, b.w)
        XCTAssertEqual("BELLS", words[Int(b.w)])
        XCTAssertEqual(4, b.x)
        XCTAssertEqual(3, b.y)
        XCTAssertTrue(b.z)
    }
    
    func test_fromTextToPlacementVertical_NUTS_ZION() {
        
        let words = [
                "ZION", "AZURE", "TOYS", "JOY", "HAZELNUT", "NUTS", "NAZARETH", "HYMN", "TURKEY", "SNOW",
                "MERRY", "TOAST", "STAR", "HOLLY", "JELLY", "FAMILY", "WHITE", "SING", "SAUCE", "PORK",
                "TREE", "EVE", "INN", "BELLS" ,"CAKE"]
        let grid = [
                " . .      ",
                ".NAZARETH.",
                " U I      ",
                " T O      ",
                ".SING.    ",
                " . .      "
            ]
        
        let (horizontal, isValid) = PlacementCalculator.fromTextToPlacementsVertical(grid: grid, words: words)
        
        XCTAssertTrue(isValid)
        
        XCTAssertEqual(2, horizontal.count)
        
        let a = horizontal[0]
        let b = horizontal[1]
        
        XCTAssertEqual(5, a.w)
        XCTAssertEqual("NUTS", words[Int(a.w)])
        XCTAssertEqual(1, a.x)
        XCTAssertEqual(0, a.y)
        XCTAssertFalse(a.z)
        
        XCTAssertEqual("ZION", words[Int(b.w)])
        XCTAssertEqual(0, b.w)
        XCTAssertEqual(3, b.x)
        XCTAssertEqual(0, b.y)
        XCTAssertFalse(b.z)
        
        
    }
    func test_fromTextToPlacementVertical_EVE_HOLLY() {
        
        let words = [
                "ZION", "AZURE", "TOYS", "JOY", "HAZELNUT", "NUTS", "NAZARETH", "HYMN", "TURKEY", "SNOW",
                "MERRY", "TOAST", "STAR", "HOLLY", "JELLY", "FAMILY", "WHITE", "SING", "SAUCE", "PORK",
                "TREE", "EVE", "INN", "BELLS" ,"CAKE"]
        let grid = [
            "      . .  ",
            ".NAZARETH. ",
            "      V O  ",
            "    .BELLS.",
            "      . L  ",
            "        Y  ",
            "        .  "
        ]
        
        let (verticalPlacements, isValid) = PlacementCalculator.fromTextToPlacementsVertical(grid: grid, words: words)
        
        XCTAssertTrue(isValid)
        
        XCTAssertEqual(2, verticalPlacements.count)
        
        let a = verticalPlacements[0]
        let b = verticalPlacements[1]
        
        XCTAssertEqual(21, a.w)
        XCTAssertEqual("EVE", words[Int(a.w)])
        XCTAssertEqual(6, a.x)
        XCTAssertEqual(0, a.y)
        XCTAssertFalse(a.z)
        
        XCTAssertEqual(13, b.w)
        XCTAssertEqual("BELL", words[Int(b.w)])
        XCTAssertEqual(8, b.x)
        XCTAssertEqual(0, b.y)
        XCTAssertFalse(b.z)
        
        
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
