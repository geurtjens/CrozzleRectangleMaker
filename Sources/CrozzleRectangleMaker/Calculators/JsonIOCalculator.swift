//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 11/6/2023.
//

import Foundation
public class JsonIOCalculator {

    public static var path = "/Users/michaelgeurtjens/Downloads/CrozzleDataFromWinningGames/"
    
    public static func getHeaderBlock(gameId: Int, widthMax: Int, heightMax: Int) -> String {
        var code = ""
        code += "    public static func Shapes_\(gameId)() -> ShapeModel? {\n\n"
        
        code += "        let widthMax = \(widthMax)\n"
        code += "        let heightMax = \(heightMax)\n\n"
        code += "        let gameList = GameList()\n"
        code += "        guard let game = gameList.getGame(gameId: \(gameId)) else {\n"
        code += "            return nil\n"
        code += "        }\n\n"
        code += "        let words = game.winningWords\n"
        code += "        let end = WordCalculator.reverse(words: words)\n"
        code += "        let len = WordCalculator.lengths(words: words)\n\n"
        return code
    }
    
    public static func execute(gameId: Int, winningScore: Int, widthMax: Int, heightMax: Int) -> String {
        var jsonShapes = load(gameId: gameId)
        
        changeNameOrientationToLargerHorizontal(jsonShapes: &jsonShapes)
        let headerBlock = getHeaderBlock(gameId: gameId, widthMax: widthMax, heightMax: heightMax)
        let calculatedBlock = getCalculationBlock(jsonShapes: jsonShapes)
        let shapeFindingBlock = getShapeFindingBlock(jsonShapes: jsonShapes)
        let mergeBlock = getMergeBlock(jsonShapes: jsonShapes)
        
        var code = ""
        code += headerBlock
        
        code += calculatedBlock
        code += shapeFindingBlock + "\n"
        code += mergeBlock
        
        //code += "\n        XCTAssertEqual(\(winningScore), result[0].score)\n"
        code += "        return result\n"
        code += "    }\n"
        code += testCode(gameId: gameId, score: winningScore)
        return code
    }
    public static func testCode(gameId: Int, score: Int) -> String {
        var result = ""
        result += "    func test_Shapes_\(gameId)() {\n"
        result += "        let result = StrategyCalculator.Shapes_\(gameId)()\n"
        result += "        XCTAssertNotNil(result)\n"
        result += "        if let result = result {\n"
        result += "            XCTAssertEqual(\(score), result.score)\n"
        result += "        }\n"
        result += "    }\n\n"
        return result
    }
    
//    public static func convertName(name: String) -> (String, Int, Int) {
//        if name.contains("Cluster") {
//            let number = name.replacingOccurrences(of: "Cluster", with: "")
//
//        } else if name.contains("OpenDonut") {
//            let nameAndDirection = name.replacingOccurrences(of: "OpenDonut", with: "")
//        } else if name.contains("Donut") {
//            let number = name.replacingOccurrences(of: "Donut", with: "")
//        } else if name.contains("Edge") {
//            return ("edge",1,1)
//        } else if name.contains("Pacman3x3") {
//            return ("Pacman3x3",3,3)
//        } else {
//            return ("",0,0)
//        }
//    }
    
