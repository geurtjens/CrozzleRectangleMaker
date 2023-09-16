//
//  SiblingMergeCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 16/9/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class SiblingMergeCalculatorTests: XCTestCase {

    func testExecute() throws {
        
        // We matched sibling 1
        
        //[Set([24, 5]), Set([24, 7]), Set([8, 24]), Set([24, 22]), Set([24, 23]), Set([1, 8, 10]), Set([10, 9, 8]), Set([10, 12, 8]), Set([23, 22, 8]), Set([2, 13, 7]), Set([24])]

        
        
        // GIVEN we started with the parent with history [0]
        let parent_History = [0]
        let parentText =
        "        .   \n" +
        "        B   \n" +
        "        L   \n" +
        "      . I   \n" +
        "      I T   \n" +
        "     .RAZOR.\n" +
        "      O E   \n" +
        ".SEASONING. \n" +
        "      . .   "
        
        /// `WHEN` we merged with all `SearchShapes` producing the `siblings` array of shapes
        
        /// `THEN` we found `siblings[0]` had merged with `searchShapes[3]` giving history of `[0, 3]`
        let sibling_1_History = [0, 3]
        let sibling_1_Text =
        "        .   \n" +
        "        B   \n" +
        "    .HOLLY. \n" +
        "      . I C \n" +
        "      I T A \n" +
        "     .RAZOR.\n" +
        "      O E D \n" +
        ".SEASONING. \n" +
        "      . .   "
        let sibling1_WordsAdded = ["CARD","YULE"]
        
        /// `AND` we found `siblings[9]` had merged with `searchShapes[57]` giving a history of `[0, 57]`
        let sibling_9_History = [0, 57]
        let sibling_9 =
        "         .  \n" +
        "        .J  \n" +
        "       .BOX.\n" +
        "    .HOLLY. \n" +
        "      . I.  \n" +
        "      I T   \n" +
        "     .RAZOR.\n" +
        "      O E   \n" +
        ".SEASONING. \n" +
        "      . .   "
        
        /// WHEN we tried to `MergeSiblings` we matchined `siblings[0]` with `siblings[9]` giving history of `[0, 3, 57]`
        let sibling0Plus9_History = [0, 3, 57]
        let sibling0Plus9_Text =
        "         .  \n" +
        "        .J  \n" +
        "       .BOX.\n" +
        "    .HOLLY. \n" +
        "      . I.C \n" +
        "      I T A \n" +
        "     .RAZOR.\n" +
        "      O E D \n" +
        ".SEASONING. \n" +
        "      . .   "
        
        /// We can see what `searchShapes[3]` looks like to deduce how `parent` combined with it to make `sibling[0]`
        let searchShape3_History = [3]
        let searchShape3_Text =
        "    .   \n" +
        "    B   \n" +
        ".HOLLY. \n" +
        "    I C \n" +
        "    T A \n" +
        " .RAZOR.\n" +
        "    E D \n" +
        "    N . \n" +
        "    .   "
        
        /// We can see what `searchShapes[57]` looks like to deduce how`parent` combined with it to make `sibling[9]`
        let searchShape57_History = [57]
        let searchShape57_Text =
        "   .      \n" +
        "   H      \n" +
        "   O      \n" +
        "  .L      \n" +
        " .BLITZEN.\n" +
        ".JOY.     \n" +
        "  X.      \n" +
        "  .       "
        
        /// And then we combined with these at the word site that sourceShape introduced
        
        /*
         .
         B
     .HOLLY.
       . I C
       I T A
      .RAZOR.
       O E D
 .SEASONING.
       . .
 Merge History: [0, 3, 3] with searchShapes[3] already included and being
         .
         B
     .HOLLY.
         I C
         T A
      .RAZOR.
         E D
         N .
         .
         
         
         

          .
         .J
        .BOX.
     .HOLLY.
       . I.C
       I T A
      .RAZOR.
       O E D
 .SEASONING.
       . .
 Merge History: [0, 3, 57] with searchShapes[57] already found by our process beforehand and producing duplicate
         .
         H
         O
        .L
       .BLITZEN.
      .JOY.
        X.
        .
         
         
         
         

         .
         B
     .HOLLY.
       . I C
       I T A
      .RAZOR.
       O E D
 .SEASONING.
       . .
 Merge History: [0, 3, 188] with searchShapes[188] being
         .
         C
         A
        .RAZOR.
         D
         .
         
         
         
         
         
         

         .
         B
     .HOLLY.
       . I C
       I T A
      .RAZOR.
       O E D
 .SEASONING.
       . .
 Merge History: [0, 3, 191] with sourceShapes[191] being
         .
         H
     .RAZOR.
         L
         L
         Y
         .
         
         
         
         
         

         .
         B
     .HOLLY.
       . I C
       I T A
      .RAZOR.
       O E D
 .SEASONING.
       . .
 Merge History: [0, 3, 200] with searchShapes[200] being
         .
         C
         A
    .RAZOR.
         D
         .
         
         
         
         

             
         .
         B
     .HOLLY.
       . I C
       I T A
      .RAZOR.
       O E D
 .SEASONING.
       . .
 Merge History: [0, 3, 224] with 224 being
         .
         I
         R
       .HOLLY.
         N
         .
         
         
         
         
         
         
         
         

       .
       V
       I
       D .
       E B
     .HOLLY.
       . I C
       I T A
      .RAZOR.
       O E D
 .SEASONING.
       . .
 Merge History: [0, 3, 225] with searchShapes[255]
         .
         V
         I
         D
         E
       .HOLLY.
         .
         
         
         
         
         

         .
         B
     .HOLLY.
       . I C
       I T A
      .RAZOR.
       O E D
 .SEASONING.
       . .
 Merge History: [0, 3, 246] with shape[246] being:
         
         .
         C
         A
       .IRON.
         D
         .
         
         
         

      .
      W
      A
      T  .
      C  B
     .HOLLY.
      .. I C
       I T A
      .RAZOR.
       O E D
 .SEASONING.
       . .
 Merge History: [0, 3, 258]
         
Shape 258 is
         
         .
         W
         A
         T
         C
        .HOLLY.
         .
         
         */
        /// The good news is that we have found a lot of errors in our processing and in fact it should only really produce the last one.
        
        
        let gameId = 8912
        
        let (winningShapes, words, widthMax, heightMax, winningScore) = StandardSearchAlgorithms.winningsMore(gameId: gameId)
        
        let wordsInt = WordCalculator.WordsToInt(words: words)
        
        var searchShapes = winningShapes
        searchShapes.sort { $0.score > $1.score }
        ShapeCalculator.SetMergeHistory(shapes: &searchShapes)
        
        let wordIndex = WordIndexModelV2(shapes: searchShapes, wordCount: words.count)
        
        let parentShape = searchShapes[0]
        
        let scoresMin: [Int] = Array(repeating: 0, count: 40)
        
        var siblingShapes = MergeCalculatorV2.ExecuteDifferentShapesSync(
            sourceShapes: [parentShape],
            searchShapes: searchShapes,
            searchWordIndex: wordIndex,
            sourceMax: 1,
            searchMax: searchShapes.count,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        
        let result = SiblingMergeCalculator.execute(parent: parentShape, siblings: siblingShapes, searchShapes: searchShapes, words: words, wordsInt: wordsInt, widthMax: widthMax, heightMax: heightMax, wordIndex: wordIndex, scoresMin: scoresMin)
        
        XCTAssertEqual(1,result.count)
    }

}
