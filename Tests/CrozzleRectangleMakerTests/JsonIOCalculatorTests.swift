//
//  JsonIOCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 11/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class JsonIOCalculatorTests: XCTestCase {

    func test_GetAllNames() throws {
        
        var names:[String] = []
        let gameList = GameList()
        for game in gameList.games {
            let gameId = game.gameId
            
            let jsonShapes = JsonIOCalculator.load(gameId: gameId)
            for shape in jsonShapes {
                if names.contains(shape.name) == false {
                    names.append(shape.name)
                }
            }
        }
        names.sort()
        print(names)
    }
    
    func test_JsonAll() throws {
        var codes:[String] = []
        let gameList = GameList()
        
        for game in gameList.games {
            
            let code = JsonIOCalculator.execute(gameId: game.gameId, winningScore: game.winningScore, widthMax: game.maxWidth, heightMax: game.maxHeight)
            codes.append(code)
        }
        var result = ""
        for code in codes {
            result += code + "\n\n"
        }
        print(result)
    }
    
    
//    func test_8612() throws {
//        print(JsonIOCalculator.execute(gameId: 8612, winningScore: 694, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_8702() throws {
//        print(JsonIOCalculator.execute(gameId: 8702, winningScore: 726, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_8703() throws {
//        print(JsonIOCalculator.execute(gameId: 8703, winningScore: 758, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_8704() throws {
//        print(JsonIOCalculator.execute(gameId: 8704, winningScore: 704, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_8710() throws {
//        print(JsonIOCalculator.execute(gameId: 8710, winningScore: 764, widthMax: 17, heightMax: 12))
//    }
//    func test_8711() throws {
//        print(JsonIOCalculator.execute(gameId: 8711, winningScore: 810, widthMax: 17, heightMax: 12))
//    }
//    func test_8712() throws {
//        print(JsonIOCalculator.execute(gameId: 8712, winningScore: 680, widthMax: 17, heightMax: 12))
//    }
//    func test_8802() throws {
//        print(JsonIOCalculator.execute(gameId: 8802, winningScore: 720, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_8803() throws {
//        print(JsonIOCalculator.execute(gameId: 8803, winningScore: 626, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_8804() throws {
//        print(JsonIOCalculator.execute(gameId: 8804, winningScore: 836, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_8806() throws {
//        print(JsonIOCalculator.execute(gameId: 8806, winningScore: 816, widthMax: 17, heightMax: 12))
//    }
//    
    func test_8808() throws {
        print(JsonIOCalculator.execute(gameId: 8808, winningScore: 696, widthMax: 17, heightMax: 12))
    }
    
    //    func test_8809() throws {
