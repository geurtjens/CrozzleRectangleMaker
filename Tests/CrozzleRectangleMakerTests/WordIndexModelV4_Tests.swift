//
//  WordIndexV4_Tests.swift
//  
//
//  Created by Michael Geurtjens on 10/2/2024.
//

import XCTest
@testable import CrozzleRectangleMaker
final class WordIndexModelV4_Tests: XCTestCase {

    

    func testInit() throws {
        
        /// GIVEN all winning shapes in the 8612 game.
        let shapes = GetStartingData.getWinningShapesAllWords(gameId: 8612)
        // AND that we have 91 words in that game
        let wordCount = WordData.words_8612().count
        // WHEN we initialize the WordIndexModelV4 with these shapes and word count
        let index = WordIndexModelV4(shapes: shapes, wordCount: wordCount)
        // THEN we find that the size of the index is the same as that of the word count
        XCTAssertEqual(wordCount, index.index.count)
        // AND the search space which means the common words amoungst all shapes is 42
        XCTAssertEqual(42, index.searchSpace())
    }

    func testSearch() throws {
        /// GIVEN all winning shapes in the 8612 game.
        let searchShapes = GetStartingData.getWinningShapesAllWords(gameId: 8612)
        let sourceShape = searchShapes[0]
        let words = WordData.words_8612()
        // AND that we have 91 words in that game
        let wordCount = words.count
        // WHEN we initialize the WordIndexModelV4 with these shapes and word count
        let index = WordIndexModelV4(shapes: searchShapes, wordCount: wordCount)
        
        
        
        
        // AND we find all words that can connect with the first shape
        let items: [IndexResultModel] = index.findMatch(sourceShape: sourceShape)
        
        // THEN we expect only two matches.  The third match would be shape[0] but that is a subset or exact match to the source and so it will not be included in the found
        XCTAssertEqual(2, items.count)
        
        // THEN we find that the size of the index is the same as that of the word count
        XCTAssertEqual(wordCount, index.index.count)
        // AND the search space which means the common words amoungst all shapes is 42
        XCTAssertEqual(42, index.searchSpace())
        
        let instructions = IndexResultValidator.Execute(
            sourceShape: sourceShape,
            searchShapes: searchShapes,
            items: items,
            widthMax: 17,
            heightMax: 12)
        
        XCTAssertEqual(2, instructions.count)
        
        let result0 = instructions[0]
        let result1 = instructions[1]
        // We can now measure if these offsets and values are correct
        
        XCTAssertFalse(result0.isFlipped)
        XCTAssertEqual(8, result0.width)
        XCTAssertEqual(10, result0.height)
        XCTAssertEqual(0, result0.sourceOffsetX)
        XCTAssertEqual(0, result0.sourceOffsetY)
        XCTAssertEqual(1, result0.searchOffsetX)
        XCTAssertEqual(0, result0.searchOffsetY)
        
        XCTAssertTrue(result1.isFlipped)
        XCTAssertEqual(8, result1.width)
        XCTAssertEqual(10, result1.height)
        // Once you flipped the search1 shape then there are no offsets required
        XCTAssertEqual(0, result1.sourceOffsetX)
        XCTAssertEqual(0, result1.sourceOffsetY)
        XCTAssertEqual(0, result1.searchOffsetX)
        XCTAssertEqual(0, result1.searchOffsetY)
        
        
        let searchShape0 = searchShapes[instructions[0].searchShapeId]
        let searchShape1 = searchShapes[instructions[1].searchShapeId]
        
        let sourceShapeText = sourceShape.ToText(words: words)
        let searchShape0Text = searchShape0.ToText(words: words)
        let searchShape1Text = searchShape1.ToText(words: words)
        let searchShape1TextFlipped = searchShape1.Flip().ToText(words: words)
        
        print(sourceShapeText)
        print(searchShape0Text)
        print(searchShape1Text)
        print(searchShape1TextFlipped)
        
        let mergedShapes = IndexResultValidator.MergeTwoShapesList(
            sourceShape: sourceShape,
            searchShapes: searchShapes,
            instructions: instructions)
        
        print(mergedShapes[0].ToString(words: words))
        print(mergedShapes[1].ToString(words: words))
        
        
        
        
        
        /*
let sourceShape =
"   . .  ",
"   H M  ",
"   A E  ",
" .AZURE.",
"   E R  ",
".JELLY. ",
"   N .  ",
"   U    ",
"   T    ",
"   .    "
         
let SearchShape0 =
"  . .  ",
" .HYMN.",
"  A E  ",
".AZURE.",
"  E R  ",
"  L Y  ",
"  N .  ",
"  U    ",
"  T    ",
"  .    "
         
let mergedShape0 =
"   . .  ",
"  .HYMN.",
"   A E  ",
" .AZURE.",
"   E R  ",
".JELLY. ",
"   N .  ",
"   U    ",
"   T    ",
"   .    "
         
You must offset the x direction of the search shape by 1 but everything else fits perfectly
*/
        
        
/*
         
let sourceShape =
"   . .  ",
"   H M  ",
"   A E  ",
" .AZURE.",
"   E R  ",
".JELLY. ",
"   N .  ",
"   U    ",
"   T    ",
"   .    "
         
let searchShape1 =
"     .    "
"    .JOY. "
"     E  S "
".HAZELNUT."
"     L  A "
"     Y  R "
"     .  . "
               
let mergedShape1 =
"   . .  ",
"   H M  ",
"   A E  ",
" .AZURE.",
" . E R  ",
".JELLY. ",
" O N .  ",
" Y U    ",
" .STAR. ",
"   .    "
         
let searchShape1Flipped =
"   .   "
"   H   "
"   A   "
"   Z   "
" . E   "
".JELLY."
" O N   "
" Y U   "
" .STAR."
"   .   "
 
There are no offsets required once you flip the search shape as the flipped shape fits perfectly ontop of the sourceShape
*/
        
    }
}
