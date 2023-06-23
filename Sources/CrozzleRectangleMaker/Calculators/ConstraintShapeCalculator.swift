//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 23/6/2023.
//

import Foundation
public class ConstraintShapeCalculator {
    
    public static func execute() -> String {
        let inputs: [(Int,[ConstraintsShapeModel])] = getConstraintsShapeModels()
        
        let json = makeJson(inputs: inputs)
        
        var code = makeGetCode(inputs: inputs)
        code += driverCode()
        return json + "\n\n" + code
    }
    
    
    
    public static func makeJson(inputs: [(Int,[ConstraintsShapeModel])]) -> String {
        
        var result = ""
        for input in inputs {
            
            let gameId = input.0
            let shapes = input.1
            
            var gameResult = ""
            
            for shape in shapes {
                if gameResult != "" {
                    gameResult += ",\n"
                }
                gameResult += "    {\"name\": \"\(shape.shapeName)\", \"scoreMin\": \(shape.scoreMin), \"widthMax\": \(shape.widthMax), \"heightMax\": \(shape.heightMax)}"
            }
            gameResult = "{\"gameId\": \(gameId), \"shapes\": [\n" + gameResult + "\n]}"
            
            if result != "" {
                result += ",\n"
            }
            result += gameResult
        }
        result = "[\n\(result)\n]"
        
        return result
    }
    
