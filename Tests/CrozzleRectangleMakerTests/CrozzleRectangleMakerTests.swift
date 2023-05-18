import XCTest
@testable import CrozzleRectangleMaker

final class RectangleCalculator8612Tests: XCTestCase {
    
    let widthMax = 15
    let heightMax = 10
    let scoreMin = 0
    
    
//    func test_Execute() throws {
//        
//        let _ = RectangleCalculator.Execute(
//            words: words,
//            widthMax: widthMax,
//            heightMax: heightMax,
//            scoreMin: scoreMin)
//    }
    
    
    func test_D3x3() throws {
        
        let result = RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(174_370, result.count)
    }
    
    func test_D3x4() {
        
        let result = RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(201499, result.count);
    }
    
    func test_D3x5() {
        
        let result = RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(112_679, result.count)
    }
    
    func test_D3x6() {
        
        let result = RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(57_695, result.count);
    }
    
    func test_D4x4() throws {
        
        let result = RectangleCalculator.Square(
            interlockWidth: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(60_620, result.count)
    }
    
    func test_D4x5() {
        
        let result = RectangleCalculator.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(67_109, result.count)
    }
    
    func test_D4x6() {
        
        let result = RectangleCalculator.Rectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(33_802, result.count)
    }
    
    
    func test_D5x5() throws {
        
        let result = RectangleCalculator.Square(
            interlockWidth: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(18_587, result.count)
    }
    
    func test_D5x6() {
        
        let d5x6 = RectangleCalculator.Rectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(19_577, d5x6.count);

    }
    
    func test_D6x6() throws {
        
        let d6x6 = RectangleCalculator.Square(
            interlockWidth: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(4_809, d6x6.count)
    }
    
    
    func test_O3x3_BottomRight() throws {
        
        let result = RectangleCalculator.BottomRightSquare(
            interlockWidth: 2,
            interlockHeight: 2,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(160_216, result.count)
    }
    
    func test_O3x3_TopLeft() throws {
        
        let result = RectangleCalculator.TopLeftSquare(
            interlockWidth: 2,
            interlockHeight: 2,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(153_820, result.count)
    }
    
    func test_O3x3_TopRight() throws {
        
        let result = RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(247_614, result.count)
    }
    
    func test_O3x4_BottomLeft() throws {
        
        let result = RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        XCTAssertEqual(186873, result.count)
    }
    func test_O3x4_BottomRight() throws {
        
        let result = RectangleCalculator.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(206_706, result.count)
    }
    
    func test_O3x4_TopLeft() throws {
        
        let result = RectangleCalculator.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(220_148, result.count)
    }
    
    func test_O3x4_TopRight() throws {
        
        let result = RectangleCalculator.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(203_487, result.count)
    }
    
    
    func test_O3x5_BottomLeft() throws {

        
        //let words = ["HYMN","HOLIDAY","HAZELNUT","ZION"]
       // let lengths = RectangleCalculator.WordListToLengths(words: words)
/*
        H
        O
    HAZELNUT
      I I
      O D
      N A
      .HYMN
*/
        
        let result = RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        XCTAssertEqual(129_100, result.count)
    }
    
    func test_O3x5_BottomRight() throws {
        
        let result = RectangleCalculator.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        XCTAssertEqual(166_525, result.count)
    }
    
    func test_O3x5_TopLeft() throws {
        
        let result = RectangleCalculator.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(163_938, result.count)
    }
    
    
    func test_O3x5_TopRight() throws {
        
        let result = RectangleCalculator.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        XCTAssertEqual(140_044, result.count)
    }
    
    func test_O3x6_BottomLeft() throws {
        
        let result = RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        XCTAssertEqual(69_550, result.count)
    }
    func test_O3x6_BottomRight() throws {
        
        let result = RectangleCalculator.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(80_656, result.count)
    }
    
    func test_O3x6_TopLeft() throws {
        
        let result = RectangleCalculator.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(92_581, result.count)
    }
    
    func test_O3x6_TopRight() throws {
        
        let result = RectangleCalculator.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(86_795, result.count)
    }
    
    func test_O4x4_BottomRight() throws {
        
        let result = RectangleCalculator.BottomRightSquare(
            interlockWidth: 3,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(67_844, result.count)
    }
    func test_O4x4_TopLeft() throws {
        
        let result = RectangleCalculator.TopLeftSquare(
            interlockWidth: 3,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(74_551, result.count)
    }
    
    func test_O4x4_TopRight() throws {
        
        let result = RectangleCalculator.TopRightSquare(
            interlockWidth: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(150_985, result.count)
    }
    
    func test_O4x5_BottomLeft() throws {
        
        let result = RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        XCTAssertEqual(109_009, result.count)
    }
    
    func test_O4x5_BottomRight() throws {
        
        let O4x5 = RectangleCalculator.BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        XCTAssertEqual(109_533, O4x5.count)
    }
    
    func test_O4x5_TopLeft() throws {
        
        let O4x5 = RectangleCalculator.TopLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        XCTAssertEqual(115_656, O4x5.count)
    }
    
    func test_O4x5_TopRight() throws {
        
        let O4x5 = RectangleCalculator.TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        XCTAssertEqual(109_064, O4x5.count)
    }
    
    func test_O4x6_BottomLeft() throws {
        
        let result = RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        XCTAssertEqual(64_028, result.count)
    }
    
    func test_O4x6_BottomRight() throws {
        
        let O4x6 = RectangleCalculator.BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(56_689, O4x6.count)
    }
    func test_O4x6_TopLeft() throws {
        
        let O4x6 = RectangleCalculator.TopLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(70_538, O4x6.count)
    }
    
    func test_O4x6_TopRight() throws {
        
        let O4x6 = RectangleCalculator.TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(68_952, O4x6.count)
    }
    
    func test_O5x5_BottomRight() throws {
        
        let result = RectangleCalculator.BottomRightSquare(
            interlockWidth: 4,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(42_044, result.count)
    }
    
    func test_O5x5_TopLeft() throws {
        
        let result = RectangleCalculator.TopLeftSquare(
            interlockWidth: 4,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(41_235, result.count)
    }
    
    func test_O5x5_TopRight() throws {
        
        let result = RectangleCalculator.TopRightSquare(
            interlockWidth: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(75_472, result.count)
    }
    
    func test_O5x6_BottomLeft() throws {
        
        let result = RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        XCTAssertEqual(43_818, result.count)
    }
    
    func test_O5x6_BottomRight() throws {
        
        let O4x6 = RectangleCalculator.BottomRightRectangle(
            interlockWidth: 4, interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(43_089, O4x6.count)
    }
    
    func test_O5x6_TopLeft() throws {
        
        let result = RectangleCalculator.TopLeftRectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(49_644, result.count)
    }
    
    func test_O5x6_TopRight() throws {
        
        let O4x6 = RectangleCalculator.TopRightRectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(49_940, O4x6.count)
    }
    
    func test_O6x6_BottomRight() throws {
        
        let result = RectangleCalculator.BottomRightSquare(
            interlockWidth: 5,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(11_878, result.count)
    }
    
    func test_O6x6_TopLeft() throws {
        
        let result = RectangleCalculator.TopLeftSquare(
            interlockWidth: 5,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        XCTAssertEqual(14_963, result.count)
    }
    
    func test_O6x6_TopRight() throws {
        
        let result = RectangleCalculator.TopRightSquare(
            interlockWidth: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        //print(result[3000])
        
        XCTAssertEqual(28581, result.count)
    }
    
    
    
    func getWords_8612() -> [String] {
        let wordList = [
            "ZION", "AZURE", "TOYS", "JOY", "HAZELNUT", "NUTS", "NAZARETH", "HYMN", "TURKEY", "SNOW", "MERRY", "TOAST", "STAR", "HOLLY", "JELLY", "FAMILY", "WHITE", "SING", "SAUCE", "PORK", "TREE", "EVE", "INN", "BELLS", "CAKE",
            
            "GLAZE", "PARTYHATS", "TWENTYFIFTH", "WALNUT", "PEANUTS", "PRESENTS", "FRUIT", "NUTMEG", "CUSTARD", "CHRISTMAS", "MISTLETOE", "GIFTS", "SANTACLAUS", "FESTIVE", "RAISINS", "LIGHTS", "WREATH", "HOLIDAY", "WISEMEN", "CRANBERRY", "OPENHOUSE", "SILENTNIGHT", "STOCKING", "PUNCH", "WINE", "SHOPPING", "PLUMPUDDING", "WRAPPING", "NEIGHBOURS", "GREETINGS", "DECORATIONS", "ALMONDS", "LANTERN", "KRISSKRINGLE", "SPICE", "GOODWILL", "BONBON", "CHURCH", "FRIENDS", "PARCELS", "CINNAMON", "NICHOLAS", "MINCEPIES", "CHERRIES", "SLEIGH", "ALMOND", "MANGER", "RIBBON", "CHOCOLATE", "MIXEDPEEL", "DRINK", "CANDLES", "FOOD", "GINGER", "BETHLEHEM", "CAROL", "REINDEER", "GOODCHEER", "CREAM", "CORDIAL", "CHILDREN", "ICECREAM", "CHICKEN", "CARD", "DECEMBER", "PEACE"]
        return wordList
    }
    
    func getLengths() -> [Int] {
        let words = getWords_8612()
        let lengths = RectangleCalculator.WordListToLengths(words: words)
        return lengths
    }
    
    var words:[String] = []
    var lengths: [Int] = []
    override func setUpWithError() throws {
        words = getWords_8612()
        lengths = RectangleCalculator.WordListToLengths(words: words)
    }
}