//        print(JsonIOCalculator.execute(gameId: 8809, winningScore: 676, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_8810() throws {
//        print(JsonIOCalculator.execute(gameId: 8810, winningScore: 716, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_8811() throws {
//        print(JsonIOCalculator.execute(gameId: 8811, winningScore: 630, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_8812() throws {
//        print(JsonIOCalculator.execute(gameId: 8812, winningScore: 720, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_8902() throws {
//        print(JsonIOCalculator.execute(gameId: 8902, winningScore: 746, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_8903() throws {
//        print(JsonIOCalculator.execute(gameId: 8903, winningScore: 652, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_8904() throws {
//        print(JsonIOCalculator.execute(gameId: 8904, winningScore: 768, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_8905() throws {
//        print(JsonIOCalculator.execute(gameId: 8905, winningScore: 764, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_8906() throws {
//        print(JsonIOCalculator.execute(gameId: 8906, winningScore: 760, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_8908() {
//        print(JsonIOCalculator.execute(gameId: 8908, winningScore: 634, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_8909() {
//        print(JsonIOCalculator.execute(gameId: 8909, winningScore: 616, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_8911() {
//        print(JsonIOCalculator.execute(gameId: 8911, winningScore: 692, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_8912() {
//        print(JsonIOCalculator.execute(gameId: 8912, winningScore: 678, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9001() {
//        print(JsonIOCalculator.execute(gameId: 9001, winningScore: 612, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9003() {
//        print(JsonIOCalculator.execute(gameId: 9003, winningScore: 672, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9004() {
//        print(JsonIOCalculator.execute(gameId: 9004, winningScore: 720, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9005() {
//        print(JsonIOCalculator.execute(gameId: 9005, winningScore: 734, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9006() {
//        print(JsonIOCalculator.execute(gameId: 9006, winningScore: 686, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9007() {
//        print(JsonIOCalculator.execute(gameId: 9007, winningScore: 626, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9009() {
//        print(JsonIOCalculator.execute(gameId: 9009, winningScore: 736, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9010() {
//        print(JsonIOCalculator.execute(gameId: 9010, winningScore: 722, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9011() {
//        print(JsonIOCalculator.execute(gameId: 9011, winningScore: 652, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9012() {
//        print(JsonIOCalculator.execute(gameId: 9012, winningScore: 634, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9101() {
//        print(JsonIOCalculator.execute(gameId: 9101, winningScore: 734, widthMax: 17, heightMax: 12))
//    }
//    func test_9103() {
//        print(JsonIOCalculator.execute(gameId: 9103, winningScore: 518, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9104() {
//        print(JsonIOCalculator.execute(gameId: 9104, winningScore: 728, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9105() {
//        print(JsonIOCalculator.execute(gameId: 9105, winningScore: 506, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9106() {
//        print(JsonIOCalculator.execute(gameId: 9106, winningScore: 676, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9107() {
//        print(JsonIOCalculator.execute(gameId: 9107, winningScore: 710, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9108() {
//        print(JsonIOCalculator.execute(gameId: 9108, winningScore: 696, widthMax: 17, heightMax: 12))
//    }
//    
////    func test_9109() {
////        print(JsonIOCalculator.execute(gameId: 9109, winningScore: 636, widthMax: 17, heightMax: 12))
////    }
//    func test_9110() {
//        print(JsonIOCalculator.execute(gameId: 9110, winningScore: 598, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9111() {
//        print(JsonIOCalculator.execute(gameId: 9111, winningScore: 616, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9112() {
//        print(JsonIOCalculator.execute(gameId: 9112, winningScore: 552, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9201() {
//        print(JsonIOCalculator.execute(gameId: 9201, winningScore: 522, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9202() {
//        print(JsonIOCalculator.execute(gameId: 9202, winningScore: 558, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9203() {
//        print(JsonIOCalculator.execute(gameId: 9203, winningScore: 548, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9205() {
//        print(JsonIOCalculator.execute(gameId: 9205, winningScore: 506, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9206() {
//        print(JsonIOCalculator.execute(gameId: 9206, winningScore: 590, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9207() {
//        print(JsonIOCalculator.execute(gameId: 9207, winningScore: 518, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9208() {
//        print(JsonIOCalculator.execute(gameId: 9208, winningScore: 532, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9210() {
//        print(JsonIOCalculator.execute(gameId: 9210, winningScore: 626, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9211() {
//        print(JsonIOCalculator.execute(gameId: 9211, winningScore: 602, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9212() {
//        print(JsonIOCalculator.execute(gameId: 9212, winningScore: 576, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9301() {
//        print(JsonIOCalculator.execute(gameId: 9301, winningScore: 636, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9302() {
//        print(JsonIOCalculator.execute(gameId: 9302, winningScore: 524, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9303() {
//        print(JsonIOCalculator.execute(gameId: 9303, winningScore: 654, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9304() {
//        print(JsonIOCalculator.execute(gameId: 9304, winningScore: 676, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9305() {
//        print(JsonIOCalculator.execute(gameId: 9305, winningScore: 632, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9306() {
//        print(JsonIOCalculator.execute(gameId: 9306, winningScore: 554, widthMax: 17, heightMax: 12))
//    }
//    func test_9307() {
//        print(JsonIOCalculator.execute(gameId: 9307, winningScore: 610, widthMax: 17, heightMax: 12))
//    }
//    func test_9308() {
//        print(JsonIOCalculator.execute(gameId: 9308, winningScore: 598, widthMax: 17, heightMax: 12))
//    }
//    func test_9309() {
//        print(JsonIOCalculator.execute(gameId: 9309, winningScore: 570, widthMax: 17, heightMax: 12))
//    }
//    func test_9310() {
//        print(JsonIOCalculator.execute(gameId: 9310, winningScore: 440, widthMax: 17, heightMax: 12))
//    }
//    func test_9311() {
//        print(JsonIOCalculator.execute(gameId: 9311, winningScore: 552, widthMax: 17, heightMax: 12))
//    }
//    func test_9312() {
//        print(JsonIOCalculator.execute(gameId: 9312, winningScore: 506, widthMax: 17, heightMax: 12))
//    }
//    
//    func test_9401() {
//        print(JsonIOCalculator.execute(gameId: 9401, winningScore: 656, widthMax: 17, heightMax: 15))
//    }
//    
//    func test_9402() {
//        print(JsonIOCalculator.execute(gameId: 9402, winningScore: 636, widthMax: 17, heightMax: 15))
//    }
//    
//    func test_9403() {
//        print(JsonIOCalculator.execute(gameId: 9403, winningScore: 710, widthMax: 17, heightMax: 15))
//    }
//    
    func test_9404() {
        print(JsonIOCalculator.execute(gameId: 9404, winningScore: 740, widthMax: 17, heightMax: 15))
    }
