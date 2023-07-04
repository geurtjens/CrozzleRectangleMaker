//
//  ShapeConstraintCodeGen.swift
//  
//
//  Created by Michael Geurtjens on 4/7/2023.
//

import Foundation
public class ShapeConstraintCodeGen {
    
    public static func execute(inputs: [(Int,[ShapeConstraintModel])]) -> String {
        
        //let json = makeJson(inputs: inputs)
        
        var code = makeGetCode(inputs: inputs)
        code += driverCode()
        return code
    }
    
    public static func makeGetCode(inputs: [(Int,[ShapeConstraintModel])]) -> String {
        
        var result = ""
        for input in inputs {
            
            let gameId = input.0
            let shapes = input.1
            
            result += codeHeader(gameId: gameId)
            

            result += codeShapeCalculations(constraints: shapes)
            result += "        return queue\n    }\n\n"
            
        }
        return result
    }
    
    public static func codeShapeCalculations(constraints: [ShapeConstraintModel]) -> String {
        var code = ""
        for constraint in constraints {
            let (newCode, variableName) = shapeCode(constraint: constraint)
            
            code += newCode
            code += "        queue.add(shapes: \(variableName))\n\n"
        }
        return code
    }
    
    public static func driverCode() -> String {
        var code = ""
        code += "    public static func Queue(gameId: Int, words: [String], queueLength: Int, priorityFunction: PriorityFunction, wordsToUse: WordsUsedType) -> QueueList {\n\n"

        code += "        switch gameId {\n"
        let gameList = GameList()
        for game in gameList.games {
            let gameId = game.gameId
            
            code += "        case \(gameId):\n"
            code += "            return Queue_\(gameId)(words: words, queueLength: queueLength, priorityFunction: priorityFunction, wordsToUse: wordsToUse)\n"
        }
        code += "        }"
        code += "    }"
        return code
    }
    
