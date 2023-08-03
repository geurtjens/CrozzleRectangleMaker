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
//        let sourceGrid = [
//            " . .      ",
//            ".NAZARETH.",
//            " U I      ",
//            " T O      ",
//            ".SING.    ",
//            " . .      "
//        ]
        
        let sourceGrid = [
            " .  . ",
            ".NUTS.",
            " A  I ",
            ".ZION.",
            " A  G ",
            " R  . ",
            " E    ",
            " T    ",
            " H    ",
            " .    "
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
        XCTAssertTrue(source0.z)
        
        XCTAssertEqual("NUTS", words8612[Int(source1.w)])
        XCTAssertEqual(5, source1.w)
        XCTAssertEqual(0, source1.x)
        XCTAssertEqual(1, source1.y)
        XCTAssertTrue(source1.z)
        
        XCTAssertEqual("NAZARETH", words8612[Int(source2.w)])
        XCTAssertEqual(6, source2.w)
        XCTAssertEqual(1, source2.x)
        XCTAssertEqual(0, source2.y)
        XCTAssertFalse(source2.z)
        
        XCTAssertEqual("SING", words8612[Int(source3.w)])
        XCTAssertEqual(17, source3.w)
        XCTAssertEqual(4, source3.x)
        XCTAssertEqual(0, source3.y)
        XCTAssertFalse(source3.z)
        
        // So we can now merge
        
        
    }
    
    /// Given we have identified a common word between two shapes
    /// AND we have identified the placements of the common word
    /// AND the placements have same direction, both horizontal
    /// AND the placements have the same x,y positions
    /// WHEN we calculate the offsets between these two placements
    /// THEN all offsets will be zero
    func test_offsetsOfMatchingXYZ() {

        // GIVEN placements are same direction and same x,y positions
        let p1 = PlacementModel(w: 6, x: 0, y: 1, z: true, l: 3)
        let p2 = PlacementModel(w: 6, x: 0, y: 1, z: true, l: 3)
        
        /// WHEN we calculate offsets between these two placements
        let (x1, y1, x2, y2, isFlipped) = MergeOffsetCalculator.GetOffsets(p1: p1, p2: p2)
        
        /// THEN all offsets are zero
        XCTAssertEqual(0, x1)
        XCTAssertEqual(0, y1)
        XCTAssertEqual(0, x2)
        XCTAssertEqual(0, y2)
        XCTAssertFalse(isFlipped)
        
    }
    
    func test_offsetFlipped() {
         /*
         let g1 = [ ".....",
                    "#ABC#",
                    "....."]
         
         let g2 = [ ".#.",
                    ".A.",
                    ".B.",
                    ".C.",
                    ".#."]
         */
        
        
        /// Given g2 is a flipped version of g1
        let h1 = PlacementModel(w: 0, x: 0, y: 1, z: true, l: 3)
        let v1 = PlacementModel(w: 0, x: 1, y: 0, z: false, l: 3)
        
        /// WHEN we calculate offsets
        let (x1, y1, x2, y2, isFlipped) = MergeOffsetCalculator.GetOffsets(p1: h1, p2: v1)
        
        /// THEN offsets will all be zero
        XCTAssertEqual(0, x1)
        XCTAssertEqual(0, y1)
        XCTAssertEqual(0, x2)
        XCTAssertEqual(0, y2)
        XCTAssertTrue(isFlipped)
    }
    
    func test_offsetBothHorizontalAndXPlus2() {
        
        /*
         let g1 = [".....",
                   "#ABC#",
                   "....."]
         
         let g2 = [".......",
                   "..#ABC#",
                   "......."]
         */
        
        /// GIVEN g2 is same as g1 except is x + 2
        let h1 = PlacementModel(w: 0, x: 0, y: 1, z: true, l: 3)
        let h2 = PlacementModel(w: 0, x: 2, y: 1, z: true, l: 3)
        
        /// WHEN we calculate offsets
        let (x1, y1, x2, y2, isFlipped) = MergeOffsetCalculator.GetOffsets(p1: h1, p2: h2)
        
        // g1 must change by x + 2 to align with g2
        XCTAssertEqual(2, x1)
        XCTAssertEqual(0, y1)
        XCTAssertEqual(0, x2)
        XCTAssertEqual(0, y2)
        XCTAssertFalse(isFlipped)
    }
    
    func test_FlippedAndBothAreDifferent() {
         
        /*
         let g1 = [".......",
                   "..#ABC#",
                   "......."]
         
         let g2 = ["..#.",
                   "..A.",
                   "..B.",
                   "..C.",
                   "..#."]
         
         /// This is what would happen if g2 was flipped
         let f2 = [".....",
                   ".....",
                   "#ABC#",
                   ".....",
         */
        
        /// GIVEN both are flipped AND x + 2 in g1 and x + 1 for g2
        let h1 = PlacementModel(w: 0, x: 2, y: 1, z: true, l: 3)
        let v2 = PlacementModel(w: 0, x: 2, y: 0, z: false, l: 3)
        
        /// WHEN we calculate offsets
        let (x1, y1, x2, y2, isFlipped) = MergeOffsetCalculator.GetOffsets(p1: h1, p2: v2)
        
        /// THEN g1 is offset by y + 1 and f2 is offset by x + 2 and its flipped
        XCTAssertEqual(0, x1)
        XCTAssertEqual(1, y1)
        XCTAssertEqual(2, x2)
        XCTAssertEqual(0, y2)
        XCTAssertTrue(isFlipped)
    }
    
    
    
    func test_VerticalAndV2IsMovedByXPlus1() {
        
        /*
         let g1 = [".#.",
                   ".A.",
                   ".B.",
                   ".C.",
                   ".#."]
         
         let g2 = ["..#.",
                   "..A.",
                   "..B.",
                   "..C.",
                   "..#."] */
        
        // Given v2 is moved x + 1 from v1
        let v1 = PlacementModel(w: 0, x: 1, y: 0, z: false, l: 3)
        let v2 = PlacementModel(w: 0, x: 2, y: 0, z: false, l: 3)
        /// WHEN we calculate offsets
        let (x1, y1, x2, y2, isFlipped) = MergeOffsetCalculator.GetOffsets(p1: v1, p2: v2)
        
        // THEN v1 would have to shift by x + 1 to align with v2
        XCTAssertEqual(1, x1)
        XCTAssertEqual(0, y1)
        XCTAssertEqual(0, x2)
        XCTAssertEqual(0, y2)
        XCTAssertFalse(isFlipped)
    }
    
    
    
    
    
    func test_MatchingWordInExactlySamePositionSoNoOffsets() {
        
        let sourceGrid = [
            " .  . ",
            ".NUTS.",
            " A  I ",
            ".ZION.",
            " A  G ",
            " R  . ",
            " E    ",
            " T    ",
            " H    ",
            " .    "
        ]
        
        let searchGrid = [
            "      . .  ",
            ".NAZARETH. ",
            "      V O  ",
            "    .BELLS.",
            "      . L  ",
            "        Y  ",
            "        .  "
        ]
        
        let expected = [
            " .  .  ",
            ".NUTS. ",
            " A  I  ",
            ".ZION. ",
            " A  G  ",
            " R B.  ",
            ".EVE.  ",
            " T L   ",
            ".HOLLY.",
            " . S   ",
            "   .   "
        ]
        let expectedWidth = 7
        let expectedHeight = 11
        
        
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
        XCTAssertTrue(source0.z)
        
        XCTAssertEqual("NUTS", words8612[Int(source1.w)])
        XCTAssertEqual(5, source1.w)
        XCTAssertEqual(0, source1.x)
        XCTAssertEqual(1, source1.y)
        XCTAssertTrue(source1.z)
        
        XCTAssertEqual("NAZARETH", words8612[Int(source2.w)])
        XCTAssertEqual(6, source2.w)
        XCTAssertEqual(1, source2.x)
        XCTAssertEqual(0, source2.y)
        XCTAssertFalse(source2.z)
        
        XCTAssertEqual("SING", words8612[Int(source3.w)])
        XCTAssertEqual(17, source3.w)
        XCTAssertEqual(4, source3.x)
        XCTAssertEqual(0, source3.y)
        XCTAssertFalse(source3.z)
        
        
        
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
        
        
       let scoresMin = [0,0,0,0,0,0,0,0,0,0]
        
        
        
        // Here is where we start our real work
        let result = WordIndex2Calculator.findShapesContainingCommonWords(
            words: words8612,
            sourceShape: sourceShape,
            sourceShapeId: 0,
            searchShapes: searchShapes,
            searchWordIndex: searchWordIndex,
            searchMin: 0,
            searchMax: 0,
            scoresMin: scoresMin,
            widthMax: 17,
            heightMax: 12)
        
        // We can print the shapes so now we want to get valid shapes
        for shape in result {
            print(shape.ToString(words: words8612))
        }
        
    }

}
