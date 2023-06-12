//
//  StrategyCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 9/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class StrategyCalculatorTests: XCTestCase {

    func test_Shapes8612() throws {
        StrategyCalculator.Shapes_8612()
    }
    func test_Shapes_8612New() throws {
        StrategyCalculator.Shapes_8612New()
    }
    func test_Shapes8702() throws {
        StrategyCalculator.Shapes_8702()
    }
    func test_Shapes_8705() {
        let result = StrategyCalculator.Shapes_8705()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(610, result.score)
        }
    }
    
    
    func test_Shapes_8710() {
        let result = StrategyCalculator.Shapes_8710()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(764, result.score)
        }
    }
    
    func test_Shapes_8711() {
        let result = StrategyCalculator.Shapes_8711()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(810, result.score)
        }
    }
    
    
    func test_Shapes_8712() {
        let result = StrategyCalculator.Shapes_8712()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(680, result.score)
        }
    }
    
    func test_Shapes_8802() {
        let result = StrategyCalculator.Shapes_8802()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(720, result.score)
        }
    }
    
    func test_Shapes_8803() {
        let result = StrategyCalculator.Shapes_8803()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(626, result.score)
        }
    }
    
    func test_Shapes_8804() {
        let result = StrategyCalculator.Shapes_8804()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(836, result.score)
        }
    }
    
    func test_Shapes_8805() {
        // Has shapes I cannot make yet
    }
    
    func test_Shapes_8806() {
        let result = StrategyCalculator.Shapes_8806()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(816, result.score)
        }
    }
    
    func test_Shapes_8807() {
        // Has shapes I cannot make yet
    }
    func test_Shapes_8808() {
        // Has shapes I cannot make yet  it has an MG word so not sure we can cater for two letter words try later
    }
    
    func test_Shapes_8809() {
        let result = StrategyCalculator.Shapes_8809()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(676, result.score)
        }
    }
    
    func test_Shapes_8810() {
        let result = StrategyCalculator.Shapes_8810()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(716, result.score)
        }
    }
    
    func test_Shapes_8811() {
        let result = StrategyCalculator.Shapes_8811()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(630, result.score)
        }
    }
    
    func test_Shapes_8812() {
        let result = StrategyCalculator.Shapes_8812()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(720, result.score)
        }
    }
    
    func test_Shapes_8902() {
        let result = StrategyCalculator.Shapes_8902()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(746, result.score)
        }
    }
    
    func test_Shapes_8903() {
        let result = StrategyCalculator.Shapes_8903()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(652, result.score)
        }
    }
    
    
    
    func test_Shapes_8702New() throws {
        StrategyCalculator.Shapes_8702New()
    }
    func test_Shapes_8704New() throws {
        StrategyCalculator.Shapes_8704New()
    }
}
