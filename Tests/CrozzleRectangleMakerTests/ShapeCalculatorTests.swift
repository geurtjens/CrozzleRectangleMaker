//
//  ShapeCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 26/5/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class ShapeCalculatorTests: XCTestCase {
    
    func test_SplitSpeed() {
        let text =   "    . .   . \n" +
                     ".SNOW.TOAST.\n" +
                     "    H O . R \n" +
                     ".FAMILY.T E \n" +
                     "    T.SAUCE.\n" +
                     "    E . R . \n" +
                     " .  .PORK.I \n" +
                     ".NUTS. .E.N \n" +
                     " A  I .HYMN.\n" +
                     ".ZION. A.E. \n" +
                     " A .G.AZURE.\n" +
                     " R B.. E R  \n" +
                     ".EVE.JELLY. \n" +
                     " T L O N .  \n" +
                     ".HOLLY.U    \n" +
                     " . S .STAR. \n" +
                     "   .   .    "
        measure {
            
            let _ = text.split(separator:"\n")
        }
    }
    
    func test_ReverseSpeed() {
        let text =   "    . .   . \n" +
                     ".SNOW.TOAST.\n" +
                     "    H O . R \n" +
                     ".FAMILY.T E \n" +
                     "    T.SAUCE.\n" +
                     "    E . R . \n" +
                     " .  .PORK.I \n" +
                     ".NUTS. .E.N \n" +
                     " A  I .HYMN.\n" +
                     ".ZION. A.E. \n" +
                     " A .G.AZURE.\n" +
                     " R B.. E R  \n" +
                     ".EVE.JELLY. \n" +
                     " T L O N .  \n" +
                     ".HOLLY.U    \n" +
                     " . S .STAR. \n" +
                     "   .   .    "
        
        let grid = text.split(separator:"\n")
        measure {
            let _ = ShapeCalculator.rotateGrid(grid: grid)
            
        }
    }
    
    func test_RotateGridSpeed() {
        measure {
            
            let text =   "    . .   . \n" +
                         ".SNOW.TOAST.\n" +
                         "    H O . R \n" +
                         ".FAMILY.T E \n" +
                         "    T.SAUCE.\n" +
                         "    E . R . \n" +
                         " .  .PORK.I \n" +
                         ".NUTS. .E.N \n" +
                         " A  I .HYMN.\n" +
                         ".ZION. A.E. \n" +
                         " A .G.AZURE.\n" +
                         " R B.. E R  \n" +
                         ".EVE.JELLY. \n" +
                         " T L O N .  \n" +
                         ".HOLLY.U    \n" +
                         " . S .STAR. \n" +
                         "   .   .    "
            let grid = text.split(separator:"\n")
            
            let _ = ShapeCalculator.rotateGrid(grid: grid)
        }
    }
    func test_VerifyTextSpeed() {
        measure {
            
             
            let text =   "    . .   . \n" +
                         ".SNOW.TOAST.\n" +
                         "    H O . R \n" +
                         ".FAMILY.T E \n" +
                         "    T.SAUCE.\n" +
                         "    E . R . \n" +
                         " .  .PORK.I \n" +
                         ".NUTS. .E.N \n" +
                         " A  I .HYMN.\n" +
                         ".ZION. A.E. \n" +
                         " A .G.AZURE.\n" +
                         " R B.. E R  \n" +
                         ".EVE.JELLY. \n" +
                         " T L O N .  \n" +
                         ".HOLLY.U    \n" +
                         " . S .STAR. \n" +
                         "   .   .    "
            XCTAssertTrue(ShapeToTextConverter.VerifyText(text: text))
        }
    }
    
//    func test_VerifyTextSpeed2() {
//        measure {
//            
//             
//            let text =   "    . .   . \n" +
//                         ".SNOW.TOAST.\n" +
//                         "    H O . R \n" +
//                         ".FAMILY.T E \n" +
//                         "    T.SAUCE.\n" +
//                         "    E . R . \n" +
//                         " .  .PORK.I \n" +
//                         ".NUTS. .E.N \n" +
//                         " A  I .HYMN.\n" +
//                         ".ZION. A.E. \n" +
//                         " A .G.AZURE.\n" +
//                         " R B.. E R  \n" +
//                         ".EVE.JELLY. \n" +
//                         " T L O N .  \n" +
//                         ".HOLLY.U    \n" +
//                         " . S .STAR. \n" +
//                         "   .   .    "
//            XCTAssertTrue(ShapeToTextConverter.VerifyText2(text: text))
//        }
//    }
    