    public static func shapeCode(constraint: ShapeConstraintModel) -> (String, String) {
        
        let name = constraint.name
        let corner = ShapeConstraintFromJsonCalculator.extractCorner(name: name)
        let (interlockWidth, interlockHeight) = ShapeConstraintFromJsonCalculator.extractInterlockWidthAndHeight(name: name)
        
        let scoreMin = constraint.scoreMin
        let widthMax = constraint.widthMax
        let heightMax = constraint.heightMax
        
        
        if name == "edge" {
            
            return edgeCode(
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
        } else if name.contains("square") {
            if corner != "" {
                
                return squareCode(
                    corner: corner,
                    interlockWidth: interlockWidth,
                    scoreMin: scoreMin,
                    widthMax: widthMax,
                    heightMax: heightMax)
                
            } else {
                
                return squareCode(
                    interlockWidth: interlockWidth,
                    scoreMin: scoreMin,
                    widthMax: widthMax,
                    heightMax: heightMax)
            }
        } else if name.contains("rectangle") {
            
            if corner != "" {
                
                return rectangleCode(
                    corner: corner,
                    interlockWidth: interlockWidth,
                    interlockHeight: interlockHeight,
                    scoreMin: scoreMin,
                    widthMax: widthMax,
                    heightMax: heightMax)
                
            } else {
                
                return rectangleCode(
                    interlockWidth: interlockWidth,
                    interlockHeight: interlockHeight,
                    scoreMin: scoreMin,
                    widthMax: widthMax,
                    heightMax: heightMax)
                
            }
        } else if name.contains("Pacman") {
            
            return pacmanCode(
                corner: corner,
                interlockWidth: interlockWidth,
                interlockHeight: interlockHeight,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
        } else if name.contains("special") {
            
            let specialId = name.replacingOccurrences(of: "special", with: "")
            
            return specialCode(specialId: specialId)
            
        } else if name.contains("cluster") {
            return clusterCode(
                interlockWidth: interlockWidth,
                interlockHeight: interlockHeight,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
        } else if name.contains("outer") {
            return outerCode(
                interlockWidth: interlockWidth,
                interlockHeight: interlockHeight,
                scoreMin: scoreMin,
                widthMax: widthMax,
                heightMax: heightMax)
        }
        return ("", name)
    }
    
    public static func codeHeader(gameId: Int) -> String {
        let code =
        """
        
            public static func Queue_\(gameId)(words: [String], queueLength: Int, priorityFunction: PriorityFunction, wordsToUse: WordsUsedType) -> QueueList {
                let game = GameList().getGame(gameId: \(gameId))!

                let len = WordCalculator.lengths(words: words)
        
                let end = WordCalculator.reverse(words: words)
        
                let scoresMin = StrategyCalculator.GetScoreMins(gameId: \(gameId))
        
                let constraint = ConstraintsModel(
                    scoresMin: scoresMin,
                    wordsMax: words.count,
                    wordsToUse: wordsToUse,
                    queueLengthMax: queueLength,
                    priorityFunction: priorityFunction)
             
                var queue = QueueList(game: game, constraints: constraint)

        """
        return code
    }
    
    public static func rectangleCode(interlockWidth: Int, interlockHeight: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> (String, String) {
        
        let name = "rectangle\(interlockWidth)x\(interlockHeight)"
        
        let code =
        """
                let \(name) = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(
                    interlockWidth: \(interlockWidth - 1),
                    interlockHeight: \(interlockHeight - 1),
                    words: words,
                    lengths: len,
                    scoreMin: \(scoreMin),
                    widthMax: \(widthMax),
                    heightMax: \(heightMax)))
        """
        return (code,name)
    }
    
    public static func clusterCode(interlockWidth: Int, interlockHeight: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> (String, String) {
    
        let name = "c\(interlockWidth)x\(interlockHeight)"
    
        let code =
        """
                  let \(name) = ShapeCalculator.toShapes(clusters: ClusterCalculator.C\(interlockWidth)x\(interlockHeight)(
                    start: words,
                    end: end,
                    len: len,
                    scoreMin: \(scoreMin),
                    widthMax: \(widthMax),
                    heightMax: \(heightMax)))
        """
        return (code, name)
    }
    
    public static func outerCode(interlockWidth: Int, interlockHeight: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> (String, String) {
    
        let name = "outer\(interlockWidth)x\(interlockHeight)"
    
        let code =
        """
                let \(name) = ShapeCalculator.toShapes(outers: OuterCalculator.C\(interlockWidth)x\(interlockHeight)(
                    start: words,
                    end: end,
                    len: len,
                    scoreMin: \(scoreMin),
                    widthMax: \(widthMax),
                    heightMax: \(heightMax)))
        """
        return (code, name)
    }
    
    public static func pacmanCode(corner: String, interlockWidth: Int, interlockHeight: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> (String, String) {
    
        let name = "pacman\(interlockWidth)x\(interlockHeight)_\(corner)"
    
        let code =
        """
                let \(name) = ShapeCalculator.toShapes(pacmans: PacmanCalculator.\(corner)(
                    start: words,
                    end: end,
                    len: len,
                    scoreMin: \(scoreMin),
                    widthMax: \(widthMax),
                    heightMax: \(heightMax)))
        """
        return (code, name)
    }
    
    
    public static func rectangleCode(corner: String, interlockWidth: Int, interlockHeight: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> (String,String) {
        
        let name = "rectangle\(interlockWidth)x\(interlockHeight)_\(corner)"
        
        let code =
        """
                let \(name) = ShapeCalculator.toShapes(rectangles:RectangleCalculator.\(corner)Rectangle(
                    interlockWidth: \(interlockWidth - 1),
                    interlockHeight: \(interlockHeight - 1),
                    words: words,
                    lengths: len,
                    scoreMin: \(scoreMin),
                    widthMax: \(widthMax),
                    heightMax: \(heightMax)))
        """
        return (code, name)
    }
    
    
    public static func squareCode(interlockWidth: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> (String,String) {
        
        let name = "square\(interlockWidth)x\(interlockWidth)"
        
        let code =
        """
                let \(name) = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(
                    interlockWidth: \(interlockWidth - 1),
                    words: words,
                    lengths: len,
                    scoreMin: \(scoreMin),
                    widthMax: \(widthMax),
                    heightMax: \(heightMax)))
        """
        return (code, name)
    }
    
    
    public static func specialCode(specialId: String) -> (String, String) {
        let name = "special\(specialId)"
        
        let code = """
            let \(name) = SpecialShapesCalculator.C\(specialId)(words: words)
        """
        return (code, name)
    }
    
    
    public static func squareCode(corner: String, interlockWidth: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> (String, String) {
        
        let name = "square\(interlockWidth)x\(interlockWidth)_\(corner)"
        
        let code =
        """
                let \(name) = ShapeCalculator.toShapes(rectangles:RectangleCalculator.\(corner)Square(
                    interlockWidth: \(interlockWidth - 1),
                    words: words,
                    lengths: len,
                    scoreMin: \(scoreMin),
                    widthMax: \(widthMax),
                    heightMax: \(heightMax)))
        """
        return (code, name)
    }
    
    
    public static func edgeCode(scoreMin: Int, widthMax: Int, heightMax: Int) -> (String, String) {
        
        let name = "edges"
        
        let code =
        """
                let \(name) = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(
                    words: words,
                    scoreMin: \(scoreMin),
                    widthMax: \(widthMax),
                    heightMax: \(heightMax)))
        """
        return (code, name)
    }
}
