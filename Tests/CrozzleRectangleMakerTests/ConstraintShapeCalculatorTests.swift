//
//  ConstraintShapeCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 23/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class ConstraintShapeCalculatorTests: XCTestCase {
    func test_makeShapeConstraints() {
        let json = ConstraintShapeCalculator.makeShapeConstraints()
        print(json)
    }
    
}
