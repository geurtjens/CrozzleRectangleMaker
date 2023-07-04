//
//  ShapeConstraintCalculator.swift
//  
//
//  Created by Michael Geurtjens on 4/7/2023.
//

import Foundation
public class ShapeConstraintCalculator {
    public func create(game: GameModel, constraints: ConstraintsModel, words: [String]) -> QueueList {
        
        
        let len = WordCalculator.lengths(words: words)
        let reversedWords = WordCalculator.reverse(words: words)
        
        var queueList = QueueList(game: game, constraints: constraints)
        
        for a in constraints.shapeConstraints {
            
            let shapes = execute(
                name: a.name,
                
                words: words,
                reversedWords: reversedWords,
                len: len,
                
                scoreMin: a.scoreMin,
                widthMax: a.widthMax,
                heightMax: a.heightMax)
            
            queueList.add(shapes: shapes)
        }
        
        
        return queueList
    }
    
    
    public func execute(name: String, words: [String], reversedWords: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        let (interlockWidth, interlockHeight) = ShapeConstraintFromJsonCalculator.extractInterlockWidthAndHeight(name: name)
        let corner = ShapeConstraintFromJsonCalculator.extractCorner(name: name)
        
        
        
        
        
        if name == "edge" {
            
            return edgeCalc(
                words: words,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
        } else if name.contains("special") {
            
            let specialId = name.replacingOccurrences(of: "special", with: "")
            
            return specialCalc(
                words: words,
                specialId: specialId)
            
        }
        
        
        
        if name.contains("square") {
            return squareCalc(
                    corner: corner,
                    words: words,
                    len: len,
                    interlockWidth: interlockWidth,
                    scoreMin: scoreMin,
                    widthMax: widthMax,
                    heightMax: heightMax)
                
           
        } else if name.contains("rectangle") {
            
            return rectangleCalc(
                corner: corner,
                words: words,
                len: len,
                interlockWidth: interlockWidth,
                interlockHeight: interlockHeight,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
                
        } else if name.contains("Pacman") {
            
            return pacmanCalc(
                corner: corner,
                words: words,
                end: reversedWords,
                len: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
        }  else if name.contains("cluster") {
            
            return clusterCalc(
                words: words,
                reversedWords: reversedWords,
                len: len,
                interlockWidth: interlockWidth,
                interlockHeight: interlockHeight,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
        } else if name.contains("outer") {
            return outerCalc(
                words: words,
                reversedWords: reversedWords,
                len: len,
                interlockWidth: interlockWidth,
                interlockHeight: interlockHeight,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
        }
        return []
    }
    
    
    
    public func edgeCalc(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        return ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax))
        
    }
    
    public func specialCalc(words: [String], specialId: String) -> [ShapeModel] {
        switch specialId {
        case "8703":
            return SpecialShapesCalculator.C8703(words: words)
        case "8805":
            return SpecialShapesCalculator.C8805(words: words)
        case "9002a":
            return SpecialShapesCalculator.C9002a(words: words)
        case "9002b":
            return SpecialShapesCalculator.C9002b(words: words)
        case "9101":
            return SpecialShapesCalculator.C9101(words: words)
        case "9102":
            return SpecialShapesCalculator.C9102(words: words)
        case "9109":
            return SpecialShapesCalculator.C9109(words: words)
        case "9204":
            return SpecialShapesCalculator.C9204(words: words)
        case "9209":
            return SpecialShapesCalculator.C9209(words: words)
        case "9407":
            return SpecialShapesCalculator.C9407(words: words)
        case "9605":
            return SpecialShapesCalculator.C9605(words: words)
        default:
            return []
        }
    }
    
    
    public func rectangleCalc(corner: String, words: [String], len: [Int], interlockWidth: Int, interlockHeight: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        
        switch corner {
        case "":
            return ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
                interlockWidth: interlockWidth - 1,
                interlockHeight: interlockHeight - 1,
                words: words,
                lengths: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax))
        case "BottomLeft":
            return ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomLeftRectangle(
                interlockWidth: interlockWidth - 1,
                interlockHeight: interlockHeight - 1,
                words: words,
                lengths: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax))
        case "BottomRight":
            return ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomRightRectangle(
                interlockWidth: interlockWidth - 1,
                interlockHeight: interlockHeight - 1,
                words: words,
                lengths: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax))
        case "TopLeft":
            return ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftRectangle(
                interlockWidth: interlockWidth - 1,
                interlockHeight: interlockHeight - 1,
                words: words,
                lengths: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax))
        case "TopRight":
            return ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightRectangle(
                interlockWidth: interlockWidth - 1,
                interlockHeight: interlockHeight - 1,
                words: words,
                lengths: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax))
        default:
            return []
        }
    }
        
    public func pacmanCalc(corner: String, words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        switch corner {
        case "BottomRight":
            
            return ShapeCalculator.toShapes(pacmans: PacmanCalculator.BottomRight(
                start: words,
                end: end,
                len: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax))
        case "TopLeft":
            return ShapeCalculator.toShapes(pacmans: PacmanCalculator.TopLeft(
                start: words,
                end: end,
                len: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax))
        case "TopRight":
            return ShapeCalculator.toShapes(pacmans: PacmanCalculator.TopRight(
                start: words,
                end: end,
                len: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax))
        default:
            return []
        }
    }
    
            
    public func squareCalc(corner: String, words: [String], len: [Int], interlockWidth: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {

        switch corner {
        case "":
            return ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
                interlockWidth: interlockWidth - 1,
                words: words,
                lengths: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax))
        case "TopLeft":
            return ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopLeftSquare(
                interlockWidth: interlockWidth - 1,
                words: words,
                lengths: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax))
        case "TopRight":
            return ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightSquare(
                interlockWidth: interlockWidth - 1,
                words: words,
                lengths: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax))
        case "BottomRight":
            return ShapeCalculator.toShapes(rectangles:RectangleCalculator.BottomRightSquare(
                interlockWidth: interlockWidth - 1,
                words: words,
                lengths: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax))
        default:
            return []
        }
    }
        
    public func clusterCalc(words: [String], reversedWords: [String], len:[Int], interlockWidth: Int, interlockHeight: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        if interlockWidth == 2 {
            switch interlockHeight {
            case 2:
                return ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
                    start: words,
                    end: reversedWords,
                    len: len,
                    scoreMin: scoreMin,
                    widthMax: widthMax,
                    heightMax: heightMax))
            case 3:
                return ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x3(
                    start: words,
                    end: reversedWords,
                    len: len,
                    scoreMin: scoreMin,
                    widthMax: widthMax,
                    heightMax: heightMax))
            case 4:
                return ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x4(
                    start: words,
                    end: reversedWords,
                    len: len,
                    scoreMin: scoreMin,
                    widthMax: widthMax,
                    heightMax: heightMax))
            case 5:
                return ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x5(
                    start: words,
                    end: reversedWords,
                    len: len,
                    scoreMin: scoreMin,
                    widthMax: widthMax,
                    heightMax: heightMax))
            case 6:
                return ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x6(
                    start: words,
                    end: reversedWords,
                    len: len,
                    scoreMin: scoreMin,
                    widthMax: widthMax,
                    heightMax: heightMax))
            default:
                return []
            }
        } else if interlockWidth == 3 {
            switch interlockHeight {
            case 3:
                return ShapeCalculator.toShapes(clusters: ClusterCalculator.C3x3(
                    start: words,
                    end: reversedWords,
                    len: len,
                    scoreMin: scoreMin,
                    widthMax: widthMax,
                    heightMax: heightMax))
            case 4:
                return ShapeCalculator.toShapes(clusters: ClusterCalculator.C3x4(
                    start: words,
                    end: reversedWords,
                    len: len,
                    scoreMin: scoreMin,
                    widthMax: widthMax,
                    heightMax: heightMax))
            case 5:
                return ShapeCalculator.toShapes(clusters: ClusterCalculator.C3x5(
                    start: words,
                    end: reversedWords,
                    len: len,
                    scoreMin: scoreMin,
                    widthMax: widthMax,
                    heightMax: heightMax))
            default:
                return []
            }
        } else {
            return []
        }
    }
    
    
    public func outerCalc(words: [String], reversedWords: [String], len: [Int], interlockWidth: Int, interlockHeight: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ShapeModel] {
        
        if interlockWidth == 2 && interlockHeight == 3 {
            return ShapeCalculator.toShapes(outers: OuterCalculator.C2x3(
                start: words,
                end: reversedWords,
                len: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax))
        } else if interlockWidth == 2 && interlockHeight == 4 {
            return ShapeCalculator.toShapes(outers: OuterCalculator.C2x4(
                start: words,
                end: reversedWords,
                len: len,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax))
        } else {
            return []
        }
    }
    
    
    
    
    
}
