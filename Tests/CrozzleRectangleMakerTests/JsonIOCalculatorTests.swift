//
//  JsonIOCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 11/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class JsonIOCalculatorTests: XCTestCase {

    func test_JsonLoadingStuff() throws {
        let filename = "/Users/michaelgeurtjens/Downloads/CrozzleDataFromWinningGames/8710.json"
        
        let url = URL(fileURLWithPath: filename)

        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            let decoder = JSONDecoder()
            
                do {
                    let jsonShapes = try decoder.decode([JsonShapeModel].self, from: data)
                    // first lets work out all the shapes
                    var shapeNames: [String] = []
                    for shape in jsonShapes {
                        if shapeNames.contains(shape.name) == false {
                            shapeNames.append(shape.name)
                        }
                    }
                    
                    var text = ""
                    for shapeName in shapeNames {
                        switch shapeName {
                        case "Edge":
                            var code = ""
                            code += "        let edges = ShapeCalculator.toShapes(edges: EdgeCalculator.Execute(\n"
                            code += "            words: words,\n"
                            code += "            scoreMin: 0,\n"
                            code += "            widthMax: widthMax,\n"
                            code += "            heightMax: heightMax))\n\n"
                            
                            text += code
                        case "Donut3x3":
                            var code = ""
                            code += "        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Square(\n"
                            code += "            interlockWidth: 2,\n"
                            code += "            words: words,\n"
                            code += "            lengths: len,\n"
                            code += "            scoreMin: 0,\n"
                            code += "            widthMax: widthMax,\n"
                            code += "            heightMax: heightMax))\n\n"
                            
                            text += code
                        case "Donut3x4":
                            var code = ""
                            code += "        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(\n"
                            code += "            interlockWidth: 2,\n"
                            code += "            interlockHeight: 3,\n"
                            code += "            words: words,\n"
                            code += "            lengths: len,\n"
                            code += "            scoreMin: 0,\n"
                            code += "            widthMax: widthMax,\n"
                            code += "            heightMax: heightMax))\n\n"
                            
                            text += code
                        case "Donut4x5":
                            var code = ""
                            code += "        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.Rectangle(\n"
                            code += "            interlockWidth: 3,\n"
                            code += "            interlockHeight: 4,\n"
                            code += "            words: words,\n"
                            code += "            lengths: len,\n"
                            code += "            scoreMin: 0,\n"
                            code += "            widthMax: widthMax,\n"
                            code += "            heightMax: heightMax))\n\n"
                            
                            text += code
                        case "OpenDonut4x3_TopRight":
                            var code = ""
                            code += "        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculator.TopRightRectangle(\n"
                            code += "            interlockWidth: 2,\n"
                            code += "            interlockHeight: 3,\n"
                            code += "            words: words,\n"
                            code += "            lengths: len,\n"
                            code += "            scoreMin: 0,\n"
                            code += "            widthMax: widthMax,\n"
                            code += "            heightMax: heightMax))\n\n"
                            
                            text += code
                        default:
                            text += "MISSING \(shapeName)"
                        }
                        
                    }
                    print(text)
                    
                    var variableNames: [String] = []
                    
                    for shape in jsonShapes {
                        let words = shape.h + shape.v
                        
                        var variableName = ""
                        var upperWords: [String] = []
                        
                        for word in words {
                            upperWords.append(word.uppercased())
                            if variableName != "" {
                                variableName += "_"
                            }
                            variableName += word.lowercased()
                            
                        }
                        variableNames.append(variableName)
                        print("        let \(variableName) = \(shape.name).containing(\(upperWords), from: words)[0]\n")
                        
                        
                    }
                    print("        let result = MergeShapesCalculator.Merge_Sequence_Of_Shapes(shapes:[")
                    
                    for variableName in variableNames {
                        print("            \(variableName),")
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
            
        } catch {
            print("Cant find file")
        }
        
        
    }

}
