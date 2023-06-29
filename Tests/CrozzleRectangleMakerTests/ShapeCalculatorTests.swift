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
            XCTAssertTrue(ShapeCalculator.VerifyText(text: text))
        }
    }
    
    func test_VerifyTextSpeed2() {
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
            XCTAssertTrue(ShapeCalculator.VerifyText2(text: text))
        }
    }
    
    func test_VerifyTextSpeed3() {
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
            XCTAssertTrue(ShapeCalculator.VerifyText3(text: text))
        }
    }
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
            XCTAssertTrue(ShapeCalculator.VerifyText4(text: text))
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
            XCTAssertTrue(ShapeCalculator.VerifyText5(text: text))
        }
    }
    
    func test_VerifyText() {
        let gameList = GameList()
        
        for game in gameList.games {
            let text = game.winningText()
            
            XCTAssertTrue(ShapeCalculator.VerifyText(text: text))
        }
    }
    
    func testToCodeResult() throws {
        let placements = [
            PlacementModel(i: 0, h: true, x: 0, y: 9, l:4),
            PlacementModel(i: 1, h: true, x: 5, y: 10, l:5),
            PlacementModel(i: 2, h: false, x: 6, y: 0, l:4),
            PlacementModel(i: 3, h: false, x: 5, y: 11, l:3),
            PlacementModel(i: 4, h: false, x: 7, y: 7, l:8),
            PlacementModel(i: 5, h: true, x: 0, y: 7, l:4),
            PlacementModel(i: 6, h: false, x: 1, y: 6, l:8),
            PlacementModel(i: 7, h: true, x: 6, y: 8, l:4),
            PlacementModel(i: 8, h: false, x: 8, y: 2, l:6),
            PlacementModel(i: 9, h: true, x: 0, y: 1, l:4),
            PlacementModel(i: 10, h: false, x: 9, y: 7, l:5),
            PlacementModel(i: 11, h: true, x: 5, y: 1, l:5),
            PlacementModel(i: 13, h: true, x: 0, y: 14, l:5),
            PlacementModel(i: 14, h: true, x: 4, y: 12, l:5),
            PlacementModel(i: 15, h: true, x: 0, y: 3, l:6),
            PlacementModel(i: 16, h: false, x: 4, y: 0, l:5),
            PlacementModel(i: 17, h: false, x: 4, y: 6, l:4),
            PlacementModel(i: 18, h: true, x: 5, y: 4, l:5),
            PlacementModel(i: 20, h: false, x: 10, y: 0, l:4),
            PlacementModel(i: 21, h: true, x: 0, y: 12, l:3),
            PlacementModel(i: 23, h: false, x: 3, y: 10, l:5),
            PlacementModel(i: 24, h: true, x: 0, y: 5, l:4)
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
        
        let isVerified = ShapeCalculator.VerifyText(text: input)
        XCTAssertTrue(isVerified)
    }
}