    public static func getMergeBlock(jsonShapes: [JsonShapeModel]) -> String {

        var variableNames:[String] = []
        for jsonShape in jsonShapes {
            let words = jsonShape.h + jsonShape.v
            let name = getVariableName(words: words)
            variableNames.append(name)
        }

        var code = ""
        for variableName in variableNames {
            if code != "" {
                code += ",\n"
            }
            code += "            \(variableName)"
        }
        code = "        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes: [\n" + code + "\n        ], words: words)\n"
        
        return code
    }
    /// Loads shapes from a json file
    public static func load(gameId: Int) -> [JsonShapeModel] {
        let filename = "\(path)\(gameId).json"
        let url = URL(fileURLWithPath: filename)

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonShapes = try decoder.decode([JsonShapeModel].self, from: data)
            return jsonShapes
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    
    public static func getCalculationBlock(jsonShapes: [JsonShapeModel]) -> String {
        
        let sorted = jsonShapes.sorted() {
            if $0.name == $1.name {
                return $0.score < $1.score
            } else {
                return $0.name < $1.name
            }
        }
        
        let shapesAndMinScores = getShapeNamesAndMinScores(jsonShapes: sorted)
        
        var result: [String] = []
        for (name, score) in shapesAndMinScores {
            let code = getShapesGen(shapeName: name, minScore: score)
            
            result.append(code)
        }
        
        result.sort()
        var text = ""
        for code in result {
            text += code
        }
        
        return text
    }
    
    /// We cannot handle a 4x3 structure and so it must be changed to a 3x4 structure
    public static func changeNameOrientationToLargerHorizontal(jsonShapes: inout [JsonShapeModel]) {
        for i in 0..<jsonShapes.count {
            switch jsonShapes[i].name {
            case "Donut4x3":
                jsonShapes[i].name = "Donut3x4"
            case "Donut5x3":
                jsonShapes[i].name = "Donut3x5"
            case "Donut6x3":
                jsonShapes[i].name = "Donut3x6"
            case "Donut5x4":
                jsonShapes[i].name = "Donut4x5"
            case "Donut6x5":
                jsonShapes[i].name = "Donut5x6"
                
            case "Cluster3x2":
                jsonShapes[i].name = "Cluster2x3"
            case "Cluster4x2":
                jsonShapes[i].name = "Cluster2x4"
            case "Cluster5x2":
                jsonShapes[i].name = "Cluster2x5"
            case "Cluster6x2":
                jsonShapes[i].name = "Cluster2x6"
                
            case "Cluster4x3":
                jsonShapes[i].name = "Cluster3x4"
            case "Cluster5x3":
                jsonShapes[i].name = "Cluster3x5"
            case "Cluster6x3":
                jsonShapes[i].name = "Cluster3x6"
            case "Cluster5x4":
                jsonShapes[i].name = "Cluster4x5"
            case "Cluster6x5":
                jsonShapes[i].name = "Cluster5x6"
                
            case "OpenDonut4x3_TopLeft":
                jsonShapes[i].name = "OpenDonut3x4_TopLeft"
            case "OpenDonut5x3_TopLeft":
                jsonShapes[i].name = "OpenDonut3x5_TopLeft"
            case "OpenDonut5x4_TopLeft":
                jsonShapes[i].name = "OpenDonut4x5_TopLeft"
            case "OpenDonut6x3_TopLeft":
                jsonShapes[i].name = "OpenDonut3x6_TopLeft"
            case "OpenDonut6x4_TopLeft":
                jsonShapes[i].name = "OpenDonut4x6_TopLeft"
            case "OpenDonut6x5_TopLeft":
                jsonShapes[i].name = "OpenDonut5x6_TopLeft"
                
            case "OpenDonut4x3_BottomRight":
                jsonShapes[i].name = "OpenDonut3x4_BottomRight"
            case "OpenDonut5x3_BottomRight":
                jsonShapes[i].name = "OpenDonut3x5_BottomRight"
            case "OpenDonut5x4_BottomRight":
                jsonShapes[i].name = "OpenDonut4x5_BottomRight"
            case "OpenDonut6x3_BottomRight":
                jsonShapes[i].name = "OpenDonut3x6_BottomRight"
            case "OpenDonut6x4_BottomRight":
                jsonShapes[i].name = "OpenDonut4x6_BottomRight"
            case "OpenDonut6x5_BottomRight":
                jsonShapes[i].name = "OpenDonut5x6_BottomRight"
                
            case "OpenDonut4x3_TopRight":
                jsonShapes[i].name = "OpenDonut3x4_BottomLeft"
            case "OpenDonut5x3_TopRight":
                jsonShapes[i].name = "OpenDonut3x5_BottomLeft"
            case "OpenDonut5x4_TopRight":
                jsonShapes[i].name = "OpenDonut4x5_BottomLeft"
            case "OpenDonut6x3_TopRight":
                jsonShapes[i].name = "OpenDonut3x6_BottomLeft"
            case "OpenDonut6x4_TopRight":
                jsonShapes[i].name = "OpenDonut4x6_BottomLeft"
            case "OpenDonut6x5_TopRight":
                jsonShapes[i].name = "OpenDonut5x6_BottomLeft"
                
                // BottomLeft is opposite to TopRight
            case "OpenDonut4x3_BottomLeft":
                jsonShapes[i].name = "OpenDonut3x4_TopRight"
            case "OpenDonut5x3_BottomLeft":
                jsonShapes[i].name = "OpenDonut3x5_TopRight"
            case "OpenDonut5x4_BottomLeft":
                jsonShapes[i].name = "OpenDonut4x5_TopRight"
            case "OpenDonut6x3_BottomLeft":
                jsonShapes[i].name = "OpenDonut3x6_TopRight"
            case "OpenDonut6x4_BottomLeft":
                jsonShapes[i].name = "OpenDonut4x6_TopRight"
            case "OpenDonut6x5_BottomLeft":
                jsonShapes[i].name = "OpenDonut5x6_TopRight"
                
            default:
                break
            }
        }
    }
    
    
    public static func getShapeNamesAndMinScores(jsonShapes: [JsonShapeModel]) -> [(String,Int)] {
        if jsonShapes.count == 0 {
            return []
        }

        var result:[(String,Int)] = []
        var previous = jsonShapes[0]
        var current = jsonShapes[0]
        for i in 1..<jsonShapes.count {
            current = jsonShapes[i]
            if previous.name != current.name {
                result.append((previous.name, previous.score))
                previous = current
            }
        }
        if result.count > 0 && result[result.count-1].0 != previous.name {
            result.append((previous.name, previous.score))
        }
        return result
    }
    
    
    public static func clusterGen(shapeName: String, minScore: Int) -> String {
        let size = shapeName.replacingOccurrences(of: "Cluster", with: "")
        
        let (width, height, _) = getNumbers(numbers: size)
        
        var code = ""
        code += "        let c\(width)x\(height) = ShapeCalculator.toShapes(clusters: ClusterCalculator.C\(width)x\(height)(\n"
        code += "           start: words,\n"
        code += "           end: end,\n"
        code += "           len: len,\n"
        code += "           scoreMin: \(minScore),\n"
        code += "           widthMax: widthMax,\n"
        code += "           heightMax: heightMax))\n\n"
        return code
    }
    
    public static func edgeGen(minScore: Int) -> String {
        var code = ""
        code += "        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(\n"
        code += "            words: words,\n"
        code += "            scoreMin: \(minScore),\n"
        code += "            widthMax: widthMax,\n"
        code += "            heightMax: heightMax))\n\n"
        
        return code
    }
    
    public static func getNumbers(numbers: String) -> (Int, Int, Bool) {
        let split = numbers.split(separator:"x")
        
        let width = Int(split[0]) ?? 0
        let height = Int(split[1]) ?? 0
        
        /// is it swapped
        if width > height {
            return (height, width, true)
        } else {
            return (width, height, false)
        }
        
        
    }
    
    
    public static func openDonutGen(name: String, minScore: Int) -> String {
        
        let variableName = openDonutName(name: name)
        
        let numberAndAngle = name.replacingOccurrences(of: "OpenDonut", with: "")
        
        let underscore = numberAndAngle.split(separator:"_")
        
        let numbers = underscore[0]
        var angle = underscore[1]
        
        let (width,height,swapped) = getNumbers(numbers: String(numbers))
        
        if width == height {
            if angle == "BottomLeft" {
                angle = "TopRight"
            }
            
           
            
            // We have a square
            var code = ""
            code += "        let \(variableName) = ShapeCalculator.toShapes(rectangles:RectangleCalculator.\(angle)Square(\n"
            code += "            interlockWidth: \(width - 1),\n"
            code += "            words: words,\n"
            code += "            lengths: len,\n"
            code += "            scoreMin: \(minScore),\n"
            code += "            widthMax: widthMax,\n"
            code += "            heightMax: heightMax))\n\n"
            return code
        } else {
            
            if swapped {
                if angle == "BottomLeft" {
                    angle = "TopRight"
                } else if angle == "TopRight" {
                    angle = "BottomLeft"
                }
            }
            var code = ""
            code += "        let \(variableName) = ShapeCalculator.toShapes(rectangles:RectangleCalculator.\(angle)Rectangle(\n"
            code += "            interlockWidth: \(width - 1),\n"
            code += "            interlockHeight: \(height - 1),\n"
            code += "            words: words,\n"
            code += "            lengths: len,\n"
            code += "            scoreMin: \(minScore),\n"
            code += "            widthMax: widthMax,\n"
            code += "            heightMax: heightMax))\n\n"
            
            return code
        }
    }
    
    
    public static func donutGen(name: String, minScore: Int) -> String {
        
        let variableName = donutName(name: name)
        
        let numbers = name.replacingOccurrences(of: "Donut", with: "")
        
        let (width, height, _) = getNumbers(numbers: String(numbers))
        
        if width == height {

            var code = ""
            code += "        let \(variableName) = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(\n"
            code += "            interlockWidth: \(width - 1),\n"
            code += "            words: words,\n"
            code += "            lengths: len,\n"
            code += "            scoreMin: \(minScore),\n"
            code += "            widthMax: widthMax,\n"
            code += "            heightMax: heightMax))\n\n"
            return code
            
        } else {
            
            var code = ""
            code += "        let \(variableName) = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(\n"
            code += "            interlockWidth: \(width - 1),\n"
            code += "            interlockHeight: \(height - 1),\n"
            code += "            words: words,\n"
            code += "            lengths: len,\n"
            code += "            scoreMin: \(minScore),\n"
            code += "            widthMax: widthMax,\n"
            code += "            heightMax: heightMax))\n\n"
            
            return code
        }
    }
    
    public static func pacmanGen(name: String, minScore: Int) -> String {
        
        let variableName = pacmanName(name: name)
        
        let numberAndAngle = name.replacingOccurrences(of: "Pacman", with: "")
        
        let underscore = numberAndAngle.split(separator:"_")
        
        //let numbers = underscore[0]
        let angle = underscore[1]
        
        //let (width,height) = getNumbers(numbers: String(numbers))
        
        var code = ""
        code += "        let \(variableName) = ShapeCalculator.toShapes(pacmans: PacmanCalculator.\(angle)(\n"
        code += "            start: words,\n"
        code += "            end: end,\n"
        code += "            len: len,\n"
        code += "            scoreMin: \(minScore),\n"
        code += "            widthMax: widthMax,\n"
        code += "            heightMax: heightMax))\n\n"
        
        return code
    }
    
    
    public static func convertShapeName(shapeName: String) -> String {
        if shapeName == "Edge" {
            return "edges"
        } else if shapeName.contains("Cluster") {
            return clusterName(name: shapeName)
        } else if shapeName.contains("OpenDonut") {
            return openDonutName(name: shapeName)
        } else if shapeName.contains("Donut") {
            return donutName(name: shapeName)
        } else if shapeName.contains("Pacman") {
            return pacmanName(name: shapeName)
        } else {
            return shapeName
        }
    }
    public static func clusterName(name: String) -> String {
        let numbers = name.replacingOccurrences(of: "Cluster", with: "")
        
        let (width, height, _) = getNumbers(numbers: String(numbers))
        /// In clusters the biggest one is last
        return "c\(width)x\(height)"
    }
    public static func donutName(name: String) -> String {
        let numbers = name.replacingOccurrences(of: "Donut", with: "")
        
        let (width, height, _) = getNumbers(numbers: String(numbers))
        
        if width == height {
            return "square\(width)x\(height)"
        } else {
            return "rectangle\(width)x\(height)"
        }
    }
    public static func openDonutName(name: String) -> String {
        let numberAndAngle = name.replacingOccurrences(of: "OpenDonut", with: "")
        
        let underscore = numberAndAngle.split(separator:"_")
        
        let numbers = underscore[0]
        let angle = underscore[1]
        
        let (width, height, _) = getNumbers(numbers: String(numbers))
        
        if width == height {
            return "square\(width)x\(height)_\(angle)"
        } else {
            return "rectangle\(width)x\(height)_\(angle)"
        }
    }
    public static func pacmanName(name: String) -> String {
        let numberAndAngle = name.replacingOccurrences(of: "Pacman", with: "")
        
        let underscore = numberAndAngle.split(separator:"_")
        
        let numbers = underscore[0]
        let angle = underscore[1]
        
        let (width, height, _) = getNumbers(numbers: String(numbers))

        return "pacman\(width)x\(height)_\(angle)"
        
    }
    
    
    
    
    public static func getShapesGen(shapeName: String, minScore: Int) -> String {
        if shapeName == "Edge" {
            return edgeGen(minScore: minScore)
        } else if shapeName.contains("Cluster") {
            return clusterGen(shapeName: shapeName, minScore: minScore)
        } else if shapeName.contains("OpenDonut") {
            return openDonutGen(name: shapeName, minScore: minScore)
        } else if shapeName.contains("Donut") {
            return donutGen(name: shapeName, minScore: minScore)
        } else if shapeName.contains("Pacman") {
            return pacmanGen(name: shapeName, minScore: minScore)
        }
        switch shapeName {
        case "Special8703":
            return ""
        case "Special8805":
            return ""
        case "Special9002":
            return ""
        case "Special9102":
            return ""
        case "Special9109":
            return ""
           
        case "Special9605":
            return ""
        
        default:
            return "MISSING \(shapeName)\n\n"
        }
    }
    public static func getShapeFindingBlock(jsonShapes: [JsonShapeModel]) -> String {
        var result = ""
        for jsonShape in jsonShapes {
            let code = getShapeFinding(jsonShape: jsonShape) + "\n"
            result += code
        }
        return result
    }
    
    
        
    public static func getWords(jsonShape: JsonShapeModel) -> [String] {
        let words = jsonShape.h + jsonShape.v
        var result: [String] = []
        for word in words {
            result.append(word.uppercased())
        }
        return result
    }
    
    
    public static func getVariableName(words: [String]) -> String {
        var result = ""
        for word in words {
            if result != "" {
                result += "_"
            }
            result += word.lowercased()
        }
        return result
    }

    public static func getShapeFinding(jsonShape: JsonShapeModel) -> String {
        let words = getWords(jsonShape: jsonShape)
        let convertedShapeName = convertShapeName(shapeName: jsonShape.name)
        let variableName = getVariableName(words: words)
        let code = getVariableString(variableName: variableName, convertedShapeName: convertedShapeName, uppercasedWords: words)
        return code
    }
    
    public static func getVariableString(variableName: String, convertedShapeName: String, uppercasedWords: [String]) -> String {
        let code = "        let \(variableName) = \(convertedShapeName).containing(\(uppercasedWords), from: words)[0]"
        return code
    }
    
    
}
