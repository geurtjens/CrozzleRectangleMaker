//
//  ClusterCalculatorV3Tests.swift
//  
//
//  Created by Michael Geurtjens on 26/10/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class ClusterCalculatorV3Tests: XCTestCase {

    func test_ClusterCalculatorV3_ExecuteAllSerial() throws {
        let clusterCount = ClusterCalculatorV3.ExecuteAllSerial(scoreMin: 0, includeBreakdown: true)
        XCTAssertEqual(1043636, clusterCount)
    }
    
    func test_EdgeCalculatorV1_ExecuteAllSerial() throws {
        let edgeCount = EdgeCalculatorV1.ExecuteAllSerial(scoreMin: 0, includeBreakdown: true)
        XCTAssertEqual(1813068, edgeCount)
    }

    func test_PacmanCalculatorV3_ExecuteAllSerial() throws {
        let pacmanCount = PacmanCalculatorV3.ExecuteAllSerial(scoreMin: 0, includeBreakdown: true)
        XCTAssertEqual(59566, pacmanCount)
    }
    
    func test_OuterCalculatorV3_ExecuteAllSerial() throws {
        let outerCount = OuterCalculatorV3.ExecuteAllSerial(scoreMin: 0, includeBreakdown: true)
        XCTAssertEqual(58756, outerCount)
    }
    
    func test_RectangleCalculatorV3_ExecuteAllSerial() throws {
        let rectangleCount = RectangleCalculatorV3.ExecuteAllSerial(scoreMin: 0, includeBreakdown: true)
        XCTAssertEqual(58756, rectangleCount)
    }
    func test_AllShapeGenerations() {
        
        let startTime = DateTimeCalculator.now()
        
        let edgeCount = EdgeCalculatorV1.ExecuteAllSerial(scoreMin: 0, includeBreakdown: true)
        XCTAssertEqual(1_813_068, edgeCount)
        
        let clusterCount = ClusterCalculatorV3.ExecuteAllSerial(scoreMin: 0, includeBreakdown: true)
        XCTAssertEqual(1_043_636, clusterCount)
        
        let pacmanCount = PacmanCalculatorV3.ExecuteAllSerial(scoreMin: 0, includeBreakdown: true)
        XCTAssertEqual(59_566, pacmanCount)
        
        let outerCount = OuterCalculatorV3.ExecuteAllSerial(scoreMin: 0, includeBreakdown: true)
        XCTAssertEqual(58_756, outerCount)
        
        let rectangleCount = RectangleCalculatorV3.ExecuteAllSerial(scoreMin: 0, includeBreakdown: true)
        XCTAssertEqual(1_027_168, rectangleCount)
        
        let total = edgeCount + clusterCount + pacmanCount + outerCount + rectangleCount
        XCTAssertEqual(1_497_137_212, total)
        
        let finishTime = DateTimeCalculator.now()
        let duration = DateTimeCalculator.duration(start: startTime, finish: finishTime)
        
        print("RectangleCalculatorV3.ExecuteParallel: \(total) shapes found in \(duration)")
    }
    func testPerformanceExample() throws {

        let options = XCTMeasureOptions()
        options.iterationCount = 1
        
        measure(metrics: [XCTClockMetric()], options: options) {
            
            let edgeCount = EdgeCalculatorV1.ExecuteAllSerial(scoreMin: 0, includeBreakdown: true)
            XCTAssertEqual(1_813_068, edgeCount)
            
            let clusterCount = ClusterCalculatorV3.ExecuteAllSerial(scoreMin: 0, includeBreakdown: true)
            XCTAssertEqual(1_043_636, clusterCount)
            
            let pacmanCount = PacmanCalculatorV3.ExecuteAllSerial(scoreMin: 0, includeBreakdown: true)
            XCTAssertEqual(59_566, pacmanCount)
            
            let outerCount = OuterCalculatorV3.ExecuteAllSerial(scoreMin: 0, includeBreakdown: true)
            XCTAssertEqual(58_756, outerCount)
            
            let rectangleCount = RectangleCalculatorV3.ExecuteAllSerial(scoreMin: 0, includeBreakdown: true)
            XCTAssertEqual(1_027_168, rectangleCount)
            
            let total = edgeCount + clusterCount + pacmanCount + outerCount + rectangleCount
            XCTAssertEqual(1_497_137_212, total)
        }
    }

}
