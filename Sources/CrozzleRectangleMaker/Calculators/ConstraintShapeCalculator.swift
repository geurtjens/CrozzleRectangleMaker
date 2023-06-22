//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 23/6/2023.
//

import Foundation
public class ConstraintShapeCalculator {
    
    public static func makeShapeConstraints() -> String {
        let gameList = GameList()
        
        var result = ""
        
        for game in gameList.games {
            
            let proposedShapes = JsonIOCalculator.load(gameId: game.gameId)
            let jsonShapes = JsonIOCalculator.removeShapesThatAreNotAddingWords(jsonShapes: proposedShapes)
            
            
            
            var constraintShapes = loadConstraintShapes(jsonShapes: jsonShapes)
            
            
            
            constraintShapes.sort() { $0.shapeName < $1.shapeName}
            
            //print(constraintShapes)
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
            
            
            
            //print("")
            
            // We can do a group by and then we can count the lowest score and biggest width and height
            //print("{ \"gameId\": game.gameId, shapes: [")
            
            var gameResult = ""
            
            let sortedSummary = summary.sorted() { $0.shapeName < $1.shapeName}
            for shape in sortedSummary {
                if gameResult != "" {
                    gameResult += ",\n"
                }
                gameResult += "    {\"name\": \"\(shape.shapeName)\", \"scoreMin\": \(shape.scoreMin), \"widthMax\": \(shape.widthMax), \"heightMax\": \(shape.heightMax)}"
            }
            gameResult = "{\"gameId\": \(game.gameId), \"shapes\": [\n" + gameResult + "\n]}"
            
            if result != "" {
                result += ",\n"
            }
            result += gameResult
        }
        result = "[\n\(result)\n]"
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
            return shapeName.lowercased()
        } else if shapeName.contains("Special") {
            return shapeName.lowercased()
        }
        
        else {
            return shapeName.lowercased()
        }
    }
}
