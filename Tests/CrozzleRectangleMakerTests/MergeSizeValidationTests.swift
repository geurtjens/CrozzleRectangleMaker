//
//  MergeSizeValidationTests.swift
//  
//
//  Created by Michael Geurtjens on 4/8/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class MergeSizeValidationTests: XCTestCase {

    // these parameters are used in all tests
    private let widthMax = 17
    private let heightMax = 12
    private let words8612 = [
        "ZION", "AZURE", "TOYS", "JOY", "HAZELNUT", "NUTS", "NAZARETH", "HYMN", "TURKEY", "SNOW",
        "MERRY", "TOAST", "STAR", "HOLLY", "JELLY", "FAMILY", "WHITE", "SING", "SAUCE", "PORK",
        "TREE", "EVE", "INN", "BELLS", "CAKE",
        "GLAZE"]
    
    
    
    
    
    
    func test_Execute_SameOrientation() throws {
        // GIVEN sourceShape is TURKEy:HyMN
        // AND searchShape is TURkEY:PORk
        // AND sourceShape, searchShape have common word "TURKEY" both in their first position
        // WHEN we check the size
        // THEN `width` is 8, `height` is 8 and both shapes do not have `differentOrientation`, the resulting `sizeIsValid`
        
        let source =    "      . \n" +
                        "      H \n" +
                        ".TURKEY.\n" +
                        "      M \n" +
                        "      N \n" +
                        "      . "
        
        let search =    "    .   \n" +
                        "    P   \n" +
                        "    O   \n" +
                        "    R   \n" +
                        ".TURKEY.\n" +
                        "    .   "
         
//        let result =    "    .   \n" +
//                        "    P   \n" +
//                        "    O . \n" +
//                        "    R H \n" +
//                        ".TURKEY.\n" +
//                        "      M \n" +
//                        "      N \n" +
//                        "      . "
        
        // GIVEN sourceShape is TURKEy:HyMN
        let sourcePlacements:[PlacementModel] = [
            PlacementModel(w: 8, x: 0, y: 2, z: true, l: 6),
            PlacementModel(w: 7, x: 6, y: 0, z: false, l: 4)
        ]
        let sourceShape = ShapeModel(score: 52, width: 8, height: 6, placements: sourcePlacements)
        XCTAssertEqual(source, sourceShape.ToText(words: words8612))
         
        // AND searchShape is TURkEY:PORk
        let searchPlacements = [
            PlacementModel(w: 8, x: 0, y: 4, z: true, l: 6),
            PlacementModel(w: 19, x: 4, y: 0, z: false, l: 4)]
        let searchShape = ShapeModel(score: 24, width: 8, height: 6, placements: searchPlacements)
        XCTAssertEqual(search, searchShape.ToText(words: words8612))
        
        // AND sourceShape, searchShape have common word "TURKEY" both in their first position
        let sourceFirstPos = 0
        let searchFirstPos = 0
        XCTAssertEqual(sourceShape.placements[sourceFirstPos].w, searchShape.placements[searchFirstPos].w)
        
        // WHEN we check the size
        let (sizeIsValid, width, height, differentOrientation) = MergeSizeValidation.execute(
            sourceShape: sourceShape,
            sourcePos: sourceFirstPos,
            searchShape: searchShape,
            searchPos: searchFirstPos,
            widthMax: widthMax,
            heightMax: heightMax
        )
        
        // THEN `width` is 8, `height` is 8 and both shapes do not have `differentOrientation`, the resulting `sizeIsValid`
        XCTAssertEqual(8, width)
        XCTAssertEqual(8, height)
        XCTAssertFalse(differentOrientation)
        XCTAssertTrue(sizeIsValid)
        
    }


    func test_Execute_OppositeOrientation() throws {
        // GIVEN sourceShape is HyMN:TURKEy
        // AND searchShape is TURkEY:PORk
        // AND sourceShape, searchShape have common word "TURKEY"
        // WHEN we check the size
        // THEN `width` is 8, `height` is 8 and source and search have `differentOrientation`
       
        let source =    "  .   \n" +
                        "  T   \n" +
                        "  U   \n" +
                        "  R   \n" +
                        "  K   \n" +
                        "  E   \n" +
                        ".HYMN.\n" +
                        "  .   "
        
        let search =    "    .   \n" +
                        "    P   \n" +
                        "    O   \n" +
                        "    R   \n" +
                        ".TURKEY.\n" +
                        "    .   "
         
//        let result =    "    .   \n" +
//                        "    T   \n" +
//                        "    U   \n" +
//                        "    R   \n" +
//                        ".PORK.  \n" +
//                        "    E   \n" +
//                        "  .HYMN.\n" +
//                        "    .   "

        // GIVEN sourceShape is HyMN:TURKEy
        let sourcePlacements:[PlacementModel] = [
            PlacementModel(w: 7, x: 0, y: 6, z: true, l: 4),
            PlacementModel(w: 8, x: 2, y: 0, z: false, l: 6)
        ]
        let sourceShape = ShapeModel(score: 52, width: 6, height: 8, placements: sourcePlacements)
        XCTAssertEqual(source, sourceShape.ToText(words: words8612))

        // AND searchShape is TURkEY:PORk
        let searchPlacements = [
            PlacementModel(w: 8, x: 0, y: 4, z: true, l: 6),
            PlacementModel(w: 19, x: 4, y: 0, z: false, l: 4)]
        let searchShape = ShapeModel(score: 24, width: 8, height: 6, placements: searchPlacements)
        XCTAssertEqual(search, searchShape.ToText(words: words8612))
        
        // AND sourceShape, searchShape have common word "TURKEY"
        let sourceFirstPos = 1
        let searchFirstPos = 0
        XCTAssertEqual(sourceShape.placements[sourceFirstPos].w, searchShape.placements[searchFirstPos].w)
        
        // WHEN we check the size
        let (sizeIsValid, width, height, differentOrientation) = MergeSizeValidation2.execute(
            sourceShape: sourceShape,
            sourcePos: sourceFirstPos,
            searchShape: searchShape,
            searchPos: searchFirstPos,
            widthMax: widthMax,
            heightMax: heightMax
        )
        
        // THEN `width` is 8, `height` is 8 and source and search have `differentOrientation`
        XCTAssertTrue(differentOrientation)
        XCTAssertTrue(sizeIsValid)
        XCTAssertEqual(8, width) // calculator says 6
        XCTAssertEqual(8, height) // calculator says 10
    }

    func test_getWidthHeight() throws {
        let (width,height) = MergeSizeValidation2.getWidthHeight(
            sourceWidth: 6,
            sourceHeight: 8,
            sourceX: 2,
            sourceY: 0,
            searchWidth: 8,
            searchHeight: 6,
            searchX: 0,
            searchY: 4,
            sourceIsFlipped: true)
        XCTAssertEqual(8, width)
        XCTAssertEqual(8, height)
    }

}
