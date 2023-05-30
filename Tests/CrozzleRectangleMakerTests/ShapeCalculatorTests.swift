//
//  ShapeCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 26/5/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class ShapeCalculatorTests: XCTestCase {

    func testTextIsVerified() throws {
        let input = "   ..     \n.STAY.    \n  .HAWSER.\n .BOW.    \n.GUY.     \n  O.      \n  Y       \n  .       "
        print(input)
        
        let isVerified = ShapeCalculator.VerifyText(text: input)
        XCTAssertTrue(isVerified)
    }
}
