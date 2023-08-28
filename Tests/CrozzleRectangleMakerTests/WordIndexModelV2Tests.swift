//
//  WordIndexModelV2Tests.swift
//  
//
//  Created by Michael Geurtjens on 27/8/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class WordIndexModelV2Tests: XCTestCase {
let scoreMin = 0
    let widthMax = 17
    let heightMax = 12
   
    func test_WordIndexModelV2() throws {
        
        /*
         ..
      .STAY.
        .HAWSER.
       .BOW.
      .GUY.
        O.
        Y
        .
         */
        
        let words = ["AHOY", "YAW", "STAY", "HAWSER", "BOW", "GUY", "BUOY"] // WordData.words_8806()
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        let c2x2 = ClusterCalculatorV1.C2x2(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let c2x2Shapes = ShapeCalculator.toShape(fromClusters: c2x2)
        
        
        
        let (C2x2Text,C2x2Score) = ShapeCalculator.ToText(shape:c2x2Shapes[0], words: words)
        print("Shape A score: \(C2x2Score)")
        print(C2x2Text)
        
        let c2x3 = ClusterCalculatorV1.C2x3(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let c2x3Shapes = ShapeCalculator.toShape(fromClusters: c2x3)
        let (C2x3Text,C2x3Score) = ShapeCalculator.ToText(shape:c2x3Shapes[0], words: words)
        print("Shape B score: \(C2x3Score)")
        print(C2x3Text)
        
        
        let sourceShape = c2x2Shapes[0]
        let searchShapes = c2x3Shapes
        
        let wordModel = WordIndexModelV2(shapes: searchShapes, wordsPerShape: 5, wordCount: words.count)
        XCTAssertEqual(7, wordModel.index.count)
        XCTAssertEqual(1, wordModel.index[0].count)
        XCTAssertEqual(1, wordModel.index[1].count)
        XCTAssertEqual(1, wordModel.index[2].count)
        XCTAssertEqual(1, wordModel.index[3].count)
        XCTAssertEqual(1, wordModel.index[4].count)
        
        XCTAssertEqual(0, wordModel.index[0][0])
        XCTAssertEqual(0, wordModel.index[1][0])
        XCTAssertEqual(0, wordModel.index[2][0])
        XCTAssertEqual(0, wordModel.index[3][0])
        XCTAssertEqual(0, wordModel.index[4][0])
        
        
        let instructions = wordModel.FindMatches(sourceShape: sourceShape, sourceShapeId: 0, searchMin: 0, searchMax: 0, searchShapes: searchShapes)
        
        XCTAssertEqual(1, instructions.count)
        let instruction = instructions[0]
        XCTAssertEqual(0, instruction.sourceShapeId)
        XCTAssertEqual(0, instruction.searchShapeId)
        XCTAssertEqual(2, instruction.matchingWordCount)
        
        XCTAssertEqual(0, instruction.sourceMatchingWordPosition)
        XCTAssertEqual(0, instruction.searchMatchingWordPosition)
        XCTAssertFalse(instruction.flipped)

    }
    
    func test_CreateAnIndex() throws {
        //score:52, width:6, height:7, words:2
        
        /// GIVEN our game has four words
        let words = ["MERRY","HYMN","WHITE","STAR"]
        
        /// AND we have found a shape with those words
        let searchGrid = [
            "  .    ",
            "  W .  ",
            " .HYMN.",
            "  I E  ",
            ".STAR. ",
            "  E R  ",
            "  . Y  ",
            "    .  "]
        let searchShape = ShapeCalculator.toShapeNoFlip(fromGrid: searchGrid, words: words)!
        
        /// WHEN we create an index based only on the single shapethe words
        let wordIndex = WordIndexModelV2(shapes: [searchShape],wordsPerShape: 4,wordCount: words.count)
        
        /// THEN there will be four positions in the index, one for each word
        XCTAssertEqual(4, wordIndex.index.count)
        
        /// AND each index points to only one shape (because we only had one shape)
        XCTAssertEqual(1, wordIndex.index[0].count)
        XCTAssertEqual(1, wordIndex.index[1].count)
        XCTAssertEqual(1, wordIndex.index[2].count)
        XCTAssertEqual(1, wordIndex.index[3].count)
        
        /// AND the shape that each index item is pointing to is our only shape, shape 0
        XCTAssertEqual(0, wordIndex.index[0][0])
        XCTAssertEqual(0, wordIndex.index[1][0])
        XCTAssertEqual(0, wordIndex.index[2][0])
        XCTAssertEqual(0, wordIndex.index[3][0])

    }
    
    func test_SubsetShapesShouldNotBeFound() throws {
        
        /// GIVEN our game has four words
        let words = ["MERRY","HYMN","WHITE","STAR"]

        /// AND we have found a shape with those words
        let searchGrid = [
            "  .    ",
            "  W .  ",
            " .HYMN.",
            "  I E  ",
            ".STAR. ",
            "  E R  ",
            "  . Y  ",
            "    .  "]
        let searchShapes = [ShapeCalculator.toShapeNoFlip(fromGrid: searchGrid, words: words)!]
        
        /// AND we have created an index with that one shape
        let searchIndex = WordIndexModelV2(shapes: searchShapes,wordsPerShape: 4,wordCount: words.count)
        
        /// AND we have another shape made up of the same words as the search shape that is in the search index
        let sourceGrid = [
            "  .   ",
            "  M   ",
            "  E   ",
            "  R   ",
            "  R   ",
            ".HYMN.",
            "  .   "]
        let sourceShape = ShapeCalculator.toShapeNoFlip(fromGrid: sourceGrid, words: words)!

        /// WHEN we search for this shape which is really a subset of the shape we are searching
        let instructions = searchIndex.FindMatches(sourceShape: sourceShape, sourceShapeId: 0, searchMin: 0, searchMax: 0, searchShapes: searchShapes)
        
        /// THEN we find there are no results because we do not return subsets
        XCTAssertEqual(0, instructions.count)
    }
    

    func test_ShapesThatAreNotSubsetsShouldBeFound() throws {
        
        /// GIVEN our game has four words
        let words = ["MERRY","HYMN","WHITE","STAR"]

        /// AND we have found a shape with those words
        let searchGrid = [
            "  .    ",
            "  W    ",
            " .HYMN.",
            "  I    ",
            ".STAR. ",
            "  E    ",
            "  .    "]
        let searchShape = ShapeCalculator.toShapeNoFlip(fromGrid: searchGrid, words: words)!
        
        /// AND we have created an index with that one shape
        let searchIndex = WordIndexModelV2(shapes: [searchShape],wordsPerShape: 3,wordCount: words.count)
        
        /// AND we have another shape made up of the same words as the search shape that is in the search index
        let sourceGrid = [
            "  .   ",
            "  M   ",
            "  E   ",
            "  R   ",
            "  R   ",
            ".HYMN.",
            "  .   "]
        let sourceShape = ShapeCalculator.toShapeNoFlip(fromGrid: sourceGrid, words: words)!

        /// WHEN we search for this shape which is really a subset of the shape we are searching
        let matches = searchIndex.FindMatches(sourceShape: sourceShape, sourceShapeId: 0, searchMin: 0, searchMax: 0, searchShapes: [searchShape])
        
        /// THEN we find there are no results because we do not return subsets
        XCTAssertEqual(1, matches.count)
        
        let match = matches[0]
        XCTAssertEqual(0, match.sourceShapeId)
        XCTAssertEqual(0, match.searchShapeId)
        XCTAssertEqual(1, match.matchingWordCount)
        XCTAssertEqual(0, match.sourceMatchingWordPosition)
        XCTAssertEqual(0, match.searchMatchingWordPosition)
        XCTAssertEqual(sourceShape.placements[0].w, searchShape.placements[0].w)
        XCTAssertFalse(match.flipped)
        
        
    }
}
