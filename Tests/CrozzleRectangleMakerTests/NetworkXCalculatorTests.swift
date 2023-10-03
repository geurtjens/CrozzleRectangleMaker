//
//  NetworkXCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 3/10/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class NetworkXCalculatorTests: XCTestCase {

    

    func testExample() throws {
        
        let result = NetworkXCalculator.execute()
        print(result)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
