//
//  OverlappingPlacementsCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 31/5/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class OverlappingPlacementsCalculatorTests: XCTestCase {

    
    
    func test_BothShapesMustBeInSameCoordinateSystem() {
        // In actual fact the common word must be aligned to the x,y axis and then it will work so our problem is misalignment of common word
        
        
        // We start with a game that was generated by our engine and it has allowed overlaps so we want to recreate a fix
        // So why is this game allowed to generate?
        // It is because we must be not in the same coordinate system, that is the common word has to be in the same x,y location for the overlapping placements to work
        let _ = [
            "      . .        ",
            "   .INN.J .      ",
            "    . A E T    . ",
            "   .HAZELNUT.. T ",
            " .JOY.A L R.STAR.",
            " A .MERRY.K  O E ",
            ".ZION.E .HE.CAKE.",   // Overlaps mean a new word of `.HE.` is created
            " U  . T.TOYS.S . ",
            " R    H  L.NUTS. ",
            " E    .  L O .   ",
            " . .FAMILY.WHITE.",
            "         . .     "]
        

        let words = ["HAZELNUT","TOYS","TURKEY","HOLLY"]
        
        // When you check for overlapping there must be an identical placement in both.
        
        // When we merge toys_holly with toys_turkey, we can detect an overlap because the placement of TOYS is identical in both
        // and this word is the anchor word that allows the merge to happen
        
        let toys_holly = [
            "      ",
            "      ",
            "      ",
            "      ",
            "  .   ",
            "  H   ",
            ".TOYS.",
            "  L   ",
            "  L   ",
            "  Y   ",
            "  .   "]
        
        let toys_turkey = [
           "   .  ",
           "   T  ",
           "   U  ",
           "   R  ",
           "   K  ",
           "   E  ",
           ".TOYS.",
           "   .  "]
        
//        let toys_holly_wrong_coordinate_system = [
//            "  .   ",
//            "  H   ",
//            ".TOYS.",
//            "  L   ",
//            "  L   ",
//            "  Y   ",
//            "  .   "]
        
         
        
        let (toys_turkey_placements,_) = PlacementCalculator.fromTextToPlacements(grid: toys_turkey, words: words)
        let (toys_holly_placements,_) = PlacementCalculator.fromTextToPlacements(grid: toys_holly, words: words)
        
        let isOverlapping = OverlappingPlacementsCalculator.isOverlapping(
            sourcePlacements: toys_turkey_placements,
            searchPlacements: toys_holly_placements)
        
        // This test fails at the moment
        XCTAssertTrue(isOverlapping)
        
        
        // Lets reverse this calculation
       
        let isOverlappingReversed = OverlappingPlacementsCalculator.isOverlapping(
            sourcePlacements: toys_holly_placements,
            searchPlacements: toys_turkey_placements)
        
        // This test fails at the moment also
        XCTAssertTrue(isOverlappingReversed)
        
    }

    func test_AnotherError() throws {
        let words = WordData.words_8806()
        
        let item = PlacementModel(w: 20, x: 0, y: 7, z: true, l: 4)
        let find = PlacementModel(w: 29, x: 8, y: 7, z: true, l: 3)
        
        print("item:\(words[Int(item.w)])")
        print("find:\(words[Int(find.w)])")
        let placements = [item, find]
        let height = PlacementCalculator.height(fromPlacements: placements)
        let width = PlacementCalculator.width(fromPlacements: placements)
        let shape = ShapeModel(score:0, width:width, height:height, placements: placements)
        let (text,score) = ShapeCalculator.ToText(shape:shape, words: words)
        print(text)
        //let a = OverlappingPlacementsCalculator.columnsAreOverlapping(sourceStart: item.x, sourceLength: item.l, searchStart:find.x, searchLength: find.l)
        XCTAssertEqual(20, score)
    }
    func test_ErrorIFound2() throws {
        let words = WordData.words_8806()
        let item = PlacementModel(w: 69, x: 8, y: 6, z: true, l: 8)
        let find = PlacementModel(w: 2, x: 0, y: 6, z: true, l: 4)
        
        let placements = [find, item]
        
        let height = PlacementCalculator.height(fromPlacements: placements)
        let width = PlacementCalculator.width(fromPlacements: placements)
        let shape = ShapeModel(score:0, width:width, height:height, placements: placements)
        let (text,score) = ShapeCalculator.ToText(shape:shape, words: words)
        print(text)
        XCTAssertEqual(20, score)
        
        //let a = OverlappingPlacementsCalculator.columnsAreOverlapping(sourceStart: item.x, sourceLength: item.l, searchStart:find.x, searchLength: find.l)
        
        let result = OverlappingPlacementsCalculator.isOverlappingOne(item: item, find: find)
        XCTAssertFalse(result)
    }
    
    func test_ErrorIFound() throws {
        let words = WordData.words_8806()
        let find = PlacementModel(w: 97, x: 0, y: 6, z: true, l: 7)
        let item = PlacementModel(w: 5, x: 0, y: 3, z: true, l: 4)
        
        let result = OverlappingPlacementsCalculator.isOverlappingOne(item: item, find: find)
        XCTAssertFalse(result)
        
//        let result2 = OverlappingPlacementsCalculator.columnsAreOverlapping(sourceStart: 3, sourceLength: 4, searchStart: 6, searchLength: 7)
//        XCTAssertFalse(result2)
        
        let placements = [find, item]
        
        
        
        
        let height = PlacementCalculator.height(fromPlacements: placements)
        let width = PlacementCalculator.width(fromPlacements: placements)
        let shape = ShapeModel(score:0, width:width, height:height, placements: placements)
        let (text,score) = ShapeCalculator.ToText(shape:shape, words: words)
        XCTAssertEqual(20, score)
        print(text)
    }
    
    
    
    func test_columnsAreOverlapping_0_5() throws {
        /*
         01234567890
         .ABC.
              .DEF.
         */
        XCTAssertFalse(OverlappingPlacementsCalculator.columnsAreOverlapping(
            sourceStart: 0,
            sourceLength: length,
            searchStart: 5,
            searchLength: length))
    }
    func test_columnsAreOverlapping_0_4() throws {
        /*
         01234567890
         .ABC.
             .DEF.
         */
        XCTAssertFalse(OverlappingPlacementsCalculator.columnsAreOverlapping(
            sourceStart: 0,
            sourceLength: length,
            searchStart: 4,
            searchLength: length))
    }
    func test_columnsAreOverlapping_0_3() throws {
        /*
         01234567890
         .ABC.
            .DEF.
         */
        XCTAssertTrue(OverlappingPlacementsCalculator.columnsAreOverlapping(
            sourceStart: 0,
            sourceLength: length,
            searchStart: 3,
            searchLength: length))
    }
    func test_columnsAreOverlapping_0_2() throws {
        /*
         01234567890
         .ABC.
           .DEF.
         */
        XCTAssertTrue(OverlappingPlacementsCalculator.columnsAreOverlapping(
            sourceStart: 0,
            sourceLength: length,
            searchStart: 2,
            searchLength: length))
    }
    func test_columnsAreOverlapping_0_1() throws {
        /*
         01234567890
         .ABC.
          .DEF.
         */
        XCTAssertTrue(OverlappingPlacementsCalculator.columnsAreOverlapping(
            sourceStart: 0,
            sourceLength: length,
            searchStart: 1,
            searchLength: length))
    }
    func test_columnsAreOverlapping_0_0() throws {
        /*
         01234567890
         .ABC.
         .DEF.
         */
        XCTAssertTrue(OverlappingPlacementsCalculator.columnsAreOverlapping(
            sourceStart: 0,
            sourceLength: length,
            searchStart: 0,
            searchLength: length))
    }
    func test_columnsAreOverlapping_1_0() throws {
        /*
         01234567890
          .ABC.
         .DEF.
         */
        XCTAssertTrue(OverlappingPlacementsCalculator.columnsAreOverlapping(
            sourceStart: 1,
            sourceLength: length,
            searchStart: 0,
            searchLength: length))
    }
    func test_columnsAreOverlapping_2_0() throws {
        /*
         01234567890
           .ABC.
         .DEF.
         */
        XCTAssertTrue(OverlappingPlacementsCalculator.columnsAreOverlapping(
            sourceStart: 2,
            sourceLength: length,
            searchStart: 0,
            searchLength: length))
    }
    func test_columnsAreOverlapping_3_0() throws {
        /*
         01234567890
            .ABC.
         .DEF.
         */
        XCTAssertTrue(OverlappingPlacementsCalculator.columnsAreOverlapping(
            sourceStart: 3,
            sourceLength: length,
            searchStart: 0,
            searchLength: length))
    }
    func test_columnsAreOverlapping_4_0() throws {
        /*
         01234567890
             .ABC.
         .DEF.
         */
        XCTAssertFalse(OverlappingPlacementsCalculator.columnsAreOverlapping(
            sourceStart: 4,
            sourceLength: length,
            searchStart: 0,
            searchLength: length))
    }
    func test_columnsAreOverlapping_5_0() throws {
        /*
         01234567890
              .ABC.
         .DEF.
         */
        XCTAssertFalse(OverlappingPlacementsCalculator.columnsAreOverlapping(
            sourceStart: 5,
            sourceLength: length,
            searchStart: 0,
            searchLength: length))
    }
    
    
    func test_isOverlappingOne_DifferentXY() throws {
        /*
         01234567890
              .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(w: wordId, x: 1, y: 2, z: true, l: length)]
        
        let find = PlacementModel(w: otherWordId, x: 3, y: 4, z: true, l: length)
        
        XCTAssertFalse(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    
    
    
    func test_interlockOverlappingHorizontalStart_0_0_0_0() throws {
        
        let horizontal = PlacementModel(
            w: wordId,
            x: zero,
            y: zero,
            z: true,
            l: length)
        
        let vertical = PlacementModel(
            w:otherWordId,
            x: 0,
            y: zero,
            z: false,
            l: length)
        
        /*
         .ABC.
         D
         E
         F
         .
         */
        
        XCTAssertFalse(OverlappingPlacementsCalculator.interlockOverlapping(source: horizontal, search: vertical))
        XCTAssertFalse(OverlappingPlacementsCalculator.interlockOverlapping(source: vertical, search: horizontal))
    }
    func test_interlockOverlappingHorizontalStart_0_0_1_0() throws {
        
        let horizontal = PlacementModel(
            w: wordId,
            x: zero,
            y: zero,
            z: true,
            l: length)
       
        let vertical = PlacementModel(
            w: otherWordId,
            x: 1,
            y: zero,
            z: false,
            l: length)
        
        /*
         .#BC.
          D
          E
          F
          .
         */
        
        XCTAssertTrue(OverlappingPlacementsCalculator.interlockOverlapping(source: horizontal, search: vertical))
        XCTAssertTrue(OverlappingPlacementsCalculator.interlockOverlapping(source: vertical, search: horizontal))
    }
    func test_interlockOverlappingHorizontalStart_0_0_2_0() throws {
       
        let horizontal = PlacementModel(
            w: wordId,
            x: zero,
            y: zero,
            z: true,
            l: length)
        
        let vertical = PlacementModel(
            w:otherWordId,
            x: 2,
            y: zero,
            z: false,
            l: length)
        
        /*
         .A#C.
           D
           E
           F
           .
         */
        
        XCTAssertTrue(OverlappingPlacementsCalculator.interlockOverlapping(source: horizontal, search: vertical))
        XCTAssertTrue(OverlappingPlacementsCalculator.interlockOverlapping(source: vertical, search: horizontal))
    }
    
    func test_interlockOverlappingHorizontalStart_0_0_3_0() throws {
        
        let horizontal = PlacementModel(
            w: wordId,
            x: zero,
            y: zero,
            z: true,
            l: length)
        
        let vertical = PlacementModel(
            w: otherWordId,
            x: 3,
            y: zero,
            z: false,
            l: length)
        
        /*
         .AB#.
            D
            E
            F
            .
         */
        
        XCTAssertTrue(OverlappingPlacementsCalculator.interlockOverlapping(source: horizontal, search: vertical))
        XCTAssertTrue(OverlappingPlacementsCalculator.interlockOverlapping(source: vertical, search: horizontal))
    }
    
    func test_interlockOverlappingHorizontalStart_0_0_4_0() throws {
        
        let horizontal = PlacementModel(
            w: wordId,
            x: zero,
            y: zero,
            z: true,
            l: length)
        
        let vertical = PlacementModel(
            w: otherWordId,
            x: 4,
            y: zero,
            z: false,
            l: length)
        
        /*
         .ABC.
             D
             E
             F
             .
         */
        
        XCTAssertFalse(OverlappingPlacementsCalculator.interlockOverlapping(source: horizontal, search: vertical))
        XCTAssertFalse(OverlappingPlacementsCalculator.interlockOverlapping(source: vertical, search: horizontal))
    }
    
    
    
    func test_interlockOverlappingHorizontalEnd_0_4_0_0() throws {
        
        let horizontal = PlacementModel(
            w: wordId,
            x: zero,
            y: four,
            z: true,
            l: length)
        
        let vertical = PlacementModel(
            w: otherWordId,
            x: 0,
            y: zero,
            z: false,
            l: length)
        
        /*
         .
         D
         E
         F
         .ABC.
         
         */
        
        XCTAssertFalse(OverlappingPlacementsCalculator.interlockOverlapping(source: horizontal, search: vertical))
        XCTAssertFalse(OverlappingPlacementsCalculator.interlockOverlapping(source: vertical, search: horizontal))
    }
    func test_interlockOverlappingHorizontalEnd_0_4_1_0() throws {
        
        let horizontal = PlacementModel(
            w: wordId,
            x: zero,
            y: four,
            z: true,
            l: length)
        
        let vertical = PlacementModel(
            w: otherWordId,
            x: 1,
            y: zero,
            z: false,
            l: length)
        
        /*
          .
          D
          E
          F
         .#BC.
         
         */
        
        XCTAssertTrue(OverlappingPlacementsCalculator.interlockOverlapping(source: horizontal, search: vertical))
        XCTAssertTrue(OverlappingPlacementsCalculator.interlockOverlapping(source: vertical, search: horizontal))
    }
    func test_interlockOverlappingHorizontalEnd_0_4_2_0() throws {
       
        let horizontal = PlacementModel(
            w: wordId,
            x: zero,
            y: four,
            z: true,
            l: length)
        
        let vertical = PlacementModel(
            w: otherWordId,
            x: 2,
            y: zero,
            z: false,
            l: length)
        
        /*
           .
           D
           E
           F
         .A#C.
         */
        
        XCTAssertTrue(OverlappingPlacementsCalculator.interlockOverlapping(source: horizontal, search: vertical))
        XCTAssertTrue(OverlappingPlacementsCalculator.interlockOverlapping(source: vertical, search: horizontal))
    }
    
    func test_interlockOverlappingHorizontalEnd_0_4_3_0() throws {
        
        let horizontal = PlacementModel(
            w: wordId,
            x: zero,
            y: four,
            z: true,
            l: length)
        
        let vertical = PlacementModel(
            w: otherWordId,
            x: 3,
            y: zero,
            z: false,
            l: length)
        
        /*
            .
            D
            E
            F
         .AB#.
            
         */
        
        XCTAssertTrue(OverlappingPlacementsCalculator.interlockOverlapping(source: horizontal, search: vertical))
        XCTAssertTrue(OverlappingPlacementsCalculator.interlockOverlapping(source: vertical, search: horizontal))
    }
    
    func test_interlockOverlappingHorizontalEnd_0_4_4_0() throws {
        
        let horizontal = PlacementModel(
            w: wordId,
            x: zero,
            y: four,
            z: true,
            l: length)
        
        let vertical = PlacementModel(
            w: otherWordId,
            x: 4,
            y: zero,
            z: false,
            l: length)
        
        /*
             .
             D
             E
             F
         .ABC.
         */
        
        XCTAssertFalse(OverlappingPlacementsCalculator.interlockOverlapping(source: horizontal, search: vertical))
        XCTAssertFalse(OverlappingPlacementsCalculator.interlockOverlapping(source: vertical, search: horizontal))
    }
    
    
    
    // We have to try vertical as well but that has been implemented but not yet tested.
    func test_interlockOverlappingVerticalStart_0_0_0_0() throws {
        
        let horizontal = PlacementModel(
            w: wordId,
            x: zero,
            y: 0,
            z: true,
            l: length)
       
        let vertical = PlacementModel(
            w: otherWordId,
            x: zero,
            y: zero,
            z: false,
            l: length)
        
        /*
         .ABC.
         D
         E
         F
         .
         */
        
        XCTAssertFalse(OverlappingPlacementsCalculator.interlockOverlapping(source: horizontal, search: vertical))
        XCTAssertFalse(OverlappingPlacementsCalculator.interlockOverlapping(source: vertical, search: horizontal))
    }
    func test_interlockOverlappingVerticalStart_0_1_0_0() throws {
        
        let horizontal = PlacementModel(
            w: wordId,
            x: zero,
            y: 1,
            z: true,
            l: length)
       
        let vertical = PlacementModel(
            w: otherWordId,
            x: zero,
            y: zero,
            z: false,
            l: length)
        
        /*
         .
         #ABC.
         E
         F
         .
         */
        
        XCTAssertTrue(OverlappingPlacementsCalculator.interlockOverlapping(source: horizontal, search: vertical))
        XCTAssertTrue(OverlappingPlacementsCalculator.interlockOverlapping(source: vertical, search: horizontal))
    }
    
    func test_interlockOverlappingVerticalStart_0_2_0_0() throws {
        
        let horizontal = PlacementModel(
            w: wordId,
            x: zero,
            y: 2,
            z: true,
            l: length)
       
        let vertical = PlacementModel(
            w: otherWordId,
            x: zero,
            y: zero,
            z: false,
            l: length)
        
        /*
         .
         D
         #ABC.
         F
         .
         */
        
        XCTAssertTrue(OverlappingPlacementsCalculator.interlockOverlapping(source: horizontal, search: vertical))
        XCTAssertTrue(OverlappingPlacementsCalculator.interlockOverlapping(source: vertical, search: horizontal))
    }
    func test_interlockOverlappingVerticalStart_0_3_0_0() throws {
        
        let horizontal = PlacementModel(
            w: wordId,
            x: zero,
            y: 3,
            z: true,
            l: length)
       
        let vertical = PlacementModel(
            w: otherWordId,
            x: zero,
            y: zero,
            z: false,
            l: length)
        
        /*
         .
         D
         E
         #ABC.
         .
         */
        
        XCTAssertTrue(OverlappingPlacementsCalculator.interlockOverlapping(source: horizontal, search: vertical))
        XCTAssertTrue(OverlappingPlacementsCalculator.interlockOverlapping(source: vertical, search: horizontal))
    }
    func test_interlockOverlappingVerticalStart_0_4_0_0() throws {
        
        let horizontal = PlacementModel(
            w: wordId,
            x: zero,
            y: 4,
            z: true,
            l: length)
       
        let vertical = PlacementModel(
            w: otherWordId,
            x: zero,
            y: zero,
            z: false,
            l: length)
        
        /*
         .
         D
         E
         F
         .ABC.
         */
        
        XCTAssertFalse(OverlappingPlacementsCalculator.interlockOverlapping(source: horizontal, search: vertical))
        XCTAssertFalse(OverlappingPlacementsCalculator.interlockOverlapping(source: vertical, search: horizontal))
    }
    
    
    
    
    func test_interlockOverlappingVerticalEnd_0_0_4_0() throws {
        
        let horizontal = PlacementModel(
            w: wordId,
            x: zero,
            y: 0,
            z: true,
            l: length)
       
        let vertical = PlacementModel(
            w: otherWordId,
            x: four,
            y: zero,
            z: false,
            l: length)
        
        /*
         .ABC.
             D
             E
             F
             .
         */
        
        XCTAssertFalse(OverlappingPlacementsCalculator.interlockOverlapping(source: horizontal, search: vertical))
        XCTAssertFalse(OverlappingPlacementsCalculator.interlockOverlapping(source: vertical, search: horizontal))
    }
    func test_interlockOverlappingVerticalEnd_0_1_4_0() throws {
        
        let horizontal = PlacementModel(
            w: wordId,
            x: zero,
            y: 1,
            z: true,
            l: length)
       
        let vertical = PlacementModel(
            w: otherWordId,
            x: four,
            y: zero,
            z: false,
            l: length)
        
        /*
             .
         .ABC#
             E
             F
             .
         */
        
        XCTAssertTrue(OverlappingPlacementsCalculator.interlockOverlapping(source: horizontal, search: vertical))
        XCTAssertTrue(OverlappingPlacementsCalculator.interlockOverlapping(source: vertical, search: horizontal))
    }
    
    func test_interlockOverlappingVerticalEnd_0_2_4_0() throws {
        
        let horizontal = PlacementModel(
            w: wordId,
            x: zero,
            y: 2,
            z: true,
            l: length)
       
        let vertical = PlacementModel(
            w: otherWordId,
            x: four,
            y: zero,
            z: false,
            l: length)
        
        /*
             .
             D
         .ABC#
             F
             .
         */
        
        XCTAssertTrue(OverlappingPlacementsCalculator.interlockOverlapping(source: horizontal, search: vertical))
        XCTAssertTrue(OverlappingPlacementsCalculator.interlockOverlapping(source: vertical, search: horizontal))
    }
    func test_interlockOverlappingVerticalStart_0_3_4_0() throws {
        
        let horizontal = PlacementModel(
            w: wordId,
            x: zero,
            y: 3,
            z: true,
            l: length)
       
        let vertical = PlacementModel(
            w: otherWordId,
            x: four,
            y: zero,
            z: false,
            l: length)
        
        /*
             .
             D
             E
         .ABC#
             .
         */
        
        XCTAssertTrue(OverlappingPlacementsCalculator.interlockOverlapping(source: horizontal, search: vertical))
        XCTAssertTrue(OverlappingPlacementsCalculator.interlockOverlapping(source: vertical, search: horizontal))
    }
    func test_interlockOverlappingVerticalEnd_0_4_4_0() throws {
        
        let horizontal = PlacementModel(
            w: wordId,
            x: zero,
            y: 4,
            z: true,
            l: length)
       
        let vertical = PlacementModel(
            w: otherWordId,
            x: four,
            y: zero,
            z: false,
            l: length)
        
        /*
             .
             D
             E
             F
         .ABC.
         */
        
        XCTAssertFalse(OverlappingPlacementsCalculator.interlockOverlapping(source: horizontal, search: vertical))
        XCTAssertFalse(OverlappingPlacementsCalculator.interlockOverlapping(source: vertical, search: horizontal))
    }
    
    
    
    
    
    
    
    
    func test_isOverlappingOneX_same_0_5() throws {
        /*
         01234567890
              .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(w: wordId, x: 0, y: y, z: true, l: length)]
        
        let find = PlacementModel(w: otherWordId, x: 5, y: y, z: true, l: length)
        
        XCTAssertFalse(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneX_same_0_4() throws {
        /*
         01234567890
         .ABC.
             .DEF.
         */
        
        let source = [PlacementModel(w: wordId, x: 0, y: y, z: true, l: length)]
        
        let find = PlacementModel(w: otherWordId, x: 4, y: y, z: true, l: length)
        
        XCTAssertFalse(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneX_same_0_3() throws {
        /*
         01234567890
         .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(w: wordId, x: 0, y: y, z: true, l: length)]
        
        let find = PlacementModel(w: otherWordId, x: 3, y: y, z: true, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneX_same_0_2() throws {
        /*
         01234567890
         .ABC.
           .DEF.
         */
        
        let source = [PlacementModel(w: wordId, x: 0, y: y, z: true, l: length)]
        
        let find = PlacementModel(w: otherWordId, x: 2, y: y, z: true, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneX_same_0_1() throws {
        /*
         01234567890
         .ABC.
          .DEF.
         */
        
        let source = [PlacementModel(w: wordId, x: 0, y: y, z: true, l: length)]
        
        let find = PlacementModel(w: otherWordId, x: 1, y: y, z: true, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneX_same_0_0() throws {
        /*
         01234567890
         .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(w: wordId, x: 0, y: y, z: true, l: length)]
        
        let find = PlacementModel(w: otherWordId, x: 0, y: y, z: true, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneX_same_1_0() throws {
        /*
         01234567890
          .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(w: wordId, x: 1, y: y, z: true, l: length)]
        
        let find = PlacementModel(w: otherWordId, x: 0, y: y, z: true, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneX_same_2_0() throws {
        /*
         01234567890
           .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(w: wordId, x: 2, y: y, z: true, l: length)]
        
        let find = PlacementModel(w: otherWordId, x: 0, y: y, z: true, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneX_same_3_0() throws {
        /*
         01234567890
            .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(w: wordId, x: 3, y: y, z: true, l: length)]
        
        let find = PlacementModel(w: otherWordId, x: 0, y: y, z: true, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneX_same_4_0() throws {
        /*
         01234567890
             .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(w: wordId, x: 4, y: y, z: true, l: length)]
        
        let find = PlacementModel(w: otherWordId, x: 0, y: y, z: true, l: length)
        
        XCTAssertFalse(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneX_same_5_0() throws {
        /*
         01234567890
              .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(w: wordId, x: 5, y: y, z: true, l: length)]
        
        let find = PlacementModel(w: otherWordId, x: 0, y: y, z: true, l: length)
        
        XCTAssertFalse(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    
    
    
    
    func test_isOverlappingOneY_same_0_5() throws {
        /*
         01234567890
              .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(w: wordId, x: x, y: 0, z: false, l: length)]
        
        let find = PlacementModel(w: otherWordId, x: x, y: 5, z: false, l: length)
        
        XCTAssertFalse(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneY_same_0_4() throws {
        /*
         01234567890
         .ABC.
             .DEF.
         */
        
        let source = [PlacementModel(w: wordId, x: x, y: 0, z: false, l: length)]
        
        let find = PlacementModel(w: otherWordId, x: x, y: 4, z: false, l: length)
        
        XCTAssertFalse(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneY_same_0_3() throws {
        /*
         01234567890
         .ABC.
            .DEF.
         */
        
        let source = [PlacementModel(w: wordId, x: x, y: 0, z: false, l: length)]
        
        let find = PlacementModel(w: otherWordId, x: x, y: 3, z: false, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneY_same_0_2() throws {
        /*
         01234567890
         .ABC.
           .DEF.
         */
        
        let source = [PlacementModel(w: wordId, x: x, y: 0, z: false, l: length)]
        
        let find = PlacementModel(w: otherWordId, x: x, y: 2, z: false, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneY_same_0_1() throws {
        /*
         01234567890
         .ABC.
          .DEF.
         */
        
        let source = [PlacementModel(w: wordId, x: x, y: 0, z: false, l: length)]
        
        let find = PlacementModel(w: otherWordId, x: x, y: 1, z: false, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneY_same_0_0() throws {
        /*
         01234567890
         .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(w: wordId, x: x, y: 0, z: false, l: length)]
        
        let find = PlacementModel(w: otherWordId, x: x, y: 0, z: false, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneY_same_1_0() throws {
        /*
         01234567890
          .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(w: wordId, x: x, y: 1, z: false, l: length)]
        
        let find = PlacementModel(w: otherWordId, x: x, y: 0, z: false, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneY_same_2_0() throws {
        /*
         01234567890
           .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(w: wordId, x: x, y: 2, z: false, l: length)]
        
        let find = PlacementModel(w: otherWordId, x: x, y: 0, z: false, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneY_same_3_0() throws {
        /*
         01234567890
            .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(w: wordId, x: x, y: 3, z: false, l: length)]
        
        let find = PlacementModel(w: otherWordId, x: x, y: 0, z: false, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneY_same_4_0() throws {
        /*
         01234567890
             .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(w: wordId, x: x, y: 4, z: false, l: length)]
        
        let find = PlacementModel(w: otherWordId, x: x, y: 0, z: false, l: length)
        
        XCTAssertFalse(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    
    func test_newendgoal() {
        let a = [
            PlacementModel(w: 0, x: 0, y: 3, z: true, l: 4),
            PlacementModel(w: 5, x: 0, y: 1, z: true, l: 4),
            PlacementModel(w: 17, x: 4, y: 0, z: false, l: 4)]
        
        let b = [
            PlacementModel(w: 0, x: 3, y: 0, z: false, l: 4),
            PlacementModel(w: 5, x: 1, y: 0, z: false, l: 4),
            PlacementModel(w: 6, x: 0, y: 1, z: true, l: 8),
            PlacementModel(w: 17, x: 0, y: 4, z: true, l: 104)]

    }
    
    
    
    func test_isOverlappingOneY_same_5_0() throws {
        /*
         01234567890
              .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(w: wordId, x: x, y: 5, z: false, l: length)]
        
        let find = PlacementModel(w: otherWordId, x: x, y: 0, z: false, l: length)
        
        XCTAssertFalse(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    
    
    let four = UInt8(4)
    let zero = UInt8(0)
    let length = UInt8(3)
    let wordId = UInt8(10)
    let otherWordId = UInt8(20)
    let x = UInt8(4)
    let y = UInt8(3)
    
}
