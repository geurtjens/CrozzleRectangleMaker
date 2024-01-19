//
//  MergeOffsetCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 1/8/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class MergeOffsetCalculatorTests: XCTestCase {

    private let words8612 = [
        "ZION", "AZURE", "TOYS", "JOY", "HAZELNUT", "NUTS", "NAZARETH", "HYMN", "TURKEY", "SNOW",
        "MERRY", "TOAST", "STAR", "HOLLY", "JELLY", "FAMILY", "WHITE", "SING", "SAUCE", "PORK",
        "TREE", "EVE", "INN", "BELLS", "CAKE",
        "GLAZE"]
    
    
    
    
    func test_GetOffsets_SameOrientation() throws {
        
        // GIVEN sourceShape is AzURE:GLAzE
        let source = [
            "  .    ",
            "  G    ",
            "  L    ",
            "  A    ",
            ".AZURE.",
            "  E    ",
            "  .    "]
        let sourceShape = ShapeCalculator.toShape(fromGrid: source, words: words8612)!
        
        // AND searchShape is HAzELNUT:GLAzE
        let search = [
            "   .      ",
            "   G      ",
            "   L      ",
            "   A      ",
            ".HAZELNUT.",
            "   E      ",
            "   .      "]
        let searchShape = ShapeCalculator.toShape(fromGrid: search, words: words8612)!
        
        // WHEN we calculate the offset
        let (x1, y1, x2, y2, differentOrientation) = MergeOffsetCalculator.GetOffsets(
            sourcePlacement: sourceShape.placements[1],
            searchPlacement:searchShape.placements[1])
        
        // THEN the search should be moved to the right with x1 = 1 and the rest can stay the same and with the same orientation
        XCTAssertFalse(differentOrientation)
        XCTAssertEqual(1, x1)
        XCTAssertEqual(0, y1)
        XCTAssertEqual(0, x2)
        XCTAssertEqual(0, y2)
    }
    
    
    
    func testOffsets() {
        /*
         score:52, width:6, height:8, words:2, area:24, density:2.1666667
            "  .   "
            "  T   "
            "  U   "
            "  R   "
            "  K   "
            "  E   "
            ".HYMN."
            "  .   "
         
         score:24, width:8, height:6, words:2, area:24, density:1.0
            "    .   "
            "    P   "
            "    O   "
            "    R   "
            ".TURKEY."
            "    .   "

         Expecting width: 8, height: 8 which is what we get but somehow the target shape thinks it is 6, 10 which means we have an offset problem perhaps
         
            "    .   "
            "    T   "
            "    U   "
            "    R   "
            ".PORK.  "
            "    E   "
            "  .HYMN."
            "    .   "
         
         */
        let p1 = PlacementModel(w: 8, x: 2, y: 0, z: false, l: 6)
        let p2 = PlacementModel(w: 8, x: 0, y: 4, z: true, l: 6)
        let (x1, y1, x2, y2, isFlipped) = MergeOffsetCalculator.GetOffsets(
            sourcePlacement: p1,
            searchPlacement: p2)
        
        // This first step is to get rid of the extra dots
//        let (ax1, ay1) = MergeOffsetCalculator.GetAdjustedPlacement(placement: p1, flipped: isFlipped)
//        let (ax2, ay2) = MergeOffsetCalculator.GetAdjustedPlacement(placement: p2, flipped: isFlipped)
//      
        /*
    score:52, width:6, height:8, words:2, area:24, density:2.1666667
       
       "     H"
       "TURKEY"
       "     M"
       "     N"
         
       "   P  "
       "   O  "
       "   R  "
       "TURKEY"

        */
        XCTAssertEqual(0, x1)
        XCTAssertEqual(2, y1)
        XCTAssertEqual(0, x2)
        XCTAssertEqual(0, y2)
        XCTAssertTrue(isFlipped)
        
        // So this is good except it was flipped and so we need to adjust for the flip
    }
    
    func test_GetOffsets_SameOrientation2() {
        
        // GIVEN sourcePlacement is the TURKEY part of TURKEy:HyMN
//        let sourceGrid = [
//                "      . ",
//                "      H ",
//                ".TURKEY.",
//                "      M ",
//                "      N ",
//                "      . "]
        let sourcePlacement = PlacementModel(w: 8, x: 0, y: 2, z: true, l: 6)
        
        
        // AND searchPlacement is TURKEY part of TURkEY:PORk
//        let searchGrid = [
//                "    .   ",
//                "    P   ",
//                "    O   ",
//                "    R   ",
//                ".TURKEY.",
//                "    .   "]
        let searchPlacement = PlacementModel(w: 8, x: 0, y: 4, z: true, l: 6)
        
        // WHEN we calculate offset of sourcePlacement to searchPlacement
        let (sourceOffsetX, sourceOffsetY, searchOffsetX, searchOffsetY, differentOrientation) = MergeOffsetCalculator.GetOffsets(
            sourcePlacement: sourcePlacement, searchPlacement: searchPlacement)
        
        // THEN the orientation will not be different
        XCTAssertFalse(differentOrientation)
        
        // AND we need to move source
        XCTAssertEqual(0, sourceOffsetX)
        XCTAssertEqual(2, sourceOffsetY)
        XCTAssertEqual(0, searchOffsetX)
        XCTAssertEqual(0, searchOffsetY)
        
        // There seems to be an assumption that the first will be rotated
//        let sourceFlippedGrid = [
//                "  .   ",
//                "  T   ",
//                "  U   ",
//                "  R   ",
//                "  K   ",
//                "  E   ",
//                ".HYMN.",
//                "  .   "]
    }
 
    
    
    func test_GetOffsets_DifferentOrientation2() {
        
        
//        let sourceGrid = [
//                "  .   ",
//                "  T   ",
//                "  U   ",
//                "  R   ",
//                "  K   ",
//                "  E   ",
//                ".HYMN.",
//                "  .   "]
        let sourcePlacement = PlacementModel(w: 8, x: 2, y: 0, z: false, l: 6)
        
        
        // AND searchShape is TURkEY:PORk
//        let searchGrid = [
//                "    .   ",
//                "    P   ",
//                "    O   ",
//                "    R   ",
//                ".TURKEY.",
//                "    .   "]
        let searchPlacement = PlacementModel(w: 8, x: 0, y: 4, z: true, l: 6)
        
        let (sourceOffsetX, sourceOffsetY, searchOffsetX, searchOffsetY, sourceIsFlippedFirst) = MergeOffsetCalculator.GetOffsets(
            sourcePlacement: sourcePlacement,
            searchPlacement: searchPlacement)
        
        XCTAssertTrue(sourceIsFlippedFirst)
        
        // This assumes that we are going to flip the first one first and then it will be correct
        XCTAssertEqual(0, sourceOffsetX)
        XCTAssertEqual(2, sourceOffsetY)
        XCTAssertEqual(0, searchOffsetX)
        XCTAssertEqual(0, searchOffsetY)
        
        // There seems to be an assumption that the first will be rotated as per `test_GetOffsets_SameOrientation2` but this logic is unintuitive
//        let sourceFlippedGrid = [
//                "  .   ",
//                "  T   ",
//                "  U   ",
//                "  R   ",
//                "  K   ",
//                "  E   ",
//                ".HYMN.",
//                "  .   "]
    }
    
    
   
    
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
        let sourcePlacement = PlacementModel(w: 6, x: 0, y: 1, z: true, l: 3)
        let searchPlacement = PlacementModel(w: 6, x: 0, y: 1, z: true, l: 3)
        
        /// WHEN we calculate offsets between these two placements
        let (x1, y1, x2, y2, isFlipped) = MergeOffsetCalculator.GetOffsets(
            sourcePlacement: sourcePlacement,
            searchPlacement: searchPlacement)
        
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
        let (x1, y1, x2, y2, isFlipped) = MergeOffsetCalculator.GetOffsets(
            sourcePlacement: h1, searchPlacement: v1)
        
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
        let (x1, y1, x2, y2, isFlipped) = MergeOffsetCalculator.GetOffsets(
            sourcePlacement: h1,
            searchPlacement: h2)
        
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
        let (x1, y1, x2, y2, isFlipped) = MergeOffsetCalculator.GetOffsets(
            sourcePlacement: h1,
            searchPlacement: v2)
        
        /// THEN g1 is offset by y + 1 and f2 is offset by x + 2 and its flipped
        XCTAssertEqual(0, x1)
        XCTAssertEqual(1, y1)
        XCTAssertEqual(2, x2)
        XCTAssertEqual(0, y2)
        XCTAssertTrue(isFlipped)
    }
    
    
    
    func test_VerticalAndV2IsMovedByXPlus1() {
        
//         let sourceGrid = [
//                    " . ",
//                    " A ",
//                    " B ",
//                    " C ",
//                    " . "]
//         
//         let searchGrid = [
//                    "  . ",
//                    "  A ",
//                    "  B ",
//                    "  C ",
//                    "  . "]
        
        // Given v2 is moved x + 1 from v1
        let sourcePlacement = PlacementModel(w: 0, x: 1, y: 0, z: false, l: 3)
        let searchPlacement = PlacementModel(w: 0, x: 2, y: 0, z: false, l: 3)
        /// WHEN we calculate offsets
        let (sourceOffsetX, sourceOffsetY, searchOffsetX, searchOffsetY, sourceIsFlippedFirst) = MergeOffsetCalculator.GetOffsets(
            sourcePlacement: sourcePlacement,
            searchPlacement: searchPlacement)
        
        // THEN v1 would have to shift by x + 1 to align with v2
        XCTAssertEqual(1, sourceOffsetX)
        XCTAssertEqual(0, sourceOffsetY)
        XCTAssertEqual(0, searchOffsetX)
        XCTAssertEqual(0, searchOffsetY)
        XCTAssertFalse(sourceIsFlippedFirst)
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
        
//        let expected = [
//            " .  .  ",
//            ".NUTS. ",
//            " A  I  ",
//            ".ZION. ",
//            " A  G  ",
//            " R B.  ",
//            ".EVE.  ",
//            " T L   ",
//            ".HOLLY.",
//            " . S   ",
//            "   .   "
//        ]
//        let expectedWidth = 7
//        let expectedHeight = 11
//        
//        
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
        
        let searchIndex = WordIndex2Calculator.createWordIndex(shapes: searchShapes, totalWords: words8612.count, stride: 4)
        
        XCTAssertEqual(26, searchIndex.count)
        
        XCTAssertEqual(1, searchIndex[6].count)
        XCTAssertEqual(1, searchIndex[13].count)
        XCTAssertEqual(1, searchIndex[21].count)
        XCTAssertEqual(1, searchIndex[23].count)
        
        let searchWords = WordIndex2Calculator.getWordMatchModels(sourceShape: sourceShape, searchIndex: searchIndex,searchMin: 0, searchMax: 0)
        
        XCTAssertEqual(1, searchWords.count)
        XCTAssertEqual(0, searchWords[0].searchShape)
        XCTAssertEqual(2, searchWords[0].sourcePos)
        XCTAssertEqual(0, searchWords[0].searchPos)
        
        
       let scoresMin = [0,0,0,0,0,0,0,0,0,0]
        
        
        
        // Here is where we start our real work
        let result = WordIndex2Calculator.findMergedShapes(
            words: words8612,
            sourceShape: sourceShape,
            sourceShapeId: 0,
            searchShapes: searchShapes,
            searchIndex: searchIndex,
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
