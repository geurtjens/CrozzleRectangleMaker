//
//  WordIndexModelV2Tests.swift
//  
//
//  Created by Michael Geurtjens on 27/8/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class WordIndexModelV2Tests: XCTestCase {
let scoreMin = 0
    let widthMax = 17
    let heightMax = 12
   
    func test_WordIndexModelV2() throws {
        
        /*
         ..
      .STAY.
        .HAWSER.
       .BOW.
      .GUY.
        O.
        Y
        .
         */
        
        let words = ["AHOY", "YAW", "STAY", "HAWSER","BOW", "GUY", "BUOY"] // WordData.words_8806()
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        let c2x2 = ClusterCalculatorV1.C2x2(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let c2x2Shapes = ShapeCalculator.toShape(fromClusters: c2x2)
        
        
        
        let (C2x2Text,C2x2Score) = ShapeCalculator.ToText(shape:c2x2Shapes[0], words: words)
        print("Shape A score: \(C2x2Score)")
        print(C2x2Text)
        
        let c2x3 = ClusterCalculatorV1.C2x3(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let c2x3Shapes = ShapeCalculator.toShape(fromClusters: c2x3)
        let (C2x3Text,C2x3Score) = ShapeCalculator.ToText(shape:c2x3Shapes[0], words: words)
        print("Shape B score: \(C2x3Score)")
        print(C2x3Text)
        
        
        let sourceShapes = c2x2Shapes
        let searchShapes = c2x3Shapes
        
        let wordModel = WordIndexModelV2(searchShapes, 5, words.count)
        
        let foundList = wordModel.FindMatches(sourceShapes[0], 0, 0, 0, searchShapes)
        
        XCTAssertEqual(1,foundList.count)
    }
}
