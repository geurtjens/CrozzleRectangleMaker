//
//  BreadthFirstSearchTests.swift
//  
//
//  Created by Michael Geurtjens on 20/9/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class BreadthFirstSearchTests: XCTestCase {

    func test_executeAllInSerial() {
        BreadthFirstSearch.executeAllInSerial()
    }
    
    func test_executeAllInParallel() async {
        await BreadthFirstSearch.executeAllInParallel()
    }

}
