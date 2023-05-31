import XCTest
@testable import CrozzleRectangleMaker

final class RectangleCalculator8612Tests: XCTestCase {
    
    func test_D3x3() throws {
        
        let result = RectangleCalculator.Square(
            interlockWidth: 2,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(174_370, result.count)
        
        print("D3x3 = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_D3x4() {
        
        let result = RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(201_499, result.count);
        print("D3x4 = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_D3x5() {
        
        let result = RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(112_679, result.count)
        print("D3x5 = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_D3x6() {
        
        let result = RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(57_695, result.count);
        print("D3x6 = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_D4x4() throws {
        
        let result = RectangleCalculator.Square(
            interlockWidth: 3,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(60_620, result.count)
        print("D4x4 = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_D4x5() {
        
        let result = RectangleCalculator.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(67_109, result.count)
        print("D4x5 = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_D4x6() {
        
        let result = RectangleCalculator.Rectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(33_802, result.count)
        print("D4x6 = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_D5x5() throws {
        
        let result = RectangleCalculator.Square(
            interlockWidth: 4,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(18_587, result.count)
        print("D5x5 = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_D5x6() {
        
        let result = RectangleCalculator.Rectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(19_577, result.count);
        print("D5x6 = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_D6x6() throws {
        
        let result = RectangleCalculator.Square(
            interlockWidth: 5,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(4_809, result.count)
        print("D6x6 = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O3x3_BottomRight() throws {
        
        let result = RectangleCalculator.BottomRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(160_216, result.count)
        print("O3x3_BottomRight = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O3x3_TopLeft() throws {
        
        let result = RectangleCalculator.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(153_820, result.count)
        print("O3x3_TopLeft = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O3x3_TopRight() throws {
        
        let result = RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(248_083, result.count)
        print("D3x3_TopRight = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O3x4_BottomLeft() throws {
        
        let result = RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)

        XCTAssertEqual(186_873, result.count)
        print("D3x4_BottomLeft = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O3x4_BottomRight() throws {
        
        let result = RectangleCalculator.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(206_706, result.count)
        print("D3x4_BottomRight = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O3x4_TopLeft() throws {
        
        let result = RectangleCalculator.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(220_148, result.count)
        print("D3x4_TopLeft = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O3x4_TopRight() throws {
        
        let result = RectangleCalculator.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(203_487, result.count)
        print("D3x4_TopRight = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O3x5_BottomLeft() throws {
        
        let result = RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)

        XCTAssertEqual(129_100, result.count)
        print("D3x5_BottomLeft = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O3x5_BottomRight() throws {
        
        let result = RectangleCalculator.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)

        XCTAssertEqual(166_525, result.count)
        print("D3x5_BottomRight = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O3x5_TopLeft() throws {
        
        let result = RectangleCalculator.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(163_938, result.count)
        print("D3x5_TopLeft = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O3x5_TopRight() throws {
        
        let result = RectangleCalculator.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)

        XCTAssertEqual(140_044, result.count)
        print("D3x5_TopRight = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O3x6_BottomLeft() throws {
        
        let result = RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)

        XCTAssertEqual(69_550, result.count)
        print("D3x6_BottomLeft = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O3x6_BottomRight() throws {
        
        let result = RectangleCalculator.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(80_656, result.count)
        print("D3x6_BottomRight = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O3x6_TopLeft() throws {
        
        let result = RectangleCalculator.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(92_581, result.count)
        print("D3x6_TopLeft = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O3x6_TopRight() throws {
        
        let result = RectangleCalculator.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(86_795, result.count)
        print("D3x6_TopRight = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O4x4_BottomRight() throws {
        
        let result = RectangleCalculator.BottomRightSquare(
            interlockWidth: 3,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(67_844, result.count)
        print("D4x4_BottomRight = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O4x4_TopLeft() throws {
        
        let result = RectangleCalculator.TopLeftSquare(
            interlockWidth: 3,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(74_551, result.count)
        print("D4x4_TopLeft = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O4x4_TopRight() throws {
        
        let result = RectangleCalculator.TopRightSquare(
            interlockWidth: 3,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(151_171, result.count)
        print("D4x4_TopRight = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O4x5_BottomLeft() throws {
        
        let result = RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)

        XCTAssertEqual(109_009, result.count)
        print("D4x4_BottomLeft = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O4x5_BottomRight() throws {
        
        let result = RectangleCalculator.BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)

        XCTAssertEqual(109_533, result.count)
        print("D4x5_BottomRight = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O4x5_TopLeft() throws {
        
        let result = RectangleCalculator.TopLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)

        XCTAssertEqual(115_656, result.count)
        print("D4x5_TopLeft = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O4x5_TopRight() throws {
        
        let result = RectangleCalculator.TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)

        XCTAssertEqual(109_064, result.count)
        print("D4x5_TopRight = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O4x6_BottomLeft() throws {
        
        let result = RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)

        XCTAssertEqual(64_028, result.count)
        print("D4x6_BottomLeft = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O4x6_BottomRight() throws {
        
        let result = RectangleCalculator.BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(56_689, result.count)
        print("D4x6_BottomRight = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O4x6_TopLeft() throws {
        
        let result = RectangleCalculator.TopLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(70_538, result.count)
        print("D4x6_TopLeft = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O4x6_TopRight() throws {
        
        let result = RectangleCalculator.TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(68_952, result.count)
        print("D4x6_TopRight = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O5x5_BottomRight() throws {
        
        let result = RectangleCalculator.BottomRightSquare(
            interlockWidth: 4,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(42_044, result.count)
        print("D5x5_BottomRight = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O5x5_TopLeft() throws {
        
        let result = RectangleCalculator.TopLeftSquare(
            interlockWidth: 4,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(41_235, result.count)
        print("D5x5_TopLeft = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O5x5_TopRight() throws {
        
        let result = RectangleCalculator.TopRightSquare(
            interlockWidth: 4,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(75_525, result.count)
        print("D5x5_TopRight = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O5x6_BottomLeft() throws {
        
        let result = RectangleCalculator.BottomLeftRectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)

        XCTAssertEqual(43_818, result.count)
        print("D5x6_BottomLeft = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O5x6_BottomRight() throws {
        
        let result = RectangleCalculator.BottomRightRectangle(
            interlockWidth: 4, interlockHeight: 5,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(43_089, result.count)
        print("D5x6_BottomRight = \(result.count)")
        print(result[0].ToText(words:words))
        
    }
    
    
    func test_O5x6_TopLeft() throws {
        
        let result = RectangleCalculator.TopLeftRectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(49_644, result.count)
        print("D5x6_TopLeft = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O5x6_TopRight() throws {
        
        let result = RectangleCalculator.TopRightRectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(49_940, result.count)
        print("D5x6_TopRight = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O6x6_BottomRight() throws {
        
        let result = RectangleCalculator.BottomRightSquare(
            interlockWidth: 5,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(11_878, result.count)
        print("D6x6_BottomRight = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O6x6_TopLeft() throws {
        
        let result = RectangleCalculator.TopLeftSquare(
            interlockWidth: 5,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(14_963, result.count)
        print("D6x6_TopLeft = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    
    func test_O6x6_TopRight() throws {
        
        let result = RectangleCalculator.TopRightSquare(
            interlockWidth: 5,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        XCTAssertEqual(28_586, result.count)
        print("D6x6_TopRight = \(result.count)")
        print(result[0].ToText(words:words))
    }
    
    /// standard values for all tests
    let wordsMax = 0
    let widthMax = 17
    let heightMax = 12
    let scoreMin = 0
    var words:[String] = []
    var lengths: [Int] = []
    override func setUpWithError() throws {
        words = WordData.words_8612()
        lengths = WordCalculator.lengths(words: words)
    }
}
