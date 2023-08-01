//
//  MergeOffsetCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 1/8/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class MergeOffsetCalculatorTests: XCTestCase {

    public let words8612 = ["ZION","AZURE","TOYS","JOY","HAZELNUT","NUTS","NAZARETH","HYMN","TURKEY","SNOW","MERRY","TOAST","STAR","HOLLY","JELLY","FAMILY","WHITE","SING","SAUCE","PORK","TREE","EVE","INN","BELLS","CAKE"]
    
    
    func test_ToShape() {
        let sourceGrid = [
            " . .      ",
            ".NAZARETH.",
            " U I      ",
            " T O      ",
            ".SING.    ",
            " . .      "
        ]
        // Its giving all the opposites like its flipping the grid or something like that
        let sourceShape = ShapeCalculator.toShape(fromGrid: sourceGrid, words: words8612)!
        XCTAssertEqual(4, sourceShape.placements.count)
        
        let source0 = sourceShape.placements[0]
        let source1 = sourceShape.placements[1]
        let source2 = sourceShape.placements[2]
        let source3 = sourceShape.placements[3]
        
        XCTAssertEqual("ZION", words8612[Int(source0.w)])
        XCTAssertEqual(0, source0.w)
        XCTAssertEqual(0, source0.x)
        XCTAssertEqual(3, source0.y)
        XCTAssertFalse(source0.z)
        
        XCTAssertEqual("NUTS", words8612[Int(source1.w)])
        XCTAssertEqual(5, source1.w)
        XCTAssertEqual(0, source1.x)
        XCTAssertEqual(1, source1.y)
        XCTAssertFalse(source1.z)
        
        XCTAssertEqual("NAZARETH", words8612[Int(source2.w)])
        XCTAssertEqual(6, source2.w)
        XCTAssertEqual(0, source2.x)
        XCTAssertEqual(1, source2.y)
        XCTAssertTrue(source2.z)
        
        XCTAssertEqual("SING", words8612[Int(source3.w)])
        XCTAssertEqual(17, source3.w)
        XCTAssertEqual(0, source3.x)
        XCTAssertEqual(4, source3.y)
        XCTAssertTrue(source3.z)
    }
    
    
    
    func test_MatchingWordInExactlySamePositionSoNoOffsets() {
        let sourceGrid = [
            " . .      ",
            ".NAZARETH.",
            " U I      ",
            " T O      ",
            ".SING.    ",
            " . .      "
        ]
        // Its giving all the opposites like its flipping the grid or something like that
        let sourceShape = ShapeCalculator.toShape(fromGrid: sourceGrid, words: words8612)!
        XCTAssertEqual(4, sourceShape.placements.count)
        
        let source0 = sourceShape.placements[0]
        let source1 = sourceShape.placements[1]
        let source2 = sourceShape.placements[2]
        let source3 = sourceShape.placements[3]
        
        XCTAssertEqual("ZION", words8612[Int(source0.w)])
        XCTAssertEqual(0, source0.w)
        XCTAssertEqual(0, source0.x)
        XCTAssertEqual(3, source0.y)
        XCTAssertFalse(source0.z)
        
        XCTAssertEqual("NUTS", words8612[Int(source1.w)])
        XCTAssertEqual(5, source1.w)
        XCTAssertEqual(0, source1.x)
        XCTAssertEqual(1, source1.y)
        XCTAssertFalse(source1.z)
        
        XCTAssertEqual("NAZARETH", words8612[Int(source2.w)])
        XCTAssertEqual(6, source2.w)
        XCTAssertEqual(0, source2.x)
        XCTAssertEqual(1, source2.y)
        XCTAssertTrue(source2.z)
        
        XCTAssertEqual("SING", words8612[Int(source3.w)])
        XCTAssertEqual(17, source3.w)
        XCTAssertEqual(0, source3.x)
        XCTAssertEqual(4, source3.y)
        XCTAssertTrue(source3.z)
        
        let searchGrid = [
            "      . .  ",
            ".NAZARETH. ",
            "      V O  ",
            "    .BELLS.",
            "      . L  ",
            "        Y  ",
            "        .  "
        ]
        
        let searchShape = ShapeCalculator.toShape(fromGrid: searchGrid, words: words8612)!
        
        XCTAssertEqual(4, searchShape.placements.count)
        let search0 = searchShape.placements[0]
        let search1 = searchShape.placements[1]
        let search2 = searchShape.placements[2]
        let search3 = searchShape.placements[3]
        
        XCTAssertEqual("NAZARETH", words8612[Int(search0.w)])
        XCTAssertEqual(6, search0.w)
        XCTAssertEqual(0, search0.x)
        XCTAssertEqual(1, search0.y)
        XCTAssertTrue(search0.z)
        
        XCTAssertEqual("HOLLY", words8612[Int(search1.w)])
        XCTAssertEqual(13, search1.w)
        XCTAssertEqual(8, search1.x)
        XCTAssertEqual(0, search1.y)
        XCTAssertFalse(search1.z)
        
        XCTAssertEqual("EVE", words8612[Int(search2.w)])
        XCTAssertEqual(21, search2.w)
        XCTAssertEqual(6, search2.x)
        XCTAssertEqual(0, search2.y)
        XCTAssertFalse(search2.z)
        
        XCTAssertEqual("BELLS", words8612[Int(search3.w)])
        XCTAssertEqual(23, search3.w)
        XCTAssertEqual(4, search3.x)
        XCTAssertEqual(3, search3.y)
        XCTAssertTrue(search3.z)
        
        let searchShapes = [searchShape]
        
        let searchWordIndex = WordIndex2Calculator.createWordIndex(shapes: searchShapes, totalWords: words8612.count, stride: 4)
        
        XCTAssertEqual(25, searchWordIndex.count)
        
        XCTAssertEqual(1, searchWordIndex[6].count)
        XCTAssertEqual(1, searchWordIndex[13].count)
        XCTAssertEqual(1, searchWordIndex[21].count)
        XCTAssertEqual(1, searchWordIndex[23].count)
        
        let searchWords = WordIndex2Calculator.getWordMatchModels(sourceShape: sourceShape, searchIndex: searchWordIndex,searchMin: 0, searchMax: 0)
        
        XCTAssertEqual(1, searchWords.count)
        XCTAssertEqual(0, searchWords[0].searchShape)
        XCTAssertEqual(2, searchWords[0].sourcePos)
        XCTAssertEqual(0, searchWords[0].searchPos)
        
        let result = WordIndex2Calculator.findShapesContainingCommonWords(
            sourceShape: sourceShape,
            sourceShapeId: 0,
            searchShapes: searchShapes,
            searchWordIndex: searchWordIndex,
            searchMin: 0,
            searchMax: 0,
            widthMax: 17,
            heightMax: 12)
        
    }

}
