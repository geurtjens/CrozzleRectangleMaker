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
    
    func test_Shapes_8904() {
        let result = StrategyCalculator.Shapes_8904()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(768, result.score)
        }
    }
    func test_Shapes_8905() {
        let result = StrategyCalculator.Shapes_8905()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(764, result.score)
        }
    }
    
    func test_Shapes_8906() {
        /// cannot solve this as you have a shape deadlock around aRC:aRIES
        let result = StrategyCalculator.Shapes_8906()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(760, result.score)
        }
    }
    
    
    
    
    func test_Shapes_8907() {
        /// this is impossible as we do not have the outer shape.
    }
    
    func test_Shapes_8908() {
        let result = StrategyCalculator.Shapes_8908()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(634, result.score)
        }
    }
    
    /// this should work but it cannot merge with ALoE:oXLIP even though it has plenty of space to do so.
    func test_Shapes_8909() {
        let result = StrategyCalculator.Shapes_8909()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(616, result.score)
        }
    }

    /// cannot do as it has an outer 2x2
    func test_Shapes_8910() {
        
    }
    
    
    func test_Shapes_8911() {
        let result = StrategyCalculator.Shapes_8911()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(692, result.score)
        }
    }
    
    func test_Shapes_8912() {
        let result = StrategyCalculator.Shapes_8912()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(678, result.score)
        }
    }
    
    func test_Shapes_9001() {
        let result = StrategyCalculator.Shapes_9001()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(612, result.score)
        }
    }
    
    func test_Shapes_9002_Cannot() {
        
    }
    
    func test_Shapes_9003() {
        let result = StrategyCalculator.Shapes_9003()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(672, result.score)
        }
    }
    
    func test_Shapes_9004() {
        let result = StrategyCalculator.Shapes_9004()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(720, result.score)
        }
    }
    
    func test_Shapes_9005() {
        let result = StrategyCalculator.Shapes_9005()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(734, result.score)
        }
    }

    func test_Shapes_9006() {
        let result = StrategyCalculator.Shapes_9006()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(686, result.score)
        }
    }
    
    func test_Shapes_9007() {
        let result = StrategyCalculator.Shapes_9007()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(626, result.score)
        }
    }
    
    func test_Shapes_9008_CannotDo() {
        
    }
    
    func test_Shapes_9009() {
        let result = StrategyCalculator.Shapes_9009()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(736, result.score)
        }
    }
    
    func test_Shapes_9010() {
        let result = StrategyCalculator.Shapes_9010()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(722, result.score)
        }
    }
    
    func test_Shapes_9011() {
        let result = StrategyCalculator.Shapes_9011()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(652, result.score)
        }
    }
    
    func test_Shapes_9012() {
        let result = StrategyCalculator.Shapes_9012()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(634, result.score)
        }
    }

    func test_Shapes_9101_WontWork_OuterRequired() {
        let result = StrategyCalculator.Shapes_9101()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(734, result.score)
        }
    }

    func test_Shapes_9102_CannotSolve() {
        
    }
    
    func test_Shapes_9103() {
        let result = StrategyCalculator.Shapes_9103()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(518, result.score)
        }
    }

    func test_Shapes_9104() {
        let result = StrategyCalculator.Shapes_9104()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(728, result.score)
        }
    }
    
    func test_Shapes_9105() {
        let result = StrategyCalculator.Shapes_9105()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(506, result.score)
        }
    }
    
    func test_Shapes_9106() {
        let result = StrategyCalculator.Shapes_9106()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(676, result.score)
        }
    }
    
    func test_Shapes_9107() {
        let result = StrategyCalculator.Shapes_9107()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(710, result.score)
        }
    }
    
    func test_Shapes_9108() {
        let result = StrategyCalculator.Shapes_9108()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(696, result.score)
        }
    }
    func test_Shapes_9109_WontWork() {
//        let result = StrategyCalculator.Shapes_9109()
//        XCTAssertNotNil(result)
//        if let result = result {
//            XCTAssertEqual(636, result.score)
//        }
    }
    
    func test_Shapes_9110() {
        let result = StrategyCalculator.Shapes_9110()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(598, result.score)
        }
    }
    
    func test_Shapes_9111_MergeError() {
        // This should totally work but something stopping and I think its a merge error
        let result = StrategyCalculator.Shapes_9111()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(616, result.score)
        }
    }
    
    func test_Shapes_9112() {
        let result = StrategyCalculator.Shapes_9112()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(552, result.score)
        }
    }
    
    func test_Shapes_9201() {
        let result = StrategyCalculator.Shapes_9201()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(522, result.score)
        }
    }
    
    func test_Shapes_9202() {
        let result = StrategyCalculator.Shapes_9202()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(558, result.score)
        }
    }
    
    func test_Shapes_9203() {
        let result = StrategyCalculator.Shapes_9203()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(548, result.score)
        }
    }
    
    func test_Shapes_9204_WontWork() {
        
    }
    
    
    func test_Shapes_9205() {
        let result = StrategyCalculator.Shapes_9205()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(506, result.score)
        }
    }
    
    func test_Shapes_9206_MergeDefect() {
        let result = StrategyCalculator.Shapes_9206()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(590, result.score)
        }
    }
    
    func test_Shapes_9207() {
        let result = StrategyCalculator.Shapes_9207()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(518, result.score)
        }
    }
    
    
    func test_Shapes_9208() {
        let result = StrategyCalculator.Shapes_9208()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(532, result.score)
        }
    }
    
    func test_Shapes_9209_Outer() {
        
    }
    
    func test_Shapes_9210() {
        let result = StrategyCalculator.Shapes_9210()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(626, result.score)
        }
    }
    
    func test_Shapes_9211() {
        let result = StrategyCalculator.Shapes_9211()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(602, result.score)
        }
    }
    
    func test_Shapes_9212() {
        let result = StrategyCalculator.Shapes_9212()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(576, result.score)
        }
    }
    
    
    
    func test_Shapes_9301() {
        let result = StrategyCalculator.Shapes_9301()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(636, result.score)
        }
    }

    func test_Shapes_9302_MergeProblemSimple() {
        let result = StrategyCalculator.Shapes_9302()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(524, result.score)
        }
    }
    
    func test_Shapes_9303() {
        let result = StrategyCalculator.Shapes_9303()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(654, result.score)
        }
    }
    
    
    func test_Shapes_9304() {
        let result = StrategyCalculator.Shapes_9304()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(676, result.score)
        }
    }
    
    func test_Shapes_9305() {
        let result = StrategyCalculator.Shapes_9305()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(632, result.score)
        }
    }
    
    
    func test_Shapes_9306_MergeError() {
        let result = StrategyCalculator.Shapes_9306()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(554, result.score)
        }
    }
    
    
    func test_Shapes_9307() {
        let result = StrategyCalculator.Shapes_9307()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(610, result.score)
        }
    }
    
    func test_Shapes_9308() {
        let result = StrategyCalculator.Shapes_9308()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(598, result.score)
        }
    }
    
    func test_Shapes_9309() {
        let result = StrategyCalculator.Shapes_9309()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(570, result.score)
        }
    }
    
    func test_Shapes_9310() {
        let result = StrategyCalculator.Shapes_9310()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(440, result.score)
        }
    }
    
    func test_Shapes_9311() {
        let result = StrategyCalculator.Shapes_9311()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(552, result.score)
        }
    }
    
    func test_Shapes_9312() {
        let result = StrategyCalculator.Shapes_9312()
        XCTAssertNotNil(result)
        if let result = result {
            XCTAssertEqual(506, result.score)
        }
    }

    
    
    func test_Shapes_8702New() throws {
        StrategyCalculator.Shapes_8702New()
    }
    
    
    
    
    func test_Shapes_8704New() throws {
        StrategyCalculator.Shapes_8704New()
    }
}
