//
//  ShapeConstraintCodeGen.swift
//  
//
//  Created by Michael Geurtjens on 4/7/2023.
//

import Foundation
public class ShapeConstraintCodeGen {
    
    public static func classHeader() -> String {
        let code =
        """
        import Foundation
        public class WinningShapesAllCalculatorV3_2 {

        """
        return code
    }
    
    public static func execute(inputs: [(Int,[ShapeConstraintModel])]) -> String {
        
        //let json = makeJson(inputs: inputs)
        var code = ""
        code += classHeader()
        code += makeGetCode(inputs: inputs)
        code += driverCode()
        code += "}"
        return code
    }
    
    public static func makeGetCode(inputs: [(Int,[ShapeConstraintModel])]) -> String {
        
        var result = ""
        for input in inputs {
            
            let gameId = input.0
            let shapes = input.1
            
            //let endText = includeEndDependingOnShapes(shapeConstraints: shapes)
            
            result += codeHeader(gameId: gameId)
            

            result += codeShapeCalculations(constraints: shapes)
            result += "        return shapes\n"
            result += "    }\n\n"
            
        }
        return result
    }
    
    public static func includeEndDependingOnShapes(shapeConstraints: [ShapeConstraintModel]) -> String {
        var include = false
        
        for item in shapeConstraints {
            let name = item.name
            if name.contains("cluster") || name.contains("outer") || name.contains("Pacman") {
                include = true
            }
        }
        
        if include == true {
            return "\n\n        let end = WordCalculator.reverse(words: words)\n\n"
        } else {
            return "\n\n"
        }
        
        
    }
    
    public static func codeShapeCalculations(constraints: [ShapeConstraintModel]) -> String {
        var code = ""
        for constraint in constraints {
            let (newCode, variableName) = shapeCode(constraint: constraint)
            
            code += newCode
            code += "        shapes += \(variableName)\n\n"
        }
        return code
    }
    
    public static func driverCode() -> String {
        var code = ""
        code += "    public static func execute(gameId: Int, words: [String]) -> [ShapeModel] {\n\n"

        code += "        let end = WordCalculator.reverse(words: words)\n"
        code += "        let len = WordCalculator.lengths(words: words)\n"
        code += "        let letterIndex = LetterIndexModel(words: words)\n"
        code += "        let wordsInt = WordCalculator.WordsToInt(words: words)\n"
        code += "        let endInt = WordCalculator.WordsToInt(words: end)\n"
        code += "\n"
        code += "        switch gameId {\n"
        let gameList = GameList()
        for game in gameList.games {
            let gameId = game.gameId
            
            code += "        case \(gameId):\n"
            code += "            return Shapes_\(gameId)(words: words, end: end, wordsInt: wordsInt, endInt: endInt, len: len, letterIndex: letterIndex)\n"
        }
            code += "        default:\n"
            code += "            return []\n"
        code += "        }\n"
        code += "    }\n"
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
            public static func Shapes_\(gameId)(words: [String], end: [String], wordsInt: [[Int]], endInt: [[Int]], len: [Int], letterIndex: LetterIndexModel) -> [ShapeModel] {

                var shapes: [ShapeModel] = []

        """
        
        return code
    }
    
    public static func rectangleCode(interlockWidth: Int, interlockHeight: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> (String, String) {
        
        let name = "rectangle\(interlockWidth)x\(interlockHeight)"
        
        let code =
        """
                let \(name) = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Rectangle(
                    interlockWidth: \(interlockWidth - 1),
                    interlockHeight: \(interlockHeight - 1),
                    letterIndex: letterIndex,
                    words: wordsInt,
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
                let \(name) = ShapeCalculator.toShapes(clusters: ClusterCalculatorV3.C\(interlockWidth)x\(interlockHeight)(
                    letterIndex: letterIndex,
                    words: wordsInt,
                    end: endInt,
                    words2: words,
                    end2: end,
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
                let \(name) = ShapeCalculator.toShapes(outers: OuterCalculatorV3.C\(interlockWidth)x\(interlockHeight)(
                    letterIndex: letterIndex,
                    words: wordsInt,
                    end: endInt,
                    words2: words,
                    end2: end,
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
                let \(name) = ShapeCalculator.toShapes(pacmans: PacmanCalculatorV3.\(corner)(
                    letterIndex: letterIndex,
                    words: wordsInt,
                    end: endInt,
                    words2: words,
                    end2: end,
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
                let \(name) = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.\(corner)Rectangle(
                    interlockWidth: \(interlockWidth - 1),
                    interlockHeight: \(interlockHeight - 1),
                    letterIndex: letterIndex,
                    words: wordsInt,
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
                let \(name) = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.Square(
                    interlockWidth: \(interlockWidth - 1),
                    letterIndex: letterIndex,
                    words: wordsInt,
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
                let \(name) = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV3.\(corner)Square(
                    interlockWidth: \(interlockWidth - 1),
                    letterIndex: letterIndex,
                    words: wordsInt,
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
                let \(name) = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
                    words: words,
                    scoreMin: \(scoreMin),
                    widthMax: \(widthMax),
                    heightMax: \(heightMax)))
        
        """
        return (code, name)
    }
}
