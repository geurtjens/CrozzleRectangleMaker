//
//  ShapeConstraintFromJsonCalculator.swift
//  
//
//  Created by Michael Geurtjens on 23/6/2023.
//

import Foundation
public class ShapeConstraintFromJsonCalculator {
    
    public static func executeJson() -> String {
        let inputs: [(Int,[ShapeConstraintModel])] = getConstraintsShapeModels()
        let json = makeJson(inputs: inputs)
        return json
    }
    
    
    public static func executeCode() -> String {
        
        let inputs: [(Int,[ShapeConstraintModel])] = getConstraintsShapeModels()
       
        
        let code = ShapeConstraintCodeGen.execute(inputs: inputs)
        
        return code
    }
    
    
    
    public static func makeJson(inputs: [(Int,[ShapeConstraintModel])]) -> String {
        
        var result = ""
        for input in inputs {
            
            let gameId = input.0
            let shapes = input.1
            
            var gameResult = ""
            
            for shape in shapes {
                if gameResult != "" {
                    gameResult += ",\n"
                }
                gameResult += "    {\"name\": \"\(shape.name)\", \"scoreMin\": \(shape.scoreMin), \"widthMax\": \(shape.widthMax), \"heightMax\": \(shape.heightMax)}"
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
    
    
    
    
    
    
    
    public static func getConstraintsShapeModels() -> [(Int,[ShapeConstraintModel])] {
        let gameList = GameList()
        
        var result: [(Int,[ShapeConstraintModel])] = []
        
        for game in gameList.games {
            
            let proposedShapes = JsonIOCalculator.load(gameId: game.gameId)
            let jsonShapes = JsonIOCalculator.removeShapesThatAreNotAddingWords(jsonShapes: proposedShapes)
            
            
            
            var constraintShapes = loadConstraintShapes(jsonShapes: jsonShapes)
            
            
            
            constraintShapes.sort() { $0.name < $1.name}
            
            let groupByName = Dictionary(grouping: constraintShapes) { $0.name }
            
            var summary: [ShapeConstraintModel] = []
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
                let summaryItem = ShapeConstraintModel(name:  dictionaryItem.key, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
                summary.append(summaryItem)
            }
            
            summary.sort() { $0.name < $1.name}
            result.append((game.gameId,summary))
            
            
        }
        
        
        return result
    }
    
    
    
    public static func loadConstraintShapes(jsonShapes: [JsonShapeModel]) -> [ShapeConstraintModel] {
        
        
        var result:[ShapeConstraintModel] = []
        for jsonShape in jsonShapes {
            let name = jsonShape.name
            let revisedName = splitName(shapeName: name)
            let width = jsonShape.size.x
            let height = jsonShape.size.y
            let score = jsonShape.score
            
            let constraintShape = ShapeConstraintModel(name: revisedName,
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
                
                // we have to swap styles between TopRight and BottomLeft because the dimensions are opposite
                if style == "BottomLeft" {
                    style = "TopRight"
                } else if style == "TopRight" {
                    style = "BottomLeft"
                }
                
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
