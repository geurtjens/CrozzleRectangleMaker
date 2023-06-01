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
        let shapes = QueueListCalculator.get_2_word_shapes(
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
        let shapes = QueueListCalculator.get_2_word_shapes(
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
        let shapes = QueueListCalculator.get_2_word_shapes(
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
        
        let shapes = await QueueListCalculator.get_4_word_shapes(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let a = StatisticsCalculator.Execute(shapes: shapes)
        XCTAssertEqual(52, a.count)
        
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
        XCTAssertEqual(1, a[0].count)
        XCTAssertEqual(0, a[0].percentage)
        XCTAssertEqual(0, a[0].topPercentage)


        XCTAssertEqual(160, a[1].score)
        XCTAssertEqual(1, a[1].count)
        XCTAssertEqual(0, a[1].percentage)
        XCTAssertEqual(0, a[1].topPercentage)

        XCTAssertEqual(156, a[2].score)
        XCTAssertEqual(1, a[2].count)
        XCTAssertEqual(0, a[2].percentage)
        XCTAssertEqual(0, a[2].topPercentage)

        XCTAssertEqual(152, a[3].score)
        XCTAssertEqual(27, a[3].count)
        XCTAssertEqual(5, a[3].percentage)
        XCTAssertEqual(6, a[3].topPercentage)

        XCTAssertEqual(148, a[4].score)
        XCTAssertEqual(12, a[4].count)
        XCTAssertEqual(2, a[4].percentage)
        XCTAssertEqual(9, a[4].topPercentage)

        XCTAssertEqual(144, a[5].score)
        XCTAssertEqual(44, a[5].count)
        XCTAssertEqual(9, a[5].percentage)
        XCTAssertEqual(18, a[5].topPercentage)

        XCTAssertEqual(140, a[6].score)
        XCTAssertEqual(28, a[6].count)
        XCTAssertEqual(6, a[6].percentage)
        XCTAssertEqual(25, a[6].topPercentage)

        XCTAssertEqual(138, a[7].score)
        XCTAssertEqual(42, a[7].count)
        XCTAssertEqual(9, a[7].percentage)
        XCTAssertEqual(34, a[7].topPercentage)

        XCTAssertEqual(136, a[8].score)
        XCTAssertEqual(457, a[8].count)
        XCTAssertEqual(100, a[8].percentage)
        XCTAssertEqual(135, a[8].topPercentage)

        XCTAssertEqual(132, a[9].score)
        XCTAssertEqual(221, a[9].count)
        XCTAssertEqual(48, a[9].percentage)
        XCTAssertEqual(184, a[9].topPercentage)

        XCTAssertEqual(130, a[10].score)
        XCTAssertEqual(226, a[10].count)
        XCTAssertEqual(49, a[10].percentage)
        XCTAssertEqual(233, a[10].topPercentage)


        XCTAssertEqual(128, a[11].score)
        XCTAssertEqual(1041, a[11].count)
        XCTAssertEqual(229, a[11].percentage)
        XCTAssertEqual(463, a[11].topPercentage)

        XCTAssertEqual(126, a[12].score)
        XCTAssertEqual(170, a[12].count)
        XCTAssertEqual(37, a[12].percentage)
        XCTAssertEqual(501, a[12].topPercentage)

        XCTAssertEqual(124, a[13].score)
        XCTAssertEqual(731, a[13].count)
        XCTAssertEqual(161, a[13].percentage)
        XCTAssertEqual(662, a[13].topPercentage)

        XCTAssertEqual(122, a[14].score)
        XCTAssertEqual(1204, a[14].count)
        XCTAssertEqual(265, a[14].percentage)
        XCTAssertEqual(928, a[14].topPercentage)

        XCTAssertEqual(120, a[15].score)
        XCTAssertEqual(1948, a[15].count)
        XCTAssertEqual(429, a[15].percentage)
        XCTAssertEqual(1358, a[15].topPercentage)

        XCTAssertEqual(118, a[16].score)
        XCTAssertEqual(381, a[16].count)
        XCTAssertEqual(84, a[16].percentage)
        XCTAssertEqual(1442, a[16].topPercentage)

        XCTAssertEqual(116, a[17].score)
        XCTAssertEqual(2387, a[17].count)
        XCTAssertEqual(526, a[17].percentage)
        XCTAssertEqual(1968, a[17].topPercentage)

        XCTAssertEqual(114, a[18].score)
        XCTAssertEqual(2956, a[18].count)
        XCTAssertEqual(652, a[18].percentage)
        XCTAssertEqual(2621, a[18].topPercentage)

        XCTAssertEqual(112, a[19].score)
        XCTAssertEqual(848, a[19].count)
        XCTAssertEqual(187, a[19].percentage)
        XCTAssertEqual(2808, a[19].topPercentage)

        XCTAssertEqual(110, a[20].score)
        XCTAssertEqual(1647, a[20].count)
        XCTAssertEqual(363, a[20].percentage)
        XCTAssertEqual(3171, a[20].topPercentage)


        XCTAssertEqual(108, a[21].score)
        XCTAssertEqual(940, a[21].count)
        XCTAssertEqual(207, a[21].percentage)
        XCTAssertEqual(3379, a[21].topPercentage)

        XCTAssertEqual(106, a[22].score)
        XCTAssertEqual(247, a[22].count)
        XCTAssertEqual(54, a[22].percentage)
        XCTAssertEqual(3433, a[22].topPercentage)

        XCTAssertEqual(104, a[23].score)
        XCTAssertEqual(1622, a[23].count)
        XCTAssertEqual(357, a[23].percentage)
        XCTAssertEqual(3791, a[23].topPercentage)

        XCTAssertEqual(100, a[24].score)
        XCTAssertEqual(881, a[24].count)
        XCTAssertEqual(194, a[24].percentage)
        XCTAssertEqual(3986, a[24].topPercentage)

        XCTAssertEqual(98, a[25].score)
        XCTAssertEqual(1072, a[25].count)
        XCTAssertEqual(236, a[25].percentage)
        XCTAssertEqual(4222, a[25].topPercentage)

        XCTAssertEqual(96, a[26].score)
        XCTAssertEqual(5331, a[26].count)
        XCTAssertEqual(1176, a[26].percentage)
        XCTAssertEqual(5399, a[26].topPercentage)

        XCTAssertEqual(94, a[27].score)
        XCTAssertEqual(829, a[27].count)
        XCTAssertEqual(182, a[27].percentage)
        XCTAssertEqual(5581, a[27].topPercentage)

        XCTAssertEqual(92, a[28].score)
        XCTAssertEqual(5005, a[28].count)
        XCTAssertEqual(1104, a[28].percentage)
        XCTAssertEqual(6686, a[28].topPercentage)

        XCTAssertEqual(90, a[29].score)
        XCTAssertEqual(7913, a[29].count)
        XCTAssertEqual(1746, a[29].percentage)
        XCTAssertEqual(8432, a[29].topPercentage)

        XCTAssertEqual(88, a[30].score)
        XCTAssertEqual(17714, a[30].count)
        XCTAssertEqual(3909, a[30].percentage)
        XCTAssertEqual(12341, a[30].topPercentage)


        XCTAssertEqual(86, a[31].score)
        XCTAssertEqual(1800, a[31].count)
        XCTAssertEqual(397, a[31].percentage)
        XCTAssertEqual(12738, a[31].topPercentage)

        XCTAssertEqual(84, a[32].score)
        XCTAssertEqual(18611, a[32].count)
        XCTAssertEqual(4106, a[32].percentage)
        XCTAssertEqual(16845, a[32].topPercentage)

        XCTAssertEqual(82, a[33].score)
        XCTAssertEqual(30551, a[33].count)
        XCTAssertEqual(6741, a[33].percentage)
        XCTAssertEqual(23587, a[33].topPercentage)

        XCTAssertEqual(80, a[34].score)
        XCTAssertEqual(52131, a[34].count)
        XCTAssertEqual(11504, a[34].percentage)
        XCTAssertEqual(35091, a[34].topPercentage)

        XCTAssertEqual(78, a[35].score)
        XCTAssertEqual(23598, a[35].count)
        XCTAssertEqual(5207, a[35].percentage)
        XCTAssertEqual(40299, a[35].topPercentage)

        XCTAssertEqual(76, a[36].score)
        XCTAssertEqual(71595, a[36].count)
        XCTAssertEqual(15799, a[36].percentage)
        XCTAssertEqual(56098, a[36].topPercentage)

        XCTAssertEqual(74, a[37].score)
        XCTAssertEqual(104627, a[37].count)
        XCTAssertEqual(23088, a[37].percentage)
        XCTAssertEqual(79187, a[37].topPercentage)

        XCTAssertEqual(72, a[38].score)
        XCTAssertEqual(132741, a[38].count)
        XCTAssertEqual(29292, a[38].percentage)
        XCTAssertEqual(108479, a[38].topPercentage)

        XCTAssertEqual(70, a[39].score)
        XCTAssertEqual(62072, a[39].count)
        XCTAssertEqual(13697, a[39].percentage)
        XCTAssertEqual(122177, a[39].topPercentage)

        XCTAssertEqual(68, a[40].score)
        XCTAssertEqual(251403, a[40].count)
        XCTAssertEqual(55478, a[40].percentage)
        XCTAssertEqual(177656, a[40].topPercentage)


        XCTAssertEqual(66, a[41].score)
        XCTAssertEqual(345223, a[41].count)
        XCTAssertEqual(76182, a[41].percentage)
        XCTAssertEqual(253838, a[41].topPercentage)

        XCTAssertEqual(64, a[42].score)
        XCTAssertEqual(177555, a[42].count)
        XCTAssertEqual(39182, a[42].percentage)
        XCTAssertEqual(293020, a[42].topPercentage)

        XCTAssertEqual(62, a[43].score)
        XCTAssertEqual(308705, a[43].count)
        XCTAssertEqual(68123, a[43].percentage)
        XCTAssertEqual(361144, a[43].topPercentage)

        XCTAssertEqual(60, a[44].score)
        XCTAssertEqual(460810, a[44].count)
        XCTAssertEqual(101689, a[44].percentage)
        XCTAssertEqual(462833, a[44].topPercentage)

        XCTAssertEqual(58, a[45].score)
        XCTAssertEqual(354542, a[45].count)
        XCTAssertEqual(78238, a[45].percentage)
        XCTAssertEqual(541072, a[45].topPercentage)

        XCTAssertEqual(56, a[46].score)
        XCTAssertEqual(191542, a[46].count)
        XCTAssertEqual(42268, a[46].percentage)
        XCTAssertEqual(583340, a[46].topPercentage)

        XCTAssertEqual(54, a[47].score)
        XCTAssertEqual(570956, a[47].count)
        XCTAssertEqual(125995, a[47].percentage)
        XCTAssertEqual(709336, a[47].topPercentage)

        XCTAssertEqual(52, a[48].score)
        XCTAssertEqual(526951, a[48].count)
        XCTAssertEqual(116285, a[48].percentage)
        XCTAssertEqual(825622, a[48].topPercentage)

        XCTAssertEqual(50, a[49].score)
        XCTAssertEqual(201870, a[49].count)
        XCTAssertEqual(44547, a[49].percentage)
        XCTAssertEqual(870169, a[49].topPercentage)

        XCTAssertEqual(48, a[50].score)
        XCTAssertEqual(371099, a[50].count)
        XCTAssertEqual(81892, a[50].percentage)
        XCTAssertEqual(952062, a[50].topPercentage)


        XCTAssertEqual(46, a[51].score)
        XCTAssertEqual(217232, a[51].count)
        XCTAssertEqual(47937, a[51].percentage)
        XCTAssertEqual(1000000, a[51].topPercentage)

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
    
    
    /// standard values for all tests
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
