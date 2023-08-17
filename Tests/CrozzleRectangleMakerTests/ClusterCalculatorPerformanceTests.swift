//
//  ClusterCalculatorPerformanceTests.swift
//  
//
//  Created by Michael Geurtjens on 16/8/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class ClusterCalculatorPerformanceTests: XCTestCase {

    
    // By default, it returns [XCTClockMetric()]
    // XCTClockMetric() is to measure the number of seconds the block of code takes to execute.
    override class var defaultMetrics: [XCTMetric] {
        return [
            XCTClockMetric(),
            XCTStorageMetric(),
            XCTMemoryMetric(),
            XCTCPUMetric()
        ]
    }
    
    func test_PerformanceMemory_Execute_8612() throws {
        let options = XCTMeasureOptions()
        options.iterationCount = 2 /* Tweak this value on a test-by-test basis */
        
       
        
        //measure(metrics: [memory,XCTCPUMetric.init()]) {
        //measure(options: options) {
        measure(metrics: [XCTMemoryMetric()], options: options) {
            /// GIVEN we use the words from 8612
            let words = WordData.words_8612()
            
            /// WHEN we search for all cluster shapes
            let result = ClusterCalculator.Execute(words:words,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
            
            /// THEN we get 1,149 shapes
            XCTAssertEqual(1149, result.count)
            
            /// AND the first shape has the score of 146
            XCTAssertEqual(146, result[0].score)
           
            /// AND it takes `2.434` to complete in debug mode, incidentally it takes `0.365` in release mode so insignificant to user experience
            ///
            
        }
    }
    
    func test_Performance_Execute_8612() throws {
        let options = XCTMeasureOptions()
        options.iterationCount = 1 /* Tweak this value on a test-by-test basis */
        
       
        
        //measure(metrics: [memory,XCTCPUMetric.init()]) {
        //measure(options: options) {
        measure(options: options) {
            /// GIVEN we use the words from 8612
            let words = WordData.words_8612()
            
            /// WHEN we search for all cluster shapes
            let result = ClusterCalculator.Execute(words:words,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax)
            
            /// THEN we get 1,149 shapes
            XCTAssertEqual(1149, result.count)
            
            /// AND the first shape has the score of 146
            XCTAssertEqual(146, result[0].score)
           
            /// AND it takes `2.434` to complete in debug mode, incidentally it takes `0.365` in release mode so insignificant to user experience
            ///
            
        }
    }

    let scoreMin = 0
    let widthMax = 17
    let heightMax = 12
}