//    
//    func test_9406() {
//        print(JsonIOCalculator.execute(gameId: 9406, winningScore: 718, widthMax: 17, heightMax: 15))
//    }
//    
//    func test_9408() {
//        print(JsonIOCalculator.execute(gameId: 9408, winningScore: 828, widthMax: 17, heightMax: 15))
//    }
//    
//    func test_9409() {
//        print(JsonIOCalculator.execute(gameId: 9409, winningScore: 766, widthMax: 17, heightMax: 15))
//    }
//    
//    func test_9410() {
//        print(JsonIOCalculator.execute(gameId: 9410, winningScore: 688, widthMax: 17, heightMax: 15))
//    }
//    
//    func test_9411() {
//        print(JsonIOCalculator.execute(gameId: 9411, winningScore: 696, widthMax: 17, heightMax: 15))
//    }
//    
//    func test_9412() {
//        print(JsonIOCalculator.execute(gameId: 9412, winningScore: 874, widthMax: 17, heightMax: 15))
//    }
//    
//    func test_9501() {
//        print(JsonIOCalculator.execute(gameId: 9501, winningScore: 800, widthMax: 17, heightMax: 15))
//    }
//    
//    func test_9502() {
//        print(JsonIOCalculator.execute(gameId: 9502, winningScore: 654, widthMax: 17, heightMax: 15))
//    }
//    
//    func test_9503() {
//        print(JsonIOCalculator.execute(gameId: 9503, winningScore: 746, widthMax: 17, heightMax: 15))
//    }
//    
//    func test_9504() {
//        print(JsonIOCalculator.execute(gameId: 9504, winningScore: 824, widthMax: 17, heightMax: 15))
//    }
//    
//    func test_9505() {
//        print(JsonIOCalculator.execute(gameId: 9505, winningScore: 748, widthMax: 17, heightMax: 15))
//    }
//    
//    func test_9506() {
//        print(JsonIOCalculator.execute(gameId: 9506, winningScore: 706, widthMax: 17, heightMax: 15))
//    }
//    
//    func test_9509() {
//        print(JsonIOCalculator.execute(gameId: 9509, winningScore: 762, widthMax: 17, heightMax: 15))
//    }
//    
//    func test_9510() {
//        print(JsonIOCalculator.execute(gameId: 9510, winningScore: 706, widthMax: 17, heightMax: 15))
//    }
//    
//    func test_9511() {
//        print(JsonIOCalculator.execute(gameId: 9511, winningScore: 772, widthMax: 17, heightMax: 15))
//    }
//    
//    func test_9512() {
//        print(JsonIOCalculator.execute(gameId: 9512, winningScore: 764, widthMax: 17, heightMax: 15))
//    }
//    
//    func test_9602() {
//        print(JsonIOCalculator.execute(gameId: 9602, winningScore: 844, widthMax: 17, heightMax: 15))
//    }
//    
//    func test_9603() {
//        print(JsonIOCalculator.execute(gameId: 9603, winningScore: 680, widthMax: 17, heightMax: 15))
//    }
    
    func test_JsonLoadingStuff() throws {
        let filename = "/Users/michaelgeurtjens/Downloads/CrozzleDataFromWinningGames/8710.json"
        
        let url = URL(fileURLWithPath: filename)

        do {
            let data = try Data(contentsOf: url)
            //let json = try JSONSerialization.jsonObject(with: data, options: [])
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
