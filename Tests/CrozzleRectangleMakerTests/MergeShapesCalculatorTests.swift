//
//  MergeShapesCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 20/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class MergeShapesCalculatorTests: XCTestCase {

    
    func testBasic() {
        
        let words = ["NAZARETH", "NUTS","ZION","SING","BELLS","EVE","HOLLY"]
         //score:136, width:6, height:10, words:4, area:32, density:4.25

         let nuts_zion_nazareth_sing_grid = [
             " .  . ",
             ".NUTS.",
             " A  I ",
             ".ZION.",
             " A  G ",
             " R  . ",
             " E    ",
             " T    ",
             " H    ",
             " .    "]
        let (nuts_zion_nazareth_sing_placements, _) = PlacementCalculator.fromTextToPlacements(
            grid: nuts_zion_nazareth_sing_grid,
            words: words)
        //print(nuts_zion_nazareth_sing_placements)
        //print(nuts_zion_nazareth_sing_grid)
        
        //score:52, width:11, height:7, words:4, area:45, density:1.1555556

        let nazareth_bells_eve_holly_grid = [
            "      . .  ",
            ".NAZARETH. ",
            "      V O  ",
            "    .BELLS.",
            "      . L  ",
            "        Y  ",
            "        .  "]
        
        let expected =
            " . .  . .  \n" +
            ".NAZARETH. \n" +
            " U I  V O  \n" +
            " T O.BELLS.\n" +
            ".SING.. L  \n" +
            " . .    Y  \n" +
            "        .  "
        
        
        
        //print(PlacementCalculator.ToCode(fromPlacements: nuts_zion_nazareth_sing_placements))
        
        
        let nuts_zion_nazareth_sing_shape = nuts_zion_nazareth_sing_placements.toShape(score: 136)
        //print(nuts_zion_nazareth_sing_shape.ToString(words: words))
        
        let (nazareth_bells_eve_holly_placements,_) = PlacementCalculator.fromTextToPlacements(
            grid: nazareth_bells_eve_holly_grid,
            words: words)
         
        let nazareth_bells_eve_holly_shape = nazareth_bells_eve_holly_placements.toShape(score:52)
        //print(nazareth_bells_eve_holly_shape.ToString(words: words))
        
        let wordsInt = WordCalculator.WordsToInt(words: words)
        let shapes = MergeShapesCalculator.Merge_Two_Shapes(smaller: [nazareth_bells_eve_holly_shape], larger:[nuts_zion_nazareth_sing_shape] , words: words, wordsInt: wordsInt, widthMax: 17, heightMax: 12)
        XCTAssertEqual(1, shapes.count)
        let shape = shapes[0]
        let (text, _) = ShapeCalculator.ToText(shape: shape, words: words)
        XCTAssertEqual(expected, text)
        print(text)
    }
    

}
