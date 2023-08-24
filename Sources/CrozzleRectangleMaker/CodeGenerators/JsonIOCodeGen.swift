//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 5/7/2023.
//

import Foundation
public class JsonIOCodeGen {
    
    public static func testCode(gameId: Int, score: Int) -> String {
        let code =
        """
            func test_Shapes_\(gameId)() {
                let result = StrategyCalculator.Shapes_\(gameId)()
                XCTAssertNotNil(result)
                if let result = result {
                    XCTAssertEqual(\(score), result.score)
                }
            }
        
        """
        return code
    }
    
    public static func getHeaderBlock(gameId: Int) -> String {
        let code =
        """
            public static func Shapes_\(gameId)() -> ([ShapeModel], [String], Int, Int) {
        
                let game = GameList().getGame(gameId: \(gameId))!
        
                let widthMax = game.maxWidth
                let heightMax = game.maxHeight
        
                let words = game.winningWords
                let end = WordCalculator.reverse(words: words)
                let len = WordCalculator.lengths(words: words)
        
        """
        return code
    }
    
    
    public static func getWinningGameTest(gameId: Int, score: Int) -> String {
        let code =
        """
            func test_WinningShape_\(gameId)() {
                let winningGame = WinningGamesCalculator.WinningShape_\(gameId)()
                XCTAssertEqual(\(score), winningGame.score)
            }
        """
        return code
    }
    
    public static func getWinningGame(gameId: Int) -> String {
        let code =
        """
            
            public static func WinningShape_\(gameId)() -> ShapeModel {
                let (shapes, words, widthMax, heightMax) = WinningShapesCalculator.Shapes_\(gameId)()
                return MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: shapes, words: words, widthMax: widthMax, heightMax: heightMax)
            }
        
        """
        return code
    }
    
    public static func clusterGen(shapeName: String, minScore: Int) -> String {
        let size = shapeName.replacingOccurrences(of: "Cluster", with: "")
        
        let (width, height, _) = JsonIOCalculator.getNumbers(numbers: size)
        
        let code =
        """
                let c\(width)x\(height) = ShapeCalculator.toShapes(clusters: ClusterCalculator.C\(width)x\(height)(
                   start: words,
                   end: end,
                   len: len,
                   scoreMin: \(minScore),
                   widthMax: widthMax,
                   heightMax: heightMax))
        
        """
        return code
    }
    
    public static func outerGen(shapeName: String, minScore: Int) -> String {
        let size = shapeName.replacingOccurrences(of: "Outer", with: "")
        
        let (width, height, _) = JsonIOCalculator.getNumbers(numbers: size)
        
        let code =
        """
                let outer\(width)x\(height) = ShapeCalculator.toShapes(outers: OuterCalculatorV1.C\(width)x\(height)(
                   start: words,
                   end: end,
                   len: len,
                   scoreMin: \(minScore),
                   widthMax: widthMax,
                   heightMax: heightMax))

        """
        return code
    }
    
    public static func edgeGen(minScore: Int) -> String {
        let code =
        """
                let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
                    words: words,
                    scoreMin: \(minScore),
                    widthMax: widthMax,
                    heightMax: heightMax))
        
        """
        return code
    }
    
    public static func pacmanGen(name: String, minScore: Int, variableName: String) -> String {
        
        //let variableName = JsonIOCalculator.pacmanName(name: name)
        
        let numberAndAngle = name.replacingOccurrences(of: "Pacman", with: "")
        
        let underscore = numberAndAngle.split(separator:"_")
        
        //let numbers = underscore[0]
        let angle = underscore[1]
        
        //let (width,height) = getNumbers(numbers: String(numbers))
        
        let code =
        """
                let \(variableName) = ShapeCalculator.toShapes(pacmans: PacmanCalculatorV1.\(angle)(
                    start: words,
                    end: end,
                    len: len,
                    scoreMin: \(minScore),
                    widthMax: widthMax,
                    heightMax: heightMax))

        """
        return code
    }
    
    
    public static func donutGen(name: String, minScore: Int, variableName: String) -> String {
        
        //let variableName = JsonIOCalculator.donutName(name: name)
        
        let numbers = name.replacingOccurrences(of: "Donut", with: "")
        
        let (width, height, _) = JsonIOCalculator.getNumbers(numbers: String(numbers))
        
        if width == height {

            let code =
            """
                    let \(variableName) = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
                        interlockWidth: \(width - 1),
                        words: words,
                        lengths: len,
                        scoreMin: \(minScore),
                        widthMax: widthMax,
                        heightMax: heightMax))
            
            """
            return code
            
        } else {
            
            let code =
            """
                    let \(variableName) = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
                        interlockWidth: \(width - 1),
                        interlockHeight: \(height - 1),
                        words: words,
                        lengths: len,
                        scoreMin: \(minScore),
                        widthMax: widthMax,
                        heightMax: heightMax))
            
            """
            return code
        }
    }
    
    public static func openDonutGen(name: String, minScore: Int) -> String {
        
        let variableName = JsonIOCalculator.openDonutName(name: name)
        
        let numberAndAngle = name.replacingOccurrences(of: "OpenDonut", with: "")
        
        let underscore = numberAndAngle.split(separator:"_")
        
        let numbers = underscore[0]
        var angle = underscore[1]
        
        let (width,height,swapped) = JsonIOCalculator.getNumbers(numbers: String(numbers))
        
        if width == height {
            if angle == "BottomLeft" {
                angle = "TopRight"
            }
            
           
            
            // We have a square
            let code =
            """
                    let \(variableName) = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.\(angle)Square(
                        interlockWidth: \(width - 1),
                        words: words,
                        lengths: len,
                        scoreMin: \(minScore),
                        widthMax: widthMax,
                        heightMax: heightMax))

            """
            return code
        } else {
            
            if swapped {
                if angle == "BottomLeft" {
                    angle = "TopRight"
                } else if angle == "TopRight" {
                    angle = "BottomLeft"
                }
            }
            let code =
            """
                    let \(variableName) = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.\(angle)Rectangle(
                        interlockWidth: \(width - 1),
                        interlockHeight: \(height - 1),
                        words: words,
                        lengths: len,
                        scoreMin: \(minScore),
                        widthMax: widthMax,
                        heightMax: heightMax))
            
            """
            return code
        }
    }
    
    public static func specialGen(shapeName: String, minScore: Int) -> String {
        let gameId = shapeName.replacingOccurrences(of: "Special", with: "")

        let code =
        """
                let \(shapeName.lowercased()) = SpecialShapesCalculator.C\(gameId)(words: words)
        
        """
        return code
    }
}
