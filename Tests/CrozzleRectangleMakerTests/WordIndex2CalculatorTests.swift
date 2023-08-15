////
////  WordIndex2CalculatorTests.swift
////  
////
////  Created by Michael Geurtjens on 4/8/2023.
////
//
//import XCTest
//@testable import CrozzleRectangleMaker
//final class WordIndex2CalculatorTests: XCTestCase {
//
//    private let scoresMin = [0,0,0,0,0,0,0,0,0,0,0,0]
//    private let words = ["ZION", "AZURE", "TOYS", "JOY", "HAZELNUT", "NUTS", "NAZARETH", "HYMN", "TURKEY", "SNOW",
//                     "MERRY", "TOAST", "STAR", "HOLLY", "JELLY", "FAMILY", "WHITE", "SING", "SAUCE", "PORK",
//                     "TREE", "EVE", "INN", "BELLS", "CAKE"]
//    private let widthMax = 17
//    private let heightMax = 12
//    
//    
//   
//    
//    
//    func test_AzURE_HAzELNUT_HAZELNUt_tREE() throws {
//        
//        
//        // this is what the placements calculator gives me, notice the unnecessary space at top left
//        
//
//        //score:84, width:7, height:10, words:2
//        let sourceGrid = [
//            "  .    ",
//            "  H    ",
//            "  A    ",
//            ".AZURE.",
//            "  E    ",
//            "  L    ",
//            "  N    ",
//            "  U    ",
//            "  T    ",
//            "  .    "]
//        let sourceShape = ShapeCalculator.toShape(fromGrid: sourceGrid, words: words)!
//        let sourcePlacement = sourceShape.placements[1]
//
//        //score:36, width:10, height:6, words:2
//        let searchGrid = [
//            "        . ",
//            ".HAZELNUT.",
//            "        R ",
//            "        E ",
//            "        E ",
//            "        . "]
//        let searchShape = ShapeCalculator.toShape(fromGrid: searchGrid, words: words)!
//        let searchPlacement = searchShape.placements[0]
//        
//        
//        let (sourceOffsetX, sourceOffsetY, searchOffsetX, searchOffsetY, sourceIsFlipped) = MergeOffsetCalculator.GetOffsets(
//            sourcePlacement: sourcePlacement,
//            searchPlacement: searchPlacement)
//        
//        XCTAssertTrue(sourceIsFlipped)
//        XCTAssertEqual(0, sourceOffsetX)
//        XCTAssertEqual(0, sourceOffsetY)
//        XCTAssertEqual(0, searchOffsetX)
//        XCTAssertEqual(1, searchOffsetY)
//
//        let matches = [WordIndexResultModel(searchPos: 0, sourcePos: 1)]
//        let (sourcePlacements, searchPlacements) = WordIndex2Calculator.extractPlacements(
//            matches: matches,
//            sourceShape: sourceShape,
//            searchShape: searchShape,
//            sourceOffsetX: sourceOffsetX,
//            sourceOffsetY: sourceOffsetY,
//            searchOffsetX: searchOffsetX,
//            searchOffsetY: searchOffsetY,
//            sourceIsFlipped: sourceIsFlipped)
//
//        //lets now see the placements generation
//        let placements = sourcePlacements + searchPlacements
//        
//        let placementsText = placements.toShape(score: 0).ToText(words: words)
//       
////        let placements_grid = [
////            "   .     . ",
////            " .HAZELNUT.",
////            "   Z     R ",
////            "   U     E ",
////            "   R     E ",
////            "   E     . ",
////            "   .       "]
//        
//        let expectedPlacementsText =
//            "   .      \n" +
//            "   A    . \n" +
//            ".HAZELNUT.\n" +
//            "   U    R \n" +
//            "   R    E \n" +
//            "   E    E \n" +
//            "   .    . "
//
//        //print(expectedPlacementsText)
//        //print(placementsText)
//        XCTAssertEqual(expectedPlacementsText, placementsText)
//        
////        let sourceGridFlipped = [
////            "   .      ",
////            "   A      ",
////            ".HAZELNUT.",
////            "   U      ",
////            "   R      ",
////            "   E      ",
////            "   .      "]
////        let sourceShapeFlipped = ShapeCalculator.toShape(fromGrid: sourceGridFlipped, words: words)
//    }
//    
//    
//    
//    func test_WillGetWrongSize() throws {
//        
//        //score:84, width:6, height:7, words:2
//        let sourceGrid = [
//            " .    ",
//            " A    ",
//            ".ZION.",
//            " U    ",
//            " R    ",
//            " E    ",
//            " .    "]
//        let sourceShape = ShapeCalculator.toShape(fromGrid: sourceGrid, words: words)!
//        
//        //score:90, width:9, height:7, words:4
//        let searchGrid = [
//            "   . .   ",
//            "   N M   ",
//            ".AZURE.  ",
//            "   T R   ",
//            "   S R   ",
//            "   .HYMN.",
//            "     .   "]
//        let searchShape = ShapeCalculator.toShape(fromGrid: searchGrid, words: words)!
//        
//        let sourceFirstPos = 1
//        let searchFirstPos = 0
//        
//        let sourcePlacement = sourceShape.placements[sourceFirstPos]
//        let searchPlacement = searchShape.placements[searchFirstPos]
//        
//        // get the offsets and then combine the placements and make the shape like we used to
//        let (sourceOffsetX, sourceOffsetY, searchOffsetX, searchOffsetY, sourceIsFlipped) = MergeOffsetCalculator.GetOffsets(
//            sourcePlacement: sourcePlacement,
//            searchPlacement: searchPlacement)
//        
//        XCTAssertTrue(sourceIsFlipped)
//        XCTAssertEqual(0, sourceOffsetX)
//        XCTAssertEqual(1, sourceOffsetY)
//        XCTAssertEqual(0, searchOffsetX)
//        XCTAssertEqual(0, searchOffsetY)
//        
//        let sourceFlippedGrid = [
//            "  .    ",
//            ".AZURE.",
//            "  I    ",
//            "  O    ",
//            "  N    ",
//            "  .    "]
//        
//        // Its not going to be valid in the end but it is still valid size
//        let expectedGrid = [
//            "   . .   ",
//            "  .N M   ",
//            ".AZURE.  ",
//            "  IT R   ",
//            "  OS R   ",
//            "  N.HYMN.",
//            "  .  .   "]
//        
//        let widthExpected = 9
//        let heightExpected = 7
//        
//        let (sizeIsValid, width, height, firstIsFlipped) = MergeSizeValidation2.execute(
//            sourceShape: sourceShape,
//            sourcePos: sourceFirstPos,
//            searchShape: searchShape,
//            searchPos: searchFirstPos,
//            widthMax: widthMax,
//            heightMax: heightMax
//        )
//        
//        XCTAssertTrue(sizeIsValid)
//        XCTAssertEqual(widthExpected, width)
//        XCTAssertEqual(heightExpected, height)
//        XCTAssertTrue(firstIsFlipped)
//        
//        
////        let searchIndex = WordIndex2Calculator.createWordIndex(shapes: [searchShape], totalWords: words.count, stride: 4)
////
////        let shapes = WordIndex2Calculator.findMergedShapes(
////            words: words,
////            sourceShape: sourceShape,
////            sourceShapeId: 0,
////            searchShapes: [searchShape],
////            searchIndex: searchIndex,
////            searchMin: 0,
////            searchMax: 0,
////            scoresMin: scoresMin,
////            widthMax: widthMax,
////            heightMax: heightMax)
//        
//        
//    }
//    
//    func test_NAzARETH_HAzELNUT_tOYS_HAZELNUt2() throws {
//        let sourceGrid = [
//            "   .      ",
//            "   H      ",
//            "   A      ",
//            ".NAZARETH.",
//            "   E      ",
//            "   L      ",
//            "   N      ",
//            "   U      ",
//            "   T      ",
//            "   .      "]
//        let sourceShape = ShapeCalculator.toShapeNoFlip(fromGrid: sourceGrid, words: words)!
//        // To ValidShape will flip it so our placements selection is wrong
//        let sourcePlacement = sourceShape.placements[1]
//
//        let searchGrid = [
//            " .    ",
//            " H    ",
//            " A    ",
//            " Z    ",
//            " E    ",
//            " L    ",
//            " N    ",
//            " U    ",
//            ".TOYS.",
//            " .    "]
//        let searchShape = ShapeCalculator.toShapeNoFlip(fromGrid: searchGrid, words: words)!
//        let searchPlacement = searchShape.placements[1]
//        
//        /// WHEN we calculate offsets
//        let (sourceOffsetX, sourceOffsetY, searchOffsetX, searchOffsetY, sourceIsFlipped) = MergeOffsetCalculator.GetOffsets(
//            sourcePlacement: sourcePlacement,
//            searchPlacement: searchPlacement)
//        
//        /// THEN `searchOffsetX` must change by `2`
//        XCTAssertEqual(0, sourceOffsetX)
//        XCTAssertEqual(0, sourceOffsetY)
//        XCTAssertEqual(2, searchOffsetX)
//        XCTAssertEqual(0, searchOffsetY)
//        XCTAssertFalse(sourceIsFlipped)
//        
//        
//        let matches = [WordIndexResultModel(searchPos: 1, sourcePos: 1)]
//        let (sourcePlacements, searchPlacements) = WordIndex2Calculator.extractPlacements(
//            matches: matches,
//            sourceShape: sourceShape,
//            searchShape: searchShape,
//            sourceOffsetX: sourceOffsetX,
//            sourceOffsetY: sourceOffsetY,
//            searchOffsetX: searchOffsetX,
//            searchOffsetY: searchOffsetY,
//            sourceIsFlipped: sourceIsFlipped)
//
//        //lets now see the placements generation
//        let placements = sourcePlacements + searchPlacements
//        
//        let placementsText = placements.toShape(score: 0).ToText(words: words)
//               
//        let expectedPlacementsText =
//        "   .      \n" +
//        "   H      \n" +
//        "   A      \n" +
//        ".NAZARETH.\n" +
//        "   E      \n" +
//        "   L      \n" +
//        "   N      \n" +
//        "   U      \n" +
//        "  .TOYS.  \n" +
//        "   .      "
//
//        print(expectedPlacementsText)
//        print(placementsText)
//        XCTAssertEqual(expectedPlacementsText, placementsText)
//    }
//    
//    
//    func test_HAzELNUT_NAzARETH_tOYS_HAZELNUt() throws {
//        let sourceGrid = [
//            "   .      ",
//            "   N      ",
//            "   A      ",
//            ".HAZELNUT.",
//            "   A      ",
//            "   R      ",
//            "   E      ",
//            "   T      ",
//            "   H      ",
//            "   .      "]
//        let sourceShape = ShapeCalculator.toShapeNoFlip(fromGrid: sourceGrid, words: words)!
//        let sourcePlacement = sourceShape.placements[0]
//
//        let searchGrid = [
//            " .    ",
//            " H    ",
//            " A    ",
//            " Z    ",
//            " E    ",
//            " L    ",
//            " N    ",
//            " U    ",
//            ".TOYS.",
//            " .    "]
//        let searchShape = ShapeCalculator.toShapeNoFlip(fromGrid: searchGrid, words: words)!
//        let searchPlacement = searchShape.placements[1]
//        
//        /// WHEN we calculate offsets
//        let (sourceOffsetX, sourceOffsetY, searchOffsetX, searchOffsetY, sourceIsFlipped) = MergeOffsetCalculator.GetOffsets(
//            sourcePlacement: sourcePlacement,
//            searchPlacement: searchPlacement)
//        
//        /// THEN `searchOffsetX` must change by `2`
//        XCTAssertEqual(0, sourceOffsetX)
//        XCTAssertEqual(0, sourceOffsetY)
//        XCTAssertEqual(0, searchOffsetX)
//        XCTAssertEqual(2, searchOffsetY)
//        XCTAssertTrue(sourceIsFlipped)
//        
//        let matches = [WordIndexResultModel(searchPos: 1, sourcePos: 0)]
//        let (sourcePlacements, searchPlacements) = WordIndex2Calculator.extractPlacements(
//            matches: matches,
//            sourceShape: sourceShape,
//            searchShape: searchShape,
//            sourceOffsetX: sourceOffsetX,
//            sourceOffsetY: sourceOffsetY,
//            searchOffsetX: searchOffsetX,
//            searchOffsetY: searchOffsetY,
//            sourceIsFlipped: sourceIsFlipped)
//
//        //lets now see the placements generation
//        let placements = sourcePlacements + searchPlacements
//        
//        let placementsText = placements.toShape(score: 0).ToText(words: words)
//        
//        let expectedPlacementsText =
//        "   .      \n" +
//        "   H      \n" +
//        "   A      \n" +
//        ".NAZARETH.\n" +
//        "   E      \n" +
//        "   L      \n" +
//        "   N      \n" +
//        "   U      \n" +
//        "  .TOYS.  \n" +
//        "   .      "
//
//        print(expectedPlacementsText)
//        print(placementsText)
//        XCTAssertEqual(expectedPlacementsText, placementsText)
//    }
//    
//    
//    func test_NAzARETH_HAzELNUT_tOYS_HAZELNUt() throws {
//        
//        /// We have an example where `sourceShape` and `searchShape` have `HAZELNUT` as common word and `sourceShape` must be flipped as `HAZENUT` is opposite orientation.
//        /// What we observe is that `searchShape` is asked to `offsetY` by 2 but if `sourceShape` is flipped it would by `offsetX` instead
//        /// We want the result to be the same size regardless of whether `sourceShape` must be flipped
//        /// `HAZELNUT` is word 4 in the sequence
//        
//        /// GIVEN `sourceShape` is `NAzARETH:HAzELNUT`
//        /// AND `searchShape` is `tOYS:HAZENUt`
//        /// WHEN we calculate offsets
//        /// THEN `searchOffsetX` must change by `2`
//        
//        
//        /// GIVEN `sourceShape` is `NAzARETH:HAzELNUT`
//        let sourceGrid = [
//            "   .      ",
//            "   H      ",
//            "   A      ",
//            ".NAZARETH.",
//            "   E      ",
//            "   L      ",
//            "   N      ",
//            "   U      ",
//            "   T      ",
//            "   .      "]
//        let sourceShape = ShapeCalculator.toShape(fromGrid: sourceGrid, words: words)!
//        let sourcePlacement = sourceShape.placements[1]
//        
//        
//        /// AND `searchShape` is `tOYS:HAZENUt`
//        let searchGrid = [
//            " .    ",
//            " H    ",
//            " A    ",
//            " Z    ",
//            " E    ",
//            " L    ",
//            " N    ",
//            " U    ",
//            ".TOYS.",
//            " .    "]
//        let searchShape = ShapeCalculator.toShape(fromGrid: searchGrid, words: words)!
//        let searchPlacement = searchShape.placements[1]
//        
//        
//        /// WHEN we calculate offsets
//        let (sourceOffsetX, sourceOffsetY, searchOffsetX, searchOffsetY, sourceIsFlipped) = MergeOffsetCalculator.GetOffsets(
//            sourcePlacement: sourcePlacement,
//            searchPlacement: searchPlacement)
//        
//        /// THEN `searchOffsetX` must change by `2`
//        XCTAssertEqual(0, sourceOffsetX)
//        XCTAssertEqual(0, sourceOffsetY)
//        XCTAssertEqual(2, searchOffsetX)
//        XCTAssertEqual(0, searchOffsetY)
//        XCTAssertFalse(sourceIsFlipped)
//        
//        let _ = [
//            "   .      ",
//            "   H      ",
//            "   A      ",
//            ".NAZARETH.",
//            "   E      ",
//            "   L      ",
//            "   N      ",
//            "   U      ",
//            "  .TOYS.  ",
//            "   .      "]
//        
//        
//    }
//    
//    
//    func test_NAZARETH_HAZELNUT_TOYS_Flipped() throws {
//        
//        /// GIVEN `sourceShape` is `HAzELNUT:NAzARETH`
//        /// AND `searchShape` is `tOYS:HAZENUt`
//        /// WHEN we calculate offsets
//        /// THEN `searchOffsetX` must change by `2`
//        /// AND `sourceShape` must be flipped
//        
//        /// We have an example where `sourceShape` and `searchShape` have `HAZELNUT` as common word and `sourceShape` must be flipped as `HAZENUT` is opposite orientation.
//        /// What we observe is that `searchShape` is asked to `offsetY` by 2 but if `sourceShape` is flipped it would by `offsetX` instead
//        /// We want the result to be the same size regardless of whether `sourceShape` must be flipped
//        /// `HAZELNUT` is word 4 in the sequence
//        /// `func test_NAZARETH_HAZELNUT_TOYS` proves that it is correct when not flipped
//        
//        
//        /// GIVEN `sourceShape` is `HAzELNUT:NAzARETH`
//        let sourceGrid = [
//            "   .      ",
//            "   N      ",
//            "   A      ",
//            ".HAZELNUT.",
//            "   A      ",
//            "   R      ",
//            "   E      ",
//            "   T      ",
//            "   H      ",
//            "   .      "]
//        let sourceShape = ShapeCalculator.toShape(fromGrid: sourceGrid, words: words)!
//        let sourcePlacement = sourceShape.placements[0]
//        
//        
//        /// AND `searchShape` is `tOYS:HAZENUt`
//        let searchGrid = [
//            " .    ",
//            " H    ",
//            " A    ",
//            " Z    ",
//            " E    ",
//            " L    ",
//            " N    ",
//            " U    ",
//            ".TOYS.",
//            " .    "]
//        let searchShape = ShapeCalculator.toShape(fromGrid: searchGrid, words: words)!
//        let searchPlacement = searchShape.placements[1]
//        
//
//        /// WHEN we calculate offsets
//        let (sourceOffsetX, sourceOffsetY, searchOffsetX, searchOffsetY, sourceIsFlipped) = MergeOffsetCalculator.GetOffsets(
//            sourcePlacement: sourcePlacement,
//            searchPlacement: searchPlacement)
//        
//        /// THEN `searchOffsetX` must change by `2`
//        /// AND `sourceShape` must be flipped
//        XCTAssertEqual(0, sourceOffsetX)
//        XCTAssertEqual(0, sourceOffsetY)
//        XCTAssertEqual(2, searchOffsetX)
//        XCTAssertEqual(0, searchOffsetY)
//        XCTAssertTrue(sourceIsFlipped)
//        
//        // This is what the result must be
//        let _ = [
//            "   .      ",
//            "   H      ",
//            "   A      ",
//            ".NAZARETH.",
//            "   E      ",
//            "   L      ",
//            "   N      ",
//            "   U      ",
//            "  .TOYS.  ",
//            "   .      "]
//        
//        // this is the flipped source grid so you can see how they go together
//        let _ = [
//            "   .      ",
//            "   H      ",
//            "   A      ",
//            ".NAZARETH.",
//            "   E      ",
//            "   L      ",
//            "   N      ",
//            "   U      ",
//            "   T      ",
//            "   .      "]
//    }
//    
//    
//    
//    func test_findMergedShapes_DifferentOrientation() throws {
//
//        // GIVEN sourceShape is TURKEy:HyMN
//        // AND searchShape is TURkEY:PORk
//        // WHEN we create an index from the search shape
//        // AND calculate the merged shape using that index
//        // THEN one shape will be returned
//        // AND the returned shape will be sourceShape and searchShape merged together
//        
//        // GIVEN sourceShape is HyMN:TURKEy
//        let sourceGrid = [
//                "  .   ",
//                "  T   ",
//                "  U   ",
//                "  R   ",
//                "  K   ",
//                "  E   ",
//                ".HYMN.",
//                "  .   "]
//        let sourceShape = ShapeCalculator.toShape(fromGrid: sourceGrid, words: words)!
//        
//        // AND searchShape is TURkEY:PORk
//        let searchGrid = [
//                "    .   ",
//                "    P   ",
//                "    O   ",
//                "    R   ",
//                ".TURKEY.",
//                "    .   "]
//        let searchShape = ShapeCalculator.toShape(fromGrid: searchGrid, words: words)!
//        
//        // WHEN we create an index from the search shape
//        let searchIndex = WordIndex2Calculator.createWordIndex(shapes: [searchShape], totalWords: words.count, stride: 2)
//        
//        // AND calculate the merged shape using that index
//        let shapes = WordIndex2Calculator.findMergedShapes(
//            words: words,
//            sourceShape: sourceShape,
//            sourceShapeId: 0,
//            searchShapes: [searchShape],
//            searchIndex: searchIndex,
//            searchMin: 0,
//            searchMax: 0,
//            scoresMin: scoresMin,
//            widthMax: widthMax,
//            heightMax: heightMax)
//
//        // THEN one shape will be returned
//        XCTAssertEqual(1, shapes.count)
//    
//        // AND the returned shape will be sourceShape and searchShape merged together
//        let actualText = shapes[0].ToText(words: words)
//        let expectedText =  "    .   \n" +
//                            "    T   \n" +
//                            "    U   \n" +
//                            "    R   \n" +
//                            ".PORK.  \n" +
//                            "    E   \n" +
//                            "  .HYMN.\n" +
//                            "    .   "
//        XCTAssertEqual(expectedText, actualText)
//    }
//
//    
//    
//    
//    func test_findMergedShapes_SameOrientation() throws {
//        
//        // GIVEN sourceShape is TURKEy:HyMN
//        // AND searchShape is TURkEY:PORk
//        // WHEN we create an index from the search shape
//        // AND calculate the merged shape using that index
//        // THEN one shape will be returned
//        // AND the returned shape will be sourceShape and searchShape merged together
//        
//
//        // GIVEN sourceShape is TURKEy:HyMN
//        let source = [
//                "      . ",
//                "      H ",
//                ".TURKEY.",
//                "      M ",
//                "      N ",
//                "      . "]
//        let sourceShape = ShapeCalculator.toShape(fromGrid: source, words: words)!
//                
//        // AND searchShape is TURkEY:PORk
//        let search = [
//                "    .   ",
//                "    P   ",
//                "    O   ",
//                "    R   ",
//                ".TURKEY.",
//                "    .   "]
//        let searchShape = ShapeCalculator.toShape(fromGrid: search, words: words)!
//            
//        // WHEN we create an index from the search shape
//        let searchIndex = WordIndex2Calculator.createWordIndex(shapes: [searchShape], totalWords: words.count, stride: 2)
//        
//        // calculate the merged shape using that index
//        let shapes = WordIndex2Calculator.findMergedShapes(
//            words: words,
//            sourceShape: sourceShape,
//            sourceShapeId: 0,
//            searchShapes: [searchShape],
//            searchIndex: searchIndex,
//            searchMin: 0,
//            searchMax: 0,
//            scoresMin: [0,0,0,0,0,0,0,0,0,0,0,0],
//            widthMax: 17,
//            heightMax: 12)
//
//        // THEN one shape will be returned
//        XCTAssertEqual(1, shapes.count)
//        
//        // AND the returned shape will be sourceShape and searchShape merged together
//        let actualText = shapes[0].ToText(words: words)
//        
//        let expectedText =
//                "    .   \n" +
//                "    T   \n" +
//                "    U   \n" +
//                "    R   \n" +
//                ".PORK.  \n" +
//                "    E   \n" +
//                "  .HYMN.\n" +
//                "    .   "
//        XCTAssertEqual(expectedText, actualText)
//    }
//}
