//
//  WinningGamesCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 14/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class WinningGamesCalculatorTests: XCTestCase {

//    func test_try8804() {
//        // This is crashing in our testing since changing the VerifyText algorithm
//        let (shapes, words, _, _) = GameList.getShapes(gameId: 8804)
//    }
    
//    func test_TryThis() {
//
//        let gameList = GameList()
//
//        for game in gameList.games {
//            let (shapes, words, _, _) = GameList.getShapes(gameId: game.gameId)
//
//            if let winningGame = GameList.getWinningShape(gameId: game.gameId) {
//                if winningGame.width > winningGame.height {
//                    print(winningGame.CodeGridText(words: words))
//                } else {
//                    print(winningGame.FlipCodeGridText(words: words))
//                }
//            }
//
//
//        }
//
        
        
//        var text = ""
//        for shape in shapes {
//            if text != "" {
//                text += ","
//            }
//            text += shape.CodeGridText(words: words)
//        }
//        print("    " + text)
//
//        // Then we make the winning game and create that as a grid as well
//
//        let winningShape = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: shapes, words: words, widthMax: widthMax, heightMax: heightMax)
//
//        let winningShapeText = winningShape.CodeGridText(words: words)
//
//    }
    
    func test_WinningShape_8612() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8612)
        XCTAssertEqual(694, winningGame.score)
    }

    func test_WinningShape_8702() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8702)
        XCTAssertEqual(726, winningGame.score)
    }

    func test_WinningShape_8703() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8703)
        XCTAssertEqual(564, winningGame.score)
    }

    func test_WinningShape_8704() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8704)
        XCTAssertEqual(704, winningGame.score)
    }

    func test_WinningShape_8705() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8705)
        XCTAssertEqual(610, winningGame.score)
    }

    func test_WinningShape_8710() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8710)
        XCTAssertEqual(764, winningGame.score)
    }

    func test_WinningShape_8711() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8711)
        XCTAssertEqual(810, winningGame.score)
    }

    func test_WinningShape_8712() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8712)
        XCTAssertEqual(680, winningGame.score)
    }

    func test_WinningShape_8802() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8802)
        XCTAssertEqual(720, winningGame.score)
    }

    func test_WinningShape_8803() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8803)
        XCTAssertEqual(626, winningGame.score)
    }

    func test_WinningShape_8804() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8804)
        XCTAssertEqual(836, winningGame.score)
    }

    func test_WinningShape_8805() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8805)
        XCTAssertEqual(688, winningGame.score)
    }

    func test_WinningShape_8806() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8806)
        XCTAssertEqual(816, winningGame.score)
    }

    func test_WinningShape_8807() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8807)
        XCTAssertEqual(764, winningGame.score)
    }

    func test_WinningShape_8808() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8808)
        XCTAssertEqual(696, winningGame.score)
    }

    func test_WinningShape_8809() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8809)
        XCTAssertEqual(676, winningGame.score)
    }

    func test_WinningShape_8810() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8810)
        XCTAssertEqual(716, winningGame.score)
    }

    func test_WinningShape_8811() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8811)
        XCTAssertEqual(630, winningGame.score)
    }

    func test_WinningShape_8812() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8812)
        XCTAssertEqual(720, winningGame.score)
    }

    func test_WinningShape_8902() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8902)
        XCTAssertEqual(746, winningGame.score)
    }

    func test_WinningShape_8903() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8903)
        XCTAssertEqual(652, winningGame.score)
    }

    func test_WinningShape_8904() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8904)
        XCTAssertEqual(768, winningGame.score)
    }

    func test_WinningShape_8905() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8905)
        XCTAssertEqual(764, winningGame.score)
    }

    func test_WinningShape_8906() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8906)
        XCTAssertEqual(760, winningGame.score)
    }

    func test_WinningShape_8907() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8907)
        XCTAssertEqual(818, winningGame.score)
    }

    func test_WinningShape_8908() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8908)
        XCTAssertEqual(634, winningGame.score)
    }

    func test_WinningShape_8909() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8909)
        XCTAssertEqual(616, winningGame.score)
    }

    func test_WinningShape_8910() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8910)
        XCTAssertEqual(576, winningGame.score)
    }

    func test_WinningShape_8911() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8911)
        XCTAssertEqual(692, winningGame.score)
    }

    func test_WinningShape_8912() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 8912)
        XCTAssertEqual(678, winningGame.score)
    }

    func test_WinningShape_9001() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9001)
        XCTAssertEqual(612, winningGame.score)
    }

    func test_WinningShape_9002() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9002)
        XCTAssertEqual(714, winningGame.score)
    }

    func test_WinningShape_9003() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9003)
        XCTAssertEqual(672, winningGame.score)
    }

    func test_WinningShape_9004() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9004)
        XCTAssertEqual(720, winningGame.score)
    }

    func test_WinningShape_9005() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9005)
        XCTAssertEqual(734, winningGame.score)
    }

    func test_WinningShape_9006() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9006)
        XCTAssertEqual(686, winningGame.score)
    }

    func test_WinningShape_9007() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9007)
        XCTAssertEqual(626, winningGame.score)
    }

    func test_WinningShape_9008() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9008)
        XCTAssertEqual(592, winningGame.score)
    }

    func test_WinningShape_9009() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9009)
        XCTAssertEqual(736, winningGame.score)
    }

    func test_WinningShape_9010() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9010)
        XCTAssertEqual(722, winningGame.score)
    }

    func test_WinningShape_9011() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9011)
        XCTAssertEqual(652, winningGame.score)
    }

    func test_WinningShape_9012() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9012)
        XCTAssertEqual(634, winningGame.score)
    }

    func test_WinningShape_9101() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9101)
        XCTAssertEqual(734, winningGame.score)
    }

    func test_WinningShape_9102() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9102)
        XCTAssertEqual(712, winningGame.score)
    }

    func test_WinningShape_9103() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9103)
        XCTAssertEqual(518, winningGame.score)
    }

    func test_WinningShape_9104() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9104)
        XCTAssertEqual(728, winningGame.score)
    }

    func test_WinningShape_9105() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9105)
        XCTAssertEqual(506, winningGame.score)
    }

    func test_WinningShape_9106() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9106)
        XCTAssertEqual(676, winningGame.score)
    }

    func test_WinningShape_9107() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9107)
        XCTAssertEqual(710, winningGame.score)
    }

    func test_WinningShape_9108() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9108)
        XCTAssertEqual(696, winningGame.score)
    }

    func test_WinningShape_9109() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9109)
        XCTAssertEqual(636, winningGame.score)
    }

    func test_WinningShape_9110() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9110)
        XCTAssertEqual(598, winningGame.score)
    }

    func test_WinningShape_9111() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9111)
        XCTAssertEqual(616, winningGame.score)
    }

    func test_WinningShape_9112() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9112)
        XCTAssertEqual(552, winningGame.score)
    }

    func test_WinningShape_9201() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9201)
        XCTAssertEqual(522, winningGame.score)
    }

    func test_WinningShape_9202() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9202)
        XCTAssertEqual(558, winningGame.score)
    }

    func test_WinningShape_9203() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9203)
        XCTAssertEqual(548, winningGame.score)
    }

    func test_WinningShape_9204() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9204)
        XCTAssertEqual(674, winningGame.score)
    }

    func test_WinningShape_9206() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9206)
        XCTAssertEqual(590, winningGame.score)
    }

    func test_WinningShape_9207() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9207)
        XCTAssertEqual(518, winningGame.score)
    }

    func test_WinningShape_9208() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9208)
        XCTAssertEqual(532, winningGame.score)
    }

    func test_WinningShape_9209() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9209)
        XCTAssertEqual(608, winningGame.score)
    }

    func test_WinningShape_9210() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9210)
        XCTAssertEqual(626, winningGame.score)
    }

    func test_WinningShape_9211() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9211)
        XCTAssertEqual(602, winningGame.score)
    }

    func test_WinningShape_9212() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9212)
        XCTAssertEqual(576, winningGame.score)
    }

    func test_WinningShape_9301() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9301)
        XCTAssertEqual(636, winningGame.score)
    }

    func test_WinningShape_9302() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9302)
        XCTAssertEqual(524, winningGame.score)
    }

    func test_WinningShape_9303() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9303)
        XCTAssertEqual(654, winningGame.score)
    }

    func test_WinningShape_9304() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9304)
        XCTAssertEqual(676, winningGame.score)
    }

    func test_WinningShape_9305() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9305)
        XCTAssertEqual(632, winningGame.score)
    }

    func test_WinningShape_9306() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9306)
        XCTAssertEqual(554, winningGame.score)
    }

    func test_WinningShape_9307() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9307)
        XCTAssertEqual(610, winningGame.score)
    }

    func test_WinningShape_9308() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9308)
        XCTAssertEqual(598, winningGame.score)
    }

    func test_WinningShape_9309() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9309)
        XCTAssertEqual(570, winningGame.score)
    }

    func test_WinningShape_9310() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9310)
        XCTAssertEqual(440, winningGame.score)
    }

    func test_WinningShape_9311() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9311)
        XCTAssertEqual(552, winningGame.score)
    }

    func test_WinningShape_9312() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9312)
        XCTAssertEqual(506, winningGame.score)
    }

    func test_WinningShape_9401() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9401)
        XCTAssertEqual(656, winningGame.score)
    }

    func test_WinningShape_9402() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9402)
        XCTAssertEqual(636, winningGame.score)
    }

    func test_WinningShape_9403() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9403)
        XCTAssertEqual(710, winningGame.score)
    }

    func test_WinningShape_9404() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9404)
        XCTAssertEqual(740, winningGame.score)
    }

    func test_WinningShape_9406() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9406)
        XCTAssertEqual(718, winningGame.score)
    }

    func test_WinningShape_9407() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9407)
        XCTAssertEqual(804, winningGame.score)
    }

    func test_WinningShape_9408() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9408)
        XCTAssertEqual(828, winningGame.score)
    }

    func test_WinningShape_9409() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9409)
        XCTAssertEqual(766, winningGame.score)
    }

    func test_WinningShape_9410() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9410)
        XCTAssertEqual(688, winningGame.score)
    }

    func test_WinningShape_9411() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9411)
        XCTAssertEqual(696, winningGame.score)
    }

    func test_WinningShape_9412() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9412)
        XCTAssertEqual(874, winningGame.score)
    }

    func test_WinningShape_9501() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9501)
        XCTAssertEqual(800, winningGame.score)
    }

    func test_WinningShape_9502() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9502)
        XCTAssertEqual(654, winningGame.score)
    }

    func test_WinningShape_9503() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9503)
        XCTAssertEqual(746, winningGame.score)
    }

    func test_WinningShape_9504() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9504)
        XCTAssertEqual(824, winningGame.score)
    }

    func test_WinningShape_9505() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9505)
        XCTAssertEqual(748, winningGame.score)
    }

    func test_WinningShape_9506() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9506)
        XCTAssertEqual(706, winningGame.score)
    }

    func test_WinningShape_9507() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9507)
        XCTAssertEqual(802, winningGame.score)
    }

    func test_WinningShape_9508() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9508)
        XCTAssertEqual(778, winningGame.score)
    }

    func test_WinningShape_9509() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9509)
        XCTAssertEqual(762, winningGame.score)
    }

    func test_WinningShape_9510() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9510)
        XCTAssertEqual(706, winningGame.score)
    }

    func test_WinningShape_9511() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9511)
        XCTAssertEqual(772, winningGame.score)
    }

    func test_WinningShape_9512() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9512)
        XCTAssertEqual(764, winningGame.score)
    }

    func test_WinningShape_9601() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9601)
        XCTAssertEqual(830, winningGame.score)
    }

    func test_WinningShape_9602() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9602)
        XCTAssertEqual(844, winningGame.score)
    }

    func test_WinningShape_9603() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9603)
        XCTAssertEqual(680, winningGame.score)
    }

    func test_WinningShape_9604() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9604)
        XCTAssertEqual(720, winningGame.score)
    }

    func test_WinningShape_9605() {
        let winningGame = WinningGamesCalculator.WinningShape(gameId: 9605)
        XCTAssertEqual(840, winningGame.score)
    }
}
