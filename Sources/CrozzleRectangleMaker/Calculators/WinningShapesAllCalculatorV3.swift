// Generated code using ShapeConstraintFromJsonCalculatorTests.swift - test_executeCode()

import Foundation
public class WinningShapesAllCalculatorV3 {
    public static func Shapes_8612(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 8,
            heightMax: 7))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 136,
            widthMax: 10,
            heightMax: 6))
        shapes += rectangle3x4

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 90,
            widthMax: 7,
            heightMax: 6))
        shapes += rectangle4x5

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 64,
            widthMax: 10,
            heightMax: 7))
        shapes += rectangle3x4_BottomLeft

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 52,
            widthMax: 11,
            heightMax: 8))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_8702(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let pacman3x3_BottomRight = ShapeCalculator.toShapes(pacmans: PacmanCalculatorV3.BottomRight(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 144,
            widthMax: 9,
            heightMax: 8))
        shapes += pacman3x3_BottomRight

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 106,
            widthMax: 10,
            heightMax: 8))
        shapes += c2x2

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 8,
            heightMax: 7))
        shapes += edges

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 74,
            widthMax: 9,
            heightMax: 8))
        shapes += square3x3

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 76,
            widthMax: 8,
            heightMax: 6))
        shapes += square4x4

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 72,
            widthMax: 10,
            heightMax: 8))
        shapes += square3x3_TopLeft

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 80,
            widthMax: 8,
            heightMax: 7))
        shapes += square3x3_TopRight

        return shapes
    }

    public static func Shapes_8703(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 70,
            widthMax: 10,
            heightMax: 8))
        shapes += c2x2

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 102,
            widthMax: 13,
            heightMax: 10))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 7,
            heightMax: 6))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 74,
            widthMax: 7,
            heightMax: 7))
        shapes += rectangle3x4

        let special8703 = SpecialShapesCalculator.C8703(words: words)
        shapes += special8703

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 68,
            widthMax: 10,
            heightMax: 7))
        shapes += square3x3

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 66,
            widthMax: 8,
            heightMax: 7))
        shapes += square3x3_BottomRight

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 58,
            widthMax: 10,
            heightMax: 5))
        shapes += square3x3_TopLeft

        return shapes
    }

    public static func Shapes_8704(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 104,
            widthMax: 9,
            heightMax: 7))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 9,
            heightMax: 8))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 100,
            widthMax: 9,
            heightMax: 9))
        shapes += rectangle3x4

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 92,
            widthMax: 9,
            heightMax: 7))
        shapes += rectangle3x5

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 72,
            widthMax: 8,
            heightMax: 8))
        shapes += rectangle3x4_TopRight

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 8,
            heightMax: 7))
        shapes += square3x3

        let square4x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftSquare(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 72,
            widthMax: 8,
            heightMax: 7))
        shapes += square4x4_TopLeft

        return shapes
    }

    public static func Shapes_8705(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 66,
            widthMax: 10,
            heightMax: 9))
        shapes += c2x2

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 106,
            widthMax: 13,
            heightMax: 8))
        shapes += c2x3

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x4(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 132,
            widthMax: 10,
            heightMax: 7))
        shapes += c2x4

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: 9,
            heightMax: 6))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 80,
            widthMax: 8,
            heightMax: 6))
        shapes += rectangle3x4

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 88,
            widthMax: 10,
            heightMax: 8))
        shapes += rectangle3x4_TopLeft

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 78,
            widthMax: 9,
            heightMax: 7))
        shapes += square3x3

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 74,
            widthMax: 9,
            heightMax: 7))
        shapes += square3x3_BottomRight

        return shapes
    }

    public static func Shapes_8710(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let pacman3x3_TopLeft = ShapeCalculator.toShapes(pacmans: PacmanCalculatorV3.TopLeft(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 132,
            widthMax: 11,
            heightMax: 10))
        shapes += pacman3x3_TopLeft

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 84,
            widthMax: 10,
            heightMax: 9))
        shapes += c2x2

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 102,
            widthMax: 10,
            heightMax: 10))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 6,
            heightMax: 6))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 84,
            widthMax: 11,
            heightMax: 9))
        shapes += rectangle3x4

        let rectangle3x5_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 104,
            widthMax: 9,
            heightMax: 8))
        shapes += rectangle3x5_TopLeft

        let rectangle3x5_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 72,
            widthMax: 11,
            heightMax: 9))
        shapes += rectangle3x5_TopRight

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 100,
            widthMax: 10,
            heightMax: 6))
        shapes += square4x4

        let square5x5_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 74,
            widthMax: 9,
            heightMax: 7))
        shapes += square5x5_TopRight

        return shapes
    }

    public static func Shapes_8711(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 82,
            widthMax: 9,
            heightMax: 8))
        shapes += c2x2

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 118,
            widthMax: 9,
            heightMax: 8))
        shapes += c2x3

        let c2x5 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x5(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 204,
            widthMax: 13,
            heightMax: 7))
        shapes += c2x5

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 9,
            heightMax: 6))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 82,
            widthMax: 8,
            heightMax: 7))
        shapes += rectangle3x4

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 116,
            widthMax: 9,
            heightMax: 7))
        shapes += rectangle3x5

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 82,
            widthMax: 9,
            heightMax: 7))
        shapes += rectangle3x4_TopLeft

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 8,
            heightMax: 7))
        shapes += rectangle3x4_TopRight

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 60,
            widthMax: 9,
            heightMax: 7))
        shapes += square3x3

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 10,
            heightMax: 8))
        shapes += square3x3_TopLeft

        return shapes
    }

    public static func Shapes_8712(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 108,
            widthMax: 11,
            heightMax: 8))
        shapes += c2x2

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 118,
            widthMax: 11,
            heightMax: 7))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 28,
            widthMax: 8,
            heightMax: 7))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 82,
            widthMax: 9,
            heightMax: 8))
        shapes += rectangle3x4

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 10,
            heightMax: 8))
        shapes += rectangle3x5

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 108,
            widthMax: 11,
            heightMax: 8))
        shapes += rectangle4x5

        let rectangle3x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 80,
            widthMax: 13,
            heightMax: 7))
        shapes += rectangle3x4_BottomRight

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 78,
            widthMax: 8,
            heightMax: 8))
        shapes += square3x3

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 74,
            widthMax: 11,
            heightMax: 10))
        shapes += square3x3_TopLeft

        return shapes
    }

    public static func Shapes_8802(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 74,
            widthMax: 10,
            heightMax: 8))
        shapes += c2x2

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x4(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 148,
            widthMax: 11,
            heightMax: 7))
        shapes += c2x4

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 28,
            widthMax: 8,
            heightMax: 7))
        shapes += edges

        let rectangle3x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 82,
            widthMax: 10,
            heightMax: 7))
        shapes += rectangle3x4_BottomRight

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 60,
            widthMax: 9,
            heightMax: 7))
        shapes += rectangle3x4_TopRight

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 92,
            widthMax: 10,
            heightMax: 9))
        shapes += square3x3_TopLeft

        let square4x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftSquare(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 80,
            widthMax: 9,
            heightMax: 8))
        shapes += square4x4_TopLeft

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 120,
            widthMax: 8,
            heightMax: 7))
        shapes += square3x3_TopRight

        return shapes
    }

    public static func Shapes_8803(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let pacman3x3_TopRight = ShapeCalculator.toShapes(pacmans: PacmanCalculatorV3.TopRight(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 136,
            widthMax: 10,
            heightMax: 9))
        shapes += pacman3x3_TopRight

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 88,
            widthMax: 11,
            heightMax: 10))
        shapes += c2x2

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: 8,
            heightMax: 8))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 68,
            widthMax: 7,
            heightMax: 7))
        shapes += rectangle3x4

        let rectangle3x6_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 9,
            heightMax: 6))
        shapes += rectangle3x6_BottomLeft

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 56,
            widthMax: 11,
            heightMax: 9))
        shapes += square3x3

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 88,
            widthMax: 9,
            heightMax: 6))
        shapes += square3x3_TopRight

        return shapes
    }

    public static func Shapes_8804(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 84,
            widthMax: 8,
            heightMax: 6))
        shapes += c2x2

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 108,
            widthMax: 9,
            heightMax: 8))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 9,
            heightMax: 7))
        shapes += edges

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 74,
            widthMax: 9,
            heightMax: 7))
        shapes += square3x3

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 68,
            widthMax: 8,
            heightMax: 6))
        shapes += square3x3_TopRight

        return shapes
    }

    public static func Shapes_8805(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 74,
            widthMax: 12,
            heightMax: 8))
        shapes += c2x2

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 7,
            heightMax: 7))
        shapes += edges

        let special8805 = SpecialShapesCalculator.C8805(words: words)
        shapes += special8805

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 118,
            widthMax: 10,
            heightMax: 9))
        shapes += square3x3

        let square4x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 116,
            widthMax: 9,
            heightMax: 7))
        shapes += square4x4_TopRight

        let square5x5_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 88,
            widthMax: 7,
            heightMax: 7))
        shapes += square5x5_TopRight

        return shapes
    }

    public static func Shapes_8806(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 62,
            widthMax: 11,
            heightMax: 6))
        shapes += c2x2

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 108,
            widthMax: 10,
            heightMax: 7))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 10,
            heightMax: 7))
        shapes += edges

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 78,
            widthMax: 10,
            heightMax: 8))
        shapes += square3x3

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 64,
            widthMax: 10,
            heightMax: 8))
        shapes += square3x3_TopLeft

        return shapes
    }

    public static func Shapes_8807(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 9,
            heightMax: 7))
        shapes += edges

        let outer2x3 = ShapeCalculator.toShapes(outers: OuterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 90,
            widthMax: 10,
            heightMax: 7))
        shapes += outer2x3

        let rectangle3x5_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 12,
            heightMax: 8))
        shapes += rectangle3x5_TopLeft

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 104,
            widthMax: 10,
            heightMax: 9))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_8808(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 68,
            widthMax: 11,
            heightMax: 10))
        shapes += c2x2

        let c3x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C3x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 190,
            widthMax: 12,
            heightMax: 8))
        shapes += c3x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: 9,
            heightMax: 7))
        shapes += edges

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 74,
            widthMax: 9,
            heightMax: 7))
        shapes += rectangle3x5

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 88,
            widthMax: 9,
            heightMax: 9))
        shapes += rectangle3x4_TopLeft

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 136,
            widthMax: 9,
            heightMax: 9))
        shapes += square3x3

        let square4x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 48,
            widthMax: 9,
            heightMax: 9))
        shapes += square4x4_TopRight

        return shapes
    }

    public static func Shapes_8809(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 104,
            widthMax: 11,
            heightMax: 10))
        shapes += c2x2

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 9,
            heightMax: 8))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 76,
            widthMax: 11,
            heightMax: 7))
        shapes += rectangle3x4

        let rectangle3x5_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 68,
            widthMax: 12,
            heightMax: 10))
        shapes += rectangle3x5_BottomRight

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 76,
            widthMax: 11,
            heightMax: 8))
        shapes += rectangle3x4_TopLeft

        let rectangle3x5_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 72,
            widthMax: 12,
            heightMax: 9))
        shapes += rectangle3x5_TopLeft

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 68,
            widthMax: 14,
            heightMax: 7))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_8810(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 66,
            widthMax: 9,
            heightMax: 9))
        shapes += c2x2

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: 9,
            heightMax: 7))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 9,
            heightMax: 8))
        shapes += rectangle3x4

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 70,
            widthMax: 8,
            heightMax: 7))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_8811(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 82,
            widthMax: 12,
            heightMax: 8))
        shapes += c2x2

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 142,
            widthMax: 11,
            heightMax: 9))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 28,
            widthMax: 8,
            heightMax: 8))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 92,
            widthMax: 9,
            heightMax: 8))
        shapes += rectangle3x4

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 84,
            widthMax: 10,
            heightMax: 8))
        shapes += rectangle3x5

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 80,
            widthMax: 8,
            heightMax: 6))
        shapes += rectangle4x5

        let rectangle3x5_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 54,
            widthMax: 11,
            heightMax: 10))
        shapes += rectangle3x5_BottomLeft

        let rectangle4x6_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 66,
            widthMax: 8,
            heightMax: 8))
        shapes += rectangle4x6_TopRight

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 60,
            widthMax: 10,
            heightMax: 6))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_8812(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let pacman3x3_TopRight = ShapeCalculator.toShapes(pacmans: PacmanCalculatorV3.TopRight(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 152,
            widthMax: 9,
            heightMax: 9))
        shapes += pacman3x3_TopRight

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 86,
            widthMax: 9,
            heightMax: 8))
        shapes += c2x2

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: 7,
            heightMax: 6))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 72,
            widthMax: 9,
            heightMax: 7))
        shapes += rectangle3x4

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 82,
            widthMax: 8,
            heightMax: 7))
        shapes += rectangle3x4_TopLeft

        let rectangle3x5_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 76,
            widthMax: 8,
            heightMax: 8))
        shapes += rectangle3x5_TopLeft

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 66,
            widthMax: 9,
            heightMax: 8))
        shapes += square3x3

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 60,
            widthMax: 8,
            heightMax: 7))
        shapes += square3x3_TopRight

        return shapes
    }

    public static func Shapes_8902(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 154,
            widthMax: 10,
            heightMax: 8))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 28,
            widthMax: 8,
            heightMax: 7))
        shapes += edges

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 132,
            widthMax: 13,
            heightMax: 7))
        shapes += rectangle3x5

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 74,
            widthMax: 13,
            heightMax: 7))
        shapes += square3x3

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 76,
            widthMax: 9,
            heightMax: 9))
        shapes += square3x3_TopLeft

        let square5x5_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 88,
            widthMax: 7,
            heightMax: 7))
        shapes += square5x5_TopRight

        return shapes
    }

    public static func Shapes_8903(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: 10,
            heightMax: 8))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 82,
            widthMax: 14,
            heightMax: 9))
        shapes += rectangle3x4

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 82,
            widthMax: 14,
            heightMax: 9))
        shapes += square3x3_TopRight

        return shapes
    }

    public static func Shapes_8904(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 126,
            widthMax: 8,
            heightMax: 7))
        shapes += c2x3

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x4(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 168,
            widthMax: 12,
            heightMax: 7))
        shapes += c2x4

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 9,
            heightMax: 8))
        shapes += edges

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 76,
            widthMax: 8,
            heightMax: 8))
        shapes += rectangle3x4_BottomLeft

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 78,
            widthMax: 9,
            heightMax: 7))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_8905(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 84,
            widthMax: 10,
            heightMax: 7))
        shapes += c2x3

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x4(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 160,
            widthMax: 12,
            heightMax: 10))
        shapes += c2x4

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 8,
            heightMax: 7))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 66,
            widthMax: 8,
            heightMax: 8))
        shapes += rectangle3x4

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 114,
            widthMax: 8,
            heightMax: 8))
        shapes += square3x3_BottomRight

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 120,
            widthMax: 11,
            heightMax: 8))
        shapes += square3x3_TopLeft

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 68,
            widthMax: 9,
            heightMax: 7))
        shapes += square3x3_TopRight

        return shapes
    }

    public static func Shapes_8906(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 66,
            widthMax: 11,
            heightMax: 10))
        shapes += c2x2

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 162,
            widthMax: 12,
            heightMax: 8))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 8,
            heightMax: 8))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 62,
            widthMax: 8,
            heightMax: 7))
        shapes += rectangle3x4

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 144,
            widthMax: 10,
            heightMax: 8))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_8907(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let pacman3x3_BottomRight = ShapeCalculator.toShapes(pacmans: PacmanCalculatorV3.BottomRight(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 180,
            widthMax: 11,
            heightMax: 10))
        shapes += pacman3x3_BottomRight

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: 9,
            heightMax: 8))
        shapes += edges

        let outer2x3 = ShapeCalculator.toShapes(outers: OuterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 140,
            widthMax: 9,
            heightMax: 7))
        shapes += outer2x3

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 116,
            widthMax: 9,
            heightMax: 8))
        shapes += rectangle3x4

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 66,
            widthMax: 8,
            heightMax: 7))
        shapes += rectangle3x4_BottomLeft

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 78,
            widthMax: 8,
            heightMax: 8))
        shapes += square3x3

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 58,
            widthMax: 12,
            heightMax: 7))
        shapes += square3x3_TopLeft

        return shapes
    }

    public static func Shapes_8908(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 94,
            widthMax: 11,
            heightMax: 7))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 10,
            heightMax: 8))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 78,
            widthMax: 8,
            heightMax: 8))
        shapes += rectangle3x4

        let rectangle3x6_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 116,
            widthMax: 10,
            heightMax: 8))
        shapes += rectangle3x6_TopRight

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 104,
            widthMax: 12,
            heightMax: 9))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_8909(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 132,
            widthMax: 11,
            heightMax: 9))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 8,
            heightMax: 7))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 148,
            widthMax: 9,
            heightMax: 8))
        shapes += rectangle3x4

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 92,
            widthMax: 7,
            heightMax: 7))
        shapes += rectangle3x5

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 120,
            widthMax: 9,
            heightMax: 8))
        shapes += rectangle3x4_TopLeft

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 76,
            widthMax: 10,
            heightMax: 9))
        shapes += square3x3

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 66,
            widthMax: 9,
            heightMax: 8))
        shapes += square3x3_TopLeft

        return shapes
    }

    public static func Shapes_8910(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c3x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C3x4(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 186,
            widthMax: 12,
            heightMax: 11))
        shapes += c3x4

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 28,
            widthMax: 9,
            heightMax: 8))
        shapes += edges

        let outer2x3 = ShapeCalculator.toShapes(outers: OuterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 108,
            widthMax: 10,
            heightMax: 8))
        shapes += outer2x3

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 70,
            widthMax: 11,
            heightMax: 7))
        shapes += rectangle3x4

        let rectangle3x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 108,
            widthMax: 11,
            heightMax: 10))
        shapes += rectangle3x6

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 52,
            widthMax: 10,
            heightMax: 8))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_8911(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let pacman3x3_BottomRight = ShapeCalculator.toShapes(pacmans: PacmanCalculatorV3.BottomRight(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 138,
            widthMax: 14,
            heightMax: 10))
        shapes += pacman3x3_BottomRight

        let c3x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C3x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 142,
            widthMax: 8,
            heightMax: 8))
        shapes += c3x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 9,
            heightMax: 7))
        shapes += edges

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 62,
            widthMax: 9,
            heightMax: 8))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_8912(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 86,
            widthMax: 10,
            heightMax: 8))
        shapes += c2x2

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: 8,
            heightMax: 7))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 106,
            widthMax: 8,
            heightMax: 6))
        shapes += rectangle3x4

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 7,
            heightMax: 7))
        shapes += rectangle3x5

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 90,
            widthMax: 11,
            heightMax: 7))
        shapes += rectangle4x5

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 90,
            widthMax: 9,
            heightMax: 8))
        shapes += rectangle3x4_TopRight

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 128,
            widthMax: 12,
            heightMax: 9))
        shapes += square3x3

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 84,
            widthMax: 9,
            heightMax: 8))
        shapes += square4x4

        return shapes
    }

    public static func Shapes_9001(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 9,
            heightMax: 8))
        shapes += edges

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 90,
            widthMax: 9,
            heightMax: 7))
        shapes += rectangle4x5

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 70,
            widthMax: 12,
            heightMax: 7))
        shapes += square3x3

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 84,
            widthMax: 13,
            heightMax: 7))
        shapes += square3x3_TopRight

        return shapes
    }

    public static func Shapes_9002(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 9,
            heightMax: 7))
        shapes += edges

        let special9002a = SpecialShapesCalculator.C9002a(words: words)
        shapes += special9002a

        let special9002b = SpecialShapesCalculator.C9002b(words: words)
        shapes += special9002b

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 98,
            widthMax: 12,
            heightMax: 9))
        shapes += square3x3

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 124,
            widthMax: 9,
            heightMax: 8))
        shapes += square4x4

        return shapes
    }

    public static func Shapes_9003(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 9,
            heightMax: 7))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 84,
            widthMax: 9,
            heightMax: 9))
        shapes += rectangle3x4

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 82,
            widthMax: 9,
            heightMax: 9))
        shapes += rectangle3x5

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 52,
            widthMax: 9,
            heightMax: 7))
        shapes += square3x3_TopRight

        return shapes
    }

    public static func Shapes_9004(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 54,
            widthMax: 12,
            heightMax: 12))
        shapes += c2x2

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 10,
            heightMax: 9))
        shapes += edges

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 9,
            heightMax: 8))
        shapes += rectangle3x4_BottomLeft

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 80,
            widthMax: 8,
            heightMax: 8))
        shapes += square3x3

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 10,
            heightMax: 8))
        shapes += square4x4

        return shapes
    }

    public static func Shapes_9005(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 90,
            widthMax: 9,
            heightMax: 8))
        shapes += c2x2

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 102,
            widthMax: 10,
            heightMax: 7))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 9,
            heightMax: 7))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 68,
            widthMax: 9,
            heightMax: 7))
        shapes += rectangle3x4

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 128,
            widthMax: 9,
            heightMax: 8))
        shapes += rectangle3x4_TopRight

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 88,
            widthMax: 9,
            heightMax: 8))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_9006(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 84,
            widthMax: 14,
            heightMax: 8))
        shapes += c2x2

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 136,
            widthMax: 12,
            heightMax: 9))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 10,
            heightMax: 8))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 70,
            widthMax: 8,
            heightMax: 7))
        shapes += rectangle3x4

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 98,
            widthMax: 8,
            heightMax: 6))
        shapes += rectangle3x5

        let rectangle3x5_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 80,
            widthMax: 12,
            heightMax: 9))
        shapes += rectangle3x5_BottomRight

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 68,
            widthMax: 12,
            heightMax: 9))
        shapes += square3x3

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 74,
            widthMax: 13,
            heightMax: 8))
        shapes += square3x3_TopRight

        return shapes
    }

    public static func Shapes_9007(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 134,
            widthMax: 15,
            heightMax: 9))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 36,
            widthMax: 9,
            heightMax: 9))
        shapes += edges

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 62,
            widthMax: 10,
            heightMax: 10))
        shapes += rectangle3x5

        let rectangle3x7 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 6,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 100,
            widthMax: 10,
            heightMax: 7))
        shapes += rectangle3x7

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 12,
            heightMax: 7))
        shapes += rectangle3x4_BottomLeft

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 58,
            widthMax: 8,
            heightMax: 6))
        shapes += rectangle3x4_TopRight

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 92,
            widthMax: 9,
            heightMax: 7))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_9008(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 12,
            heightMax: 10))
        shapes += edges

        let outer2x3 = ShapeCalculator.toShapes(outers: OuterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 130,
            widthMax: 12,
            heightMax: 10))
        shapes += outer2x3

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 58,
            widthMax: 12,
            heightMax: 10))
        shapes += rectangle3x4

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 92,
            widthMax: 12,
            heightMax: 7))
        shapes += rectangle4x5

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 80,
            widthMax: 12,
            heightMax: 7))
        shapes += square3x3

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 66,
            widthMax: 9,
            heightMax: 9))
        shapes += square3x3_BottomRight

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 80,
            widthMax: 14,
            heightMax: 7))
        shapes += square3x3_TopLeft

        return shapes
    }

    public static func Shapes_9009(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 82,
            widthMax: 11,
            heightMax: 10))
        shapes += c2x2

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x4(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 150,
            widthMax: 13,
            heightMax: 9))
        shapes += c2x4

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 9,
            heightMax: 8))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 112,
            widthMax: 8,
            heightMax: 6))
        shapes += rectangle3x4

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 60,
            widthMax: 8,
            heightMax: 7))
        shapes += rectangle3x4_BottomLeft

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 82,
            widthMax: 11,
            heightMax: 8))
        shapes += square3x3

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 10,
            heightMax: 9))
        shapes += square4x4

        return shapes
    }

    public static func Shapes_9010(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 100,
            widthMax: 8,
            heightMax: 7))
        shapes += c2x3

        let c3x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C3x4(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 170,
            widthMax: 10,
            heightMax: 8))
        shapes += c3x4

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: 8,
            heightMax: 7))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 72,
            widthMax: 10,
            heightMax: 8))
        shapes += rectangle3x4

        let rectangle3x5_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 66,
            widthMax: 10,
            heightMax: 8))
        shapes += rectangle3x5_BottomRight

        let square4x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 74,
            widthMax: 10,
            heightMax: 8))
        shapes += square4x4_TopRight

        return shapes
    }

    public static func Shapes_9011(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 104,
            widthMax: 9,
            heightMax: 7))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: 10,
            heightMax: 7))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 9,
            heightMax: 8))
        shapes += rectangle3x4

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 74,
            widthMax: 11,
            heightMax: 7))
        shapes += rectangle3x4_BottomLeft

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 64,
            widthMax: 12,
            heightMax: 8))
        shapes += square3x3

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 52,
            widthMax: 10,
            heightMax: 8))
        shapes += square3x3_TopRight

        return shapes
    }

    public static func Shapes_9012(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 78,
            widthMax: 11,
            heightMax: 8))
        shapes += c2x2

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 8,
            heightMax: 8))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 74,
            widthMax: 10,
            heightMax: 8))
        shapes += rectangle3x4

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 72,
            widthMax: 8,
            heightMax: 7))
        shapes += square3x3

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 72,
            widthMax: 11,
            heightMax: 9))
        shapes += square3x3_TopLeft

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 62,
            widthMax: 9,
            heightMax: 6))
        shapes += square3x3_TopRight

        return shapes
    }

    public static func Shapes_9101(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 82,
            widthMax: 9,
            heightMax: 7))
        shapes += c2x2

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x4(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 168,
            widthMax: 10,
            heightMax: 7))
        shapes += c2x4

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 11,
            heightMax: 8))
        shapes += edges

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 80,
            widthMax: 10,
            heightMax: 7))
        shapes += rectangle3x4_TopLeft

        let special9101 = SpecialShapesCalculator.C9101(words: words)
        shapes += special9101

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 74,
            widthMax: 10,
            heightMax: 8))
        shapes += square3x3_TopRight

        return shapes
    }

    public static func Shapes_9102(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 136,
            widthMax: 12,
            heightMax: 7))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 8,
            heightMax: 8))
        shapes += edges

        let rectangle3x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 8,
            heightMax: 6))
        shapes += rectangle3x6

        let rectangle3x5_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 8,
            heightMax: 7))
        shapes += rectangle3x5_BottomLeft

        let special9102 = SpecialShapesCalculator.C9102(words: words)
        shapes += special9102

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 56,
            widthMax: 8,
            heightMax: 7))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_9103(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 82,
            widthMax: 15,
            heightMax: 12))
        shapes += c2x2

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 10,
            heightMax: 7))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 72,
            widthMax: 12,
            heightMax: 6))
        shapes += rectangle3x4

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 62,
            widthMax: 12,
            heightMax: 10))
        shapes += rectangle3x4_BottomLeft

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 66,
            widthMax: 11,
            heightMax: 10))
        shapes += square3x3

        let square4x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftSquare(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 52,
            widthMax: 7,
            heightMax: 7))
        shapes += square4x4_TopLeft

        return shapes
    }

    public static func Shapes_9104(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x4(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 128,
            widthMax: 11,
            heightMax: 7))
        shapes += c2x4

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 9,
            heightMax: 7))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 78,
            widthMax: 7,
            heightMax: 7))
        shapes += rectangle3x4

        let rectangle3x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 112,
            widthMax: 8,
            heightMax: 6))
        shapes += rectangle3x6

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 68,
            widthMax: 9,
            heightMax: 8))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_9105(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x4(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 116,
            widthMax: 12,
            heightMax: 9))
        shapes += c2x4

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 28,
            widthMax: 9,
            heightMax: 9))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 98,
            widthMax: 9,
            heightMax: 9))
        shapes += rectangle3x4

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 74,
            widthMax: 11,
            heightMax: 8))
        shapes += rectangle4x5

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 60,
            widthMax: 10,
            heightMax: 10))
        shapes += rectangle3x4_TopLeft

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 80,
            widthMax: 11,
            heightMax: 9))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_9106(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 28,
            widthMax: 9,
            heightMax: 7))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 80,
            widthMax: 11,
            heightMax: 8))
        shapes += rectangle3x4

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 62,
            widthMax: 12,
            heightMax: 10))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_9107(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 110,
            widthMax: 10,
            heightMax: 9))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 9,
            heightMax: 7))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 68,
            widthMax: 10,
            heightMax: 9))
        shapes += rectangle3x4

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 72,
            widthMax: 9,
            heightMax: 9))
        shapes += rectangle3x4_TopRight

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 82,
            widthMax: 9,
            heightMax: 6))
        shapes += square3x3

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 84,
            widthMax: 9,
            heightMax: 8))
        shapes += square4x4

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 58,
            widthMax: 8,
            heightMax: 7))
        shapes += square3x3_TopRight

        return shapes
    }

    public static func Shapes_9108(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 132,
            widthMax: 12,
            heightMax: 8))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 8,
            heightMax: 7))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 64,
            widthMax: 8,
            heightMax: 7))
        shapes += rectangle3x4

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 84,
            widthMax: 9,
            heightMax: 8))
        shapes += rectangle4x5

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 84,
            widthMax: 8,
            heightMax: 8))
        shapes += square3x3

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 88,
            widthMax: 9,
            heightMax: 9))
        shapes += square3x3_TopRight

        return shapes
    }

    public static func Shapes_9109(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 28,
            widthMax: 10,
            heightMax: 9))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 68,
            widthMax: 8,
            heightMax: 7))
        shapes += rectangle3x4

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 66,
            widthMax: 8,
            heightMax: 8))
        shapes += rectangle3x5

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 82,
            widthMax: 11,
            heightMax: 9))
        shapes += rectangle3x4_TopLeft

        let special9109 = SpecialShapesCalculator.C9109(words: words)
        shapes += special9109

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 74,
            widthMax: 11,
            heightMax: 7))
        shapes += square3x3

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 78,
            widthMax: 8,
            heightMax: 6))
        shapes += square4x4

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 7,
            heightMax: 7))
        shapes += square3x3_BottomRight

        return shapes
    }

    public static func Shapes_9110(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 84,
            widthMax: 13,
            heightMax: 10))
        shapes += c2x2

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 9,
            heightMax: 7))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 78,
            widthMax: 10,
            heightMax: 9))
        shapes += rectangle3x4

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 80,
            widthMax: 15,
            heightMax: 12))
        shapes += square3x3

        let square4x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightSquare(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 76,
            widthMax: 8,
            heightMax: 8))
        shapes += square4x4_BottomRight

        return shapes
    }

    public static func Shapes_9111(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 28,
            widthMax: 10,
            heightMax: 8))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 76,
            widthMax: 10,
            heightMax: 8))
        shapes += rectangle3x4

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 104,
            widthMax: 12,
            heightMax: 8))
        shapes += rectangle3x5

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 56,
            widthMax: 12,
            heightMax: 10))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_9112(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 86,
            widthMax: 12,
            heightMax: 11))
        shapes += c2x2

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 28,
            widthMax: 10,
            heightMax: 8))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 82,
            widthMax: 10,
            heightMax: 8))
        shapes += rectangle3x4

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 128,
            widthMax: 10,
            heightMax: 9))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_9201(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 12,
            heightMax: 11))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 62,
            widthMax: 12,
            heightMax: 10))
        shapes += rectangle3x4

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 70,
            widthMax: 12,
            heightMax: 11))
        shapes += square3x3

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 80,
            widthMax: 10,
            heightMax: 8))
        shapes += square3x3_TopRight

        return shapes
    }

    public static func Shapes_9202(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: 9,
            heightMax: 8))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 70,
            widthMax: 10,
            heightMax: 9))
        shapes += rectangle3x4

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 140,
            widthMax: 10,
            heightMax: 9))
        shapes += square3x3

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 60,
            widthMax: 12,
            heightMax: 8))
        shapes += square3x3_TopRight

        return shapes
    }

    public static func Shapes_9203(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x4(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 166,
            widthMax: 12,
            heightMax: 7))
        shapes += c2x4

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 9,
            heightMax: 9))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 106,
            widthMax: 9,
            heightMax: 9))
        shapes += rectangle3x4

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 62,
            widthMax: 9,
            heightMax: 9))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_9204(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 10,
            heightMax: 7))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 76,
            widthMax: 10,
            heightMax: 7))
        shapes += rectangle3x4

        let special9204 = SpecialShapesCalculator.C9204(words: words)
        shapes += special9204

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 88,
            widthMax: 8,
            heightMax: 7))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_9206(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 102,
            widthMax: 11,
            heightMax: 9))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 9,
            heightMax: 8))
        shapes += edges

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 84,
            widthMax: 8,
            heightMax: 8))
        shapes += rectangle3x5

        let rectangle3x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 54,
            widthMax: 9,
            heightMax: 9))
        shapes += rectangle3x4_BottomRight

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 60,
            widthMax: 12,
            heightMax: 8))
        shapes += square3x3

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 74,
            widthMax: 10,
            heightMax: 8))
        shapes += square3x3_BottomRight

        return shapes
    }

    public static func Shapes_9207(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 36,
            widthMax: 11,
            heightMax: 8))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 82,
            widthMax: 11,
            heightMax: 10))
        shapes += rectangle3x4

        let rectangle3x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 80,
            widthMax: 11,
            heightMax: 8))
        shapes += rectangle3x4_BottomRight

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 86,
            widthMax: 11,
            heightMax: 10))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_9208(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: 12,
            heightMax: 10))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 66,
            widthMax: 12,
            heightMax: 9))
        shapes += rectangle3x4

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 120,
            widthMax: 12,
            heightMax: 12))
        shapes += rectangle3x5

        let rectangle5x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 140,
            widthMax: 13,
            heightMax: 12))
        shapes += rectangle5x6

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 82,
            widthMax: 12,
            heightMax: 10))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_9209(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let pacman3x3_BottomRight = ShapeCalculator.toShapes(pacmans: PacmanCalculatorV3.BottomRight(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 124,
            widthMax: 10,
            heightMax: 10))
        shapes += pacman3x3_BottomRight

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 11,
            heightMax: 8))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 58,
            widthMax: 12,
            heightMax: 9))
        shapes += rectangle3x4

        let special9209 = SpecialShapesCalculator.C9209(words: words)
        shapes += special9209

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 74,
            widthMax: 11,
            heightMax: 8))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_9210(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 100,
            widthMax: 12,
            heightMax: 9))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 12,
            heightMax: 7))
        shapes += edges

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 112,
            widthMax: 12,
            heightMax: 8))
        shapes += rectangle3x5

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 64,
            widthMax: 14,
            heightMax: 7))
        shapes += square3x3

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 76,
            widthMax: 8,
            heightMax: 8))
        shapes += square3x3_BottomRight

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 72,
            widthMax: 9,
            heightMax: 9))
        shapes += square3x3_TopLeft

        return shapes
    }

    public static func Shapes_9211(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 96,
            widthMax: 13,
            heightMax: 10))
        shapes += c2x2

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 11,
            heightMax: 8))
        shapes += edges

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 126,
            widthMax: 11,
            heightMax: 7))
        shapes += rectangle3x5

        let rectangle3x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 80,
            widthMax: 11,
            heightMax: 9))
        shapes += rectangle3x4_BottomRight

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 66,
            widthMax: 12,
            heightMax: 8))
        shapes += square3x3

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 82,
            widthMax: 9,
            heightMax: 7))
        shapes += square4x4

        return shapes
    }

    public static func Shapes_9212(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 82,
            widthMax: 11,
            heightMax: 9))
        shapes += c2x2

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 10,
            heightMax: 8))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 118,
            widthMax: 10,
            heightMax: 10))
        shapes += rectangle3x4

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 10,
            heightMax: 8))
        shapes += rectangle4x5

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 68,
            widthMax: 10,
            heightMax: 8))
        shapes += rectangle3x4_TopRight

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 68,
            widthMax: 12,
            heightMax: 10))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_9301(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 10,
            heightMax: 7))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 84,
            widthMax: 10,
            heightMax: 9))
        shapes += rectangle3x4

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 128,
            widthMax: 11,
            heightMax: 10))
        shapes += rectangle3x4_BottomLeft

        let rectangle4x5_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 104,
            widthMax: 7,
            heightMax: 7))
        shapes += rectangle4x5_BottomLeft

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 62,
            widthMax: 10,
            heightMax: 8))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_9302(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 11,
            heightMax: 10))
        shapes += edges

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 62,
            widthMax: 12,
            heightMax: 8))
        shapes += square3x3

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 68,
            widthMax: 13,
            heightMax: 8))
        shapes += square3x3_BottomRight

        return shapes
    }

    public static func Shapes_9303(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 98,
            widthMax: 10,
            heightMax: 10))
        shapes += c2x2

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 9,
            heightMax: 7))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 88,
            widthMax: 8,
            heightMax: 8))
        shapes += rectangle3x4

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 106,
            widthMax: 10,
            heightMax: 10))
        shapes += rectangle3x5

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 88,
            widthMax: 7,
            heightMax: 7))
        shapes += rectangle3x4_TopLeft

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 74,
            widthMax: 10,
            heightMax: 8))
        shapes += square3x3

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 108,
            widthMax: 12,
            heightMax: 10))
        shapes += square4x4

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 64,
            widthMax: 11,
            heightMax: 8))
        shapes += square3x3_TopRight

        return shapes
    }

    public static func Shapes_9304(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 130,
            widthMax: 13,
            heightMax: 11))
        shapes += c2x2

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 132,
            widthMax: 10,
            heightMax: 6))
        shapes += c2x3

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x4(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 122,
            widthMax: 12,
            heightMax: 11))
        shapes += c2x4

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 9,
            heightMax: 7))
        shapes += edges

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 70,
            widthMax: 11,
            heightMax: 8))
        shapes += rectangle3x5

        let rectangle3x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 66,
            widthMax: 9,
            heightMax: 8))
        shapes += rectangle3x4_BottomRight

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 58,
            widthMax: 11,
            heightMax: 8))
        shapes += square3x3

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 60,
            widthMax: 10,
            heightMax: 7))
        shapes += square3x3_TopRight

        return shapes
    }

    public static func Shapes_9305(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 104,
            widthMax: 10,
            heightMax: 7))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 10,
            heightMax: 8))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 10,
            heightMax: 8))
        shapes += rectangle3x4

        let rectangle3x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 106,
            widthMax: 9,
            heightMax: 8))
        shapes += rectangle3x6

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 84,
            widthMax: 9,
            heightMax: 8))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_9306(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 11,
            heightMax: 9))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 11,
            heightMax: 10))
        shapes += rectangle3x4

        let rectangle3x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 88,
            widthMax: 15,
            heightMax: 11))
        shapes += rectangle3x6

        let rectangle5x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 146,
            widthMax: 13,
            heightMax: 11))
        shapes += rectangle5x6

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 68,
            widthMax: 12,
            heightMax: 8))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_9307(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 11,
            heightMax: 9))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 130,
            widthMax: 11,
            heightMax: 8))
        shapes += rectangle3x4

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 106,
            widthMax: 12,
            heightMax: 10))
        shapes += square3x3

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 50,
            widthMax: 10,
            heightMax: 7))
        shapes += square3x3_TopLeft

        let square5x5_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 84,
            widthMax: 8,
            heightMax: 7))
        shapes += square5x5_TopRight

        return shapes
    }

    public static func Shapes_9308(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 68,
            widthMax: 15,
            heightMax: 12))
        shapes += c2x2

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: 11,
            heightMax: 8))
        shapes += edges

        let rectangle3x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 82,
            widthMax: 9,
            heightMax: 7))
        shapes += rectangle3x4_BottomRight

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 68,
            widthMax: 13,
            heightMax: 9))
        shapes += square3x3

        let square5x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 90,
            widthMax: 8,
            heightMax: 8))
        shapes += square5x5

        return shapes
    }

    public static func Shapes_9309(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 68,
            widthMax: 12,
            heightMax: 8))
        shapes += c2x2

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: 11,
            heightMax: 7))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 130,
            widthMax: 12,
            heightMax: 11))
        shapes += rectangle3x4

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 104,
            widthMax: 11,
            heightMax: 7))
        shapes += rectangle4x5

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 56,
            widthMax: 12,
            heightMax: 11))
        shapes += square3x3

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 66,
            widthMax: 13,
            heightMax: 8))
        shapes += square3x3_TopRight

        return shapes
    }

    public static func Shapes_9310(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 36,
            widthMax: 13,
            heightMax: 11))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 108,
            widthMax: 13,
            heightMax: 10))
        shapes += rectangle3x4

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 76,
            widthMax: 13,
            heightMax: 12))
        shapes += square3x3

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 80,
            widthMax: 16,
            heightMax: 12))
        shapes += square3x3_TopLeft

        return shapes
    }

    public static func Shapes_9311(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 11,
            heightMax: 9))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 15,
            heightMax: 9))
        shapes += rectangle3x4

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 82,
            widthMax: 10,
            heightMax: 6))
        shapes += rectangle3x5

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 68,
            widthMax: 10,
            heightMax: 9))
        shapes += rectangle3x4_TopLeft

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 112,
            widthMax: 12,
            heightMax: 9))
        shapes += square3x3

        let square4x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightSquare(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 72,
            widthMax: 10,
            heightMax: 6))
        shapes += square4x4_BottomRight

        return shapes
    }

    public static func Shapes_9312(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 112,
            widthMax: 15,
            heightMax: 11))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 11,
            heightMax: 10))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 124,
            widthMax: 12,
            heightMax: 9))
        shapes += rectangle3x4

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 84,
            widthMax: 11,
            heightMax: 7))
        shapes += square4x4

        return shapes
    }

    public static func Shapes_9401(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 10,
            heightMax: 8))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 92,
            widthMax: 11,
            heightMax: 9))
        shapes += rectangle3x4

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 88,
            widthMax: 9,
            heightMax: 8))
        shapes += rectangle4x5

        return shapes
    }

    public static func Shapes_9402(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 102,
            widthMax: 15,
            heightMax: 12))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 13,
            heightMax: 9))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 82,
            widthMax: 10,
            heightMax: 9))
        shapes += rectangle3x4

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 82,
            widthMax: 9,
            heightMax: 9))
        shapes += rectangle3x5

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 72,
            widthMax: 9,
            heightMax: 8))
        shapes += rectangle3x4_BottomLeft

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 92,
            widthMax: 17,
            heightMax: 10))
        shapes += square3x3

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 88,
            widthMax: 9,
            heightMax: 8))
        shapes += square4x4

        let square5x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 64,
            widthMax: 13,
            heightMax: 8))
        shapes += square5x5

        return shapes
    }

    public static func Shapes_9403(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 9,
            heightMax: 7))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 82,
            widthMax: 13,
            heightMax: 8))
        shapes += rectangle3x4

        let rectangle4x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 82,
            widthMax: 10,
            heightMax: 8))
        shapes += rectangle4x6

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 72,
            widthMax: 14,
            heightMax: 8))
        shapes += rectangle3x4_TopRight

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 68,
            widthMax: 15,
            heightMax: 9))
        shapes += square3x3

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 88,
            widthMax: 8,
            heightMax: 8))
        shapes += square4x4

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 54,
            widthMax: 14,
            heightMax: 9))
        shapes += square3x3_BottomRight

        return shapes
    }

    public static func Shapes_9404(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: 9,
            heightMax: 8))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 118,
            widthMax: 13,
            heightMax: 8))
        shapes += rectangle3x4

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 78,
            widthMax: 15,
            heightMax: 9))
        shapes += rectangle3x5

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 52,
            widthMax: 9,
            heightMax: 8))
        shapes += rectangle3x4_BottomLeft

        let rectangle3x5_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 62,
            widthMax: 13,
            heightMax: 8))
        shapes += rectangle3x5_TopLeft

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 68,
            widthMax: 10,
            heightMax: 9))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_9406(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: 11,
            heightMax: 9))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 82,
            widthMax: 8,
            heightMax: 8))
        shapes += rectangle3x4

        let rectangle3x7 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 6,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 100,
            widthMax: 11,
            heightMax: 9))
        shapes += rectangle3x7

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 9,
            heightMax: 8))
        shapes += rectangle4x5

        let rectangle5x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 104,
            widthMax: 10,
            heightMax: 8))
        shapes += rectangle5x6

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 68,
            widthMax: 11,
            heightMax: 9))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_9407(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 10,
            heightMax: 8))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 90,
            widthMax: 10,
            heightMax: 8))
        shapes += rectangle3x4

        let rectangle3x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 92,
            widthMax: 12,
            heightMax: 10))
        shapes += rectangle3x6

        let rectangle4x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 90,
            widthMax: 9,
            heightMax: 8))
        shapes += rectangle4x6

        let rectangle4x5_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 140,
            widthMax: 10,
            heightMax: 10))
        shapes += rectangle4x5_BottomRight

        let special9407 = SpecialShapesCalculator.C9407(words: words)
        shapes += special9407

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 88,
            widthMax: 12,
            heightMax: 10))
        shapes += square3x3

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 92,
            widthMax: 9,
            heightMax: 8))
        shapes += square4x4

        return shapes
    }

    public static func Shapes_9408(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 76,
            widthMax: 13,
            heightMax: 12))
        shapes += c2x2

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 8,
            heightMax: 8))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 60,
            widthMax: 9,
            heightMax: 9))
        shapes += rectangle3x4

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 80,
            widthMax: 11,
            heightMax: 7))
        shapes += rectangle3x4_TopRight

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 62,
            widthMax: 12,
            heightMax: 9))
        shapes += square3x3

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 76,
            widthMax: 9,
            heightMax: 9))
        shapes += square4x4

        return shapes
    }

    public static func Shapes_9409(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 10,
            heightMax: 8))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 58,
            widthMax: 12,
            heightMax: 8))
        shapes += rectangle3x4

        let rectangle4x5_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 64,
            widthMax: 12,
            heightMax: 10))
        shapes += rectangle4x5_BottomLeft

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 80,
            widthMax: 9,
            heightMax: 8))
        shapes += rectangle3x4_TopLeft

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 74,
            widthMax: 15,
            heightMax: 9))
        shapes += square3x3

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 104,
            widthMax: 11,
            heightMax: 10))
        shapes += square3x3_TopRight

        return shapes
    }

    public static func Shapes_9410(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let pacman3x3_BottomRight = ShapeCalculator.toShapes(pacmans: PacmanCalculatorV3.BottomRight(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 152,
            widthMax: 14,
            heightMax: 13))
        shapes += pacman3x3_BottomRight

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 10,
            heightMax: 9))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 82,
            widthMax: 11,
            heightMax: 9))
        shapes += rectangle3x4

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 78,
            widthMax: 11,
            heightMax: 9))
        shapes += rectangle3x5

        return shapes
    }

    public static func Shapes_9411(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x4(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 116,
            widthMax: 14,
            heightMax: 8))
        shapes += c2x4

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 10,
            heightMax: 9))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 68,
            widthMax: 11,
            heightMax: 10))
        shapes += rectangle3x4

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 136,
            widthMax: 10,
            heightMax: 10))
        shapes += rectangle3x5

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 66,
            widthMax: 9,
            heightMax: 9))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_9412(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 104,
            widthMax: 11,
            heightMax: 9))
        shapes += c2x2

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 86,
            widthMax: 9,
            heightMax: 9))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 9,
            heightMax: 7))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 70,
            widthMax: 10,
            heightMax: 8))
        shapes += rectangle3x4

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 108,
            widthMax: 8,
            heightMax: 8))
        shapes += rectangle3x4_BottomLeft

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 104,
            widthMax: 7,
            heightMax: 6))
        shapes += rectangle3x4_TopRight

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 100,
            widthMax: 8,
            heightMax: 7))
        shapes += square3x3

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 84,
            widthMax: 10,
            heightMax: 8))
        shapes += square4x4

        return shapes
    }

    public static func Shapes_9501(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x6 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x6(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 222,
            widthMax: 17,
            heightMax: 9))
        shapes += c2x6

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 11,
            heightMax: 7))
        shapes += edges

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 70,
            widthMax: 10,
            heightMax: 8))
        shapes += rectangle3x5

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 66,
            widthMax: 11,
            heightMax: 8))
        shapes += rectangle3x4_BottomLeft

        let rectangle3x5_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 76,
            widthMax: 7,
            heightMax: 7))
        shapes += rectangle3x5_BottomRight

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 9,
            heightMax: 8))
        shapes += square3x3

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 74,
            widthMax: 8,
            heightMax: 8))
        shapes += square3x3_TopLeft

        return shapes
    }

    public static func Shapes_9502(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 11,
            heightMax: 10))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 76,
            widthMax: 13,
            heightMax: 11))
        shapes += rectangle3x4

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 54,
            widthMax: 13,
            heightMax: 8))
        shapes += rectangle3x5

        let rectangle3x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 82,
            widthMax: 10,
            heightMax: 9))
        shapes += rectangle3x6

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 62,
            widthMax: 13,
            heightMax: 8))
        shapes += square3x3

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 66,
            widthMax: 10,
            heightMax: 10))
        shapes += square3x3_BottomRight

        return shapes
    }

    public static func Shapes_9503(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 70,
            widthMax: 10,
            heightMax: 8))
        shapes += c2x2

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 10,
            heightMax: 8))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 70,
            widthMax: 10,
            heightMax: 9))
        shapes += rectangle3x4

        let rectangle3x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 76,
            widthMax: 10,
            heightMax: 8))
        shapes += rectangle3x6

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 108,
            widthMax: 10,
            heightMax: 7))
        shapes += rectangle4x5

        let rectangle4x5_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 92,
            widthMax: 8,
            heightMax: 6))
        shapes += rectangle4x5_BottomRight

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 14,
            heightMax: 11))
        shapes += square3x3_TopLeft

        return shapes
    }

    public static func Shapes_9504(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 70,
            widthMax: 9,
            heightMax: 7))
        shapes += c2x2

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 110,
            widthMax: 9,
            heightMax: 7))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 12,
            heightMax: 7))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 140,
            widthMax: 12,
            heightMax: 9))
        shapes += rectangle3x4

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 140,
            widthMax: 12,
            heightMax: 9))
        shapes += rectangle4x5

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 76,
            widthMax: 11,
            heightMax: 9))
        shapes += square3x3

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 84,
            widthMax: 10,
            heightMax: 8))
        shapes += square4x4

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 80,
            widthMax: 8,
            heightMax: 7))
        shapes += square3x3_TopLeft

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 13,
            heightMax: 9))
        shapes += square3x3_TopRight

        return shapes
    }

    public static func Shapes_9505(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 98,
            widthMax: 9,
            heightMax: 8))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 9,
            heightMax: 9))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 68,
            widthMax: 9,
            heightMax: 7))
        shapes += rectangle3x4

        let rectangle4x7_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 6,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 128,
            widthMax: 9,
            heightMax: 9))
        shapes += rectangle4x7_BottomLeft

        let rectangle3x5_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 74,
            widthMax: 8,
            heightMax: 7))
        shapes += rectangle3x5_BottomRight

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 66,
            widthMax: 11,
            heightMax: 11))
        shapes += rectangle3x4_TopLeft

        let rectangle3x5_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 74,
            widthMax: 9,
            heightMax: 8))
        shapes += rectangle3x5_TopLeft

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 92,
            widthMax: 9,
            heightMax: 8))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_9506(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 88,
            widthMax: 10,
            heightMax: 10))
        shapes += c2x2

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x4(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 142,
            widthMax: 14,
            heightMax: 10))
        shapes += c2x4

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 10,
            heightMax: 8))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 72,
            widthMax: 11,
            heightMax: 9))
        shapes += rectangle3x4

        let rectangle3x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 68,
            widthMax: 8,
            heightMax: 7))
        shapes += rectangle3x4_BottomRight

        let rectangle3x5_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 66,
            widthMax: 11,
            heightMax: 8))
        shapes += rectangle3x5_BottomRight

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 80,
            widthMax: 10,
            heightMax: 9))
        shapes += square3x3

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 136,
            widthMax: 9,
            heightMax: 9))
        shapes += square4x4

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 80,
            widthMax: 11,
            heightMax: 8))
        shapes += square3x3_TopLeft

        return shapes
    }

    public static func Shapes_9507(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 62,
            widthMax: 13,
            heightMax: 12))
        shapes += c2x2

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 13,
            heightMax: 9))
        shapes += edges

        let outer2x3 = ShapeCalculator.toShapes(outers: OuterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 96,
            widthMax: 11,
            heightMax: 9))
        shapes += outer2x3

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 84,
            widthMax: 7,
            heightMax: 6))
        shapes += rectangle4x5

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 70,
            widthMax: 13,
            heightMax: 9))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_9508(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 78,
            widthMax: 10,
            heightMax: 9))
        shapes += c2x2

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 148,
            widthMax: 14,
            heightMax: 14))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 11,
            heightMax: 7))
        shapes += edges

        let outer2x3 = ShapeCalculator.toShapes(outers: OuterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 98,
            widthMax: 11,
            heightMax: 10))
        shapes += outer2x3

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 92,
            widthMax: 9,
            heightMax: 8))
        shapes += rectangle3x4

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 86,
            widthMax: 12,
            heightMax: 8))
        shapes += rectangle4x5

        return shapes
    }

    public static func Shapes_9509(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 64,
            widthMax: 13,
            heightMax: 10))
        shapes += c2x2

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 10,
            heightMax: 8))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 98,
            widthMax: 8,
            heightMax: 7))
        shapes += rectangle3x4

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 144,
            widthMax: 10,
            heightMax: 7))
        shapes += rectangle3x5

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 78,
            widthMax: 10,
            heightMax: 9))
        shapes += square3x3

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 88,
            widthMax: 12,
            heightMax: 10))
        shapes += square3x3_TopRight

        return shapes
    }

    public static func Shapes_9510(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 10,
            heightMax: 7))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 132,
            widthMax: 11,
            heightMax: 8))
        shapes += rectangle3x4

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 88,
            widthMax: 11,
            heightMax: 7))
        shapes += rectangle3x5

        let rectangle3x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 126,
            widthMax: 11,
            heightMax: 9))
        shapes += rectangle3x6

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 60,
            widthMax: 9,
            heightMax: 8))
        shapes += rectangle4x5

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 70,
            widthMax: 11,
            heightMax: 10))
        shapes += square3x3

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 120,
            widthMax: 11,
            heightMax: 7))
        shapes += square3x3_BottomRight

        return shapes
    }

    public static func Shapes_9511(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let pacman3x3_BottomRight = ShapeCalculator.toShapes(pacmans: PacmanCalculatorV3.BottomRight(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 138,
            widthMax: 12,
            heightMax: 10))
        shapes += pacman3x3_BottomRight

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 62,
            widthMax: 12,
            heightMax: 10))
        shapes += c2x2

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 11,
            heightMax: 9))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 11,
            heightMax: 10))
        shapes += rectangle3x4

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 60,
            widthMax: 12,
            heightMax: 6))
        shapes += rectangle3x4_BottomLeft

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 76,
            widthMax: 9,
            heightMax: 7))
        shapes += square3x3

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 104,
            widthMax: 11,
            heightMax: 9))
        shapes += square4x4

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 74,
            widthMax: 10,
            heightMax: 8))
        shapes += square3x3_BottomRight

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 66,
            widthMax: 11,
            heightMax: 10))
        shapes += square3x3_TopRight

        return shapes
    }

    public static func Shapes_9512(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 82,
            widthMax: 11,
            heightMax: 10))
        shapes += c2x2

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 28,
            widthMax: 11,
            heightMax: 9))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 86,
            widthMax: 10,
            heightMax: 10))
        shapes += rectangle3x4

        let rectangle3x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 92,
            widthMax: 9,
            heightMax: 8))
        shapes += rectangle3x6

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 54,
            widthMax: 11,
            heightMax: 10))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_9601(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 84,
            widthMax: 9,
            heightMax: 6))
        shapes += c2x2

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 9,
            heightMax: 8))
        shapes += edges

        let outer2x4 = ShapeCalculator.toShapes(outers: OuterCalculatorV3.C2x4(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 150,
            widthMax: 11,
            heightMax: 8))
        shapes += outer2x4

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 96,
            widthMax: 9,
            heightMax: 9))
        shapes += rectangle4x5

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 76,
            widthMax: 12,
            heightMax: 9))
        shapes += square3x3

        return shapes
    }

    public static func Shapes_9602(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 74,
            widthMax: 11,
            heightMax: 6))
        shapes += c2x2

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x3(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 110,
            widthMax: 9,
            heightMax: 7))
        shapes += c2x3

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: 11,
            heightMax: 9))
        shapes += edges

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 80,
            widthMax: 11,
            heightMax: 10))
        shapes += rectangle3x5

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 76,
            widthMax: 13,
            heightMax: 9))
        shapes += square3x3

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.BottomRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 120,
            widthMax: 11,
            heightMax: 8))
        shapes += square3x3_BottomRight

        return shapes
    }

    public static func Shapes_9603(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 9,
            heightMax: 9))
        shapes += edges

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 78,
            widthMax: 10,
            heightMax: 8))
        shapes += rectangle3x5

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 70,
            widthMax: 11,
            heightMax: 9))
        shapes += square3x3

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 60,
            widthMax: 12,
            heightMax: 9))
        shapes += square3x3_TopRight

        return shapes
    }

    public static func Shapes_9604(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C2x2(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 74,
            widthMax: 13,
            heightMax: 10))
        shapes += c2x2

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: 11,
            heightMax: 10))
        shapes += edges

        let outer2x4 = ShapeCalculator.toShapes(outers: OuterCalculatorV3.C2x4(
            letterIndex: letterIndex,
            words: wordsInt,
            end: endInt,
            words2: words,
            end2: end,
            len: len,
            scoreMin: 94,
            widthMax: 15,
            heightMax: 9))
        shapes += outer2x4

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 90,
            widthMax: 11,
            heightMax: 10))
        shapes += rectangle3x4

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 68,
            widthMax: 13,
            heightMax: 10))
        shapes += square3x3

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 74,
            widthMax: 7,
            heightMax: 6))
        shapes += square4x4

        return shapes
    }

    public static func Shapes_9605(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

        var shapes: [ShapeModel] = []
        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: 9,
            heightMax: 9))
        shapes += edges

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 90,
            widthMax: 10,
            heightMax: 9))
        shapes += rectangle3x4

        let rectangle3x5_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 66,
            widthMax: 9,
            heightMax: 8))
        shapes += rectangle3x5_TopLeft

        let special9605 = SpecialShapesCalculator.C9605(words: words)
        shapes += special9605

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            lengths: len,
            scoreMin: 74,
            widthMax: 11,
            heightMax: 11))
        shapes += square3x3

        return shapes
    }

    public static func execute(gameId: Int, words: [String]) -> [ShapeModel] {

        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        let letterIndex = LetterIndexModel(words: words)
        let wordsInt = WordCalculator.WordsToInt(words: words)
        let endInt = WordCalculator.WordsToInt(words: end)

        switch gameId {
        case 8612:
            return Shapes_8612(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8702:
            return Shapes_8702(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8703:
            return Shapes_8703(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8704:
            return Shapes_8704(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8705:
            return Shapes_8705(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8710:
            return Shapes_8710(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8711:
            return Shapes_8711(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8712:
            return Shapes_8712(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8802:
            return Shapes_8802(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8803:
            return Shapes_8803(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8804:
            return Shapes_8804(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8805:
            return Shapes_8805(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8806:
            return Shapes_8806(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8807:
            return Shapes_8807(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8808:
            return Shapes_8808(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8809:
            return Shapes_8809(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8810:
            return Shapes_8810(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8811:
            return Shapes_8811(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8812:
            return Shapes_8812(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8902:
            return Shapes_8902(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8903:
            return Shapes_8903(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8904:
            return Shapes_8904(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8905:
            return Shapes_8905(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8906:
            return Shapes_8906(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8907:
            return Shapes_8907(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8908:
            return Shapes_8908(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8909:
            return Shapes_8909(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8910:
            return Shapes_8910(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8911:
            return Shapes_8911(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 8912:
            return Shapes_8912(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9001:
            return Shapes_9001(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9002:
            return Shapes_9002(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9003:
            return Shapes_9003(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9004:
            return Shapes_9004(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9005:
            return Shapes_9005(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9006:
            return Shapes_9006(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9007:
            return Shapes_9007(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9008:
            return Shapes_9008(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9009:
            return Shapes_9009(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9010:
            return Shapes_9010(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9011:
            return Shapes_9011(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9012:
            return Shapes_9012(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9101:
            return Shapes_9101(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9102:
            return Shapes_9102(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9103:
            return Shapes_9103(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9104:
            return Shapes_9104(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9105:
            return Shapes_9105(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9106:
            return Shapes_9106(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9107:
            return Shapes_9107(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9108:
            return Shapes_9108(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9109:
            return Shapes_9109(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9110:
            return Shapes_9110(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9111:
            return Shapes_9111(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9112:
            return Shapes_9112(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9201:
            return Shapes_9201(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9202:
            return Shapes_9202(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9203:
            return Shapes_9203(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9204:
            return Shapes_9204(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9206:
            return Shapes_9206(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9207:
            return Shapes_9207(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9208:
            return Shapes_9208(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9209:
            return Shapes_9209(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9210:
            return Shapes_9210(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9211:
            return Shapes_9211(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9212:
            return Shapes_9212(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9301:
            return Shapes_9301(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9302:
            return Shapes_9302(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9303:
            return Shapes_9303(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9304:
            return Shapes_9304(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9305:
            return Shapes_9305(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9306:
            return Shapes_9306(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9307:
            return Shapes_9307(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9308:
            return Shapes_9308(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9309:
            return Shapes_9309(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9310:
            return Shapes_9310(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9311:
            return Shapes_9311(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9312:
            return Shapes_9312(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9401:
            return Shapes_9401(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9402:
            return Shapes_9402(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9403:
            return Shapes_9403(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9404:
            return Shapes_9404(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9406:
            return Shapes_9406(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9407:
            return Shapes_9407(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9408:
            return Shapes_9408(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9409:
            return Shapes_9409(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9410:
            return Shapes_9410(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9411:
            return Shapes_9411(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9412:
            return Shapes_9412(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9501:
            return Shapes_9501(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9502:
            return Shapes_9502(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9503:
            return Shapes_9503(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9504:
            return Shapes_9504(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9505:
            return Shapes_9505(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9506:
            return Shapes_9506(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9507:
            return Shapes_9507(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9508:
            return Shapes_9508(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9509:
            return Shapes_9509(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9510:
            return Shapes_9510(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9511:
            return Shapes_9511(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9512:
            return Shapes_9512(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9601:
            return Shapes_9601(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9602:
            return Shapes_9602(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9603:
            return Shapes_9603(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9604:
            return Shapes_9604(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        case 9605:
            return Shapes_9605(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)
        default:
            return []
        }
    }
}
