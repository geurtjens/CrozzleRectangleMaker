//
//  SiblingMergeCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 16/9/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class SiblingMergeCalculatorTests: XCTestCase {

    
    func testExecute() {
        let gameList = GameList()
        for game in gameList.games {
            SiblingMergeCalculator.Execute(gameId: game.gameId, maxLevels: 20)
        }
    }
    
    /// We find here that treeSearch produces the same results as normal merge with less duplicates
    /// Also the normal merge duplicates shapes in the parent shape.
    /// TreeMerge produces 1 duplicate and normal produces 27 duplicates.
    func testCompare() {
        
        let gameId = 8912
        let (parentShape, sourceShapes, searchShapes, scoresMin, words, widthMax, heightMax, _, wordIndex, wordsInt) = SiblingMergeCalculator.GetStartingData(gameId: gameId)
        
        /// `WHEN` we check for duplicates in the `sourceShapes`
        let (_, sourceShapeDuplicatesCount) = RemoveDuplicatesCalculator.execute(shapes: sourceShapes)
        
        /// `THEN` there are `0 duplicates` in the `sourceShapes`
        XCTAssertEqual(0, sourceShapeDuplicatesCount)
        
        /// `WHEN` we calculate the last shape that was added to each sibling in the source shapes
        let siblingShapes = SiblingMergeCalculator.getSiblingLastShape(siblings: sourceShapes).sorted()
        
        
        /// `AND` create a tree node from parent and sourceShapes
        let treeNode = TreeNodeModel(
            parentShape: parentShape,
            childShapes: sourceShapes,
            scoreMax: Int(sourceShapes[0].score),
            siblingCount: 0)
        
        /// `AND` perform the tree merge calculation
        let level1 = SiblingMergeCalculator.executeAll(
            treeNodes: [treeNode],
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        /// `AND` extract out all shapes that the tree search creates
        var treeShapes: [ShapeModel] = []
        for item in level1 {
            treeShapes += item.childShapes
        }
        
        /// `THEN` there are 52 shapes created
        XCTAssertEqual(52, treeShapes.count)
        
        // The tree calculation calculated 1 duplicate
        let (treeWithoutDuplicates, treeDuplicateCount) = RemoveDuplicatesCalculator.execute(shapes: treeShapes)
        
        // `AND` we find one duplicate
        XCTAssertEqual(1, treeDuplicateCount)
        
        let (_, treeAndChildDuplicateCount) = RemoveDuplicatesCalculator.execute(shapes: treeShapes + sourceShapes)
        
        
        let duplicatesFromParentShapes = treeAndChildDuplicateCount - treeDuplicateCount
        
        
        // AND no duplicates that result in the same shape within the sourceShapes
        XCTAssertEqual(0, duplicatesFromParentShapes)
        
        // WHEN we create shapes the old way
        var shapesFromTheOldWay = MergeCalculatorV2.ExecuteDifferentShapesSync(
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            searchWordIndex: wordIndex,
            sourceMax: sourceShapes.count,
            searchMax: searchShapes.count,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        // THEN we find 78 shapes are created
        XCTAssertEqual(78, shapesFromTheOldWay.count)
        
        let (_, oldWayDuplicateCount) = RemoveDuplicatesCalculator.execute(shapes: shapesFromTheOldWay)
        
        // AND 22 of them are duplicated
        XCTAssertEqual(22, oldWayDuplicateCount)
        
        let (oldWayAndParentShapesWithoutDuplicates, oldWayAndSourceShapeDuplicateCount) = RemoveDuplicatesCalculator.execute(shapes: shapesFromTheOldWay + sourceShapes)
        
        let duplicatesFromSourceShapes = oldWayAndSourceShapeDuplicateCount - oldWayDuplicateCount
        
        /// `AND` `5` are duplicates from the parent shapes that made these shapes
        XCTAssertEqual(5, duplicatesFromSourceShapes)
        
        
        //  So in conclusion the old way produces 22 + 5 duplicates = 27 duplicates
        // whereas the new way produces only 1 duplicate
        XCTAssertEqual(treeWithoutDuplicates.count + sourceShapes.count, oldWayAndParentShapesWithoutDuplicates.count)
        
        //        print("PARENT SHAPE")
        //        print(parentShape.ToText(words: words))
                
                
        //        print("CHILD SHAPES")
        //        for item in childShapes {
        //            var text = ""
        //            text += "["
        //            for history in item.mergeHistory {
        //                text += String(history) + " "
        //            }
        //            text += "]\n"
        //            text += item.ToText(words: words) + "\n"
        //            print(text)
        //        }
        //        print("\n\n")
        //

        
    }
}
