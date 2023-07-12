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

    func test_execute() {

        let result = MutationCalculator.execute()
        XCTAssertEqual(15, result.count)
    }

}
