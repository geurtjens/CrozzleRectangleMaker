//
//  OverlappingPlacementsCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 31/5/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class OverlappingPlacementsCalculatorTests: XCTestCase {

    func test_AnotherError() throws {
        let words = WordData.words_8806()
        
        let item = PlacementModel(i: 20, h: true, x: 0, y: 7, l: 4)
        let find = PlacementModel(i: 29, h: true, x: 8, y: 7, l: 3)
        
        print("item:\(words[Int(item.i)])")
        print("find:\(words[Int(find.i)])")
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
        let item = PlacementModel(i: 69, h: true, x: 8, y: 6, l: 8)
        let find = PlacementModel(i: 2, h: true, x: 0, y: 6, l: 4)
        
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
        let find = PlacementModel(i: 97, h: true, x: 0, y: 6, l: 7)
        let item = PlacementModel(i: 5, h: true, x: 0, y: 3, l: 4)
        
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
        
        let source = [PlacementModel(i: wordId, h: true, x: 1, y: 2, l: length)]
        
        let find = PlacementModel(i: otherWordId, h: true, x: 3, y: 4, l: length)
        
        XCTAssertFalse(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    
    
    
    func test_interlockOverlappingHorizontalStart_0_0_0_0() throws {
        
        let horizontal = PlacementModel(
            i: wordId,
            h: true,
            x: zero,
            y: zero,
            l: length)
        
        let vertical = PlacementModel(
            i:otherWordId,
            h: false,
            x: 0,
            y: zero,
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
            i: wordId,
            h: true,
            x: zero,
            y: zero,
            l: length)
       
        let vertical = PlacementModel(
            i: otherWordId,
            h: false,
            x: 1,
            y: zero,
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
            i:wordId,
            h:true,
            x: zero,
            y: zero,
            l: length)
        
        let vertical = PlacementModel(
            i:otherWordId,
            h: false,
            x: 2,
            y: zero,
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
            i: wordId,
            h: true,
            x: zero,
            y: zero,
            l: length)
        
        let vertical = PlacementModel(
            i:otherWordId,
            h: false,
            x: 3,
            y: zero,
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
            i: wordId,
            h: true,
            x: zero,
            y: zero,
            l: length)
        
        let vertical = PlacementModel(
            i:otherWordId,
            h: false,
            x: 4,
            y: zero,
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
            i: wordId,
            h: true,
            x: zero,
            y: four,
            l: length)
        
        let vertical = PlacementModel(
            i: otherWordId,
            h: false,
            x: 0,
            y: zero,
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
            i: wordId,
            h: true,
            x: zero,
            y: four,
            l: length)
        
        let vertical = PlacementModel(
            i: otherWordId,
            h: false,
            x: 1,
            y: zero,
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
            i: wordId,
            h: true,
            x: zero,
            y: four,
            l: length)
        
        let vertical = PlacementModel(
            i: otherWordId,
            h: false,
            x: 2,
            y: zero,
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
            i: wordId,
            h: true,
            x: zero,
            y: four,
            l: length)
        
        let vertical = PlacementModel(
            i: otherWordId,
            h: false,
            x: 3,
            y: zero,
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
            i: wordId,
            h: true,
            x: zero,
            y: four,
            l: length)
        
        let vertical = PlacementModel(
            i: otherWordId,
            h: false,
            x: 4,
            y: zero,
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
            i: wordId,
            h: true,
            x: zero,
            y: 0,
            l: length)
       
        let vertical = PlacementModel(
            i: otherWordId,
            h: false,
            x: zero,
            y: zero,
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
            i: wordId,
            h: true,
            x: zero,
            y: 1,
            l: length)
       
        let vertical = PlacementModel(
            i: otherWordId,
            h: false,
            x: zero,
            y: zero,
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
            i: wordId,
            h: true,
            x: zero,
            y: 2,
            l: length)
       
        let vertical = PlacementModel(
            i: otherWordId,
            h: false,
            x: zero,
            y: zero,
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
            i: wordId,
            h: true,
            x: zero,
            y: 3,
            l: length)
       
        let vertical = PlacementModel(
            i: otherWordId,
            h: false,
            x: zero,
            y: zero,
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
            i: wordId,
            h: true,
            x: zero,
            y: 4,
            l: length)
       
        let vertical = PlacementModel(
            i: otherWordId,
            h: false,
            x: zero,
            y: zero,
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
            i: wordId,
            h: true,
            x: zero,
            y: 0,
            l: length)
       
        let vertical = PlacementModel(
            i: otherWordId,
            h: false,
            x: four,
            y: zero,
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
            i: wordId,
            h: true,
            x: zero,
            y: 1,
            l: length)
       
        let vertical = PlacementModel(
            i: otherWordId,
            h: false,
            x: four,
            y: zero,
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
            i: wordId,
            h: true,
            x: zero,
            y: 2,
            l: length)
       
        let vertical = PlacementModel(
            i: otherWordId,
            h: false,
            x: four,
            y: zero,
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
            i: wordId,
            h: true,
            x: zero,
            y: 3,
            l: length)
       
        let vertical = PlacementModel(
            i: otherWordId,
            h: false,
            x: four,
            y: zero,
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
            i: wordId,
            h: true,
            x: zero,
            y: 4,
            l: length)
       
        let vertical = PlacementModel(
            i: otherWordId,
            h: false,
            x: four,
            y: zero,
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
        
        let source = [PlacementModel(i: wordId, h: true, x: 0, y: y, l: length)]
        
        let find = PlacementModel(i: otherWordId, h: true, x: 5, y: y, l: length)
        
        XCTAssertFalse(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneX_same_0_4() throws {
        /*
         01234567890
         .ABC.
             .DEF.
         */
        
        let source = [PlacementModel(i: wordId, h: true, x: 0, y: y, l: length)]
        
        let find = PlacementModel(i: otherWordId, h: true, x: 4, y: y, l: length)
        
        XCTAssertFalse(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneX_same_0_3() throws {
        /*
         01234567890
         .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(i: wordId, h: true, x: 0, y: y, l: length)]
        
        let find = PlacementModel(i: otherWordId, h: true, x: 3, y: y, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneX_same_0_2() throws {
        /*
         01234567890
         .ABC.
           .DEF.
         */
        
        let source = [PlacementModel(i: wordId, h: true, x: 0, y: y, l: length)]
        
        let find = PlacementModel(i: otherWordId, h: true, x: 2, y: y, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneX_same_0_1() throws {
        /*
         01234567890
         .ABC.
          .DEF.
         */
        
        let source = [PlacementModel(i: wordId, h: true, x: 0, y: y, l: length)]
        
        let find = PlacementModel(i: otherWordId, h: true, x: 1, y: y, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneX_same_0_0() throws {
        /*
         01234567890
         .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(i: wordId, h: true, x: 0, y: y, l: length)]
        
        let find = PlacementModel(i: otherWordId, h: true, x: 0, y: y, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneX_same_1_0() throws {
        /*
         01234567890
          .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(i: wordId, h: true, x: 1, y: y, l: length)]
        
        let find = PlacementModel(i: otherWordId, h: true, x: 0, y: y, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneX_same_2_0() throws {
        /*
         01234567890
           .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(i: wordId, h: true, x: 2, y: y, l: length)]
        
        let find = PlacementModel(i: otherWordId, h: true, x: 0, y: y, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneX_same_3_0() throws {
        /*
         01234567890
            .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(i: wordId, h: true, x: 3, y: y, l: length)]
        
        let find = PlacementModel(i: otherWordId, h: true, x: 0, y: y, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneX_same_4_0() throws {
        /*
         01234567890
             .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(i: wordId, h: true, x: 4, y: y, l: length)]
        
        let find = PlacementModel(i: otherWordId, h: true, x: 0, y: y, l: length)
        
        XCTAssertFalse(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneX_same_5_0() throws {
        /*
         01234567890
              .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(i: wordId, h: true, x: 5, y: y, l: length)]
        
        let find = PlacementModel(i: otherWordId, h: true, x: 0, y: y, l: length)
        
        XCTAssertFalse(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    
    
    
    
    func test_isOverlappingOneY_same_0_5() throws {
        /*
         01234567890
              .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(i: wordId, h: false, x: x, y: 0, l: length)]
        
        let find = PlacementModel(i: otherWordId, h: false, x: x, y: 5, l: length)
        
        XCTAssertFalse(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneY_same_0_4() throws {
        /*
         01234567890
         .ABC.
             .DEF.
         */
        
        let source = [PlacementModel(i: wordId, h: false, x: x, y: 0, l: length)]
        
        let find = PlacementModel(i: otherWordId, h: false, x: x, y: 4, l: length)
        
        XCTAssertFalse(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneY_same_0_3() throws {
        /*
         01234567890
         .ABC.
            .DEF.
         */
        
        let source = [PlacementModel(i: wordId, h: false, x: x, y: 0, l: length)]
        
        let find = PlacementModel(i: otherWordId, h: false, x: x, y: 3, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneY_same_0_2() throws {
        /*
         01234567890
         .ABC.
           .DEF.
         */
        
        let source = [PlacementModel(i: wordId, h: false, x: x, y: 0, l: length)]
        
        let find = PlacementModel(i: otherWordId, h: false, x: x, y: 2, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneY_same_0_1() throws {
        /*
         01234567890
         .ABC.
          .DEF.
         */
        
        let source = [PlacementModel(i: wordId, h: false, x: x, y: 0, l: length)]
        
        let find = PlacementModel(i: otherWordId, h: false, x: x, y: 1, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneY_same_0_0() throws {
        /*
         01234567890
         .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(i: wordId, h: false, x: x, y: 0, l: length)]
        
        let find = PlacementModel(i: otherWordId, h: false, x: x, y: 0, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneY_same_1_0() throws {
        /*
         01234567890
          .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(i: wordId, h: false, x: x, y: 1, l: length)]
        
        let find = PlacementModel(i: otherWordId, h: false, x: x, y: 0, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneY_same_2_0() throws {
        /*
         01234567890
           .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(i: wordId, h: false, x: x, y: 2, l: length)]
        
        let find = PlacementModel(i: otherWordId, h: false, x: x, y: 0, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneY_same_3_0() throws {
        /*
         01234567890
            .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(i: wordId, h: false, x: x, y: 3, l: length)]
        
        let find = PlacementModel(i: otherWordId, h: false, x: x, y: 0, l: length)
        
        XCTAssertTrue(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneY_same_4_0() throws {
        /*
         01234567890
             .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(i: wordId, h: false, x: x, y: 4, l: length)]
        
        let find = PlacementModel(i: otherWordId, h: false, x: x, y: 0, l: length)
        
        XCTAssertFalse(OverlappingPlacementsCalculator.isOverlappingOne(sourcePlacements: source, find: find))
    }
    func test_isOverlappingOneY_same_5_0() throws {
        /*
         01234567890
              .ABC.
         .DEF.
         */
        
        let source = [PlacementModel(i: wordId, h: false, x: x, y: 5, l: length)]
        
        let find = PlacementModel(i: otherWordId, h: false, x: x, y: 0, l: length)
        
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