//    func test_VerifyTextSpeed3() {
//        measure {
//
//
//            let text =   "    . .   . \n" +
//                         ".SNOW.TOAST.\n" +
//                         "    H O . R \n" +
//                         ".FAMILY.T E \n" +
//                         "    T.SAUCE.\n" +
//                         "    E . R . \n" +
//                         " .  .PORK.I \n" +
//                         ".NUTS. .E.N \n" +
//                         " A  I .HYMN.\n" +
//                         ".ZION. A.E. \n" +
//                         " A .G.AZURE.\n" +
//                         " R B.. E R  \n" +
//                         ".EVE.JELLY. \n" +
//                         " T L O N .  \n" +
//                         ".HOLLY.U    \n" +
//                         " . S .STAR. \n" +
//                         "   .   .    "
//            XCTAssertTrue(ShapeToTextConverter.VerifyText3(text: text))
//        }
//    }
    func test_VerifyTextSpeed4() {
        measure {
            
             
            let text =   "    . .   . \n" +
                         ".SNOW.TOAST.\n" +
                         "    H O . R \n" +
                         ".FAMILY.T E \n" +
                         "    T.SAUCE.\n" +
                         "    E . R . \n" +
                         " .  .PORK.I \n" +
                         ".NUTS. .E.N \n" +
                         " A  I .HYMN.\n" +
                         ".ZION. A.E. \n" +
                         " A .G.AZURE.\n" +
                         " R B.. E R  \n" +
                         ".EVE.JELLY. \n" +
                         " T L O N .  \n" +
                         ".HOLLY.U    \n" +
                         " . S .STAR. \n" +
                         "   .   .    "
            XCTAssertTrue(ShapeToTextConverter.VerifyText4(text: text))
        }
    }
    
    func test_VerifyTextSpeed5() {
        measure {
            
             
            let text =   "    . .   . \n" +
                         ".SNOW.TOAST.\n" +
                         "    H O . R \n" +
                         ".FAMILY.T E \n" +
                         "    T.SAUCE.\n" +
                         "    E . R . \n" +
                         " .  .PORK.I \n" +
                         ".NUTS. .E.N \n" +
                         " A  I .HYMN.\n" +
                         ".ZION. A.E. \n" +
                         " A .G.AZURE.\n" +
                         " R B.. E R  \n" +
                         ".EVE.JELLY. \n" +
                         " T L O N .  \n" +
                         ".HOLLY.U    \n" +
                         " . S .STAR. \n" +
                         "   .   .    "
            XCTAssertTrue(ShapeToTextConverter.VerifyText5(text: text))
        }
    }
    
    func test_VerifyText() {
        let gameList = GameList()
        
        for game in gameList.games {
            let text = game.winningText()
            
            XCTAssertTrue(ShapeToTextConverter.VerifyText(text: text))
        }
    }
    
    public func test_AverageScore() {
        let winningShapes = GetStartingData.getWinningShapes(gameId: 8808)
        
        let average = ShapeCalculator.findAverageScore(shapes: winningShapes)
        
        XCTAssertEqual(68, average)
    }
    
    func testToCodeResult() throws {
        let placements = [
            PlacementModel(w: 0, x: 0, y: 9, z: true, l:4),
            PlacementModel(w: 1, x: 5, y: 10, z: true, l:5),
            PlacementModel(w: 2, x: 6, y: 0, z: false, l:4),
            PlacementModel(w: 3, x: 5, y: 11, z: false, l:3),
            PlacementModel(w: 4, x: 7, y: 7, z: false, l:8),
            PlacementModel(w: 5, x: 0, y: 7, z: true, l:4),
            PlacementModel(w: 6, x: 1, y: 6, z: false, l:8),
            PlacementModel(w: 7, x: 6, y: 8, z: true, l:4),
            PlacementModel(w: 8, x: 8, y: 2, z: false, l:6),
            PlacementModel(w: 9, x: 0, y: 1, z: true, l:4),
            PlacementModel(w: 10, x: 9, y: 7, z: false, l:5),
            PlacementModel(w: 11, x: 5, y: 1, z: true, l:5),
            PlacementModel(w: 13, x: 0, y: 14, z: true, l:5),
            PlacementModel(w: 14, x: 4, y: 12, z: true, l:5),
            PlacementModel(w: 15, x: 0, y: 3, z: true, l:6),
            PlacementModel(w: 16, x: 4, y: 0, z: false, l:5),
            PlacementModel(w: 17, x: 4, y: 6, z: false, l:4),
            PlacementModel(w: 18, x: 5, y: 4, z: true, l:5),
            PlacementModel(w: 20, x: 10, y: 0, z: false, l:4),
            PlacementModel(w: 21, x: 0, y: 12, z: true, l:3),
            PlacementModel(w: 23, x: 3, y: 10, z: false, l:5),
            PlacementModel(w: 24, x: 0, y: 5, z: true, l:4)
        ]
        let shape = ShapeModel(score: 636, width: 12, height: 17, placements: placements)
        
        let gameList = GameList()
        
        if let game = gameList.getGame(gameId: 8612) {
            print(shape.ToString(words: game.winningWords))
        }
    }
        
    
    func testTextIsVerified() throws {
        let input = "   ..     \n.STAY.    \n  .HAWSER.\n .BOW.    \n.GUY.     \n  O.      \n  Y       \n  .       "
        print(input)
        
        let isVerified = ShapeToTextConverter.VerifyText(text: input)
        XCTAssertTrue(isVerified)
    }
}
