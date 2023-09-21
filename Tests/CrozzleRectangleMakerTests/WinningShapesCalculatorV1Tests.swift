//
//  WinningShapesCalculatorV1Tests.swift
//  
//
//  Created by Michael Geurtjens on 22/9/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class WinningShapesCalculatorV1Tests: XCTestCase {

    
    func test_getShapes_8803() throws {
        let (shapes, words, x,y) = WinningShapesCalculatorV1.getShapes(gameId: 8803)
        for shape in shapes {
            print(shape.ToText(words: words))
        }
    }

    
}
