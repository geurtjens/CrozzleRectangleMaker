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
            scoreMin: 104,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let a = StatisticsCalculator.Execute(shapes: shapes)
        XCTAssertEqual(24, a.count)
        
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
        XCTAssertEqual(57, a[0].percentage)
        XCTAssertEqual(57, a[0].topPercentage)


        XCTAssertEqual(160, a[1].score)
        XCTAssertEqual(1, a[1].count)
        XCTAssertEqual(57, a[1].percentage)
        XCTAssertEqual(114, a[1].topPercentage)

        XCTAssertEqual(156, a[2].score)
        XCTAssertEqual(1, a[2].count)
        XCTAssertEqual(57, a[2].percentage)
        XCTAssertEqual(171, a[2].topPercentage)

        XCTAssertEqual(152, a[3].score)
        XCTAssertEqual(27, a[3].count)
        XCTAssertEqual(1547, a[3].percentage)
        XCTAssertEqual(1719, a[3].topPercentage)

        XCTAssertEqual(148, a[4].score)
        XCTAssertEqual(12, a[4].count)
        XCTAssertEqual(687, a[4].percentage)
        XCTAssertEqual(2406, a[4].topPercentage)

        XCTAssertEqual(144, a[5].score)
        XCTAssertEqual(44, a[5].count)
        XCTAssertEqual(2521, a[5].percentage)
        XCTAssertEqual(4928, a[5].topPercentage)

        XCTAssertEqual(140, a[6].score)
        XCTAssertEqual(34, a[6].count)
        XCTAssertEqual(1948, a[6].percentage)
        XCTAssertEqual(6876, a[6].topPercentage)

        XCTAssertEqual(138, a[7].score)
        XCTAssertEqual(42, a[7].count)
        XCTAssertEqual(2406, a[7].percentage)
        XCTAssertEqual(9283, a[7].topPercentage)

        XCTAssertEqual(136, a[8].score)
        XCTAssertEqual(528, a[8].count)
        XCTAssertEqual(30256, a[8].percentage)
        XCTAssertEqual(39539, a[8].topPercentage)

        XCTAssertEqual(132, a[9].score)
        XCTAssertEqual(221, a[9].count)
        XCTAssertEqual(12664, a[9].percentage)
        XCTAssertEqual(52203, a[9].topPercentage)

        XCTAssertEqual(130, a[10].score)
        XCTAssertEqual(224, a[10].count)
        XCTAssertEqual(12835, a[10].percentage)
        XCTAssertEqual(65039, a[10].topPercentage)


        XCTAssertEqual(128, a[11].score)
        XCTAssertEqual(1017, a[11].count)
        XCTAssertEqual(58277, a[11].percentage)
        XCTAssertEqual(123316, a[11].topPercentage)

        XCTAssertEqual(126, a[12].score)
        XCTAssertEqual(170, a[12].count)
        XCTAssertEqual(9741, a[12].percentage)
        XCTAssertEqual(133058, a[12].topPercentage)

        XCTAssertEqual(124, a[13].score)
        XCTAssertEqual(770, a[13].count)
        XCTAssertEqual(44123, a[13].percentage)
        XCTAssertEqual(177181, a[13].topPercentage)

        XCTAssertEqual(122, a[14].score)
        XCTAssertEqual(1253, a[14].count)
        XCTAssertEqual(71801, a[14].percentage)
        XCTAssertEqual(248982, a[14].topPercentage)

        XCTAssertEqual(120, a[15].score)
        XCTAssertEqual(1947, a[15].count)
        XCTAssertEqual(111569, a[15].percentage)
        XCTAssertEqual(360552, a[15].topPercentage)

        XCTAssertEqual(118, a[16].score)
        XCTAssertEqual(383, a[16].count)
        XCTAssertEqual(21947, a[16].percentage)
        XCTAssertEqual(382499, a[16].topPercentage)

        XCTAssertEqual(116, a[17].score)
        XCTAssertEqual(2385, a[17].count)
        XCTAssertEqual(136668, a[17].percentage)
        XCTAssertEqual(519167, a[17].topPercentage)

        XCTAssertEqual(114, a[18].score)
        XCTAssertEqual(2951, a[18].count)
        XCTAssertEqual(169102, a[18].percentage)
        XCTAssertEqual(688270, a[18].topPercentage)

        XCTAssertEqual(112, a[19].score)
        XCTAssertEqual(889, a[19].count)
        XCTAssertEqual(50942, a[19].percentage)
        XCTAssertEqual(739212, a[19].topPercentage)

        XCTAssertEqual(110, a[20].score)
        XCTAssertEqual(1691, a[20].count)
        XCTAssertEqual(96899, a[20].percentage)
        XCTAssertEqual(836112, a[20].topPercentage)


        XCTAssertEqual(108, a[21].score)
        XCTAssertEqual(938, a[21].count)
        XCTAssertEqual(53750, a[21].percentage)
        XCTAssertEqual(889863, a[21].topPercentage)

        XCTAssertEqual(106, a[22].score)
        XCTAssertEqual(244, a[22].count)
        XCTAssertEqual(13982, a[22].percentage)
        XCTAssertEqual(903845, a[22].topPercentage)

        XCTAssertEqual(104, a[23].score)
        XCTAssertEqual(1678, a[23].count)
        XCTAssertEqual(96154, a[23].percentage)
        XCTAssertEqual(1000000, a[23].topPercentage)

        /*
         176,1,57,57
         160,1,57,114
         156,1,57,171
         152,27,1547,1719
         148,12,687,2406
         144,44,2521,4928
         140,34,1948,6876
         138,42,2406,9283
         136,528,30256,39539
         132,221,12664,52203
         130,224,12835,65039
         128,1017,58277,123316
         126,170,9741,133058
         124,770,44123,177181
         122,1253,71801,248982
         120,1947,111569,360552
         118,383,21947,382499
         116,2385,136668,519167
         114,2951,169102,688270
         112,889,50942,739212
         110,1691,96899,836112
         108,938,53750,889863
         106,244,13982,903845
         104,1678,96154,1000000
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
