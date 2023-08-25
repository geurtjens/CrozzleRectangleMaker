//
//  WinningShapesCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 25/8/2023.
//

import XCTest

final class WinningShapesCalculatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func test_PERF_8612_V1() throws {
        // This is an example of a performance test case.
        self.measure {
            let result = WinningShapesCalculatorV1.Shapes_8612()
        }
    }
    
    func test_PERF_8612_V3() throws {
        // This is an example of a performance test case.
        self.measure {
            let result = WinningShapesCalculatorV3.Shapes_8612()
        }
    }

}