    public static func makeGetCode(inputs: [(Int,[ConstraintsShapeModel])]) -> String {
        
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
    
    public static func codeShapeCalculations(constraints: [ConstraintsShapeModel]) -> String {
        var code = ""
        for constraint in constraints {
            let (newCode, variableName) = shapeCode(constraint: constraint)
            
            code += newCode 
            code += "        queue.add(shapes: \(variableName))\n\n"
        }
        return code
    }
    
    public static func rectangleCode(interlockWidth: Int, interlockHeight: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> (String, String) {
        
        let name = "rectangle\(interlockWidth)x\(interlockHeight)"
        
        var code = ""
        code += "        let \(name) = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(\n"
        code += "            interlockWidth: \(interlockWidth - 1),\n"
        code += "            interlockHeight: \(interlockHeight - 1),\n"
        code += "            words: words,\n"
        code += "            lengths: len,\n"
        code += "            scoreMin: \(scoreMin),\n"
        code += "            widthMax: \(widthMax),\n"
        code += "            heightMax: \(heightMax)))\n"
        
        return (code,name)
    }
    
    public static func clusterCode(interlockWidth: Int, interlockHeight: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> (String, String) {
    
        let name = "c\(interlockWidth)x\(interlockHeight)"
    
        var code = ""
        code += "        let \(name) = ShapeCalculator.toShapes(clusters: ClusterCalculator.C\(interlockWidth)x\(interlockHeight)(\n"
        code += "            start: words,\n"
        code += "            end: end,\n"
        code += "            len: len,\n"
        code += "            scoreMin: \(scoreMin),\n"
        code += "            widthMax: \(widthMax),\n"
        code += "            heightMax: \(heightMax)))\n"
        return (code, name)
    }
    
    public static func outerCode(interlockWidth: Int, interlockHeight: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> (String, String) {
    
        let name = "outer\(interlockWidth)x\(interlockHeight)"
    
        var code = ""
        code += "        let \(name) = ShapeCalculator.toShapes(outers: OuterCalculator.C\(interlockWidth)x\(interlockHeight)(\n"
        code += "            start: words,\n"
        code += "            end: end,\n"
        code += "            len: len,\n"
        code += "            scoreMin: \(scoreMin),\n"
        code += "            widthMax: \(widthMax),\n"
        code += "            heightMax: \(heightMax)))\n"
        return (code, name)
    }
    
    public static func pacmanCode(corner: String, interlockWidth: Int, interlockHeight: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> (String, String) {
    
        let name = "pacman\(interlockWidth)x\(interlockHeight)_\(corner)"
    
        var code = ""
        code += "        let \(name) = ShapeCalculator.toShapes(pacmans: PacmanCalculator.\(corner)(\n"
        code += "            start: words,\n"
        code += "            end: end,\n"
        code += "            len: len,\n"
        code += "            scoreMin: \(scoreMin),\n"
        code += "            widthMax: \(widthMax),\n"
        code += "            heightMax: \(heightMax)))\n"
        return (code, name)
    }
    
    
    

    
    
    
    public static func rectangleCode(corner: String, interlockWidth: Int, interlockHeight: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> (String,String) {
        
        let name = "rectangle\(interlockWidth)x\(interlockHeight)_\(corner)"
        
        var code = ""
        code += "        let \(name) = ShapeCalculator.toShapes(rectangles:RectangleCalculator.\(corner)Rectangle(\n"
        code += "            interlockWidth: \(interlockWidth - 1),\n"
        code += "            interlockHeight: \(interlockHeight - 1),\n"
        code += "            words: words,\n"
        code += "            lengths: len,\n"
        code += "            scoreMin: \(scoreMin),\n"
        code += "            widthMax: \(widthMax),\n"
        code += "            heightMax: \(heightMax)))\n"
        return (code, name)
    }
    
    public static func squareCode(interlockWidth: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> (String,String) {
        
        let name = "square\(interlockWidth)x\(interlockWidth)"
        
        var code = ""
        code += "        let \(name) = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(\n"
        code += "            interlockWidth: \(interlockWidth - 1),\n"
        code += "            words: words,\n"
        code += "            lengths: len,\n"
        code += "            scoreMin: \(scoreMin),\n"
        code += "            widthMax: \(widthMax),\n"
        code += "            heightMax: \(heightMax)))\n"
        
        return (code, name)
    }
    
    public static func specialCode(specialId: String) -> (String, String) {
        let name = "special\(specialId)"
        
        let code = "        let \(name) = SpecialShapesCalculator.C\(specialId)(words: words)\n"
        
        return (code, name)
    }
    
    public static func squareCode(corner: String, interlockWidth: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> (String, String) {
        
        let name = "square\(interlockWidth)x\(interlockWidth)_\(corner)"
        
        var code = ""
        code += "        let \(name) = ShapeCalculator.toShapes(rectangles:RectangleCalculator.\(corner)Square(\n"
        code += "            interlockWidth: \(interlockWidth - 1),\n"
        code += "            words: words,\n"
        code += "            lengths: len,\n"
        code += "            scoreMin: \(scoreMin),\n"
        code += "            widthMax: \(widthMax),\n"
        code += "            heightMax: \(heightMax)))\n"
         
        return (code, name)
    }
    
    public static func edgeCode(scoreMin: Int, widthMax: Int, heightMax: Int) -> (String, String) {
        
        let name = "edges"
        
        var code = ""
        code += "        let \(name) = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(\n"
        code += "            words: words,\n"
        code += "            scoreMin: \(scoreMin),\n"
        code += "            widthMax: \(widthMax),\n"
        code += "            heightMax: \(heightMax)))\n"
        
        return (code, name)
    }
    
    public static func extractCorner(name: String) -> String {
        if name.contains("TopLeft") {
            return "TopLeft"
        } else if name.contains("TopRight") {
            return "TopRight"
        } else if name.contains("BottomLeft") {
            return "BottomLeft"
        } else if name.contains("BottomRight") {
            return "BottomRight"
        } else {
            return ""
        }
    }
    
    public static func extractInterlockWidthAndHeight(name: String) -> (Int, Int) {
        
        let numbers = "123456789"
        // We are going to look for an x with a one digit number on either side
        for i in 1..<name.count - 1 {
            if name[i] == "x" && numbers.contains(name[i-1]) && numbers.contains(name[i+1]) {
                let widthText = name[i - 1]
                let heightText = name[i + 1]
                
                let interlockWidth = Int(String(widthText)) ?? 0
                let interlockHeight = Int(String(heightText)) ?? 0
                
                return (interlockWidth, interlockHeight)
                
            }
        }
               
        return (0,0)
    }
    
    public static func shapeCode(constraint: ConstraintsShapeModel) -> (String, String) {
        
        let name = constraint.shapeName
        let corner = extractCorner(name: name)
        let (interlockWidth, interlockHeight) = extractInterlockWidthAndHeight(name: name)
        
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
    
    public static func codeHeader(gameId: Int) -> String {
        var code = ""
        
        code += "    public static func Queue_\(gameId)(words: [String], queueLength: Int, priorityFunction: PriorityFunction, wordsToUse: WordsUsedType) -> QueueList {\n\n"
        code += "        let game = GameList().getGame(gameId: \(gameId))!\n\n"

        code += "        let len = WordCalculator.lengths(words: words)\n\n"
        
        code += "        let end = WordCalculator.reverse(words: words)\n\n"
        
        code += "        let scoresMin = StrategyCalculator.GetScoreMins(gameId: \(gameId))\n\n"
        
        code += "        let constraint = ConstraintsModel(\n"
        code += "            scoresMin: scoresMin,\n"
        code += "            wordsMax: words.count,\n"
        code += "            wordsToUse: wordsToUse,\n"
        code += "            queueLengthMax: queueLength,\n"
        code += "            priorityFunction: priorityFunction)\n\n"
             
        code += "        var queue = QueueList(game: game, constraints: constraint)\n\n"
        return code
    }
    
    public static func getConstraintsShapeModels() -> [(Int,[ConstraintsShapeModel])] {
        let gameList = GameList()
        
        var result: [(Int,[ConstraintsShapeModel])] = []
        
        for game in gameList.games {
            
            let proposedShapes = JsonIOCalculator.load(gameId: game.gameId)
            let jsonShapes = JsonIOCalculator.removeShapesThatAreNotAddingWords(jsonShapes: proposedShapes)
            
            
            
            var constraintShapes = loadConstraintShapes(jsonShapes: jsonShapes)
            
            
            
            constraintShapes.sort() { $0.shapeName < $1.shapeName}
            
            let groupByName = Dictionary(grouping: constraintShapes) { $0.shapeName }
            
            var summary: [ConstraintsShapeModel] = []
            for dictionaryItem in groupByName {
                var scoreMin = 9999
                var widthMax = 0
                var heightMax = 0
                for shape in dictionaryItem.value {
                    if shape.scoreMin < scoreMin {
                        scoreMin = shape.scoreMin
                    }
                    if shape.heightMax > heightMax {
                        heightMax = shape.heightMax
                    }
                    if shape.widthMax > widthMax {
                        widthMax = shape.widthMax
                    }
                }
                let summaryItem = ConstraintsShapeModel(shapeName:  dictionaryItem.key, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
                summary.append(summaryItem)
            }
            
            summary.sort() { $0.shapeName < $1.shapeName}
            result.append((game.gameId,summary))
            
            
        }
        
        
        return result
    }
    
    
    
    public static func loadConstraintShapes(jsonShapes: [JsonShapeModel]) -> [ConstraintsShapeModel] {
        
        
        var result:[ConstraintsShapeModel] = []
        for jsonShape in jsonShapes {
            let name = jsonShape.name
            let revisedName = splitName(shapeName: name)
            let width = jsonShape.size.x
            let height = jsonShape.size.y
            let score = jsonShape.score
            
            let constraintShape = ConstraintsShapeModel(shapeName: revisedName,
                                             scoreMin: score,
                                             widthMax: width,
                                             heightMax: height)
            result.append(constraintShape)
            
        }
        return result
    }
    
    public static func splitName(shapeName: String) -> String {
        if shapeName == "Edge" {
            return "edge"
        } else if shapeName.contains("Cluster") {
            let numbers = shapeName.replacingOccurrences(of: "Cluster", with: "")
            let split = numbers.split(separator:"x")
            let a:Int = Int(String(split[0])) ?? 0
            let b:Int = Int(String(split[1])) ?? 0
            
            if a < b {
                return "cluster\(a)x\(b)"
            } else {
                return "cluster\(b)x\(a)"
            }
        } else if shapeName.contains("OpenDonut") {
            let namesAndStyle = shapeName.replacingOccurrences(of: "OpenDonut", with: "")
            let styleSplit = namesAndStyle.split(separator:"_")
            let numbers = styleSplit[0]
            var style = styleSplit[1]
            let split = numbers.split(separator:"x")
            let a:Int = Int(String(split[0])) ?? 0
            let b:Int = Int(String(split[1])) ?? 0
            
            if a < b {
                return "rectangle\(style)\(a)x\(b)"
            } else if a == b {
                
                if style == "BottomLeft" {
                    style = "TopRight"
                }
                // We have to swap around the style for a square
                return "square\(style)\(a)x\(b)"
            } else {
                return "rectangle\(style)\(b)x\(a)"
            }
        } else if shapeName.contains("Donut") {
            let numbers = shapeName.replacingOccurrences(of: "Donut", with: "")
            let split = numbers.split(separator:"x")
            let a:Int = Int(String(split[0])) ?? 0
            let b:Int = Int(String(split[1])) ?? 0
            
            if a == 0 || b == 0 {
                print(shapeName)
            }
            if a < b {
                return "rectangle\(a)x\(b)"
            } else if a == b {
                return "square\(a)x\(b)"
            } else {
                return "rectangle\(b)x\(a)"
            }
        

        } else if shapeName.contains("Outer") {
            let numbers = shapeName.replacingOccurrences(of: "Outer", with: "")
            let split = numbers.split(separator:"x")
            let a:Int = Int(String(split[0])) ?? 0
            let b:Int = Int(String(split[1])) ?? 0
            
            if a < b {
                return "outer\(a)x\(b)"
            } else {
                return "outer\(b)x\(a)"
            }
        } else if shapeName.contains("Pacman") {
            return shapeName
        } else if shapeName.contains("Special") {
            return shapeName.lowercased()
        }
        
        else {
            return shapeName.lowercased()
        }
    }
}
