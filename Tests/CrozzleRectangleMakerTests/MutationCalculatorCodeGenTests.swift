//
//  MutationCalculatorCodeGenTests.swift
//  
//
//  Created by Michael Geurtjens on 28/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class MutationCalculatorCodeGenTests: XCTestCase {

    func test_execute() {
        let code = MutationCalculatorCodeGen.execute()
        XCTAssertEqual(2075145,code.count)
        //print(code)
    }

}
