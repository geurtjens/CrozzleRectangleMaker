//
//  StatisticsCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 24/5/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class StatisticsCalculatorTests: XCTestCase {

    func test_ScoreFor_Edge() throws {
        let shapes = ShapeQueueListCalculator.get_2_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let a = StatisticsCalculator.Execute(shapes: shapes)
        
        let scoreMinWeWant = StatisticsCalculator.scoreFor(topPercentage: 20, statistics: a)
        
        XCTAssertEqual(36,scoreMinWeWant)
        
        let scoreMinWeWant2 = StatisticsCalculator.scoreFor(topPercentage: 1, statistics: a)
        
        XCTAssertEqual(52,scoreMinWeWant2)
    }
    
    func test_PositionMax_Edge() throws {
        let shapes = ShapeQueueListCalculator.get_2_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let statistics = StatisticsCalculator.Execute(shapes: shapes)
        
        let a = StatisticsCalculator.positionMax(topPercentage: 20, statistics: statistics)
        
        XCTAssertEqual(1746, a)
        
        let b = StatisticsCalculator.positionMax(topPercentage: 1, statistics: statistics)
        
        XCTAssertEqual(75, b)
    }
    
    func test_Edges_8612() throws {
        let shapes = ShapeQueueListCalculator.get_2_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        XCTAssertEqual(10757, shapes.count)
        
        let a = StatisticsCalculator.Execute(shapes: shapes)
        XCTAssertEqual(6, a.count)
        
        XCTAssertEqual(84, a[0].score)
        XCTAssertEqual(10, a[0].count)
        XCTAssertEqual(0, a[0].startPosition)
        XCTAssertEqual(929, a[0].percentage)
        XCTAssertEqual(929, a[0].topPercentage)
        XCTAssertEqual(9, a[0].endPosition)
        
        XCTAssertEqual(52, a[1].score)
        XCTAssertEqual(66, a[1].count)
        XCTAssertEqual(10, a[1].startPosition)
        XCTAssertEqual(75, a[1].endPosition)
        XCTAssertEqual(6135, a[1].percentage)
        XCTAssertEqual(7065, a[1].topPercentage)

        XCTAssertEqual(36, a[2].score)
        XCTAssertEqual(1671, a[2].count)
        XCTAssertEqual(10 + 66, a[2].startPosition)
        XCTAssertEqual(155340, a[2].percentage)
        XCTAssertEqual(1746, a[2].endPosition)
        XCTAssertEqual(162405, a[2].topPercentage)

        XCTAssertEqual(28, a[3].score)
        XCTAssertEqual(2998, a[3].count)
        XCTAssertEqual(10 + 66 + 1671, a[3].startPosition)
        XCTAssertEqual(4744, a[3].endPosition)
        XCTAssertEqual(278702, a[3].percentage)
        XCTAssertEqual(441108, a[3].topPercentage)

        XCTAssertEqual(24, a[4].score)
        XCTAssertEqual(2062, a[4].count)
        XCTAssertEqual(10 + 66 + 1671 + 2998, a[4].startPosition)
        XCTAssertEqual(6806, a[4].endPosition)
        XCTAssertEqual(191689, a[4].percentage)
        XCTAssertEqual(632797, a[4].topPercentage)

        XCTAssertEqual(22, a[5].score)
        XCTAssertEqual(3950, a[5].count)
        XCTAssertEqual(10 + 66 + 1671 + 2998 + 2062, a[5].startPosition)
        XCTAssertEqual(10756, a[5].endPosition)
        XCTAssertEqual(367202, a[5].percentage)
        XCTAssertEqual(1000000, a[5].topPercentage)

    }
    
    func test_Rectangle_8612() async throws {
        
        let shapes = await ShapeQueueListCalculator.get_4_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        
        let a = StatisticsCalculator.Execute(shapes: shapes)
        XCTAssertEqual(55, a.count)
        
        // Create a baseline test
        for i in 0..<a.count {
            let b = a[i]
            print("XCTAssertEqual(\(b.score), a[\(i)].score)")
            print("XCTAssertEqual(\(b.count), a[\(i)].count)")
            print("XCTAssertEqual(\(b.percentage), a[\(i)].percentage)")
            print("XCTAssertEqual(\(b.topPercentage), a[\(i)].topPercentage)")
            print("")
            if i % 10 == 0 {
                print("")
            }
        }
        
        // print out the data for statistical purposes
        for b in a {
            print("\(b.score),\(b.count),\(b.percentage),\(b.topPercentage)")
        }
        XCTAssertEqual(176, a[0].score)
        XCTAssertEqual(28, a[0].count)
        XCTAssertEqual(6, a[0].percentage)
        XCTAssertEqual(6, a[0].topPercentage)


        XCTAssertEqual(172, a[1].score)
        XCTAssertEqual(141, a[1].count)
        XCTAssertEqual(31, a[1].percentage)
        XCTAssertEqual(37, a[1].topPercentage)

        XCTAssertEqual(170, a[2].score)
        XCTAssertEqual(27, a[2].count)
        XCTAssertEqual(5, a[2].percentage)
        XCTAssertEqual(43, a[2].topPercentage)

        XCTAssertEqual(168, a[3].score)
        XCTAssertEqual(2, a[3].count)
        XCTAssertEqual(0, a[3].percentage)
        XCTAssertEqual(43, a[3].topPercentage)

        XCTAssertEqual(160, a[4].score)
        XCTAssertEqual(1, a[4].count)
        XCTAssertEqual(0, a[4].percentage)
        XCTAssertEqual(43, a[4].topPercentage)

        XCTAssertEqual(156, a[5].score)
        XCTAssertEqual(1, a[5].count)
        XCTAssertEqual(0, a[5].percentage)
        XCTAssertEqual(44, a[5].topPercentage)

        XCTAssertEqual(152, a[6].score)
        XCTAssertEqual(27, a[6].count)
        XCTAssertEqual(5, a[6].percentage)
        XCTAssertEqual(50, a[6].topPercentage)

        XCTAssertEqual(148, a[7].score)
        XCTAssertEqual(12, a[7].count)
        XCTAssertEqual(2, a[7].percentage)
        XCTAssertEqual(52, a[7].topPercentage)

        XCTAssertEqual(144, a[8].score)
        XCTAssertEqual(43, a[8].count)
        XCTAssertEqual(9, a[8].percentage)
        XCTAssertEqual(62, a[8].topPercentage)

        XCTAssertEqual(140, a[9].score)
        XCTAssertEqual(22, a[9].count)
        XCTAssertEqual(4, a[9].percentage)
        XCTAssertEqual(67, a[9].topPercentage)

        XCTAssertEqual(138, a[10].score)
        XCTAssertEqual(42, a[10].count)
        XCTAssertEqual(9, a[10].percentage)
        XCTAssertEqual(76, a[10].topPercentage)


        XCTAssertEqual(136, a[11].score)
        XCTAssertEqual(1109, a[11].count)
        XCTAssertEqual(244, a[11].percentage)
        XCTAssertEqual(321, a[11].topPercentage)

        XCTAssertEqual(132, a[12].score)
        XCTAssertEqual(221, a[12].count)
        XCTAssertEqual(48, a[12].percentage)
        XCTAssertEqual(369, a[12].topPercentage)

        XCTAssertEqual(130, a[13].score)
        XCTAssertEqual(226, a[13].count)
        XCTAssertEqual(49, a[13].percentage)
        XCTAssertEqual(419, a[13].topPercentage)

        XCTAssertEqual(128, a[14].score)
        XCTAssertEqual(577, a[14].count)
        XCTAssertEqual(127, a[14].percentage)
        XCTAssertEqual(547, a[14].topPercentage)

        XCTAssertEqual(126, a[15].score)
        XCTAssertEqual(170, a[15].count)
        XCTAssertEqual(37, a[15].percentage)
        XCTAssertEqual(584, a[15].topPercentage)

        XCTAssertEqual(124, a[16].score)
        XCTAssertEqual(534, a[16].count)
        XCTAssertEqual(117, a[16].percentage)
        XCTAssertEqual(702, a[16].topPercentage)

        XCTAssertEqual(122, a[17].score)
        XCTAssertEqual(966, a[17].count)
        XCTAssertEqual(213, a[17].percentage)
        XCTAssertEqual(915, a[17].topPercentage)

        XCTAssertEqual(120, a[18].score)
        XCTAssertEqual(3070, a[18].count)
        XCTAssertEqual(677, a[18].percentage)
        XCTAssertEqual(1593, a[18].topPercentage)

        XCTAssertEqual(118, a[19].score)
        XCTAssertEqual(381, a[19].count)
        XCTAssertEqual(84, a[19].percentage)
        XCTAssertEqual(1677, a[19].topPercentage)

        XCTAssertEqual(116, a[20].score)
        XCTAssertEqual(1707, a[20].count)
        XCTAssertEqual(376, a[20].percentage)
        XCTAssertEqual(2053, a[20].topPercentage)


        XCTAssertEqual(114, a[21].score)
        XCTAssertEqual(1923, a[21].count)
        XCTAssertEqual(424, a[21].percentage)
        XCTAssertEqual(2478, a[21].topPercentage)

        XCTAssertEqual(112, a[22].score)
        XCTAssertEqual(3649, a[22].count)
        XCTAssertEqual(805, a[22].percentage)
        XCTAssertEqual(3283, a[22].topPercentage)

        XCTAssertEqual(110, a[23].score)
        XCTAssertEqual(1032, a[23].count)
        XCTAssertEqual(227, a[23].percentage)
        XCTAssertEqual(3511, a[23].topPercentage)

        XCTAssertEqual(108, a[24].score)
        XCTAssertEqual(3896, a[24].count)
        XCTAssertEqual(859, a[24].percentage)
        XCTAssertEqual(4370, a[24].topPercentage)

        XCTAssertEqual(106, a[25].score)
        XCTAssertEqual(3364, a[25].count)
        XCTAssertEqual(742, a[25].percentage)
        XCTAssertEqual(5113, a[25].topPercentage)

        XCTAssertEqual(104, a[26].score)
        XCTAssertEqual(1631, a[26].count)
        XCTAssertEqual(359, a[26].percentage)
        XCTAssertEqual(5473, a[26].topPercentage)

        XCTAssertEqual(100, a[27].score)
        XCTAssertEqual(881, a[27].count)
        XCTAssertEqual(194, a[27].percentage)
        XCTAssertEqual(5667, a[27].topPercentage)

        XCTAssertEqual(98, a[28].score)
        XCTAssertEqual(1072, a[28].count)
        XCTAssertEqual(236, a[28].percentage)
        XCTAssertEqual(5904, a[28].topPercentage)

        XCTAssertEqual(96, a[29].score)
        XCTAssertEqual(4000, a[29].count)
        XCTAssertEqual(882, a[29].percentage)
        XCTAssertEqual(6786, a[29].topPercentage)

        XCTAssertEqual(94, a[30].score)
        XCTAssertEqual(829, a[30].count)
        XCTAssertEqual(182, a[30].percentage)
        XCTAssertEqual(6969, a[30].topPercentage)


        XCTAssertEqual(92, a[31].score)
        XCTAssertEqual(3840, a[31].count)
        XCTAssertEqual(847, a[31].percentage)
        XCTAssertEqual(7817, a[31].topPercentage)

        XCTAssertEqual(90, a[32].score)
        XCTAssertEqual(6639, a[32].count)
        XCTAssertEqual(1465, a[32].percentage)
        XCTAssertEqual(9282, a[32].topPercentage)

        XCTAssertEqual(88, a[33].score)
        XCTAssertEqual(36689, a[33].count)
        XCTAssertEqual(8096, a[33].percentage)
        XCTAssertEqual(17378, a[33].topPercentage)

        XCTAssertEqual(86, a[34].score)
        XCTAssertEqual(1800, a[34].count)
        XCTAssertEqual(397, a[34].percentage)
        XCTAssertEqual(17775, a[34].topPercentage)

        XCTAssertEqual(84, a[35].score)
        XCTAssertEqual(16833, a[35].count)
        XCTAssertEqual(3714, a[35].percentage)
        XCTAssertEqual(21490, a[35].topPercentage)

        XCTAssertEqual(82, a[36].score)
        XCTAssertEqual(27267, a[36].count)
        XCTAssertEqual(6017, a[36].percentage)
        XCTAssertEqual(27507, a[36].topPercentage)

        XCTAssertEqual(80, a[37].score)
        XCTAssertEqual(75026, a[37].count)
        XCTAssertEqual(16556, a[37].percentage)
        XCTAssertEqual(44064, a[37].topPercentage)

        XCTAssertEqual(78, a[38].score)
        XCTAssertEqual(21023, a[38].count)
        XCTAssertEqual(4639, a[38].percentage)
        XCTAssertEqual(48703, a[38].topPercentage)

        XCTAssertEqual(76, a[39].score)
        XCTAssertEqual(91656, a[39].count)
        XCTAssertEqual(20226, a[39].percentage)
        XCTAssertEqual(68929, a[39].topPercentage)

        XCTAssertEqual(74, a[40].score)
        XCTAssertEqual(139320, a[40].count)
        XCTAssertEqual(30744, a[40].percentage)
        XCTAssertEqual(99674, a[40].topPercentage)


        XCTAssertEqual(72, a[41].score)
        XCTAssertEqual(136448, a[41].count)
        XCTAssertEqual(30110, a[41].percentage)
        XCTAssertEqual(129784, a[41].topPercentage)

        XCTAssertEqual(70, a[42].score)
        XCTAssertEqual(62072, a[42].count)
        XCTAssertEqual(13697, a[42].percentage)
        XCTAssertEqual(143482, a[42].topPercentage)

        XCTAssertEqual(68, a[43].score)
        XCTAssertEqual(179568, a[43].count)
        XCTAssertEqual(39626, a[43].percentage)
        XCTAssertEqual(183108, a[43].topPercentage)

        XCTAssertEqual(66, a[44].score)
        XCTAssertEqual(220963, a[44].count)
        XCTAssertEqual(48761, a[44].percentage)
        XCTAssertEqual(231869, a[44].topPercentage)

        XCTAssertEqual(64, a[45].score)
        XCTAssertEqual(283013, a[45].count)
        XCTAssertEqual(62454, a[45].percentage)
        XCTAssertEqual(294323, a[45].topPercentage)

        XCTAssertEqual(62, a[46].score)
        XCTAssertEqual(208578, a[46].count)
        XCTAssertEqual(46028, a[46].percentage)
        XCTAssertEqual(340351, a[46].topPercentage)

        XCTAssertEqual(60, a[47].score)
        XCTAssertEqual(479418, a[47].count)
        XCTAssertEqual(105795, a[47].percentage)
        XCTAssertEqual(446147, a[47].topPercentage)

        XCTAssertEqual(58, a[48].score)
        XCTAssertEqual(400014, a[48].count)
        XCTAssertEqual(88273, a[48].percentage)
        XCTAssertEqual(534421, a[48].topPercentage)

        XCTAssertEqual(56, a[49].score)
        XCTAssertEqual(215580, a[49].count)
        XCTAssertEqual(47573, a[49].percentage)
        XCTAssertEqual(581994, a[49].topPercentage)

        XCTAssertEqual(54, a[50].score)
        XCTAssertEqual(358897, a[50].count)
        XCTAssertEqual(79199, a[50].percentage)
        XCTAssertEqual(661194, a[50].topPercentage)


        XCTAssertEqual(52, a[51].score)
        XCTAssertEqual(548142, a[51].count)
        XCTAssertEqual(120961, a[51].percentage)
        XCTAssertEqual(782155, a[51].topPercentage)

        XCTAssertEqual(50, a[52].score)
        XCTAssertEqual(228297, a[52].count)
        XCTAssertEqual(50379, a[52].percentage)
        XCTAssertEqual(832535, a[52].topPercentage)

        XCTAssertEqual(48, a[53].score)
        XCTAssertEqual(377741, a[53].count)
        XCTAssertEqual(83358, a[53].percentage)
        XCTAssertEqual(915893, a[53].topPercentage)

        XCTAssertEqual(46, a[54].score)
        XCTAssertEqual(381133, a[54].count)
        XCTAssertEqual(84106, a[54].percentage)
        XCTAssertEqual(1000000, a[54].topPercentage)

        /*
         176,28,6,6
         172,141,31,37
         170,27,5,43
         168,2,0,43
         160,1,0,43
         156,1,0,44
         152,27,5,50
         148,12,2,52
         144,43,9,62
         140,22,4,67
         
         138,42,9,76
         136,1109,244,321
         132,221,48,369
         130,226,49,419
         128,577,127,547
         126,170,37,584
         124,534,117,702
         122,966,213,915
         120,3070,677,1593
         118,381,84,1677
         
         116,1707,376,2053
         114,1923,424,2478
         112,3649,805,3283
         110,1032,227,3511
         108,3896,859,4370
         106,3364,742,5113
         104,1631,359,5473
         100,881,194,5667
         98,1072,236,5904
         96,4000,882,6786
         
         94,829,182,6969
         92,3840,847,7817
         90,6639,1465,9282
         88,36689,8096,17378
         86,1800,397,17775
         84,16833,3714,21490
         82,27267,6017,27507
         80,75026,16556,44064
         78,21023,4639,48703
         76,91656,20226,68929
         
         74,139320,30744,99674
         72,136448,30110,129784
         70,62072,13697,143482
         68,179568,39626,183108
         66,220963,48761,231869
         64,283013,62454,294323
         62,208578,46028,340351
         60,479418,105795,446147
         58,400014,88273,534421
         56,215580,47573,581994
         
         54,358897,79199,661194
         52,548142,120961,782155
         50,228297,50379,832535
         48,377741,83358,915893
         46,381133,84106,1000000
         */
    }
    
    let widthMax = 17
    let heightMax = 12
    let scoreMin = 0
    var words:[String] = []
    var reversedWords:[String] = []
    var lengths: [Int] = []
    override func setUpWithError() throws {
        words = WordData.words_8612()
        lengths = WordCalculator.lengths(words: words)
    }
}
