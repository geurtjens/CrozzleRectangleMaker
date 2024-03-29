//
//  WinningShapesCalculator.swift
//  
//
//  Created by Michael Geurtjens on 14/6/2023.
//

import Foundation
public class WinningShapesCalculatorV1 {
    
    public static func getShapesWinningWords(gameId: Int) -> ([ShapeModel],[String],Int,Int) {
        let game = GameList().getGame(gameId: gameId)!
        return getShapes(gameId: gameId, words: game.winningWords)
    }
    
    public static func getShapesAllWords(gameId: Int) -> ([ShapeModel],[String],Int,Int) {
        let game = GameList().getGame(gameId: gameId)!
        return getShapes(gameId: gameId, words: game.words)
    }
    
    public static func getScoresForWinningShapes(gameId: Int) -> [Int] {
        switch (gameId) {
        case 8612:
            return [136,52,52,64,148,124,52,36,90,52,28,24,24,36,22]
        case 8704:
            return [136,36,104,92,104,96,72,72,24,100,28,52,22]
        case 8705:
            return [132,52,66,88,106,74,52,78,80,24,28]
        case 8710:
            return [100,102,132,80,72,84,90,104,84,74,24,36,36,22,22,52]
        case 8711:
            return [204,52,116,96,82,96,82,24,118,82,74,60,22,22,36,28,22]
        case 8712:
            return [118,108,82,108,78,74,96,80,92,36,28]
        case 8802:
            return [120,80,148,74,92,36,82,36,60,36,28]
        case 8803:
            return [144,88,52,66,68,28,24,28,36,56,136,96,88,24]
        case 8804:
            return [124,122,52,28,36,68,84,74,122,76,82,22,108,74,80,24,24,36]
        case 8805:
            return [118,172,76,74,88,36,116,28,24,22,28,52,22,36,22,36,28]
        case 8806:
            return [114,98,108,52,66,88,62,36,36,36,64,52,22,36,52,24,28,78,36]
        case 8807:
            return [146,112,104,52,52,36,36,90,28,28,22,96,112,28,36,22]
        case 8808:
            return [190,136,74,68,36,36,28,88,28,122,36,36,28,48]
        case 8809:
            return [124,126,52,112,68,72,104,76,76,68,24,28,36,22,28]
        case 8810:
            return [84,96,66,70,36,36,28,114,24,24,98,84,52,36,36]
        case 8811:
            return [142,60,52,54,84,92,28,66,82,80,36,28,36]
        case 8812:
            return [118,70,76,66,152,28,36,36,72,86,82,36,60,24]
        case 8902:
            return [132,132,36,28,154,98,36,88,36,28,52,28,36,76,74]
        case 8903:
            return [84,96,100,82,52,82,36,82,36,52,28,84,24]
        case 8904:
            return [84,168,36,36,22,36,126,28,28,76,52,22,52,88,78]
        case 8905:
            return [128,160,66,120,114,36,36,28,28,36,68,36,84,52,28,22]
        case 8906:
            return [162,66,62,36,66,144,52,52,28,22,52,36,36,28,36,36,36,24]
        case 8907:
            return [180,84,74,66,116,58,140,36,36,36,28,24,36,78,28,36,28,28]
        case 8908:
            return [116,104,94,36,36,78,36,36,36,36,36,28,24,52,22,22]
        case 8909:
            return [148,120,52,28,36,22,28,76,132,92,66,88,28]
        case 8910:
            return [100,186,108,28,28,70,108,36,52,28,28,52]
        case 8911:
            return [120,138,52,142,36,28,36,78,36,36,22,28,22,36,22,62]
        case 8912:
            return [116,86,128,90,24,90,106,96,36,36,84,36]
        case 9001:
            return [146,36,28,28,52,24,22,84,52,36,90,70,36,36,22]
        case 9002:
            return [124,98,212,178,106,36,36,28,24]
        case 9003:
            return [146,84,126,28,52,28,52,24,28,82,84,66,52,22,108]
        case 9004:
            return [84,96,52,52,88,96,54,80,28,136,28,28,22,36]
        case 9005:
            return [136,102,132,128,90,88,74,22,68,52,82]
        case 9006:
            return [136,84,98,74,80,88,68,36,74,36,28,70,22,36,24,22]
        case 9007:
            return [138,62,134,58,100,96,36,36,92,36,36]
        case 9008:
            return [130,80,66,94,92,36,92,58,80,28,22,52,36]
        case 9009:
            return [112,84,150,82,52,82,96,84,60,22,36,36,36,22]
        case 9010:
            return [116,24,170,74,94,66,78,36,36,36,100,72,36,36,24]
        case 9011:
            return [136,52,104,64,52,36,36,98,96,94,74,28,28,24]
        case 9012:
            return [104,74,28,28,52,72,80,78,100,92,72,62,22]
        case 9101:
            return [168,74,36,82,28,36,22,186,36,80,52,22,28]
        case 9102:
            return [214,24,56,84,36,28,28,96,136,96,28,74,24]
        case 9103:
            return [90,92,62,66,82,84,72,52,36,52,22]
        case 9104:
            return [84,140,128,112,82,70,36,78,36,28,28,28,22,68]
        case 9105:
            return [98,52,100,90,28,116,74,80,60]
        case 9106:
            return [144,82,88,64,62,80,128,112,36,36,28,36]
        case 9107:
            return [140,130,84,68,72,36,124,108,28,58,22,22,110,82,52,22,36]
        case 9108:
            return [164,52,132,84,88,28,52,64,36,36,84,88]
        case 9109:
            return [184,82,78,84,96,68,80,66,28,28]
        case 9110:
            return [152,28,28,22,76,92,84,78,80,96,84]
        case 9111:
            return [124,76,56,104,96,36,36,82,28,88]
        case 9112:
            return [128,86,52,36,28,36,36,52,82,28,28,28,82]
        case 9201:
            return [132,128,80,36,76,52,52,62,70,22,36]
        case 9202:
            return [140,96,36,28,28,60,52,36,36,28,36,28,70,36,24]
        case 9203:
            return [166,62,36,36,36,28,52,22,52,28,22,106,24]
        case 9204:
            return [200,104,28,28,52,88,52,22,22,36,76,36,22,22,52]
        case 9206:
            return [132,28,22,22,54,36,36,102,52,84,74,36,60]
        case 9207:
            return [116,84,36,82,36,80,36,36,36,104,36,86]
        case 9208:
            return [140,138,82,120,28,36,36,66,36,36,36,28]
        case 9209:
            return [86,124,74,36,22,170,112,36,52,36,58,28]
        case 9210:
            return [146,112,100,52,36,76,92,64,36,36,28,72,22]
        case 9211:
            return [126,66,66,96,106,78,82,28,24,24,80]
        case 9212:
            return [118,82,36,52,68,96,36,68,36,36,36,28,22]
        case 9301:
            return [128,84,36,36,24,104,22,24,22,22,36,62,36,114,104,36]
        case 9302:
            return [84,68,36,62,108,36,52,88,22,52,28]
        case 9303:
            return [106,108,98,84,80,88,36,74,52,64,22,88,22]
        case 9304:
            return [130,90,122,70,58,66,28,28,22,60,132,36]
        case 9305:
            return [84,36,104,52,96,84,36,36,28,22,36,36,106,106,36,24,28]
        case 9306:
            return [146,106,88,84,96,68,36,24,28,22]
        case 9307:
            return [180,130,76,106,22,36,52,36,36,52,50,84]
        case 9308:
            return [130,84,68,52,52,90,82,68,36,36,28,24]
        case 9309:
            return [130,74,66,68,104,70,56,36,36,28,28,24]
        case 9310:
            return [84,36,108,36,80,104,108,76]
        case 9311:
            return [132,144,96,52,82,24,72,68,22,112]
        case 9312:
            return [140,112,124,84,28,36,36,28,36,24,22]
        case 9401:
            return [144,36,88,36,92,100,36,36,36,28,24,24,24,52,24,22,36]
        case 9402:
            return [136,82,102,72,88,64,36,28,22,84,82,92]
        case 9403:
            return [138,52,82,74,54,28,52,76,82,82,68,82,82,22]
        case 9404:
            return [118,68,94,78,90,68,62,70,68,52,36,36,36,36,36,36,36,28,24]
        case 9406:
            return [132,100,68,84,82,28,94,104,24,24,96,28]
        case 9407:
            return [184,140,132,36,88,148,92,90,24,90,92,22]
        case 9408:
            return [104,100,96,90,80,76,76,80,84,22,80,36,36,28,62,60,28]
        case 9409:
            return [120,104,88,92,52,74,36,80,84,64,124,58,22,22]
        case 9410:
            return [100,36,152,90,78,36,36,52,82,36,28,52,24,52,22]
        case 9411:
            return [136,76,116,88,68,36,36,28,36,28,22,22,74,22,36,66]
        case 9412:
            return [108,36,24,22,36,36,36,78,84,36,70,112,104,86,104,100,24]
        case 9501:
            return [222,84,66,52,36,52,74,36,36,28,96,28,28,24,22,70,76]
        case 9502:
            return [138,82,82,76,130,54,52,36,70,36,62,28,28,66,36,24,22]
        case 9503:
            return [108,70,36,92,96,98,36,36,36,52,36,70,76,28,24,22,36,22]
        case 9504:
            return [140,140,110,36,52,36,28,28,24,22,84,100,96,70,80,36,76]
        case 9505:
            return [128,68,98,136,36,74,74,36,36,52,66,52,92,52,28,36,24,22]
        case 9506:
            return [136,52,88,68,66,24,22,142,96,80,82,80,72,24,22,22]
        case 9507:
            return [144,84,96,52,36,28,36,80,88,70,22,62,84,36,24,36,22,22]
        case 9508:
            return [148,86,98,78,92,52,52,36,36,36,28,98,28,28,24,24]
        case 9509:
            return [144,88,88,64,36,36,78,36,98,80,36,36,28,28,130,28,22,22,36]
        case 9510:
            return [136,76,80,36,70,60,28,120,126,132,22,88,52,82]
        case 9511:
            return [84,60,22,36,74,96,66,138,96,66,62,104,36,78,76]
        case 9512:
            return [98,92,76,82,52,52,36,52,74,86,66,28,90,52,54,28,36]
        case 9601:
            return [122,118,24,24,28,96,76,52,150,104,84,28,36,84,28,22,36,24]
        case 9602:
            return [136,100,120,84,74,36,36,36,28,28,36,36,80,82,36,36,24,28,110,28]
        case 9603:
            return [88,78,28,52,70,76,104,80,24,22,60,36,92,96]
        case 9604:
            return [128,90,94,68,28,22,22,74,126,52,74,36,36,52]
        case 9605:
            return [84,226,90,96,52,36,36,36,66,36,74,36,36,36,36,24]
        default:
            return [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        }
    }
    
    
    public static func getShapes(gameId: Int, words: [String]) -> ([ShapeModel],[String],Int,Int) {
        switch gameId {
        case 8612:
            return WinningShapesCalculatorV1.Shapes_8612(words: words)
        case 8702:
            return WinningShapesCalculatorV1.Shapes_8702(words: words)
        case 8703:
            return WinningShapesCalculatorV1.Shapes_8703(words: words)
        case 8704:
            return WinningShapesCalculatorV1.Shapes_8704(words: words)
        case 8705:
            return WinningShapesCalculatorV1.Shapes_8705(words: words)
        case 8710:
            return WinningShapesCalculatorV1.Shapes_8710(words: words)
        case 8711:
            return WinningShapesCalculatorV1.Shapes_8711(words: words)
        case 8712:
            return WinningShapesCalculatorV1.Shapes_8712(words: words)
        case 8802:
            return WinningShapesCalculatorV1.Shapes_8802(words: words)
        case 8803:
            return WinningShapesCalculatorV1.Shapes_8803(words: words)
        case 8804:
            return WinningShapesCalculatorV1.Shapes_8804(words: words)
        case 8805:
            return WinningShapesCalculatorV1.Shapes_8805(words: words)
        case 8806:
            return WinningShapesCalculatorV1.Shapes_8806(words: words)
        case 8807:
            return WinningShapesCalculatorV1.Shapes_8807(words: words)
        case 8808:
            return WinningShapesCalculatorV1.Shapes_8808(words: words)
        case 8809:
            return WinningShapesCalculatorV1.Shapes_8809(words: words)
        case 8810:
            return WinningShapesCalculatorV1.Shapes_8810(words: words)
        case 8811:
            return WinningShapesCalculatorV1.Shapes_8811(words: words)
        case 8812:
            return WinningShapesCalculatorV1.Shapes_8812(words: words)
        case 8902:
            return WinningShapesCalculatorV1.Shapes_8902(words: words)
        case 8903:
            return WinningShapesCalculatorV1.Shapes_8903(words: words)
        case 8904:
            return WinningShapesCalculatorV1.Shapes_8904(words: words)
        case 8905:
            return WinningShapesCalculatorV1.Shapes_8905(words: words)
        case 8906:
            return WinningShapesCalculatorV1.Shapes_8906(words: words)
        case 8907:
            return WinningShapesCalculatorV1.Shapes_8907(words: words)
        case 8908:
            return WinningShapesCalculatorV1.Shapes_8908(words: words)
        case 8909:
            return WinningShapesCalculatorV1.Shapes_8909(words: words)
        case 8910:
            return WinningShapesCalculatorV1.Shapes_8910(words: words)
        case 8911:
            return WinningShapesCalculatorV1.Shapes_8911(words: words)
        case 8912:
            return WinningShapesCalculatorV1.Shapes_8912(words: words)
        case 9001:
            return WinningShapesCalculatorV1.Shapes_9001(words: words)
        case 9002:
            return WinningShapesCalculatorV1.Shapes_9002(words: words)
        case 9003:
            return WinningShapesCalculatorV1.Shapes_9003(words: words)
        case 9004:
            return WinningShapesCalculatorV1.Shapes_9004(words: words)
        case 9005:
            return WinningShapesCalculatorV1.Shapes_9005(words: words)
        case 9006:
            return WinningShapesCalculatorV1.Shapes_9006(words: words)
        case 9007:
            return WinningShapesCalculatorV1.Shapes_9007(words: words)
        case 9008:
            return WinningShapesCalculatorV1.Shapes_9008(words: words)
        case 9009:
            return WinningShapesCalculatorV1.Shapes_9009(words: words)
        case 9010:
            return WinningShapesCalculatorV1.Shapes_9010(words: words)
        case 9011:
            return WinningShapesCalculatorV1.Shapes_9011(words: words)
        case 9012:
            return WinningShapesCalculatorV1.Shapes_9012(words: words)
        case 9101:
            return WinningShapesCalculatorV1.Shapes_9101(words: words)
        case 9102:
            return WinningShapesCalculatorV1.Shapes_9102(words: words)
        case 9103:
            return WinningShapesCalculatorV1.Shapes_9103(words: words)
        case 9104:
            return WinningShapesCalculatorV1.Shapes_9104(words: words)
        case 9105:
            return WinningShapesCalculatorV1.Shapes_9105(words: words)
        case 9106:
            return WinningShapesCalculatorV1.Shapes_9106(words: words)
        case 9107:
            return WinningShapesCalculatorV1.Shapes_9107(words: words)
        case 9108:
            return WinningShapesCalculatorV1.Shapes_9108(words: words)
        case 9109:
            return WinningShapesCalculatorV1.Shapes_9109(words: words)
        case 9110:
            return WinningShapesCalculatorV1.Shapes_9110(words: words)
        case 9111:
            return WinningShapesCalculatorV1.Shapes_9111(words: words)
        case 9112:
            return WinningShapesCalculatorV1.Shapes_9112(words: words)
        case 9201:
            return WinningShapesCalculatorV1.Shapes_9201(words: words)
        case 9202:
            return WinningShapesCalculatorV1.Shapes_9202(words: words)
        case 9203:
            return WinningShapesCalculatorV1.Shapes_9203(words: words)
        case 9204:
            return WinningShapesCalculatorV1.Shapes_9204(words: words)
        case 9206:
            return WinningShapesCalculatorV1.Shapes_9206(words: words)
        case 9207:
            return WinningShapesCalculatorV1.Shapes_9207(words: words)
        case 9208:
            return WinningShapesCalculatorV1.Shapes_9208(words: words)
        case 9209:
            return WinningShapesCalculatorV1.Shapes_9209(words: words)
        case 9210:
            return WinningShapesCalculatorV1.Shapes_9210(words: words)
        case 9211:
            return WinningShapesCalculatorV1.Shapes_9211(words: words)
        case 9212:
            return WinningShapesCalculatorV1.Shapes_9212(words: words)
        case 9301:
            return WinningShapesCalculatorV1.Shapes_9301(words: words)
        case 9302:
            return WinningShapesCalculatorV1.Shapes_9302(words: words)
        case 9303:
            return WinningShapesCalculatorV1.Shapes_9303(words: words)
        case 9304:
            return WinningShapesCalculatorV1.Shapes_9304(words: words)
        case 9305:
            return WinningShapesCalculatorV1.Shapes_9305(words: words)
        case 9306:
            return WinningShapesCalculatorV1.Shapes_9306(words: words)
        case 9307:
            return WinningShapesCalculatorV1.Shapes_9307(words: words)
        case 9308:
            return WinningShapesCalculatorV1.Shapes_9308(words: words)
        case 9309:
            return WinningShapesCalculatorV1.Shapes_9309(words: words)
        case 9310:
            return WinningShapesCalculatorV1.Shapes_9310(words: words)
        case 9311:
            return WinningShapesCalculatorV1.Shapes_9311(words: words)
        case 9312:
            return WinningShapesCalculatorV1.Shapes_9312(words: words)
        case 9401:
            return WinningShapesCalculatorV1.Shapes_9401(words: words)
        case 9402:
            return WinningShapesCalculatorV1.Shapes_9402(words: words)
        case 9403:
            return WinningShapesCalculatorV1.Shapes_9403(words: words)
        case 9404:
            return WinningShapesCalculatorV1.Shapes_9404(words: words)
        case 9406:
            return WinningShapesCalculatorV1.Shapes_9406(words: words)
        case 9407:
            return WinningShapesCalculatorV1.Shapes_9407(words: words)
        case 9408:
            return WinningShapesCalculatorV1.Shapes_9408(words: words)
        case 9409:
            return WinningShapesCalculatorV1.Shapes_9409(words: words)
        case 9410:
            return WinningShapesCalculatorV1.Shapes_9410(words: words)
        case 9411:
            return WinningShapesCalculatorV1.Shapes_9411(words: words)
        case 9412:
            return WinningShapesCalculatorV1.Shapes_9412(words: words)
        case 9501:
            return WinningShapesCalculatorV1.Shapes_9501(words: words)
        case 9502:
            return WinningShapesCalculatorV1.Shapes_9502(words: words)
        case 9503:
            return WinningShapesCalculatorV1.Shapes_9503(words: words)
        case 9504:
            return WinningShapesCalculatorV1.Shapes_9504(words: words)
        case 9505:
            return WinningShapesCalculatorV1.Shapes_9505(words: words)
        case 9506:
            return WinningShapesCalculatorV1.Shapes_9506(words: words)
        case 9507:
            return WinningShapesCalculatorV1.Shapes_9507(words: words)
        case 9508:
            return WinningShapesCalculatorV1.Shapes_9508(words: words)
        case 9509:
            return WinningShapesCalculatorV1.Shapes_9509(words: words)
        case 9510:
            return WinningShapesCalculatorV1.Shapes_9510(words: words)
        case 9511:
            return WinningShapesCalculatorV1.Shapes_9511(words: words)
        case 9512:
            return WinningShapesCalculatorV1.Shapes_9512(words: words)
        case 9601:
            return WinningShapesCalculatorV1.Shapes_9601(words: words)
        case 9602:
            return WinningShapesCalculatorV1.Shapes_9602(words: words)
        case 9603:
            return WinningShapesCalculatorV1.Shapes_9603(words: words)
        case 9604:
            return WinningShapesCalculatorV1.Shapes_9604(words: words)
        case 9605:
            return WinningShapesCalculatorV1.Shapes_9605(words: words)
        default:
            return ([],[],0,0)
        }
    }
    
    
    private static func Shapes_8612(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8612)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 136,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 64,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 90,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 52,
            widthMax: widthMax,
            heightMax: heightMax))

        let nazareth_sing_nuts_zion = rectangle3x4.containing(["NAZARETH", "SING", "NUTS", "ZION"], from: words)[0]
        let nazareth_bells_eve_holly = square3x3.containing(["NAZARETH", "BELLS", "EVE", "HOLLY"], from: words)[0]
        let joy_holly = edges.containing(["JOY", "HOLLY"], from: words)[1]
        let joy_hazelnut_jelly_star = rectangle3x4_BottomLeft.containing(["JOY", "HAZELNUT", "JELLY", "STAR"], from: words)[0]
        let hazelnut_merry_azure_jelly = square3x3.containing(["HAZELNUT", "MERRY", "AZURE", "JELLY"], from: words)[0]
        let hazelnut_merry_hymn_azure = square3x3.containing(["HAZELNUT", "MERRY", "HYMN", "AZURE"], from: words)[0]
        let turkey_hymn = edges.containing(["TURKEY", "HYMN"], from: words)[0]
        let turkey_sauce = edges.containing(["TURKEY", "SAUCE"], from: words)[0]
        let toys_tree_toast_sauce = rectangle4x5.containing(["TOYS", "TREE", "TOAST", "SAUCE"], from: words)[0]
        let toys_family = edges.containing(["TOYS", "FAMILY"], from: words)[0]
        let inn_hymn = edges.containing(["INN", "HYMN"], from: words)[1]
        let turkey_pork = edges.containing(["TURKEY", "PORK"], from: words)[1]
        let white_family = edges.containing(["WHITE", "FAMILY"], from: words)[0]
        let white_snow = edges.containing(["WHITE", "SNOW"], from: words)[0]
        let white_cake = edges.containing(["WHITE", "CAKE"], from: words)[0]

        let winningShapes = [
            nazareth_sing_nuts_zion,
            nazareth_bells_eve_holly,
            joy_holly,
            joy_hazelnut_jelly_star,
            hazelnut_merry_azure_jelly,
            hazelnut_merry_hymn_azure,
            turkey_hymn,
            turkey_sauce,
            toys_tree_toast_sauce,
            toys_family,
            inn_hymn,
            turkey_pork,
            white_family,
            white_snow,
            white_cake
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_8702(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8702)!
        
        let widthMax = game.widthMax
        let heightMax = game.heightMax
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 106,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let pacman3x3_BottomRight = ShapeCalculator.toShapes(pacmans: PacmanCalculatorV1.BottomRight(
            words: words,
            end: end,
            len: len,
            scoreMin: 144,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 72,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let stock_pay_sale_parity = c2x2.containing(["STOCK", "PAY", "SALE", "PARITY"], from: words)[0]
        let stock_debit_sale_cost = square4x4.containing(["STOCK", "DEBIT", "SALE", "COST"], from: words)[0]
        let short_cut_cost_bonus = square3x3_BottomLeft.containing(["SHORT", "CUT", "COST", "BONUS"], from: words)[0]
        let units_short_bonus_net = square3x3_TopLeft.containing(["UNITS", "SHORT", "BONUS", "NET"], from: words)[0]
        let bull_sold_units_trust_loss_sell = pacman3x3_BottomRight.containing(["BULL", "SOLD", "UNITS", "TRUST", "LOSS", "SELL"], from: words)[0]
        let notes_bull_trust_sell = square3x3.containing(["NOTES", "BULL", "TRUST", "SELL"], from: words)[0]
        let units_iou = edges.containing(["UNITS", "IOU"], from: words)[0]
        let spot_loss = edges.containing(["SPOT", "LOSS"], from: words)[1]
        let spot_tax = edges.containing(["SPOT", "TAX"], from: words)[0]
        let scrip_parity = edges.containing(["SCRIP", "PARITY"], from: words)[0]
        let capital_scrip_parity_tip = square3x3.containing(["CAPITAL", "SCRIP", "PARITY", "TIP"], from: words)[0]
        let capital_scrip_cash_parity = square3x3.containing(["CAPITAL", "SCRIP", "CASH", "PARITY"], from: words)[0]
        let spot_par = edges.containing(["SPOT", "PAR"], from: words)[0]
        let bear_par = edges.containing(["BEAR", "PAR"], from: words)[1]
        let bear_bid = edges.containing(["BEAR", "BID"], from: words)[0]
        let deed_bid = edges.containing(["DEED", "BID"], from: words)[0]
        let debit_buy = edges.containing(["DEBIT", "BUY"], from: words)[0]
        let buyer_buy = edges.containing(["BUYER", "BUY"], from: words)[2]

        let winningShapes = [
            stock_pay_sale_parity,
            stock_debit_sale_cost,
            short_cut_cost_bonus,
            units_short_bonus_net,
            bull_sold_units_trust_loss_sell,
            notes_bull_trust_sell,
            units_iou,
            spot_loss,
            spot_tax,
            scrip_parity,
            capital_scrip_parity_tip,
            capital_scrip_cash_parity,
            spot_par,
            bear_par,
            bear_bid,
            deed_bid,
            debit_buy,
            buyer_buy
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_8703(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8703)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax

        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 70,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 102,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

//        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
//            interlockWidth: 2,
//            interlockHeight: 3,
//            words: words,
//            lengths: len,
//            scoreMin: 74,
//            widthMax: widthMax,
//            heightMax: heightMax))

        let special8703 = SpecialShapesCalculator.C8703(words: words)

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 58,
            widthMax: widthMax,
            heightMax: heightMax))

        let jiffy_late_always_daily_fast_oft_year = special8703.containing(["JIFFY", "LATE", "ALWAYS", "DAILY", "FAST", "OFT", "YEAR"], from: words)[0]
        let week_always_century_early_weekly = c2x3.containing(["WEEK", "ALWAYS", "CENTURY", "EARLY", "WEEKLY"], from: words)[0]
        let wind_then_weekly_gain = c2x2.containing(["WIND", "THEN", "WEEKLY", "GAIN"], from: words)[0]
        let century_monthly_watch_early = square3x3.containing(["CENTURY", "MONTHLY", "WATCH", "EARLY"], from: words)[0]
        let always_now_ago_fast = square3x3_BottomRight.containing(["ALWAYS", "NOW", "AGO", "FAST"], from: words)[0]
        let late_term_fast_year = square3x3.containing(["LATE", "TERM", "FAST", "YEAR"], from: words)[0]
        let century_monthly_am_eon = square3x3_TopLeft.containing(["CENTURY", "MONTHLY", "AM", "EON"], from: words)[0]
        //let week_watch = edges.containing(["WEEK", "WATCH"], from: words)[0]
        let age_gain = edges.containing(["AGE", "GAIN"], from: words)[0]
        let term_era = edges.containing(["TERM", "ERA"], from: words)[0]
        let face_era = edges.containing(["FACE", "ERA"], from: words)[1]
        //let wind_daily = edges.containing(["WIND", "DAILY"], from: words)[0]
        
        //Has nothing to conect to as this is originally an invalid game
        // let date_today_dawn_day = c2x2.containing(["DATE", "TODAY", "DAWN", "DAY"], from: words)[1]
        //let today_morn_time_dawn = rectangle3x4.containing(["TODAY", "MORN", "TIME", "DAWN"], from: words)[0]
        //let past_tick = edges.containing(["PAST", "TICK"], from: words)[0]
        //let past_pm = edges.containing(["PAST", "PM"], from: words)[0]

        let winningShapes = [
            jiffy_late_always_daily_fast_oft_year,
            week_always_century_early_weekly,
            wind_then_weekly_gain,
            century_monthly_watch_early,
            always_now_ago_fast,
            late_term_fast_year,
            century_monthly_am_eon,
            //week_watch,
            age_gain,
            term_era,
            face_era,
            //wind_daily,
            //date_today_dawn_day,
            //today_morn_time_dawn,
            //past_tick,
            //past_pm
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    private static func Shapes_8704(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8704)!
        
        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 104,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 100,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 72,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 92,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftSquare(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 72,
            widthMax: widthMax,
            heightMax: heightMax))

        let homer_stanza_foot_prize = rectangle3x4.containing(["HOMER", "STANZA", "FOOT", "PRIZE"], from: words)[0]
        let stanza_slessor = edges.containing(["STANZA", "SLESSOR"], from: words)[0]
        let scott_hardy_slessor_poesy = rectangle3x4.containing(["SCOTT", "HARDY", "SLESSOR", "POESY"], from: words)[0]
        let donne_yeats_doyle_slessor = rectangle3x5.containing(["DONNE", "YEATS", "DOYLE", "SLESSOR"], from: words)[0]
        let donne_hood_yeats_doyle_ode = c2x3.containing(["DONNE", "HOOD", "YEATS", "DOYLE", "ODE"], from: words)[0]
        let scott_saxe_poesy_text = square3x3.containing(["SCOTT", "SAXE", "POESY", "TEXT"], from: words)[0]
        let poet_donne_hope_milton = rectangle3x4_TopRight.containing(["POET", "DONNE", "HOPE", "MILTON"], from: words)[0]
        let lamb_poet_hope_milton = square4x4_TopLeft.containing(["LAMB", "POET", "HOPE", "MILTON"], from: words)[0]
        let hood_hymn = edges.containing(["HOOD", "HYMN"], from: words)[0]
        let gray_scan_bridges_hymn = rectangle3x4.containing(["GRAY", "SCAN", "BRIDGES", "HYMN"], from: words)[0]
        let rhyme_bridges = edges.containing(["RHYME", "BRIDGES"], from: words)[0]
        let rhyme_elegy = edges.containing(["RHYME", "ELEGY"], from: words)[0]
        let poe_elegy = edges.containing(["POE", "ELEGY"], from: words)[0]

        let winningShapes = [
            homer_stanza_foot_prize,
            stanza_slessor,
            scott_hardy_slessor_poesy,
            donne_yeats_doyle_slessor,
            donne_hood_yeats_doyle_ode,
            scott_saxe_poesy_text,
            poet_donne_hope_milton,
            lamb_poet_hope_milton,
            hood_hymn,
            gray_scan_bridges_hymn,
            rhyme_bridges,
            rhyme_elegy,
            poe_elegy
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_8710(words: [String]) -> ([ShapeModel], [String], Int, Int) {
        
        let game = GameList().getGame(gameId: 8710)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 84,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 102,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let pacman3x3_TopLeft = ShapeCalculator.toShapes(pacmans: PacmanCalculatorV1.TopLeft(
            words: words,
            end: end,
            len: len,
            scoreMin: 132,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 104,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 0,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 100,
            widthMax: widthMax,
            heightMax: heightMax))

        let square5x5_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 4,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let wren_lory_swallow_canary = square4x4.containing(["WREN", "LORY", "SWALLOW", "CANARY"], from: words)[0]
        let grouse_wren_swan_swallow_tern = c2x3.containing(["GROUSE", "WREN", "SWAN", "SWALLOW", "TERN"], from: words)[0]
        let lory_sparrow_owlet_roc_swallow_owl = pacman3x3_TopLeft.containing(["LORY", "SPARROW", "OWLET", "ROC", "SWALLOW", "OWL"], from: words)[0]
        let owlet_chat_roc_tit = rectangle3x5_TopRight.containing(["OWLET", "CHAT", "ROC", "TIT"], from: words)[0]
        let tomtit_sparrow_rook_rooster = rectangle3x5_TopRight.containing(["TOMTIT", "SPARROW", "ROOK", "ROOSTER"], from: words)[0]
        let tomtit_auk_turkey_rook = c2x2.containing(["TOMTIT", "AUK", "TURKEY", "ROOK"], from: words)[0]
        let auk_skylark_turkey_skua = rectangle3x5_TopRight.containing(["AUK", "SKYLARK", "TURKEY", "SKUA"], from: words)[0]
        let auk_skylark_ibis_turkey = rectangle3x5_TopLeft.containing(["AUK", "SKYLARK", "IBIS", "TURKEY"], from: words)[0]
        let grouse_tomtit_egret_rooster = rectangle3x4.containing(["GROUSE", "TOMTIT", "EGRET", "ROOSTER"], from: words)[0]
        let snipe_tomtit_shag_egret = square5x5_BottomLeft.containing(["SNIPE", "TOMTIT", "SHAG", "EGRET"], from: words)[0]
        let tui_ibis = edges.containing(["TUI", "IBIS"], from: words)[0]
        let tui_teal = edges.containing(["TUI", "TEAL"], from: words)[0]
        let tui_emu = edges.containing(["TUI", "EMU"], from: words)[0]
        let hen_emu = edges.containing(["HEN", "EMU"], from: words)[0]
        let myna_shag = edges.containing(["MYNA", "SHAG"], from: words)[0]
        let myna_jay = edges.containing(["MYNA", "JAY"], from: words)[1]

        let winningShapes = [
            wren_lory_swallow_canary,
            grouse_wren_swan_swallow_tern,
            lory_sparrow_owlet_roc_swallow_owl,
            owlet_chat_roc_tit,
            tomtit_sparrow_rook_rooster,
            tomtit_auk_turkey_rook,
            auk_skylark_turkey_skua,
            auk_skylark_ibis_turkey,
            grouse_tomtit_egret_rooster,
            snipe_tomtit_shag_egret,
            tui_ibis,
            tui_teal,
            tui_emu,
            hen_emu,
            myna_shag,
            myna_jay
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_8711(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8711)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 82,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 118,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x5 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x5(
           words: words,
           end: end,
           len: len,
           scoreMin: 204,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 116,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 60,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let lac_zoffany_colour_rouge_jet_azure_corot = c2x5.containing(["LAC", "ZOFFANY", "COLOUR", "ROUGE", "JET", "AZURE", "COROT"], from: words)[0]
        let zoffany_dyck = edges.containing(["ZOFFANY", "DYCK"], from: words)[0]
        let zoffany_rouge_azure_lake = rectangle3x5.containing(["ZOFFANY", "ROUGE", "AZURE", "LAKE"], from: words)[0]
        let colour_ruby_hue_ebony = square3x3_TopLeft.containing(["COLOUR", "RUBY", "HUE", "EBONY"], from: words)[0]
        let ruby_blue_rubens_hue = c2x2.containing(["RUBY", "BLUE", "RUBENS", "HUE"], from: words)[1]
        let blue_sandy_rubens_bay = rectangle3x4_TopRight.containing(["BLUE", "SANDY", "RUBENS", "BAY"], from: words)[0]
        let blue_sandy_brush_rubens = rectangle3x4.containing(["BLUE", "SANDY", "BRUSH", "RUBENS"], from: words)[0]
        let rouge_grey = edges.containing(["ROUGE", "GREY"], from: words)[0]
        let sepia_goya_sooty_grey_paint = c2x3.containing(["SEPIA", "GOYA", "SOOTY", "GREY", "PAINT"], from: words)[0]
        let goya_ruddy_red_sooty = rectangle3x4_TopLeft.containing(["GOYA", "RUDDY", "RED", "SOOTY"], from: words)[0]
        let goya_tone_sooty_paint = square3x3.containing(["GOYA", "TONE", "SOOTY", "PAINT"], from: words)[0]
        let amber_ruddy_umber_red = square3x3.containing(["AMBER", "RUDDY", "UMBER", "RED"], from: words)[1]
        let sepia_art = edges.containing(["SEPIA", "ART"], from: words)[0]
        let tube_ebony = edges.containing(["TUBE", "EBONY"], from: words)[0]
        let tube_tan = edges.containing(["TUBE", "TAN"], from: words)[0]
        let dun_tan = edges.containing(["DUN", "TAN"], from: words)[0]
        let dun_jade = edges.containing(["DUN", "JADE"], from: words)[0]

        let winningShapes = [
            lac_zoffany_colour_rouge_jet_azure_corot,
            zoffany_dyck,
            zoffany_rouge_azure_lake,
            colour_ruby_hue_ebony,
            ruby_blue_rubens_hue,
            blue_sandy_rubens_bay,
            blue_sandy_brush_rubens,
            rouge_grey,
            sepia_goya_sooty_grey_paint,
            goya_ruddy_red_sooty,
            goya_tone_sooty_paint,
            amber_ruddy_umber_red,
            sepia_art,
            tube_ebony,
            tube_tan,
            dun_tan,
            dun_jade
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_8712(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8712)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 108,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 118,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 28,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 108,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 78,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let meat_roast_turkey_fare_toys = c2x3.containing(["MEAT", "ROAST", "TURKEY", "FARE", "TOYS"], from: words)[0]
        let jelly_turkey_salt_yule = c2x2.containing(["JELLY", "TURKEY", "SALT", "YULE"], from: words)[0]
        let roast_sweets_toys_nutmeg = rectangle3x4.containing(["ROAST", "SWEETS", "TOYS", "NUTMEG"], from: words)[0]
        let sweets_holly_wishes_parsley = rectangle4x5.containing(["SWEETS", "HOLLY", "WISHES", "PARSLEY"], from: words)[0]
        let dates_jelly_tree_salt = square3x3.containing(["DATES", "JELLY", "TREE", "SALT"], from: words)[0]
        let turkey_sauce_guests_yule = square3x3_TopLeft.containing(["TURKEY", "SAUCE", "GUESTS", "YULE"], from: words)[0]
        let sauce_presents_sugar_guests = rectangle3x5.containing(["SAUCE", "PRESENTS", "SUGAR", "GUESTS"], from: words)[0]
        let plums_presents_port_bush = rectangle3x4_BottomRight.containing(["PLUMS", "PRESENTS", "PORT", "BUSH"], from: words)[0]
        let sauce_eggs_sugar_guests = square3x3.containing(["SAUCE", "EGGS", "SUGAR", "GUESTS"], from: words)[1]
        let spice_wishes = edges.containing(["SPICE", "WISHES"], from: words)[1]
        let wine_nutmeg = edges.containing(["WINE", "NUTMEG"], from: words)[0]

        let winningShapes = [
            meat_roast_turkey_fare_toys,
            jelly_turkey_salt_yule,
            roast_sweets_toys_nutmeg,
            sweets_holly_wishes_parsley,
            dates_jelly_tree_salt,
            turkey_sauce_guests_yule,
            sauce_presents_sugar_guests,
            plums_presents_port_bush,
            sauce_eggs_sugar_guests,
            spice_wishes,
            wine_nutmeg
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_8802(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8802)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 74,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x4(
           words: words,
           end: end,
           len: len,
           scoreMin: 148,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 28,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 60,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 92,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 120,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftSquare(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let sport_blazer_prize_art = square3x3_TopRight.containing(["SPORT", "BLAZER", "PRIZE", "ART"], from: words)[0]
        let mates_tennis_art_captain = square4x4_TopLeft.containing(["MATES", "TENNIS", "ART", "CAPTAIN"], from: words)[1]
        let copy_maths_captain_swot_physics_boys = c2x4.containing(["COPY", "MATHS", "CAPTAIN", "SWOT", "PHYSICS", "BOYS"], from: words)[0]
        let pen_sport_prize_quiet = c2x2.containing(["PEN", "SPORT", "PRIZE", "QUIET"], from: words)[0]
        let class_study_quiet_play = square3x3_TopLeft.containing(["CLASS", "STUDY", "QUIET", "PLAY"], from: words)[0]
        let sport_lines = edges.containing(["SPORT", "LINES"], from: words)[0]
        let cane_gym_crayon_lines = rectangle3x4_BottomRight.containing(["CANE", "GYM", "CRAYON", "LINES"], from: words)[0]
        let study_sums = edges.containing(["STUDY", "SUMS"], from: words)[1]
        let roll_cane_term_lines = rectangle3x4_TopRight.containing(["ROLL", "CANE", "TERM", "LINES"], from: words)[0]
        let tables_sums = edges.containing(["TABLES", "SUMS"], from: words)[0]
        let ink_crayon = edges.containing(["INK", "CRAYON"], from: words)[0]

        let winningShapes = [
            sport_blazer_prize_art,
            mates_tennis_art_captain,
            copy_maths_captain_swot_physics_boys,
            pen_sport_prize_quiet,
            class_study_quiet_play,
            sport_lines,
            cane_gym_crayon_lines,
            study_sums,
            roll_cane_term_lines,
            tables_sums,
            ink_crayon
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_8803(words: [String]) -> ([ShapeModel], [String], Int, Int) {
        
        let game = GameList().getGame(gameId: 8803)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 88,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: widthMax,
            heightMax: heightMax))

        let pacman3x3_TopRight = ShapeCalculator.toShapes(pacmans: PacmanCalculatorV1.TopRight(
            words: words,
            end: end,
            len: len,
            scoreMin: 136,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x6_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 56,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 88,
            widthMax: widthMax,
            heightMax: heightMax))

        let quito_zurich_suez_toronto = square3x3.containing(["QUITO", "ZURICH", "SUEZ", "TORONTO"], from: words)[0]
        let tokyo_lagos_toronto_oslo = c2x2.containing(["TOKYO", "LAGOS", "TORONTO", "OSLO"], from: words)[0]
        let tokyo_york = edges.containing(["TOKYO", "YORK"], from: words)[2]
        let bonn_lagos_osaka_toronto = square3x3.containing(["BONN", "LAGOS", "OSAKA", "TORONTO"], from: words)[0]
        let lagos_cairo_osaka_oslo = rectangle3x4.containing(["LAGOS", "CAIRO", "OSAKA", "OSLO"], from: words)[0]
        let rome_york = edges.containing(["ROME", "YORK"], from: words)[1]
        let zurich_omaha = edges.containing(["ZURICH", "OMAHA"], from: words)[0]
        let bogota_omaha = edges.containing(["BOGOTA", "OMAHA"], from: words)[0]
        let bogota_toledo = edges.containing(["BOGOTA", "TOLEDO"], from: words)[4]
        let delhi_bombay_toledo_hobart = square3x3.containing(["DELHI", "BOMBAY", "TOLEDO", "HOBART"], from: words)[0]
        let delhi_omsk_bombay_hobart_lima_sydney = pacman3x3_TopRight.containing(["DELHI", "OMSK", "BOMBAY", "HOBART", "LIMA", "SYDNEY"], from: words)[0]
        let omsk_ayr_hobart_sydney = rectangle3x6_BottomLeft.containing(["OMSK", "AYR", "HOBART", "SYDNEY"], from: words)[0]
        let reno_ayr_hobart_sydney = square3x3_BottomLeft.containing(["RENO", "AYR", "HOBART", "SYDNEY"], from: words)[0]
        let omsk_cork = edges.containing(["OMSK", "CORK"], from: words)[1]

        let winningShapes = [
            quito_zurich_suez_toronto,
            tokyo_lagos_toronto_oslo,
            tokyo_york,
            bonn_lagos_osaka_toronto,
            lagos_cairo_osaka_oslo,
            rome_york,
            zurich_omaha,
            bogota_omaha,
            bogota_toledo,
            delhi_bombay_toledo_hobart,
            delhi_omsk_bombay_hobart_lima_sydney,
            omsk_ayr_hobart_sydney,
            reno_ayr_hobart_sydney,
            omsk_cork
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_8804(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8804)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax

        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 84,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 108,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let hymn_mazurka_hum_mezzo = square3x3.containing(["HYMN", "MAZURKA", "HUM", "MEZZO"], from: words)[1]
        let mazurka_viola_mezzo_aria = square3x3.containing(["MAZURKA", "VIOLA", "MEZZO", "ARIA"], from: words)[0]
        let hymn_key = edges.containing(["HYMN", "KEY"], from: words)[0]
        let hymn_sign = edges.containing(["HYMN", "SIGN"], from: words)[0]
        let song_sign = edges.containing(["SONG", "SIGN"], from: words)[0]
        let song_trio_note_tie = square3x3_TopRight.containing(["SONG", "TRIO", "NOTE", "TIE"], from: words)[0]
        let tune_trio_tie_duo = c2x2.containing(["TUNE", "TRIO", "TIE", "DUO"], from: words)[0]
        let tune_stop_duo_rest = square3x3_BottomLeft.containing(["TUNE", "STOP", "DUO", "REST"], from: words)[0]
        let strum_stop_rest_tone_harp = c2x3.containing(["STRUM", "STOP", "REST", "TONE", "HARP"], from: words)[0]
        let hit_strum_harp_time = square3x3.containing(["HIT", "STRUM", "HARP", "TIME"], from: words)[0]
        let stop_mute_slur_tone = square3x3.containing(["STOP", "MUTE", "SLUR", "TONE"], from: words)[0]
        
        let mazurka_basso = edges.containing(["MAZURKA", "BASSO"], from: words)[1]
        
        let mute_score_mood_slur_tempo = c2x3.containing(["MUTE", "SCORE", "MOOD", "SLUR", "TEMPO"], from: words)[0]
        let score_hold_basso_mood = square3x3.containing(["SCORE", "HOLD", "BASSO", "MOOD"], from: words)[0]
        let march_forte_tempo_fret = square3x3.containing(["MARCH", "FORTE", "TEMPO", "FRET"], from: words)[0]
        let march_echo = edges.containing(["MARCH", "ECHO"], from: words)[1]
        let viola_low = edges.containing(["VIOLA", "LOW"], from: words)[0]
        let slow_low = edges.containing(["SLOW", "LOW"], from: words)[2]
        

        let winningShapes = [
            hymn_mazurka_hum_mezzo,
            mazurka_viola_mezzo_aria,
            hymn_key,
            hymn_sign,
            song_sign,
            song_trio_note_tie,
            tune_trio_tie_duo,
            tune_stop_duo_rest,
            strum_stop_rest_tone_harp,
            hit_strum_harp_time,
            stop_mute_slur_tone,
            mazurka_basso,
            mute_score_mood_slur_tempo,
            score_hold_basso_mood,
            march_forte_tempo_fret,
            march_echo,
            viola_low,
            slow_low
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_8805(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8805)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax

        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 74,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let special8805 = SpecialShapesCalculator.C8805(words: words)

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 118,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 116,
            widthMax: widthMax,
            heightMax: heightMax))

        let square5x5_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 4,
            words: words,
            lengths: len,
            scoreMin: 88,
            widthMax: widthMax,
            heightMax: heightMax))

        let harvest_maize_wheat_grazing = square3x3.containing(["HARVEST", "MAIZE", "WHEAT", "GRAZING"], from: words)[0]
        let wool_meat_tank_harvest_ewe_oats_rotation = special8805.containing(["WOOL", "MEAT", "TANK", "HARVEST", "EWE", "OATS", "ROTATION"], from: words)[0]
        let soil_bin_silo_rotation = c2x2.containing(["SOIL", "BIN", "SILO", "ROTATION"], from: words)[0]
        let maize_root_mow_wheat = c2x2.containing(["MAIZE", "ROOT", "MOW", "WHEAT"], from: words)[0]
        let straw_root_seed_wheat = square5x5_BottomLeft.containing(["STRAW", "ROOT", "SEED", "WHEAT"], from: words)[0]
        let straw_cart = edges.containing(["STRAW", "CART"], from: words)[0]
        let maize_pig_mow_grazing = square4x4_BottomLeft.containing(["MAIZE", "PIG", "MOW", "GRAZING"], from: words)[0]
        let hoe_silo = edges.containing(["HOE", "SILO"], from: words)[0]
        let soil_lamb = edges.containing(["SOIL", "LAMB"], from: words)[0]
        let rake_ewe = edges.containing(["RAKE", "EWE"], from: words)[0]
        let rake_rye = edges.containing(["RAKE", "RYE"], from: words)[0]
        let hay_rye = edges.containing(["HAY", "RYE"], from: words)[0]
        let stock_cart = edges.containing(["STOCK", "CART"], from: words)[1]
        let stock_stud = edges.containing(["STOCK", "STUD"], from: words)[0]
        let shed_seed = edges.containing(["SHED", "SEED"], from: words)[2]
        let shed_sheep = edges.containing(["SHED", "SHEEP"], from: words)[0]
        let plant_sheep = edges.containing(["PLANT", "SHEEP"], from: words)[0]

        let winningShapes = [
            harvest_maize_wheat_grazing,
            wool_meat_tank_harvest_ewe_oats_rotation,
            soil_bin_silo_rotation,
            maize_root_mow_wheat,
            straw_root_seed_wheat,
            straw_cart,
            maize_pig_mow_grazing,
            hoe_silo,
            soil_lamb,
            rake_ewe,
            rake_rye,
            hay_rye,
            stock_cart,
            stock_stud,
            shed_seed,
            shed_sheep,
            plant_sheep
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    private static func Shapes_8806(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8806)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 62,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 108,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 78,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 64,
            widthMax: widthMax,
            heightMax: heightMax))

        let ahoy_yaw_stay_hawser_bow = c2x3.containing(["AHOY", "YAW", "STAY", "HAWSER", "BOW"], from: words)[0]
        let buoy_ahoy_bow_guy = c2x2.containing(["BUOY", "AHOY", "BOW", "GUY"], from: words)[0]
        let mast_port_moor_spar_stay = c2x3.containing(["MAST", "PORT", "MOOR", "SPAR", "STAY"], from: words)[0]
        let buoy_ply = edges.containing(["BUOY", "PLY"], from: words)[0]
        let yaw_bowsprit_fog_hawser = square3x3_TopLeft.containing(["YAW", "BOWSPRIT", "FOG", "HAWSER"], from: words)[0]
        let bowsprit_prow_hawser_crew = square3x3.containing(["BOWSPRIT", "PROW", "HAWSER", "CREW"], from: words)[0]
        let bowsprit_log_box_fog = c2x2.containing(["BOWSPRIT", "LOG", "BOX", "FOG"], from: words)[0]
        let bowsprit_watch = edges.containing(["BOWSPRIT", "WATCH"], from: words)[1]
        let mast_set = edges.containing(["MAST", "SET"], from: words)[1]
        let ship_set = edges.containing(["SHIP", "SET"], from: words)[0]
        let port_oar_dory_moor = square3x3_TopLeft.containing(["PORT", "OAR", "DORY", "MOOR"], from: words)[1]
        let quay_dory = edges.containing(["QUAY", "DORY"], from: words)[0]
        let quay_aft = edges.containing(["QUAY", "AFT"], from: words)[0]
        let yacht_aft = edges.containing(["YACHT", "AFT"], from: words)[1]
        let yacht_jetty = edges.containing(["YACHT", "JETTY"], from: words)[2]
        let junk_jetty = edges.containing(["JUNK", "JETTY"], from: words)[0]
        let junk_astern = edges.containing(["JUNK", "ASTERN"], from: words)[0]
        let transom_trim_astern_sail = square3x3.containing(["TRANSOM", "TRIM", "ASTERN", "SAIL"], from: words)[0]
        let transom_tack = edges.containing(["TRANSOM", "TACK"], from: words)[0]

        let winningShapes = [
            ahoy_yaw_stay_hawser_bow,
            buoy_ahoy_bow_guy,
            mast_port_moor_spar_stay,
            buoy_ply,
            yaw_bowsprit_fog_hawser,
            bowsprit_prow_hawser_crew,
            bowsprit_log_box_fog,
            bowsprit_watch,
            mast_set,
            ship_set,
            port_oar_dory_moor,
            quay_dory,
            quay_aft,
            yacht_aft,
            yacht_jetty,
            junk_jetty,
            junk_astern,
            transom_trim_astern_sail,
            transom_tack
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_8807(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8807)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax

        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let outer2x3 = ShapeCalculator.toShapes(outers: OuterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 90,
           widthMax: widthMax,
           heightMax: heightMax))

        let rectangle3x5_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 104,
            widthMax: widthMax,
            heightMax: heightMax))

        let zsa_caine_liza_sidney_alan = outer2x3.containing(["ZSA", "CAINE", "LIZA", "SIDNEY", "ALAN"], from: words)[0]
        let alda_zsa_liza_alan = square3x3.containing(["ALDA", "ZSA", "LIZA", "ALAN"], from: words)[0]
        let dunaway_taylor_sidney_woody = square3x3.containing(["DUNAWAY", "TAYLOR", "SIDNEY", "WOODY"], from: words)[0]
        let faye_woody = edges.containing(["FAYE", "WOODY"], from: words)[0]
        let dunaway_tony = edges.containing(["DUNAWAY", "TONY"], from: words)[1]
        let taylor_tom = edges.containing(["TAYLOR", "TOM"], from: words)[0]
        let steve_tony = edges.containing(["STEVE", "TONY"], from: words)[0]
        let omar_steve_al_novak_mel = outer2x3.containing(["OMAR", "STEVE", "AL", "NOVAK", "MEL"], from: words)[0]
        let john_novak = edges.containing(["JOHN", "NOVAK"], from: words)[0]
        let omar_rod = edges.containing(["OMAR", "ROD"], from: words)[1]
        let dean_rod = edges.containing(["DEAN", "ROD"], from: words)[0]
        let dean_murphy_dustin_finney = rectangle3x5_TopLeft.containing(["DEAN", "MURPHY", "DUSTIN", "FINNEY"], from: words)[0]
        let burt_ryan_judy_dustin = square3x3.containing(["BURT", "RYAN", "JUDY", "DUSTIN"], from: words)[0]
        let murphy_peter = edges.containing(["MURPHY", "PETER"], from: words)[1]
        let tab_peter = edges.containing(["TAB", "PETER"], from: words)[0]
        let tab_bow = edges.containing(["TAB", "BOW"], from: words)[0]

        let winningShapes = [
            zsa_caine_liza_sidney_alan,
            alda_zsa_liza_alan,
            dunaway_taylor_sidney_woody,
            faye_woody,
            dunaway_tony,
            taylor_tom,
            steve_tony,
            omar_steve_al_novak_mel,
            john_novak,
            omar_rod,
            dean_rod,
            dean_murphy_dustin_finney,
            burt_ryan_judy_dustin,
            murphy_peter,
            tab_peter,
            tab_bow
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_8808(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8808)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 68,
           widthMax: widthMax,
           heightMax: heightMax))

        let c3x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C3x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 190,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 88,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 136,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 122,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 48,
            widthMax: widthMax,
            heightMax: heightMax))

        let stutz_lada_astra_renault_tarago_mazda = c3x3.containing(["STUTZ", "LADA", "ASTRA", "RENAULT", "TARAGO", "MAZDA"], from: words)[0]
        let nomad_stutz_renault_mazda = square3x3.containing(["NOMAD", "STUTZ", "RENAULT", "MAZDA"], from: words)[0]
        let rolls_nomad_renault_sedan = rectangle3x5.containing(["ROLLS", "NOMAD", "RENAULT", "SEDAN"], from: words)[0]
        let astra_supra_telstar_saab = c2x2.containing(["ASTRA", "SUPRA", "TELSTAR", "SAAB"], from: words)[0]
        let colt_telstar = edges.containing(["COLT", "TELSTAR"], from: words)[0]
        let supra_audi = edges.containing(["SUPRA", "AUDI"], from: words)[0]
        let colt_rocky = edges.containing(["COLT", "ROCKY"], from: words)[0]
        let colt_camry_romeo_rocky = rectangle3x4_TopLeft.containing(["COLT", "CAMRY", "ROMEO", "ROCKY"], from: words)[0]
        let turbo_romeo = edges.containing(["TURBO", "ROMEO"], from: words)[2]
        let turbo_suzuki_vortex_benz = square4x4_BottomLeft.containing(["TURBO", "SUZUKI", "VORTEX", "BENZ"], from: words)[0]
        let vw_vortex = edges.containing(["VW", "VORTEX"], from: words)[0]
        let vw_bmw = edges.containing(["VW", "BMW"], from: words)[0]
        let mg_bmw = edges.containing(["MG", "BMW"], from: words)[0]
        let lada_golf_tarago_alfa = square4x4_TopRight.containing(["LADA", "GOLF", "TARAGO", "ALFA"], from: words)[0]

        let winningShapes = [
            stutz_lada_astra_renault_tarago_mazda,
            nomad_stutz_renault_mazda,
            rolls_nomad_renault_sedan,
            astra_supra_telstar_saab,
            colt_telstar,
            supra_audi,
            colt_rocky,
            colt_camry_romeo_rocky,
            turbo_romeo,
            turbo_suzuki_vortex_benz,
            vw_vortex,
            vw_bmw,
            mg_bmw,
            lada_golf_tarago_alfa
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_8809(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8809)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 104,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 72,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let pork_gorgonzola_pizza_rolls = square3x3.containing(["PORK", "GORGONZOLA", "PIZZA", "ROLLS"], from: words)[0]
        let gorgonzola_parsley_pizza_rolls = square3x3.containing(["GORGONZOLA", "PARSLEY", "PIZZA", "ROLLS"], from: words)[1]
        let parsley_turkey = edges.containing(["PARSLEY", "TURKEY"], from: words)[2]
        let tart_gravy_turkey_pastry = rectangle3x4.containing(["TART", "GRAVY", "TURKEY", "PASTRY"], from: words)[0]
        let gravy_edam_turkey_veal = square3x3.containing(["GRAVY", "EDAM", "TURKEY", "VEAL"], from: words)[0]
        let steak_gorgonzola_pear_stilton = rectangle3x5_TopLeft.containing(["STEAK", "GORGONZOLA", "PEAR", "STILTON"], from: words)[0]
        let mints_steak_nuts_stilton = c2x2.containing(["MINTS", "STEAK", "NUTS", "STILTON"], from: words)[0]
        let loin_mints_lamb_nuts = rectangle3x4.containing(["LOIN", "MINTS", "LAMB", "NUTS"], from: words)[0]
        let soup_steak_stilton_duck = rectangle3x4_TopLeft.containing(["SOUP", "STEAK", "STILTON", "DUCK"], from: words)[0]
        let gorgonzola_sago_eggs_stilton = rectangle3x5_BottomRight.containing(["GORGONZOLA", "SAGO", "EGGS", "STILTON"], from: words)[0]
        let pork_milk = edges.containing(["PORK", "MILK"], from: words)[0]
        let meat_milk = edges.containing(["MEAT", "MILK"], from: words)[0]
        let meat_tea = edges.containing(["MEAT", "TEA"], from: words)[2]
        let meat_pie = edges.containing(["MEAT", "PIE"], from: words)[0]
        let spice_pie = edges.containing(["SPICE", "PIE"], from: words)[0]

        let winningShapes = [
            pork_gorgonzola_pizza_rolls,
            gorgonzola_parsley_pizza_rolls,
            parsley_turkey,
            tart_gravy_turkey_pastry,
            gravy_edam_turkey_veal,
            steak_gorgonzola_pear_stilton,
            mints_steak_nuts_stilton,
            loin_mints_lamb_nuts,
            soup_steak_stilton_duck,
            gorgonzola_sago_eggs_stilton,
            pork_milk,
            meat_milk,
            meat_tea,
            meat_pie,
            spice_pie
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_8810(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8810)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 66,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 70,
            widthMax: widthMax,
            heightMax: heightMax))

        let orczy_zola = edges.containing(["ORCZY", "ZOLA"], from: words)[1]
        let mann_orczy_rohmer_henry = rectangle3x4.containing(["MANN", "ORCZY", "ROHMER", "HENRY"], from: words)[0]
        let pope_orczy_poe_rohmer = c2x2.containing(["POPE", "ORCZY", "POE", "ROHMER"], from: words)[0]
        let waugh_pope_hugo_rohmer = square3x3.containing(["WAUGH", "POPE", "HUGO", "ROHMER"], from: words)[0]
        let waugh_shaw = edges.containing(["WAUGH", "SHAW"], from: words)[2]
        let gaskin_shaw = edges.containing(["GASKIN", "SHAW"], from: words)[0]
        let pope_pepys = edges.containing(["POPE", "PEPYS"], from: words)[0]
        let kyne_grey_heyer_pepys = square3x3.containing(["KYNE", "GREY", "HEYER", "PEPYS"], from: words)[0]
        let gaskin_glyn = edges.containing(["GASKIN", "GLYN"], from: words)[0]
        let cheyney_henry = edges.containing(["CHEYNEY", "HENRY"], from: words)[0]
        let cheyney_sand_sayers_eden = rectangle3x4.containing(["CHEYNEY", "SAND", "SAYERS", "EDEN"], from: words)[0]
        let sand_hardy_ayres_doyle = square3x3.containing(["SAND", "HARDY", "AYRES", "DOYLE"], from: words)[0]
        let cheyney_hay = edges.containing(["CHEYNEY", "HAY"], from: words)[2]
        let dumas_sayers = edges.containing(["DUMAS", "SAYERS"], from: words)[0]
        let jacobs_ayres = edges.containing(["JACOBS", "AYRES"], from: words)[1]
       
        let winningShapes = [
            orczy_zola,
            mann_orczy_rohmer_henry,
            pope_orczy_poe_rohmer,
            waugh_pope_hugo_rohmer,
            waugh_shaw,
            gaskin_shaw,
            pope_pepys,
            kyne_grey_heyer_pepys,
            gaskin_glyn,
            cheyney_henry,
            cheyney_sand_sayers_eden,
            sand_hardy_ayres_doyle,
            cheyney_hay,
            dumas_sayers,
            jacobs_ayres
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_8811(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8811)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 82,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 142,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 28,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 92,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 54,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x6_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 60,
            widthMax: widthMax,
            heightMax: heightMax))

        let maize_guava_fig_zucchini_pea = c2x3.containing(["MAIZE", "GUAVA", "FIG", "ZUCCHINI", "PEA"], from: words)[0]
        let papaya_guava_pea_pear = square3x3.containing(["PAPAYA", "GUAVA", "PEA", "PEAR"], from: words)[1]
        let papaya_yam = edges.containing(["PAPAYA", "YAM"], from: words)[0]
        let cherry_celery_zucchini_orange = rectangle3x5_BottomLeft.containing(["CHERRY", "CELERY", "ZUCCHINI", "ORANGE"], from: words)[0]
        let cherry_celery_orange_lychee = rectangle3x5.containing(["CHERRY", "CELERY", "ORANGE", "LYCHEE"], from: words)[0]
        let cos_celery_lychee_parsley = rectangle3x4.containing(["COS", "CELERY", "LYCHEE", "PARSLEY"], from: words)[0]
        let maize_mango = edges.containing(["MAIZE", "MANGO"], from: words)[0]
        let pecan_sago_citrus_mango = rectangle4x6_TopRight.containing(["PECAN", "SAGO", "CITRUS", "MANGO"], from: words)[0]
        let plum_sago_citrus_marrow = c2x2.containing(["PLUM", "SAGO", "CITRUS", "MARROW"], from: words)[0]
        let plum_taro_potato_marrow = rectangle4x5.containing(["PLUM", "TARO", "POTATO", "MARROW"], from: words)[0]
        let date_citrus = edges.containing(["DATE", "CITRUS"], from: words)[0]
        let raisin_marrow = edges.containing(["RAISIN", "MARROW"], from: words)[1]
        let raisin_soy = edges.containing(["RAISIN", "SOY"], from: words)[0]

        let winningShapes = [
            maize_guava_fig_zucchini_pea,
            papaya_guava_pea_pear,
            papaya_yam,
            cherry_celery_zucchini_orange,
            cherry_celery_orange_lychee,
            cos_celery_lychee_parsley,
            maize_mango,
            pecan_sago_citrus_mango,
            plum_sago_citrus_marrow,
            plum_taro_potato_marrow,
            date_citrus,
            raisin_marrow,
            raisin_soy
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_8812(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8812)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 86,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let pacman3x3_TopRight = ShapeCalculator.toShapes(pacmans: PacmanCalculatorV1.TopRight(
            words: words,
            end: end,
            len: len,
            scoreMin: 152,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 72,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 60,
            widthMax: widthMax,
            heightMax: heightMax))

        let azalea_annual_zinnia_leaf = square3x3.containing(["AZALEA", "ANNUAL", "ZINNIA", "LEAF"], from: words)[0]
        let annual_trim_wattle_zinnia = square3x3.containing(["ANNUAL", "TRIM", "WATTLE", "ZINNIA"], from: words)[0]
        let alow_violet_vine_wattle = rectangle3x5_TopLeft.containing(["ALOW", "VIOLET", "VINE", "WATTLE"], from: words)[0]
        let violet_pest_vine_lotus = square3x3.containing(["VIOLET", "PEST", "VINE", "LOTUS"], from: words)[0]
        let pest_tuber_hose_stock_lotus_bed = pacman3x3_TopRight.containing(["PEST", "TUBER", "HOSE", "STOCK", "LOTUS", "BED"], from: words)[0]
        let tuber_rose = edges.containing(["TUBER", "ROSE"], from: words)[1]
        let sow_rose = edges.containing(["SOW", "ROSE"], from: words)[0]
        let sow_lawn = edges.containing(["SOW", "LAWN"], from: words)[0]
        let lily_natives_lawn_plant = rectangle3x4.containing(["LILY", "NATIVES", "LAWN", "PLANT"], from: words)[0]
        let pansy_lily_plant_may = c2x2.containing(["PANSY", "LILY", "PLANT", "MAY"], from: words)[0]
        let tap_pansy_may_poppy = rectangle3x4_TopLeft.containing(["TAP", "PANSY", "MAY", "POPPY"], from: words)[0]
        let tap_pot = edges.containing(["TAP", "POT"], from: words)[0]
        let pansy_can_may_spade = square3x3_BottomLeft.containing(["PANSY", "CAN", "MAY", "SPADE"], from: words)[1]
        let rake_stock = edges.containing(["RAKE", "STOCK"], from: words)[0]

        let winningShapes = [
            azalea_annual_zinnia_leaf,
            annual_trim_wattle_zinnia,
            alow_violet_vine_wattle,
            violet_pest_vine_lotus,
            pest_tuber_hose_stock_lotus_bed,
            tuber_rose,
            sow_rose,
            sow_lawn,
            lily_natives_lawn_plant,
            pansy_lily_plant_may,
            tap_pansy_may_poppy,
            tap_pot,
            pansy_can_may_spade,
            rake_stock
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_8902(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8902)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 154,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 28,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 132,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let square5x5_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 4,
            words: words,
            lengths: len,
            scoreMin: 88,
            widthMax: widthMax,
            heightMax: heightMax))

        let flowers_rendezvous_waltz_woo = square3x3.containing(["FLOWERS", "RENDEZVOUS", "WALTZ", "WOO"], from: words)[0]
        let flowers_rendezvous_waltz_words = rectangle3x5.containing(["FLOWERS", "RENDEZVOUS", "WALTZ", "WORDS"], from: words)[0]
        let pew_words = edges.containing(["PEW", "WORDS"], from: words)[0]
        let pew_trip = edges.containing(["PEW", "TRIP"], from: words)[0]
        let guests_tryst_post_trip_posy = c2x3.containing(["GUESTS", "TRYST", "POST", "TRIP", "POSY"], from: words)[0]
        let old_tryst_posy_date = square3x3.containing(["OLD", "TRYST", "POSY", "DATE"], from: words)[0]
        let guests_trust = edges.containing(["GUESTS", "TRUST"], from: words)[1]
        let toast_gift_taxi_trust = square5x5_BottomLeft.containing(["TOAST", "GIFT", "TAXI", "TRUST"], from: words)[1]
        let mix_taxi = edges.containing(["MIX", "TAXI"], from: words)[0]
        let mix_hymn = edges.containing(["MIX", "HYMN"], from: words)[0]
        let joy_hymn = edges.containing(["JOY", "HYMN"], from: words)[0]
        let win_hymn = edges.containing(["WIN", "HYMN"], from: words)[0]
        let win_wine = edges.containing(["WIN", "WINE"], from: words)[0]
        let gift_roses_usher_kiss = square3x3_TopLeft.containing(["GIFT", "ROSES", "USHER", "KISS"], from: words)[0]
        let roses_adore_groom_usher = square3x3.containing(["ROSES", "ADORE", "GROOM", "USHER"], from: words)[0]

        let winningShapes = [
            flowers_rendezvous_waltz_woo,
            flowers_rendezvous_waltz_words,
            pew_words,
            pew_trip,
            guests_tryst_post_trip_posy,
            old_tryst_posy_date,
            guests_trust,
            toast_gift_taxi_trust,
            mix_taxi,
            mix_hymn,
            joy_hymn,
            win_hymn,
            win_wine,
            gift_roses_usher_kiss,
            roses_adore_groom_usher
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_8903(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8903)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let tanzania_zambia = edges.containing(["TANZANIA", "ZAMBIA"], from: words)[0]
        let germany_tanzania_yemen_guyana = rectangle3x4.containing(["GERMANY", "TANZANIA", "YEMEN", "GUYANA"], from: words)[0]
        let italy_germany_togo_yemen = rectangle3x4.containing(["ITALY", "GERMANY", "TOGO", "YEMEN"], from: words)[0]
        let uruguay_tanzania_guyana_hungary = rectangle3x4.containing(["URUGUAY", "TANZANIA", "GUYANA", "HUNGARY"], from: words)[1]
        let uruguay_syria = edges.containing(["URUGUAY", "SYRIA"], from: words)[1]
        let tanzania_cyprus_guyana_hungary = square3x3_BottomLeft.containing(["TANZANIA", "CYPRUS", "GUYANA", "HUNGARY"], from: words)[1]
        let uruguay_cuba = edges.containing(["URUGUAY", "CUBA"], from: words)[2]
        let cyprus_sudan_peru_burma = rectangle3x4.containing(["CYPRUS", "SUDAN", "PERU", "BURMA"], from: words)[0]
        let tanzania_turkey = edges.containing(["TANZANIA", "TURKEY"], from: words)[0]
        let kenya_turkey = edges.containing(["KENYA", "TURKEY"], from: words)[1]
        let zaire_turkey = edges.containing(["ZAIRE", "TURKEY"], from: words)[0]
        let zaire_belize = edges.containing(["ZAIRE", "BELIZE"], from: words)[0]
        let niger_zambia = edges.containing(["NIGER", "ZAMBIA"], from: words)[0]

        let winningShapes = [
            tanzania_zambia,
            germany_tanzania_yemen_guyana,
            italy_germany_togo_yemen,
            uruguay_tanzania_guyana_hungary,
            uruguay_syria,
            tanzania_cyprus_guyana_hungary,
            uruguay_cuba,
            cyprus_sudan_peru_burma,
            tanzania_turkey,
            kenya_turkey,
            zaire_turkey,
            zaire_belize,
            niger_zambia
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_8904(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8904)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 126,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x4(
           words: words,
           end: end,
           len: len,
           scoreMin: 168,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 78,
            widthMax: widthMax,
            heightMax: heightMax))

        let zigzag_zipper = edges.containing(["ZIGZAG", "ZIPPER"], from: words)[0]
        let west_party_wallet_zipper_stage_city = c2x4.containing(["WEST", "PARTY", "WALLET", "ZIPPER", "STAGE", "CITY"], from: words)[0]
        let tahiti_wallet = edges.containing(["TAHITI", "WALLET"], from: words)[2]
        let tahiti_east = edges.containing(["TAHITI", "EAST"], from: words)[1]
        let cards_city = edges.containing(["CARDS", "CITY"], from: words)[0]
        let cards_sun = edges.containing(["CARDS", "SUN"], from: words)[0]
        let usa_money_sun_sea_relay = c2x3.containing(["USA", "MONEY", "SUN", "SEA", "RELAY"], from: words)[0]
        let money_orient = edges.containing(["MONEY", "ORIENT"], from: words)[0]
        let cards_air = edges.containing(["CARDS", "AIR"], from: words)[1]
        let swim_italy_ski_orient = rectangle3x4_BottomLeft.containing(["SWIM", "ITALY", "SKI", "ORIENT"], from: words)[0]
        let italy_fly = edges.containing(["ITALY", "FLY"], from: words)[1]
        let keys_east = edges.containing(["KEYS", "EAST"], from: words)[0]
        let keys_journey = edges.containing(["KEYS", "JOURNEY"], from: words)[1]
        let route_sand_ports_journey = square3x3.containing(["ROUTE", "SAND", "PORTS", "JOURNEY"], from: words)[0]
        let jet_route_journey_trek = square3x3.containing(["JET", "ROUTE", "JOURNEY", "TREK"], from: words)[0]

        let winningShapes = [
            zigzag_zipper,
            west_party_wallet_zipper_stage_city,
            tahiti_wallet,
            tahiti_east,
            cards_city,
            cards_sun,
            usa_money_sun_sea_relay,
            money_orient,
            cards_air,
            swim_italy_ski_orient,
            italy_fly,
            keys_east,
            keys_journey,
            route_sand_ports_journey,
            jet_route_journey_trek
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_8905(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8905)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 84,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x4(
           words: words,
           end: end,
           len: len,
           scoreMin: 160,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 114,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 120,
            widthMax: widthMax,
            heightMax: heightMax))

        let rose_fizz_shiraz_crush = square3x3_BottomRight.containing(["ROSE", "FIZZ", "SHIRAZ", "CRUSH"], from: words)[1]
        let sack_porphyry_shiraz_tokay_crush_whisky = c2x4.containing(["SACK", "PORPHYRY", "SHIRAZ", "TOKAY", "CRUSH", "WHISKY"], from: words)[0]
        let scotch_sack_tokay_whisky = rectangle3x4.containing(["SCOTCH", "SACK", "TOKAY", "WHISKY"], from: words)[0]
        let porphyry_ouzo_cola_booze = square3x3_TopLeft.containing(["PORPHYRY", "OUZO", "COLA", "BOOZE"], from: words)[1]
        let ouzo_bar_cola_booze = square3x3_BottomRight.containing(["OUZO", "BAR", "COLA", "BOOZE"], from: words)[1]
        let scotch_asti = edges.containing(["SCOTCH", "ASTI"], from: words)[0]
        let port_asti = edges.containing(["PORT", "ASTI"], from: words)[0]
        let port_nip = edges.containing(["PORT", "NIP"], from: words)[0]
        let wine_nip = edges.containing(["WINE", "NIP"], from: words)[1]
        let wine_water = edges.containing(["WINE", "WATER"], from: words)[0]
        let split_grog_milk_water = square3x3_BottomLeft.containing(["SPLIT", "GROG", "MILK", "WATER"], from: words)[0]
        let split_spirit = edges.containing(["SPLIT", "SPIRIT"], from: words)[0]
        let ice_toddy_spirit_coke_red = c2x3.containing(["ICE", "TODDY", "SPIRIT", "COKE", "RED"], from: words)[0]
        let toddy_rye = edges.containing(["TODDY", "RYE"], from: words)[0]
        let rum_milk = edges.containing(["RUM", "MILK"], from: words)[0]
        let mead_coke = edges.containing(["MEAD", "COKE"], from: words)[0]

        let winningShapes = [
            rose_fizz_shiraz_crush,
            sack_porphyry_shiraz_tokay_crush_whisky,
            scotch_sack_tokay_whisky,
            porphyry_ouzo_cola_booze,
            ouzo_bar_cola_booze,
            scotch_asti,
            port_asti,
            port_nip,
            wine_nip,
            wine_water,
            split_grog_milk_water,
            split_spirit,
            ice_toddy_spirit_coke_red,
            toddy_rye,
            rum_milk,
            mead_coke
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_8705(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8705)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 66,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 106,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x4(
           words: words,
           end: end,
           len: len,
           scoreMin: 132,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 88,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 78,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let pansy_mower_stalk_path_pest_earth = c2x4.containing(["PANSY", "MOWER", "STALK", "PATH", "PEST", "EARTH"], from: words)[0]
        let pansy_lily = edges.containing(["PANSY", "LILY"], from: words)[0]
        let sweep_mower_stem_poppy = c2x2.containing(["SWEEP", "MOWER", "STEM", "POPPY"], from: words)[0]
        let mower_peony_pool_poppy = rectangle3x4_TopLeft.containing(["MOWER", "PEONY", "POOL", "POPPY"], from: words)[0]
        let alyssum_mimosa_sweep_grass_lawn = c2x3.containing(["ALYSSUM", "MIMOSA", "SWEEP", "GRASS", "LAWN"], from: words)[0]
        let alyssum_sweep_stem_bud = square3x3_BottomRight.containing(["ALYSSUM", "SWEEP", "STEM", "BUD"], from: words)[1]
        let alyssum_may = edges.containing(["ALYSSUM", "MAY"], from: words)[0]
        let pansy_stalk_earth_salvia = square3x3.containing(["PANSY", "STALK", "EARTH", "SALVIA"], from: words)[0]
        let pot_mimosa_palm_trim = rectangle3x4.containing(["POT", "MIMOSA", "PALM", "TRIM"], from: words)[0]
        let dig_salvia = edges.containing(["DIG", "SALVIA"], from: words)[0]
        let peony_tap = edges.containing(["PEONY", "TAP"], from: words)[0]

        let winningShapes = [
            pansy_mower_stalk_path_pest_earth,
            pansy_lily,
            sweep_mower_stem_poppy,
            mower_peony_pool_poppy,
            alyssum_mimosa_sweep_grass_lawn,
            alyssum_sweep_stem_bud,
            alyssum_may,
            pansy_stalk_earth_salvia,
            pot_mimosa_palm_trim,
            dig_salvia,
            peony_tap
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
   
    private static func Shapes_8906(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8906)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 66,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 162,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 62,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 144,
            widthMax: widthMax,
            heightMax: heightMax))

        let ozone_eros_meteor_zodiac_cosmos = c2x3.containing(["OZONE", "EROS", "METEOR", "ZODIAC", "COSMOS"], from: words)[0]
        let epoch_ozone_meteor_cosmos = rectangle3x4.containing(["EPOCH", "OZONE", "METEOR", "COSMOS"], from: words)[0]
        let epoch_ozone_cosmos_phase = rectangle3x4.containing(["EPOCH", "OZONE", "COSMOS", "PHASE"], from: words)[0]
        let comet_meteor = edges.containing(["COMET", "METEOR"], from: words)[2]
        let comet_saturn_crater_moon = c2x2.containing(["COMET", "SATURN", "CRATER", "MOON"], from: words)[0]
        let saturn_zenith_syzygy_titan = square3x3.containing(["SATURN", "ZENITH", "SYZYGY", "TITAN"], from: words)[0]
        let day_syzygy = edges.containing(["DAY", "SYZYGY"], from: words)[0]
        let sky_syzygy = edges.containing(["SKY", "SYZYGY"], from: words)[2]
        
        // do this first
        let aries_crater = edges.containing(["ARIES", "CRATER"], from: words)[2]
        let aries_arc = edges.containing(["ARIES", "ARC"], from: words)[0]
        // We have to move this one even though its highest scoring
        let year_syzygy = edges.containing(["YEAR", "SYZYGY"], from: words)[2]
        let sky_star = edges.containing(["SKY", "STAR"], from: words)[0]
        let light_titan = edges.containing(["LIGHT", "TITAN"], from: words)[0]
        let time_moon = edges.containing(["TIME", "MOON"], from: words)[0]
        let aries_sun = edges.containing(["ARIES", "SUN"], from: words)[0]
        let uranus_sun = edges.containing(["URANUS", "SUN"], from: words)[1]
        let uranus_ursa = edges.containing(["URANUS", "URSA"], from: words)[4]
        let light_cloud = edges.containing(["LIGHT", "CLOUD"], from: words)[0]

        let winningShapes = [
            ozone_eros_meteor_zodiac_cosmos,
            epoch_ozone_meteor_cosmos,
            epoch_ozone_cosmos_phase,
            comet_meteor,
            comet_saturn_crater_moon,
            saturn_zenith_syzygy_titan,
            day_syzygy,
            sky_syzygy,
            aries_crater,
            aries_arc,
            year_syzygy,
            sky_star,
            light_titan,
            time_moon,
            aries_sun,
            uranus_sun,
            uranus_ursa,
            light_cloud,
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
   
    
    private static func Shapes_8907(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8907)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax

        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: widthMax,
            heightMax: heightMax))

        let outer2x3 = ShapeCalculator.toShapes(outers: OuterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 140,
           widthMax: widthMax,
           heightMax: heightMax))

        let pacman3x3_BottomRight = ShapeCalculator.toShapes(pacmans: PacmanCalculatorV1.BottomRight(
            words: words,
            end: end,
            len: len,
            scoreMin: 180,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 116,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 78,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 58,
            widthMax: widthMax,
            heightMax: heightMax))

        let shape_rule_quartz_art_puzzle_easel = pacman3x3_BottomRight.containing(["SHAPE", "RULE", "QUARTZ", "ART", "PUZZLE", "EASEL"], from: words)[0]
        let zipper_puzzle = edges.containing(["ZIPPER", "PUZZLE"], from: words)[3]
        let quartz_scraps_hat_nuts = square3x3_TopLeft.containing(["QUARTZ", "SCRAPS", "HAT", "NUTS"], from: words)[0]
        let rod_scraps_brush_hat = rectangle3x4_BottomLeft.containing(["ROD", "SCRAPS", "BRUSH", "HAT"], from: words)[0]
        let quartz_jewel_rope_puzzle = rectangle3x4.containing(["QUARTZ", "JEWEL", "ROPE", "PUZZLE"], from: words)[0]
        let bow_rod_brush_plywood = square3x3_TopLeft.containing(["BOW", "ROD", "BRUSH", "PLYWOOD"], from: words)[0]
        let toys_wax_bow_plywood_saw = outer2x3.containing(["TOYS", "WAX", "BOW", "PLYWOOD", "SAW"], from: words)[0]
        let toys_lath = edges.containing(["TOYS", "LATH"], from: words)[0]
        let shape_tools = edges.containing(["SHAPE", "TOOLS"], from: words)[0]
        let paint_tools = edges.containing(["PAINT", "TOOLS"], from: words)[0]
        let wool_tools = edges.containing(["WOOL", "TOOLS"], from: words)[2]
        //let paint_plywood = edges.containing(["PAINT", "PLYWOOD"], from: words)[0]
        let wool_awl = edges.containing(["WOOL", "AWL"], from: words)[1]
        let wheels_awl = edges.containing(["WHEELS", "AWL"], from: words)[0]
        let wheels_sew_easel_clown = square3x3.containing(["WHEELS", "SEW", "EASEL", "CLOWN"], from: words)[0]
        let net_clown = edges.containing(["NET", "CLOWN"], from: words)[0]
        let net_cut = edges.containing(["NET", "CUT"], from: words)[0]
        let zipper_spin = edges.containing(["ZIPPER", "SPIN"], from: words)[2]
        let zipper_draw = edges.containing(["ZIPPER", "DRAW"], from: words)[0]

        let winningShapes = [
            shape_rule_quartz_art_puzzle_easel,
            zipper_puzzle,
            quartz_scraps_hat_nuts,
            rod_scraps_brush_hat,
            quartz_jewel_rope_puzzle,
            bow_rod_brush_plywood,
            toys_wax_bow_plywood_saw,
            toys_lath,
            shape_tools,
            paint_tools,
            wool_tools,
            //paint_plywood,
            wool_awl,
            wheels_awl,
            wheels_sew_easel_clown,
            net_clown,
            net_cut,
            zipper_spin,
            zipper_draw
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_8908(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8908)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 94,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 78,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x6_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 116,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 104,
            widthMax: widthMax,
            heightMax: heightMax))

        let snow_moritz_olympics_freeze = rectangle3x6_TopRight.containing(["SNOW", "MORITZ", "OLYMPICS", "FREEZE"], from: words)[0]
        let snow_flurry_resort_olympics = square3x3.containing(["SNOW", "FLURRY", "RESORT", "OLYMPICS"], from: words)[0]
        let skis_flurry_white_lift_sled = c2x3.containing(["SKIS", "FLURRY", "WHITE", "LIFT", "SLED"], from: words)[0]
        let skis_pass = edges.containing(["SKIS", "PASS"], from: words)[2]
        let gloves_pass = edges.containing(["GLOVES", "PASS"], from: words)[0]
        let gloves_alps_gear_davos = rectangle3x4.containing(["GLOVES", "ALPS", "GEAR", "DAVOS"], from: words)[0]
        let white_wet = edges.containing(["WHITE", "WET"], from: words)[0]
        let quiet_wet = edges.containing(["QUIET", "WET"], from: words)[1]
        let snow_cow = edges.containing(["SNOW", "COW"], from: words)[1]
        let quiet_luge = edges.containing(["QUIET", "LUGE"], from: words)[0]
        let frost_olympics = edges.containing(["FROST", "OLYMPICS"], from: words)[1]
        let powder_resort = edges.containing(["POWDER", "RESORT"], from: words)[0]
        let white_italy = edges.containing(["WHITE", "ITALY"], from: words)[0]
        let germany_italy = edges.containing(["GERMANY", "ITALY"], from: words)[1]
        let cold_davos = edges.containing(["COLD", "DAVOS"], from: words)[0]
        let ice_cow = edges.containing(["ICE", "COW"], from: words)[0]

        let winningShapes = [
            snow_moritz_olympics_freeze,
            snow_flurry_resort_olympics,
            skis_flurry_white_lift_sled,
            skis_pass,
            gloves_pass,
            gloves_alps_gear_davos,
            white_wet,
            quiet_wet,
            snow_cow,
            quiet_luge,
            frost_olympics,
            powder_resort,
            white_italy,
            germany_italy,
            cold_davos,
            ice_cow
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_8909(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8909)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 132,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 148,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 120,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 92,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let azalea_pansy_zinnia_lily = rectangle3x4.containing(["AZALEA", "PANSY", "ZINNIA", "LILY"], from: words)[0]
        let azalea_pansy_poppy_zinnia = rectangle3x4_TopLeft.containing(["AZALEA", "PANSY", "POPPY", "ZINNIA"], from: words)[0]
        let may_poppy = edges.containing(["MAY", "POPPY"], from: words)[0]
        let may_mimosa = edges.containing(["MAY", "MIMOSA"], from: words)[1]
        let sage_mimosa = edges.containing(["SAGE", "MIMOSA"], from: words)[0]
        let azalea_aloe = edges.containing(["AZALEA", "ALOE"], from: words)[4]
        let oxlip_aloe = edges.containing(["OXLIP", "ALOE"], from: words)[0]
        let oxlip_tansy_lotus_lupin = square3x3.containing(["OXLIP", "TANSY", "LOTUS", "LUPIN"], from: words)[0]
        let tansy_cactus_stock_lotus_aster = c2x3.containing(["TANSY", "CACTUS", "STOCK", "LOTUS", "ASTER"], from: words)[0]
        let tulip_tansy_lupin_peony = rectangle3x5.containing(["TULIP", "TANSY", "LUPIN", "PEONY"], from: words)[0]
        let cactus_rose_iris_balsam = square3x3_TopLeft.containing(["CACTUS", "ROSE", "IRIS", "BALSAM"], from: words)[0]
        let rose_alyssum_iris_balsam = square3x3.containing(["ROSE", "ALYSSUM", "IRIS", "BALSAM"], from: words)[0]
        let nerine_aster = edges.containing(["NERINE", "ASTER"], from: words)[2]

        let winningShapes = [
            azalea_pansy_zinnia_lily,
            azalea_pansy_poppy_zinnia,
            may_poppy,
            may_mimosa,
            sage_mimosa,
            azalea_aloe,
            oxlip_aloe,
            oxlip_tansy_lotus_lupin,
            tansy_cactus_stock_lotus_aster,
            tulip_tansy_lupin_peony,
            cactus_rose_iris_balsam,
            rose_alyssum_iris_balsam,
            nerine_aster
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
       
    
    private static func Shapes_8910(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8910)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax

        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c3x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C3x4(
           words: words,
           end: end,
           len: len,
           scoreMin: 186,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 28,
            widthMax: widthMax,
            heightMax: heightMax))

        let outer2x3 = ShapeCalculator.toShapes(outers: OuterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 108,
           widthMax: widthMax,
           heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 70,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 108,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 52,
            widthMax: widthMax,
            heightMax: heightMax))

        let surveyor_unionist_typist_writer = square3x3.containing(["SURVEYOR", "UNIONIST", "TYPIST", "WRITER"], from: words)[0]
        let unionist_usher_porter_nurse_typist_shearer_writer = c3x4.containing(["UNIONIST", "USHER", "PORTER", "NURSE", "TYPIST", "SHEARER", "WRITER"], from: words)[0]
        let surveyor_unionist_sculptor_typist = rectangle3x6.containing(["SURVEYOR", "UNIONIST", "SCULPTOR", "TYPIST"], from: words)[0]
        let porter_pilot = edges.containing(["PORTER", "PILOT"], from: words)[0]
        let brewer_shearer = edges.containing(["BREWER", "SHEARER"], from: words)[1]
        let critic_brewer_crew_vicar = rectangle3x4.containing(["CRITIC", "BREWER", "CREW", "VICAR"], from: words)[0]
        let vet_critic_vicar_valet_tiler = outer2x3.containing(["VET", "CRITIC", "VICAR", "VALET", "TILER"], from: words)[0]
        let navvy_valet = edges.containing(["NAVVY", "VALET"], from: words)[0]
        let navvy_ayah = edges.containing(["NAVVY", "AYAH"], from: words)[0]
        let navvy_monk = edges.containing(["NAVVY", "MONK"], from: words)[0]
        let maid_monk = edges.containing(["MAID", "MONK"], from: words)[0]
        let critic_agent_vicar_tiler = square3x3.containing(["CRITIC", "AGENT", "VICAR", "TILER"], from: words)[0]

        let winningShapes = [
            surveyor_unionist_typist_writer,
            unionist_usher_porter_nurse_typist_shearer_writer,
            surveyor_unionist_sculptor_typist,
            porter_pilot,
            brewer_shearer,
            critic_brewer_crew_vicar,
            vet_critic_vicar_valet_tiler,
            navvy_valet,
            navvy_ayah,
            navvy_monk,
            maid_monk,
            critic_agent_vicar_tiler
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_8911(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8911)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c3x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C3x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 142,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let pacman3x3_BottomRight = ShapeCalculator.toShapes(pacmans: PacmanCalculatorV1.BottomRight(
            words: words,
            end: end,
            len: len,
            scoreMin: 138,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 62,
            widthMax: widthMax,
            heightMax: heightMax))

        let trainer_zulu_prize_field = square3x3.containing(["TRAINER", "ZULU", "PRIZE", "FIELD"], from: words)[0]
        let hats_tuesday_trainer_gate_turf_course = pacman3x3_BottomRight.containing(["HATS", "TUESDAY", "TRAINER", "GATE", "TURF", "COURSE"], from: words)[0]
        let tuesday_money = edges.containing(["TUESDAY", "MONEY"], from: words)[1]
        let time_wotan_wins_kiwi_money_bets = c3x3.containing(["TIME", "WOTAN", "WINS", "KIWI", "MONEY", "BETS"], from: words)[0]
        let tuesday_silks = edges.containing(["TUESDAY", "SILKS"], from: words)[0]
        let wotan_owner = edges.containing(["WOTAN", "OWNER"], from: words)[2]
        let run_course = edges.containing(["RUN", "COURSE"], from: words)[1]
        let tuesday_filly_turf_silks = square3x3.containing(["TUESDAY", "FILLY", "TURF", "SILKS"], from: words)[0]
        let start_silks = edges.containing(["START", "SILKS"], from: words)[1]
        let start_colt = edges.containing(["START", "COLT"], from: words)[1]
        let cup_colt = edges.containing(["CUP", "COLT"], from: words)[0]
        let cup_post = edges.containing(["CUP", "POST"], from: words)[0]
        let track_course = edges.containing(["TRACK", "COURSE"], from: words)[0]
        let track_tab = edges.containing(["TRACK", "TAB"], from: words)[0]
        let malua_tab = edges.containing(["MALUA", "TAB"], from: words)[1]
        let malua_race_mare_place = square3x3.containing(["MALUA", "RACE", "MARE", "PLACE"], from: words)[0]

        let winningShapes = [
            trainer_zulu_prize_field,
            hats_tuesday_trainer_gate_turf_course,
            tuesday_money,
            time_wotan_wins_kiwi_money_bets,
            tuesday_silks,
            wotan_owner,
            run_course,
            tuesday_filly_turf_silks,
            start_silks,
            start_colt,
            cup_colt,
            cup_post,
            track_course,
            track_tab,
            malua_tab,
            malua_race_mare_place
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_8912(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 8912)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 86,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 106,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 90,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 90,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 128,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let blitzen_card_holly_razor = rectangle3x4_TopRight.containing(["BLITZEN", "CARD", "HOLLY", "RAZOR"], from: words)[0]
        let blitzen_joy_box_holly = c2x2.containing(["BLITZEN", "JOY", "BOX", "HOLLY"], from: words)[0]
        let iron_blitzen_razor_seasoning = square3x3.containing(["IRON", "BLITZEN", "RAZOR", "SEASONING"], from: words)[0]
        let bells_tools_belt_seasoning = rectangle4x5.containing(["BELLS", "TOOLS", "BELT", "SEASONING"], from: words)[0]
        let watch_holly = edges.containing(["WATCH", "HOLLY"], from: words)[0]
        let yule_watch_toys_sweets = rectangle3x4_TopRight.containing(["YULE", "WATCH", "TOYS", "SWEETS"], from: words)[0]
        let ties_yule_toys_sweets = rectangle3x4.containing(["TIES", "YULE", "TOYS", "SWEETS"], from: words)[0]
        let video_socks_vase_toys = rectangle3x5.containing(["VIDEO", "SOCKS", "VASE", "TOYS"], from: words)[0]
        let wine_sweets = edges.containing(["WINE", "SWEETS"], from: words)[0]
        let watch_wallet = edges.containing(["WATCH", "WALLET"], from: words)[0]
        let tinsel_santa_nuts_wallet = square4x4.containing(["TINSEL", "SANTA", "NUTS", "WALLET"], from: words)[0]
        let tinsel_tree = edges.containing(["TINSEL", "TREE"], from: words)[0]

        let winningShapes = [
            blitzen_card_holly_razor,
            blitzen_joy_box_holly,
            iron_blitzen_razor_seasoning,
            bells_tools_belt_seasoning,
            watch_holly,
            yule_watch_toys_sweets,
            ties_yule_toys_sweets,
            video_socks_vase_toys,
            wine_sweets,
            watch_wallet,
            tinsel_santa_nuts_wallet,
            tinsel_tree
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9001(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9001)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 90,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 70,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let eyre_jantz_lyons_menzies = square3x3.containing(["EYRE", "JANTZ", "LYONS", "MENZIES"], from: words)[0]
        let fisk_menzies = edges.containing(["FISK", "MENZIES"], from: words)[1]
        let mawson_menzies = edges.containing(["MAWSON", "MENZIES"], from: words)[0]
        let mawson_oxley = edges.containing(["MAWSON", "OXLEY"], from: words)[0]
        let boyd_oxley = edges.containing(["BOYD", "OXLEY"], from: words)[1]
        let gold_oxley = edges.containing(["GOLD", "OXLEY"], from: words)[1]
        let fisk_fysh = edges.containing(["FISK", "FYSH"], from: words)[0]
        let murray_chifley_dark_fysh = square3x3_BottomLeft.containing(["MURRAY", "CHIFLEY", "DARK", "FYSH"], from: words)[0]
        let chifley_quay = edges.containing(["CHIFLEY", "QUAY"], from: words)[0]
        let murray_sturt = edges.containing(["MURRAY", "STURT"], from: words)[0]
        let bass_smith_roberts_sturt = rectangle4x5.containing(["BASS", "SMITH", "ROBERTS", "STURT"], from: words)[0]
        let reid_bass_roberts_sirius = square3x3.containing(["REID", "BASS", "ROBERTS", "SIRIUS"], from: words)[0]
        let fisher_sirius = edges.containing(["FISHER", "SIRIUS"], from: words)[0]
        let hume_quay = edges.containing(["HUME", "QUAY"], from: words)[0]
        let hume_dobell = edges.containing(["HUME", "DOBELL"], from: words)[0]

        let winningShapes = [
            eyre_jantz_lyons_menzies,
            fisk_menzies,
            mawson_menzies,
            mawson_oxley,
            boyd_oxley,
            gold_oxley,
            fisk_fysh,
            murray_chifley_dark_fysh,
            chifley_quay,
            murray_sturt,
            bass_smith_roberts_sturt,
            reid_bass_roberts_sirius,
            fisher_sirius,
            hume_quay,
            hume_dobell
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9002(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9002)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax

        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let special9002a = SpecialShapesCalculator.C9002a(words: words)

        let special9002b = SpecialShapesCalculator.C9002b(words: words)

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 98,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 124,
            widthMax: widthMax,
            heightMax: heightMax))

        let aeneas_zeus_amazons_eros = square4x4.containing(["AENEAS", "ZEUS", "AMAZONS", "EROS"], from: words)[0]
        let aeneas_olympus_eros_styx = square3x3.containing(["AENEAS", "OLYMPUS", "EROS", "STYX"], from: words)[0]
        let olympus_romulus_janus_satyr_uranus_jason_muses_medusa = special9002b.containing(["OLYMPUS", "ROMULUS", "JANUS", "SATYR", "URANUS", "JASON", "MUSES", "MEDUSA"], from: words)[0]
        let neptune_mars_juno_remus_pan_troy_uranus = special9002a.containing(["NEPTUNE", "MARS", "JUNO", "REMUS", "PAN", "TROY", "URANUS"], from: words)[0]
        let romulus_satyr_medusa_ulysses = square3x3.containing(["ROMULUS", "SATYR", "MEDUSA", "ULYSSES"], from: words)[0]
        let romulus_eris = edges.containing(["ROMULUS", "ERIS"], from: words)[1]
        let chaos_ulysses = edges.containing(["CHAOS", "ULYSSES"], from: words)[2]
        let nike_amazons = edges.containing(["NIKE", "AMAZONS"], from: words)[0]
        let nike_kama = edges.containing(["NIKE", "KAMA"], from: words)[0]
       // let neptune_muses = edges.containing(["NEPTUNE", "MUSES"], from: words)[0]

        let winningShapes = [
            aeneas_zeus_amazons_eros,
            aeneas_olympus_eros_styx,
            olympus_romulus_janus_satyr_uranus_jason_muses_medusa,
            neptune_mars_juno_remus_pan_troy_uranus,
            romulus_satyr_medusa_ulysses,
            romulus_eris,
            chaos_ulysses,
            nike_amazons,
            nike_kama
            //neptune_muses
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9003(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9003)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 52,
            widthMax: widthMax,
            heightMax: heightMax))

        let eden_fitzroy_breeza_sydney = rectangle3x4.containing(["EDEN", "FITZROY", "BREEZA", "SYDNEY"], from: words)[0]
        let bunbury_eden_breeza_sydney = rectangle3x4.containing(["BUNBURY", "EDEN", "BREEZA", "SYDNEY"], from: words)[0]
        let bunbury_fitzroy_quilpie_breeza = rectangle3x5.containing(["BUNBURY", "FITZROY", "QUILPIE", "BREEZA"], from: words)[0]
        let fitzroy_ouyen = edges.containing(["FITZROY", "OUYEN"], from: words)[0]
        let ayr_ouyen = edges.containing(["AYR", "OUYEN"], from: words)[0]
        let young_ouyen = edges.containing(["YOUNG", "OUYEN"], from: words)[3]
        let young_hay = edges.containing(["YOUNG", "HAY"], from: words)[0]
        let nhill_quilpie = edges.containing(["NHILL", "QUILPIE"], from: words)[2]
        let nhill_lorne = edges.containing(["NHILL", "LORNE"], from: words)[2]
        let exeter_scone_texas_lorne = rectangle3x5.containing(["EXETER", "SCONE", "TEXAS", "LORNE"], from: words)[0]
        let stawell_exeter_texas_lorne = rectangle3x5.containing(["STAWELL", "EXETER", "TEXAS", "LORNE"], from: words)[0]
        let scone_wyee_nowra_bega = square3x3_TopRight.containing(["SCONE", "WYEE", "NOWRA", "BEGA"], from: words)[0]
        let wyee_avoca_bega_moe = square3x3_TopRight.containing(["WYEE", "AVOCA", "BEGA", "MOE"], from: words)[0]
        let scone_cairns = edges.containing(["SCONE", "CAIRNS"], from: words)[1]
        let uki_yass_tully_cairns = rectangle3x4.containing(["UKI", "YASS", "TULLY", "CAIRNS"], from: words)[0]

        let winningShapes = [
            eden_fitzroy_breeza_sydney,
            bunbury_eden_breeza_sydney,
            bunbury_fitzroy_quilpie_breeza,
            fitzroy_ouyen,
            ayr_ouyen,
            young_ouyen,
            young_hay,
            nhill_quilpie,
            nhill_lorne,
            exeter_scone_texas_lorne,
            stawell_exeter_texas_lorne,
            scone_wyee_nowra_bega,
            wyee_avoca_bega_moe,
            scone_cairns,
            uki_yass_tully_cairns
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9004(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9004)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 54,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let quartz_zinc = edges.containing(["QUARTZ", "ZINC"], from: words)[0]
        let quartz_ruby_quarry_porphyry = square4x4.containing(["QUARTZ", "RUBY", "QUARRY", "PORPHYRY"], from: words)[0]
        let pyrites_porphyry = edges.containing(["PYRITES", "PORPHYRY"], from: words)[5]
        let clay_quarry = edges.containing(["CLAY", "QUARRY"], from: words)[1]
        let quartz_radium_quarry_gypsum = c2x2.containing(["QUARTZ", "RADIUM", "QUARRY", "GYPSUM"], from: words)[1]
        let onyx_quartz_rock_gypsum = rectangle3x4_BottomLeft.containing(["ONYX", "QUARTZ", "ROCK", "GYPSUM"], from: words)[0]
        let reef_radium_silver_face = c2x2.containing(["REEF", "RADIUM", "SILVER", "FACE"], from: words)[0]
        let jasper_talc_jet_silver = square3x3.containing(["JASPER", "TALC", "JET", "SILVER"], from: words)[0]
        let pewter_porphyry = edges.containing(["PEWTER", "PORPHYRY"], from: words)[0]
        let topaz_pewter_pit_zircon = square3x3.containing(["TOPAZ", "PEWTER", "PIT", "ZIRCON"], from: words)[0]
        let iron_zircon = edges.containing(["IRON", "ZIRCON"], from: words)[3]
        let iron_ochre = edges.containing(["IRON", "OCHRE"], from: words)[1]
        let steel_face = edges.containing(["STEEL", "FACE"], from: words)[1]
        let steel_tin = edges.containing(["STEEL", "TIN"], from: words)[0]

        let winningShapes = [
            quartz_zinc,
            quartz_ruby_quarry_porphyry,
            pyrites_porphyry,
            clay_quarry,
            quartz_radium_quarry_gypsum,
            onyx_quartz_rock_gypsum,
            reef_radium_silver_face,
            jasper_talc_jet_silver,
            pewter_porphyry,
            topaz_pewter_pit_zircon,
            iron_zircon,
            iron_ochre,
            steel_face,
            steel_tin
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9005(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9005)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 90,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 102,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 128,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 88,
            widthMax: widthMax,
            heightMax: heightMax))

        let mezzo_tenor_bizet_joan = square3x3.containing(["MEZZO", "TENOR", "BIZET", "JOAN"], from: words)[0]
        let tenor_pinza_duo_opus_trio = c2x3.containing(["TENOR", "PINZA", "DUO", "OPUS", "TRIO"], from: words)[0]
        let tempo_pinza_trio_mozart = square3x3.containing(["TEMPO", "PINZA", "TRIO", "MOZART"], from: words)[0]
        let pinza_baton_mozart_lind = rectangle3x4_TopRight.containing(["PINZA", "BATON", "MOZART", "LIND"], from: words)[0]
        let duo_chorus_duet_opus = c2x2.containing(["DUO", "CHORUS", "DUET", "OPUS"], from: words)[0]
        let chorus_forte_solo_duet = square3x3.containing(["CHORUS", "FORTE", "SOLO", "DUET"], from: words)[0]
        let ruffo_tempo_tune_oboe = rectangle3x4.containing(["RUFFO", "TEMPO", "TUNE", "OBOE"], from: words)[0]
        let chorus_dance = edges.containing(["CHORUS", "DANCE"], from: words)[0]
        let haydn_stage_alto_dance = rectangle3x4.containing(["HAYDN", "STAGE", "ALTO", "DANCE"], from: words)[0]
        let haydn_scenery = edges.containing(["HAYDN", "SCENERY"], from: words)[1]
        let basso_song_bass_scenery = rectangle3x4.containing(["BASSO", "SONG", "BASS", "SCENERY"], from: words)[0]

        let winningShapes = [
            mezzo_tenor_bizet_joan,
            tenor_pinza_duo_opus_trio,
            tempo_pinza_trio_mozart,
            pinza_baton_mozart_lind,
            duo_chorus_duet_opus,
            chorus_forte_solo_duet,
            ruffo_tempo_tune_oboe,
            chorus_dance,
            haydn_stage_alto_dance,
            haydn_scenery,
            basso_song_bass_scenery
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9006(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9006)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 84,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 136,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 70,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 98,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let bronze_dart_sand_zander_whaler = c2x3.containing(["BRONZE", "DART", "SAND", "ZANDER", "WHALER"], from: words)[0]
        let bronze_stingray_bass_dory = c2x2.containing(["BRONZE", "STINGRAY", "BASS", "DORY"], from: words)[0]
        let dart_ray_zander_tunny = rectangle3x5.containing(["DART", "RAY", "ZANDER", "TUNNY"], from: words)[0]
        let stingray_squid_bass_tuna = square3x3_TopRight.containing(["STINGRAY", "SQUID", "BASS", "TUNA"], from: words)[0]
        let stingray_manta_trout_bonito = rectangle3x5_BottomRight.containing(["STINGRAY", "MANTA", "TROUT", "BONITO"], from: words)[0]
        let stingray_export_trout_bonito = square3x3.containing(["STINGRAY", "EXPORT", "TROUT", "BONITO"], from: words)[0]
        let seal_bronze_sand_whaler = square3x3.containing(["SEAL", "BRONZE", "SAND", "WHALER"], from: words)[0]
        let minnow_whaler = edges.containing(["MINNOW", "WHALER"], from: words)[0]
        let export_manta_bream_trout = rectangle3x4.containing(["EXPORT", "MANTA", "BREAM", "TROUT"], from: words)[0]
        let stingray_nets = edges.containing(["STINGRAY", "NETS"], from: words)[0]
        let line_nets = edges.containing(["LINE", "NETS"], from: words)[0]
        let shark_line_sole_roe = rectangle3x4.containing(["SHARK", "LINE", "SOLE", "ROE"], from: words)[0]
        let box_bonito = edges.containing(["BOX", "BONITO"], from: words)[0]
        let box_lax = edges.containing(["BOX", "LAX"], from: words)[0]
        let eel_lax = edges.containing(["EEL", "LAX"], from: words)[0]
        let orca_tuna = edges.containing(["ORCA", "TUNA"], from: words)[0]

        let winningShapes = [
            bronze_dart_sand_zander_whaler,
            bronze_stingray_bass_dory,
            dart_ray_zander_tunny,
            stingray_squid_bass_tuna,
            stingray_manta_trout_bonito,
            stingray_export_trout_bonito,
            seal_bronze_sand_whaler,
            minnow_whaler,
            export_manta_bream_trout,
            stingray_nets,
            line_nets,
            shark_line_sole_roe,
            box_bonito,
            box_lax,
            eel_lax,
            orca_tuna
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9007(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9007)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 134,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 36,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 58,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 62,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x7 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 6,
            words: words,
            lengths: len,
            scoreMin: 100,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 92,
            widthMax: widthMax,
            heightMax: heightMax))

        let adams_zones_jazz_kansas = rectangle3x5.containing(["ADAMS", "ZONES", "JAZZ", "KANSAS"], from: words)[0]
        let arkansas_nixon_kansas_twain = rectangle3x5.containing(["ARKANSAS", "NIXON", "KANSAS", "TWAIN"], from: words)[0]
        let liberty_webster_arkansas_twain_hayes = c2x3.containing(["LIBERTY", "WEBSTER", "ARKANSAS", "TWAIN", "HAYES"], from: words)[0]
        let nixon_howe_ohio_lee = rectangle3x4_TopRight.containing(["NIXON", "HOWE", "OHIO", "LEE"], from: words)[0]
        let liberty_arkansas_tyler_hayes = rectangle3x7.containing(["LIBERTY", "ARKANSAS", "TYLER", "HAYES"], from: words)[0]
        let july_arkansas_bush_tyler = rectangle3x4_BottomLeft.containing(["JULY", "ARKANSAS", "BUSH", "TYLER"], from: words)[0]
        let texas_tyler = edges.containing(["TEXAS", "TYLER"], from: words)[0]
        let webster_sequoia = edges.containing(["WEBSTER", "SEQUOIA"], from: words)[0]
        let quota_iowa_sequoia_stowe = square3x3.containing(["QUOTA", "IOWA", "SEQUOIA", "STOWE"], from: words)[0]
        let webster_taft = edges.containing(["WEBSTER", "TAFT"], from: words)[1]
        let utah_taft = edges.containing(["UTAH", "TAFT"], from: words)[0]

        let winningShapes = [
            adams_zones_jazz_kansas,
            arkansas_nixon_kansas_twain,
            liberty_webster_arkansas_twain_hayes,
            nixon_howe_ohio_lee,
            liberty_arkansas_tyler_hayes,
            july_arkansas_bush_tyler,
            texas_tyler,
            webster_sequoia,
            quota_iowa_sequoia_stowe,
            webster_taft,
            utah_taft
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9008(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9008)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax

        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let outer2x3 = ShapeCalculator.toShapes(outers: OuterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 130,
           widthMax: widthMax,
           heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 58,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 92,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let yam_eucalyptus_yacca_coral_myall = outer2x3.containing(["YAM", "EUCALYPTUS", "YACCA", "CORAL", "MYALL"], from: words)[0]
        let eucalyptus_huon_gum_quena = square3x3_TopLeft.containing(["EUCALYPTUS", "HUON", "GUM", "QUENA"], from: words)[1]
        let buttons_yam_coral_sassy = square3x3_BottomRight.containing(["BUTTONS", "YAM", "CORAL", "SASSY"], from: words)[0]
        let simlax_yalbah_sassy_saltbush = rectangle3x4.containing(["SIMLAX", "YALBAH", "SASSY", "SALTBUSH"], from: words)[0]
        let hibiscus_simlax_sassy_saltbush = rectangle3x4.containing(["HIBISCUS", "SIMLAX", "SASSY", "SALTBUSH"], from: words)[0]
        let simlax_wax = edges.containing(["SIMLAX", "WAX"], from: words)[1]
        let hibiscus_buttons_heath_sassy = rectangle4x5.containing(["HIBISCUS", "BUTTONS", "HEATH", "SASSY"], from: words)[0]
        let yalbah_hop_saltbush_hoop = rectangle3x4.containing(["YALBAH", "HOP", "SALTBUSH", "HOOP"], from: words)[0]
        //let eucalyptus_saltbush = edges.containing(["EUCALYPTUS", "SALTBUSH"], from: words)[0]
        let eucalyptus_colane_yacca_myall = square3x3.containing(["EUCALYPTUS", "COLANE", "YACCA", "MYALL"], from: words)[0]
        let hop_oak = edges.containing(["HOP", "OAK"], from: words)[0]
        let myrtle_heath = edges.containing(["MYRTLE", "HEATH"], from: words)[1]
        let myrtle_cypress = edges.containing(["MYRTLE", "CYPRESS"], from: words)[0]
        let ash_cypress = edges.containing(["ASH", "CYPRESS"], from: words)[0]

        let winningShapes = [
            yam_eucalyptus_yacca_coral_myall,
            eucalyptus_huon_gum_quena,
            buttons_yam_coral_sassy,
            simlax_yalbah_sassy_saltbush,
            hibiscus_simlax_sassy_saltbush,
            simlax_wax,
            hibiscus_buttons_heath_sassy,
            yalbah_hop_saltbush_hoop,
            //eucalyptus_saltbush,
            eucalyptus_colane_yacca_myall,
            hop_oak,
            myrtle_heath,
            myrtle_cypress,
            ash_cypress
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9009(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9009)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 82,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x4(
           words: words,
           end: end,
           len: len,
           scoreMin: 150,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 112,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 60,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let zone_gulf_zigzag_reef = rectangle3x4.containing(["ZONE", "GULF", "ZIGZAG", "REEF"], from: words)[1]
        let zenith_zigzag = edges.containing(["ZENITH", "ZIGZAG"], from: words)[0]
        let wind_cables_streets_zenith_west_isthmus = c2x4.containing(["WIND", "CABLES", "STREETS", "ZENITH", "WEST", "ISTHMUS"], from: words)[0]
        let metres_sea_isthmus_estuary = square3x3.containing(["METRES", "SEA", "ISTHMUS", "ESTUARY"], from: words)[0]
        let bay_estuary = edges.containing(["BAY", "ESTUARY"], from: words)[1]
        let metres_soil_cities_south = c2x2.containing(["METRES", "SOIL", "CITIES", "SOUTH"], from: words)[1]
        let metres_routes_estuary_south = square4x4.containing(["METRES", "ROUTES", "ESTUARY", "SOUTH"], from: words)[0]
        let soil_routes_south_atlas = square3x3.containing(["SOIL", "ROUTES", "SOUTH", "ATLAS"], from: words)[0]
        let asia_cables_space_west = rectangle3x4_BottomLeft.containing(["ASIA", "CABLES", "SPACE", "WEST"], from: words)[0]
        let east_atlas = edges.containing(["EAST", "ATLAS"], from: words)[0]
        let east_trees = edges.containing(["EAST", "TREES"], from: words)[2]
        let east_tropic = edges.containing(["EAST", "TROPIC"], from: words)[0]
        let ports_trees = edges.containing(["PORTS", "TREES"], from: words)[1]
        let area_trees = edges.containing(["AREA", "TREES"], from: words)[1]

        let winningShapes = [
            zone_gulf_zigzag_reef,
            zenith_zigzag,
            wind_cables_streets_zenith_west_isthmus,
            metres_sea_isthmus_estuary,
            bay_estuary,
            metres_soil_cities_south,
            metres_routes_estuary_south,
            soil_routes_south_atlas,
            asia_cables_space_west,
            east_atlas,
            east_trees,
            east_tropic,
            ports_trees,
            area_trees
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9010(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9010)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 100,
           widthMax: widthMax,
           heightMax: heightMax))

        let c3x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C3x4(
           words: words,
           end: end,
           len: len,
           scoreMin: 170,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 72,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let drama_crazy_trick_jazz = rectangle3x4.containing(["DRAMA", "CRAZY", "TRICK", "JAZZ"], from: words)[0]
        let mask_trick = edges.containing(["MASK", "TRICK"], from: words)[0]
        let mask_act_stage_author_smash_actor_star = c3x4.containing(["MASK", "ACT", "STAGE", "AUTHOR", "SMASH", "ACTOR", "STAR"], from: words)[0]
        let stage_motley_actor_debut = square4x4_BottomLeft.containing(["STAGE", "MOTLEY", "ACTOR", "DEBUT"], from: words)[0]
        let bill_motley_debut_play = rectangle3x4.containing(["BILL", "MOTLEY", "DEBUT", "PLAY"], from: words)[0]
        let author_satire_cast_actor = rectangle3x5_BottomRight.containing(["AUTHOR", "SATIRE", "CAST", "ACTOR"], from: words)[1]
        let magic_satire_tights_cast = rectangle3x4.containing(["MAGIC", "SATIRE", "TIGHTS", "CAST"], from: words)[0]
        let pit_tights = edges.containing(["PIT", "TIGHTS"], from: words)[2]
        let hit_tights = edges.containing(["HIT", "TIGHTS"], from: words)[0]
        let wings_smash = edges.containing(["WINGS", "SMASH"], from: words)[0]
        let hero_box_wings_show_exit = c2x3.containing(["HERO", "BOX", "WINGS", "SHOW", "EXIT"], from: words)[0]
        let hero_wings_show_song = rectangle3x4.containing(["HERO", "WINGS", "SHOW", "SONG"], from: words)[0]
        let set_song = edges.containing(["SET", "SONG"], from: words)[0]
        let gods_show = edges.containing(["GODS", "SHOW"], from: words)[0]
        let gods_gag = edges.containing(["GODS", "GAG"], from: words)[0]

        let winningShapes = [
            drama_crazy_trick_jazz,
            mask_trick,
            mask_act_stage_author_smash_actor_star,
            stage_motley_actor_debut,
            bill_motley_debut_play,
            author_satire_cast_actor,
            magic_satire_tights_cast,
            pit_tights,
            hit_tights,
            wings_smash,
            hero_box_wings_show_exit,
            hero_wings_show_song,
            set_song,
            gods_show,
            gods_gag
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    

    private static func Shapes_9011(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9011)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 104,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 64,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 52,
            widthMax: widthMax,
            heightMax: heightMax))

        let brazil_time_narita_zimbabwe = square3x3.containing(["BRAZIL", "TIME", "NARITA", "ZIMBABWE"], from: words)[0]
        let time_wales_zimbabwe_tea = square3x3_TopRight.containing(["TIME", "WALES", "ZIMBABWE", "TEA"], from: words)[0]
        let taxi_wales_asia_tea_class = c2x3.containing(["TAXI", "WALES", "ASIA", "TEA", "CLASS"], from: words)[0]
        let taxi_asia_class_italy = square3x3.containing(["TAXI", "ASIA", "CLASS", "ITALY"], from: words)[0]
        let orly_italy = edges.containing(["ORLY", "ITALY"], from: words)[1]
        let view_zimbabwe = edges.containing(["VIEW", "ZIMBABWE"], from: words)[1]
        let turkey_italy = edges.containing(["TURKEY", "ITALY"], from: words)[0]
        let turkey_sleep_paris_oxygen = rectangle3x4.containing(["TURKEY", "SLEEP", "PARIS", "OXYGEN"], from: words)[0]
        let pilot_turkey_paris_oxygen = rectangle3x4.containing(["PILOT", "TURKEY", "PARIS", "OXYGEN"], from: words)[0]
        let safety_pilot_meal_egypt = square3x3.containing(["SAFETY", "PILOT", "MEAL", "EGYPT"], from: words)[0]
        let travel_safety_visa_meal = rectangle3x4_BottomLeft.containing(["TRAVEL", "SAFETY", "VISA", "MEAL"], from: words)[0]
        let travel_rug = edges.containing(["TRAVEL", "RUG"], from: words)[0]
        let india_narita = edges.containing(["INDIA", "NARITA"], from: words)[0]
        let view_fin = edges.containing(["VIEW", "FIN"], from: words)[0]

        let winningShapes = [
            brazil_time_narita_zimbabwe,
            time_wales_zimbabwe_tea,
            taxi_wales_asia_tea_class,
            taxi_asia_class_italy,
            orly_italy,
            view_zimbabwe,
            turkey_italy,
            turkey_sleep_paris_oxygen,
            pilot_turkey_paris_oxygen,
            safety_pilot_meal_egypt,
            travel_safety_visa_meal,
            travel_rug,
            india_narita,
            view_fin
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9012(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9012)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 78,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 72,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 72,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 62,
            widthMax: widthMax,
            heightMax: heightMax))

        let future_money_turner_marley = rectangle3x4.containing(["FUTURE", "MONEY", "TURNER", "MARLEY"], from: words)[0]
        let future_money_firm_turner = rectangle3x4.containing(["FUTURE", "MONEY", "FIRM", "TURNER"], from: words)[0]
        let dream_marley = edges.containing(["DREAM", "MARLEY"], from: words)[0]
        let frosty_turner = edges.containing(["FROSTY", "TURNER"], from: words)[1]
        let frosty_happy = edges.containing(["FROSTY", "HAPPY"], from: words)[0]
        let holly_past_happy_bless = square3x3.containing(["HOLLY", "PAST", "HAPPY", "BLESS"], from: words)[0]
        let winter_holly_bless_tiny = square3x3_TopLeft.containing(["WINTER", "HOLLY", "BLESS", "TINY"], from: words)[0]
        let sleet_winter_new_tiny = c2x2.containing(["SLEET", "WINTER", "NEW", "TINY"], from: words)[0]
        let foggy_winter_grate_year = rectangle3x4.containing(["FOGGY", "WINTER", "GRATE", "YEAR"], from: words)[0]
        let past_silver_bless_tim = c2x2.containing(["PAST", "SILVER", "BLESS", "TIM"], from: words)[0]
        let bob_silver_eve_poor = square3x3_TopLeft.containing(["BOB", "SILVER", "EVE", "POOR"], from: words)[0]
        let ghost_sleet_sole_new = square3x3_TopRight.containing(["GHOST", "SLEET", "SOLE", "NEW"], from: words)[0]
        let dream_joe = edges.containing(["DREAM", "JOE"], from: words)[0]

        let winningShapes = [
            future_money_turner_marley,
            future_money_firm_turner,
            dream_marley,
            frosty_turner,
            frosty_happy,
            holly_past_happy_bless,
            winter_holly_bless_tiny,
            sleet_winter_new_tiny,
            foggy_winter_grate_year,
            past_silver_bless_tim,
            bob_silver_eve_poor,
            ghost_sleet_sole_new,
            dream_joe
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
   
    
//    private static func Shapes_9101(words: [String]) -> ([ShapeModel], [String], Int, Int) {
//
//        let game = GameList().getGame(gameId: 9101)!
//
//        let widthMax = game.maxWidth
//        let heightMax = game.maxHeight
//        
//        let end = WordCalculator.reverse(words: words)
//        let len = WordCalculator.lengths(words: words)
//
//        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x2(
//           words: words,
//           end: end,
//           len: len,
//           scoreMin: 82,
//           widthMax: widthMax,
//           heightMax: heightMax))
//
//        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C2x4(
//           words: words,
//           end: end,
//           len: len,
//           scoreMin: 168,
//           widthMax: widthMax,
//           heightMax: heightMax))
//
//        let c3x4 = ShapeCalculator.toShapes(clusters: ClusterCalculator.C3x4(
//           words: words,
//           end: end,
//           len: len,
//           scoreMin: 186,
//           widthMax: widthMax,
//           heightMax: heightMax))
//
//        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
//            words: words,
//            scoreMin: 22,
//            widthMax: widthMax,
//            heightMax: heightMax))
//
//        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftRectangle(
//            interlockWidth: 2,
//            interlockHeight: 3,
//            words: words,
//            lengths: len,
//            scoreMin: 80,
//            widthMax: widthMax,
//            heightMax: heightMax))
//
//        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
//            interlockWidth: 2,
//            words: words,
//            lengths: len,
//            scoreMin: 74,
//            widthMax: widthMax,
//            heightMax: heightMax))
//
//        let relax_quiet_stove_party_rest_jetty = c2x4.containing(["RELAX", "QUIET", "STOVE", "PARTY", "REST", "JETTY"], from: words)[0]
//        let ease_quiet_sleep_scuba = square3x3_BottomLeft.containing(["EASE", "QUIET", "SLEEP", "SCUBA"], from: words)[0]
//        let sport_sleep = edges.containing(["SPORT", "SLEEP"], from: words)[0]
//        let sport_sand_oars_tan = c2x2.containing(["SPORT", "SAND", "OARS", "TAN"], from: words)[0]
//        let forest_oars = edges.containing(["FOREST", "OARS"], from: words)[0]
//        let forest_spade = edges.containing(["FOREST", "SPADE"], from: words)[0]
//        let party_scuba = edges.containing(["PARTY", "SCUBA"], from: words)[0]
//        let amusement_spade = edges.containing(["AMUSEMENT", "SPADE"], from: words)[0]
//        let bat_amusement_sun_hat_bush_casual_tent = c3x4.containing(["BAT", "AMUSEMENT", "SUN", "HAT", "BUSH", "CASUAL", "TENT"], from: words)[0]
//        let sand_spade = edges.containing(["SAND", "SPADE"], from: words)[0]
//        let amusement_tennis = edges.containing(["AMUSEMENT", "TENNIS"], from: words)[0]
//        let fun_dunes_quay_tennis = rectangle3x4_TopLeft.containing(["FUN", "DUNES", "QUAY", "TENNIS"], from: words)[0]
//        let flying_quay = edges.containing(["FLYING", "QUAY"], from: words)[0]
//        let amusement_reef = edges.containing(["AMUSEMENT", "REEF"], from: words)[0]
//        let rod_reef = edges.containing(["ROD", "REEF"], from: words)[0]
//
//        let winningShapes = [
//            relax_quiet_stove_party_rest_jetty,
//            ease_quiet_sleep_scuba,
//            sport_sleep,
//            sport_sand_oars_tan,
//            forest_oars,
//            forest_spade,
//            party_scuba,
//            amusement_spade,
//            bat_amusement_sun_hat_bush_casual_tent,
//            sand_spade,
//            amusement_tennis,
//            fun_dunes_quay_tennis,
//            flying_quay,
//            amusement_reef,
//            rod_reef
//        ]
//        return (winningShapes, words, widthMax, heightMax)
//    }
    
    private static func Shapes_9101(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9101)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax

        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 82,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x4(
           words: words,
           end: end,
           len: len,
           scoreMin: 168,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let special9101 = SpecialShapesCalculator.C9101(words: words)

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let relax_quiet_stove_party_rest_jetty = c2x4.containing(["RELAX", "QUIET", "STOVE", "PARTY", "REST", "JETTY"], from: words)[0]
        let ease_quiet_sleep_scuba = square3x3_BottomLeft.containing(["EASE", "QUIET", "SLEEP", "SCUBA"], from: words)[0]
        let sport_sleep = edges.containing(["SPORT", "SLEEP"], from: words)[0]
        let sport_sand_oars_tan = c2x2.containing(["SPORT", "SAND", "OARS", "TAN"], from: words)[0]
        let forest_oars = edges.containing(["FOREST", "OARS"], from: words)[0]
        let forest_spade = edges.containing(["FOREST", "SPADE"], from: words)[1]
        //let party_scuba = edges.containing(["PARTY", "SCUBA"], from: words)[0]
        let amusement_spade = edges.containing(["AMUSEMENT", "SPADE"], from: words)[0]
        let bat_amusement_sun_hat_bush_casual_tent = special9101.containing(["BAT", "AMUSEMENT", "SUN", "HAT", "BUSH", "CASUAL", "TENT"], from: words)[0]
        
        //let sand_spade = edges.containing(["SAND", "SPADE"], from: words)[0]
        let amusement_tennis = edges.containing(["AMUSEMENT", "TENNIS"], from: words)[0]
        let fun_dunes_quay_tennis = rectangle3x4_TopLeft.containing(["FUN", "DUNES", "QUAY", "TENNIS"], from: words)[0]
        let flying_quay = edges.containing(["FLYING", "QUAY"], from: words)[0]
        let amusement_reef = edges.containing(["AMUSEMENT", "REEF"], from: words)[3]
        let rod_reef = edges.containing(["ROD", "REEF"], from: words)[0]

        let winningShapes = [
            relax_quiet_stove_party_rest_jetty,
            ease_quiet_sleep_scuba,
            sport_sleep,
            sport_sand_oars_tan,
            forest_oars,
            forest_spade,
            //party_scuba,
            amusement_spade,
            bat_amusement_sun_hat_bush_casual_tent,
            
            
            //sand_spade,
            amusement_tennis,
            fun_dunes_quay_tennis,
            flying_quay,
            amusement_reef,
            rod_reef
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9102(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9102)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax

        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 136,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let special9102 = SpecialShapesCalculator.C9102(words: words)

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 56,
            widthMax: widthMax,
            heightMax: heightMax))

        let speed_dot_canon_type_data_sony_laptop_nec = special9102.containing(["SPEED", "DOT", "CANON", "TYPE", "DATA", "SONY", "LAPTOP", "NEC"], from: words)[0]
        let scroll_laptop = edges.containing(["SCROLL", "LAPTOP"], from: words)[0]
        let file_scroll_pitch_zero = square3x3.containing(["FILE", "SCROLL", "PITCH", "ZERO"], from: words)[0]
        let zenith_zero = edges.containing(["ZENITH", "ZERO"], from: words)[0]
        let zenith_tape = edges.containing(["ZENITH", "TAPE"], from: words)[1]
        let epson_tape = edges.containing(["EPSON", "TAPE"], from: words)[1]
        let epson_menu = edges.containing(["EPSON", "MENU"], from: words)[1]
        let mouse_wyse_menu_unisys = rectangle3x5_BottomLeft.containing(["MOUSE", "WYSE", "MENU", "UNISYS"], from: words)[0]
        let wyse_disc_window_unisys_screen = c2x3.containing(["WYSE", "DISC", "WINDOW", "UNISYS", "SCREEN"], from: words)[0]
        let wyse_wang_window_screen = rectangle3x6.containing(["WYSE", "WANG", "WINDOW", "SCREEN"], from: words)[0]
        let video_window = edges.containing(["VIDEO", "WINDOW"], from: words)[2]
        let ram_video_drive_mode = square3x3.containing(["RAM", "VIDEO", "DRIVE", "MODE"], from: words)[0]
        let ibm_unisys = edges.containing(["IBM", "UNISYS"], from: words)[0]
        //let speed_drive = edges.containing(["SPEED", "DRIVE"], from: words)[0]

        let winningShapes = [
            speed_dot_canon_type_data_sony_laptop_nec,
            scroll_laptop,
            file_scroll_pitch_zero,
            zenith_zero,
            zenith_tape,
            epson_tape,
            epson_menu,
            mouse_wyse_menu_unisys,
            wyse_disc_window_unisys_screen,
            wyse_wang_window_screen,
            video_window,
            ram_video_drive_mode,
            ibm_unisys
            //speed_drive
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9103(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9103)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 82,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 72,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 62,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftSquare(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 52,
            widthMax: widthMax,
            heightMax: heightMax))

        let cenis_olympus_cook_whitney = square3x3.containing(["CENIS", "OLYMPUS", "COOK", "WHITNEY"], from: words)[0]
        let jungfrau_olympus_jura_vesuvius = c2x2.containing(["JUNGFRAU", "OLYMPUS", "JURA", "VESUVIUS"], from: words)[0]
        let wilhelm_everest_blue_vesuvius = rectangle3x4_BottomLeft.containing(["WILHELM", "EVEREST", "BLUE", "VESUVIUS"], from: words)[0]
        let wilhelm_white_whitney_blue = square3x3.containing(["WILHELM", "WHITE", "WHITNEY", "BLUE"], from: words)[0]
        let pelee_everest_alps_etna = c2x2.containing(["PELEE", "EVEREST", "ALPS", "ETNA"], from: words)[0]
        let everest_jungfrau_vesuvius_crag = square3x3.containing(["EVEREST", "JUNGFRAU", "VESUVIUS", "CRAG"], from: words)[0]
        let jungfrau_mckinley_rigi_ural = rectangle3x4.containing(["JUNGFRAU", "MCKINLEY", "RIGI", "URAL"], from: words)[0]
        let mckinley_rocky = edges.containing(["MCKINLEY", "ROCKY"], from: words)[2]
        let white_snow = edges.containing(["WHITE", "SNOW"], from: words)[0]
        let peak_pelee_alps_andes = square4x4_TopLeft.containing(["PEAK", "PELEE", "ALPS", "ANDES"], from: words)[0]
        let hecla_jura = edges.containing(["HECLA", "JURA"], from: words)[0]

        let winningShapes = [
            cenis_olympus_cook_whitney,
            jungfrau_olympus_jura_vesuvius,
            wilhelm_everest_blue_vesuvius,
            wilhelm_white_whitney_blue,
            pelee_everest_alps_etna,
            everest_jungfrau_vesuvius_crag,
            jungfrau_mckinley_rigi_ural,
            mckinley_rocky,
            white_snow,
            peak_pelee_alps_andes,
            hecla_jura
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9104(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9104)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x4(
           words: words,
           end: end,
           len: len,
           scoreMin: 128,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 78,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 112,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let zenith_zero = edges.containing(["ZENITH", "ZERO"], from: words)[0]
        let waves_steer_stars_zenith_west_earth = c2x4.containing(["WAVES", "STEER", "STARS", "ZENITH", "WEST", "EARTH"], from: words)[0]
        let tables_fix_midday_waves_time_axis = c2x4.containing(["TABLES", "FIX", "MIDDAY", "WAVES", "TIME", "AXIS"], from: words)[0]
        let tables_midday_time_sky = rectangle3x6.containing(["TABLES", "MIDDAY", "TIME", "SKY"], from: words)[0]
        let steer_zenith_sextant_west = square3x3.containing(["STEER", "ZENITH", "SEXTANT", "WEST"], from: words)[0]
        let lee_tropics_pilot_zero = square3x3.containing(["LEE", "TROPICS", "PILOT", "ZERO"], from: words)[0]
        let stars_signs = edges.containing(["STARS", "SIGNS"], from: words)[2]
        let globe_south_signs_orbit = rectangle3x4.containing(["GLOBE", "SOUTH", "SIGNS", "ORBIT"], from: words)[0]
        let sun_sextant = edges.containing(["SUN", "SEXTANT"], from: words)[0]
        let log_orbit = edges.containing(["LOG", "ORBIT"], from: words)[0]
        let moon_signs = edges.containing(["MOON", "SIGNS"], from: words)[0]
        let moon_box = edges.containing(["MOON", "BOX"], from: words)[0]
        let range_sextant = edges.containing(["RANGE", "SEXTANT"], from: words)[0]
        let pole_range_port_line = square3x3.containing(["POLE", "RANGE", "PORT", "LINE"], from: words)[0]

        let winningShapes = [
            zenith_zero,
            waves_steer_stars_zenith_west_earth,
            tables_fix_midday_waves_time_axis,
            tables_midday_time_sky,
            steer_zenith_sextant_west,
            lee_tropics_pilot_zero,
            stars_signs,
            globe_south_signs_orbit,
            sun_sextant,
            log_orbit,
            moon_signs,
            moon_box,
            range_sextant,
            pole_range_port_line
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9105(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9105)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x4(
           words: words,
           end: end,
           len: len,
           scoreMin: 116,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 28,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 98,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 60,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let louis_majesty_cole_dynasty = rectangle3x4.containing(["LOUIS", "MAJESTY", "COLE", "DYNASTY"], from: words)[0]
        let royalty_dynasty = edges.containing(["ROYALTY", "DYNASTY"], from: words)[1]
        let cabinet_royalty_henry_attila = square3x3.containing(["CABINET", "ROYALTY", "HENRY", "ATTILA"], from: words)[0]
        let cabinet_royalty_oberon_henry = square3x3.containing(["CABINET", "ROYALTY", "OBERON", "HENRY"], from: words)[0]
        let regent_oberon = edges.containing(["REGENT", "OBERON"], from: words)[1]
        let regent_arthur_lord_banner_rule_emperor = c2x4.containing(["REGENT", "ARTHUR", "LORD", "BANNER", "RULE", "EMPEROR"], from: words)[0]
        let throne_arthur_coronet_emperor = rectangle4x5.containing(["THRONE", "ARTHUR", "CORONET", "EMPEROR"], from: words)[0]
        let throne_rani_victoria_coronet = square3x3.containing(["THRONE", "RANI", "VICTORIA", "CORONET"], from: words)[1]
        let midas_throne_coronet_ivan = rectangle3x4_TopLeft.containing(["MIDAS", "THRONE", "CORONET", "IVAN"], from: words)[1]

        let winningShapes = [
            louis_majesty_cole_dynasty,
            royalty_dynasty,
            cabinet_royalty_henry_attila,
            cabinet_royalty_oberon_henry,
            regent_oberon,
            regent_arthur_lord_banner_rule_emperor,
            throne_arthur_coronet_emperor,
            throne_rani_victoria_coronet,
            midas_throne_coronet_ivan
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9106(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9106)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 28,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 62,
            widthMax: widthMax,
            heightMax: heightMax))

        let zeus_pluto_zephyrus_seth = rectangle3x4.containing(["ZEUS", "PLUTO", "ZEPHYRUS", "SETH"], from: words)[0]
        let rhea_saturn_zephyrus_nestor = square3x3.containing(["RHEA", "SATURN", "ZEPHYRUS", "NESTOR"], from: words)[0]
        let saturn_furies_nestor_adonis = rectangle3x4.containing(["SATURN", "FURIES", "NESTOR", "ADONIS"], from: words)[0]
        let odin_ionia_adonis_orion = square3x3.containing(["ODIN", "IONIA", "ADONIS", "ORION"], from: words)[0]
        let jason_odin_adonis_orion = square3x3.containing(["JASON", "ODIN", "ADONIS", "ORION"], from: words)[1]
        let mercury_jason_mars_creon = rectangle3x4.containing(["MERCURY", "JASON", "MARS", "CREON"], from: words)[0]
        let mercury_olympus_ulysses_nymphs = square3x3.containing(["MERCURY", "OLYMPUS", "ULYSSES", "NYMPHS"], from: words)[1]
        let olympus_isis_ulysses_nymphs = square3x3.containing(["OLYMPUS", "ISIS", "ULYSSES", "NYMPHS"], from: words)[0]
        let olympus_abas = edges.containing(["OLYMPUS", "ABAS"], from: words)[0]
        let satyr_ulysses = edges.containing(["SATYR", "ULYSSES"], from: words)[2]
        let satyr_paris = edges.containing(["SATYR", "PARIS"], from: words)[1]
        let eros_paris = edges.containing(["EROS", "PARIS"], from: words)[1]

        let winningShapes = [
            zeus_pluto_zephyrus_seth,
            rhea_saturn_zephyrus_nestor,
            saturn_furies_nestor_adonis,
            odin_ionia_adonis_orion,
            jason_odin_adonis_orion,
            mercury_jason_mars_creon,
            mercury_olympus_ulysses_nymphs,
            olympus_isis_ulysses_nymphs,
            olympus_abas,
            satyr_ulysses,
            satyr_paris,
            eros_paris
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9107(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9107)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 110,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 72,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 58,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let dazzle_royce_duty_benzine = rectangle3x4.containing(["DAZZLE", "ROYCE", "DUTY", "BENZINE"], from: words)[0]
        let sport_royce_rotor_rolls_duty = c2x3.containing(["SPORT", "ROYCE", "ROTOR", "ROLLS", "DUTY"], from: words)[0]
        let sport_tail_seats_rolls = square4x4.containing(["SPORT", "TAIL", "SEATS", "ROLLS"], from: words)[0]
        let royce_speed_rolls_care = rectangle3x4.containing(["ROYCE", "SPEED", "ROLLS", "CARE"], from: words)[0]
        let cars_sport_rotor_duty = rectangle3x4_TopRight.containing(["CARS", "SPORT", "ROTOR", "DUTY"], from: words)[0]
        let cars_gas = edges.containing(["CARS", "GAS"], from: words)[1]
        let belt_dazzle_benzine_tyre = square4x4.containing(["BELT", "DAZZLE", "BENZINE", "TYRE"], from: words)[0]
        let axle_dazzle_gas_benzine = rectangle3x4_TopRight.containing(["AXLE", "DAZZLE", "GAS", "BENZINE"], from: words)[0]
        let nut_benzine = edges.containing(["NUT", "BENZINE"], from: words)[1]
        let road_brake_tyre_air = square3x3_BottomLeft.containing(["ROAD", "BRAKE", "TYRE", "AIR"], from: words)[0]
        let cars_lock = edges.containing(["CARS", "LOCK"], from: words)[0]
        let brake_boot = edges.containing(["BRAKE", "BOOT"], from: words)[0]
        let horn_auto_hubs_boot_roof = c2x3.containing(["HORN", "AUTO", "HUBS", "BOOT", "ROOF"], from: words)[0]
        let auto_safety_hubs_roof = square3x3.containing(["AUTO", "SAFETY", "HUBS", "ROOF"], from: words)[0]
        let safety_key = edges.containing(["SAFETY", "KEY"], from: words)[1]
        let brake_spare = edges.containing(["BRAKE", "SPARE"], from: words)[2]
        let vans_spare = edges.containing(["VANS", "SPARE"], from: words)[1]

        let winningShapes = [
            dazzle_royce_duty_benzine,
            sport_royce_rotor_rolls_duty,
            sport_tail_seats_rolls,
            royce_speed_rolls_care,
            cars_sport_rotor_duty,
            cars_gas,
            belt_dazzle_benzine_tyre,
            axle_dazzle_gas_benzine,
            nut_benzine,
            road_brake_tyre_air,
            cars_lock,
            brake_boot,
            horn_auto_hubs_boot_roof,
            auto_safety_hubs_roof,
            safety_key,
            brake_spare,
            vans_spare
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9108(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9108)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 132,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 64,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 88,
            widthMax: widthMax,
            heightMax: heightMax))

        let ozone_wet_low_zephyr_hot = c2x3.containing(["OZONE", "WET", "LOW", "ZEPHYR", "HOT"], from: words)[0]
        let dusty_zephyr = edges.containing(["DUSTY", "ZEPHYR"], from: words)[0]
        let dusty_gust_dull_cumulus_storm = c2x3.containing(["DUSTY", "GUST", "DULL", "CUMULUS", "STORM"], from: words)[0]
        let gust_polar_dull_storm = square3x3.containing(["GUST", "POLAR", "DULL", "STORM"], from: words)[0]
        let eurus_dusty_cloud_cumulus = square3x3_BottomLeft.containing(["EURUS", "DUSTY", "CLOUD", "CUMULUS"], from: words)[1]
        let muggy_storm = edges.containing(["MUGGY", "STORM"], from: words)[0]
        let muggy_foggy = edges.containing(["MUGGY", "FOGGY"], from: words)[4]
        let frosts_gale_foggy_sleet = rectangle3x4.containing(["FROSTS", "GALE", "FOGGY", "SLEET"], from: words)[0]
        let thaw_sleet = edges.containing(["THAW", "SLEET"], from: words)[0]
        let thaw_snow = edges.containing(["THAW", "SNOW"], from: words)[0]
        let tropic_frosts_meteor_hills = rectangle4x5.containing(["TROPIC", "FROSTS", "METEOR", "HILLS"], from: words)[0]
        let mist_tropic_meteor_smog = square3x3.containing(["MIST", "TROPIC", "METEOR", "SMOG"], from: words)[0]

        let winningShapes = [
            ozone_wet_low_zephyr_hot,
            dusty_zephyr,
            dusty_gust_dull_cumulus_storm,
            gust_polar_dull_storm,
            eurus_dusty_cloud_cumulus,
            muggy_storm,
            muggy_foggy,
            frosts_gale_foggy_sleet,
            thaw_sleet,
            thaw_snow,
            tropic_frosts_meteor_hills,
            mist_tropic_meteor_smog
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9109(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9109)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax

        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 28,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let special9109 = SpecialShapesCalculator.C9109(words: words)

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 78,
            widthMax: widthMax,
            heightMax: heightMax))

        
        let copypaper_answer_post_teller_order_paste_enter_buzzers = special9109.containing(["COPYPAPER", "ANSWER", "POST", "TELLER", "ORDER", "PASTE", "ENTER", "BUZZERS"], from: words)[0]
        let tape_copypaper_screen_pay = rectangle3x4_TopLeft.containing(["TAPE", "COPYPAPER", "SCREEN", "PAY"], from: words)[0]
        
        let letter_tape_list_time = square4x4.containing(["LETTER", "TAPE", "LIST", "TIME"], from: words)[0]
        // We cannot run along side tape
        let magazine_buzzers = edges.containing(["MAGAZINE", "BUZZERS"], from: words)[0]
        let bonus_keys_money_list = square3x3_BottomRight.containing(["BONUS", "KEYS", "MONEY", "LIST"], from: words)[0]
        
        let keys_index_earn_screen = rectangle3x4.containing(["KEYS", "INDEX", "EARN", "SCREEN"], from: words)[0]
        let copypaper_post_paper_paste = square3x3.containing(["COPYPAPER", "POST", "PAPER", "PASTE"], from: words)[2]
        //let post_order_paper_paste = square3x3.containing(["POST", "ORDER", "PAPER", "PASTE"], from: words)[0]
        let answer_teller_enter_error = rectangle3x5.containing(["ANSWER", "TELLER", "ENTER", "ERROR"], from: words)[0]
        let send_screen = edges.containing(["SEND", "SCREEN"], from: words)[1]
        //let magazine_time = edges.containing(["MAGAZINE", "TIME"], from: words)[0]
        let magazine_bank = edges.containing(["MAGAZINE", "BANK"], from: words)[0]

        let winningShapes = [
            
            copypaper_answer_post_teller_order_paste_enter_buzzers,
            tape_copypaper_screen_pay,
            letter_tape_list_time,
            magazine_buzzers,
            bonus_keys_money_list,
            
            keys_index_earn_screen,
            copypaper_post_paper_paste,
            //post_order_paper_paste,
            answer_teller_enter_error,
            send_screen,
            //magazine_time,
            magazine_bank
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    private static func Shapes_9110(words: [String]) -> ([ShapeModel], [String], Int, Int) {
        
        let game = GameList().getGame(gameId: 9110)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 84,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 78,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightSquare(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let freezer_traymobile_squeezer_tray = square3x3.containing(["FREEZER", "TRAYMOBILE", "SQUEEZER", "TRAY"], from: words)[0]
        let freezer_apron = edges.containing(["FREEZER", "APRON"], from: words)[0]
        let fan_apron = edges.containing(["FAN", "APRON"], from: words)[1]
        let tea_apron = edges.containing(["TEA", "APRON"], from: words)[0]
        let scales_tea_basket_tiles = square4x4_BottomRight.containing(["SCALES", "TEA", "BASKET", "TILES"], from: words)[0]
        let scales_saucers_tiles_squeezer = square3x3.containing(["SCALES", "SAUCERS", "TILES", "SQUEEZER"], from: words)[0]
        let saucers_sieves_shears_sink = c2x2.containing(["SAUCERS", "SIEVES", "SHEARS", "SINK"], from: words)[0]
        let bottles_scales_basket_tiles = rectangle3x4.containing(["BOTTLES", "SCALES", "BASKET", "TILES"], from: words)[0]
        let sieves_kettle_sink_trivet = square3x3.containing(["SIEVES", "KETTLE", "SINK", "TRIVET"], from: words)[0]
        let stool_sieves_trivet_spoons = rectangle3x4.containing(["STOOL", "SIEVES", "TRIVET", "SPOONS"], from: words)[0]
        let glass_stool_gas_spoons = rectangle3x4.containing(["GLASS", "STOOL", "GAS", "SPOONS"], from: words)[0]

        let winningShapes = [
            freezer_traymobile_squeezer_tray,
            freezer_apron,
            fan_apron,
            tea_apron,
            scales_tea_basket_tiles,
            scales_saucers_tiles_squeezer,
            saucers_sieves_shears_sink,
            bottles_scales_basket_tiles,
            sieves_kettle_sink_trivet,
            stool_sieves_trivet_spoons,
            glass_stool_gas_spoons
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9111(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9111)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 28,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 104,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 56,
            widthMax: widthMax,
            heightMax: heightMax))

        let hydrozoa_coast_protozoa_castle = square3x3.containing(["HYDROZOA", "COAST", "PROTOZOA", "CASTLE"], from: words)[0]
        let shells_weeds_castle_reefs = rectangle3x4.containing(["SHELLS", "WEEDS", "CASTLE", "REEFS"], from: words)[0]
        let shells_fins_reefs_line = square3x3.containing(["SHELLS", "FINS", "REEFS", "LINE"], from: words)[0]
        let hydrozoa_sharks_oyster_rocks = rectangle3x5.containing(["HYDROZOA", "SHARKS", "OYSTER", "ROCKS"], from: words)[0]
        let salt_sharks_molluscs_oyster = rectangle3x4.containing(["SALT", "SHARKS", "MOLLUSCS", "OYSTER"], from: words)[1]
        let shells_mussels = edges.containing(["SHELLS", "MUSSELS"], from: words)[5]
        let dunes_mussels = edges.containing(["DUNES", "MUSSELS"], from: words)[2]
        let prawns_dunes_wind_sting = rectangle3x4.containing(["PRAWNS", "DUNES", "WIND", "STING"], from: words)[0]
        let marine_molluscs = edges.containing(["MARINE", "MOLLUSCS"], from: words)[0]
        let roses_marine_surf_sand = square3x3.containing(["ROSES", "MARINE", "SURF", "SAND"], from: words)[0]

        let winningShapes = [
            hydrozoa_coast_protozoa_castle,
            shells_weeds_castle_reefs,
            shells_fins_reefs_line,
            hydrozoa_sharks_oyster_rocks,
            salt_sharks_molluscs_oyster,
            shells_mussels,
            dunes_mussels,
            prawns_dunes_wind_sting,
            marine_molluscs,
            roses_marine_surf_sand
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9112(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9112)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 86,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 28,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 128,
            widthMax: widthMax,
            heightMax: heightMax))

        let marzipan_donner_blitzen_piper = square3x3.containing(["MARZIPAN", "DONNER", "BLITZEN", "PIPER"], from: words)[0]
        let brandy_holly_blitzen_merry = c2x2.containing(["BRANDY", "HOLLY", "BLITZEN", "MERRY"], from: words)[0]
        let brandy_toy = edges.containing(["BRANDY", "TOY"], from: words)[0]
        let star_toy = edges.containing(["STAR", "TOY"], from: words)[0]
        let star_tree = edges.containing(["STAR", "TREE"], from: words)[1]
        let toast_tree = edges.containing(["TOAST", "TREE"], from: words)[0]
        let toast_turkey = edges.containing(["TOAST", "TURKEY"], from: words)[1]
        let whisky_turkey = edges.containing(["WHISKY", "TURKEY"], from: words)[0]
        let whisky_eggnog_sweets_presents = rectangle3x4.containing(["WHISKY", "EGGNOG", "SWEETS", "PRESENTS"], from: words)[0]
        let marzipan_dance = edges.containing(["MARZIPAN", "DANCE"], from: words)[0]
        let holly_food = edges.containing(["HOLLY", "FOOD"], from: words)[1]
        let cream_merry = edges.containing(["CREAM", "MERRY"], from: words)[0]
        let eggnog_season_sweets_presents = rectangle3x4.containing(["EGGNOG", "SEASON", "SWEETS", "PRESENTS"], from: words)[1]

        let winningShapes = [
            marzipan_donner_blitzen_piper,
            brandy_holly_blitzen_merry,
            brandy_toy,
            star_toy,
            star_tree,
            toast_tree,
            toast_turkey,
            whisky_turkey,
            whisky_eggnog_sweets_presents,
            marzipan_dance,
            holly_food,
            cream_merry,
            eggnog_season_sweets_presents,
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9201(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9201)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 62,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 70,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let sturt_lizards_matilda_macrozamia = square3x3.containing(["STURT", "LIZARDS", "MATILDA", "MACROZAMIA"], from: words)[0]
        let lizards_swagmen_macrozamia_iron = square3x3.containing(["LIZARDS", "SWAGMEN", "MACROZAMIA", "IRON"], from: words)[0]
        let wombat_sturt_ewe_matilda = square3x3_BottomLeft.containing(["WOMBAT", "STURT", "EWE", "MATILDA"], from: words)[0]
        let lizards_opossums = edges.containing(["LIZARDS", "OPOSSUMS"], from: words)[0]
        let oreilly_skink_opossums_station = rectangle3x4.containing(["OREILLY", "SKINK", "OPOSSUMS", "STATION"], from: words)[0]
        let oreilly_lillypilly = edges.containing(["OREILLY", "LILLYPILLY"], from: words)[7]
        let cassowary_lillypilly = edges.containing(["CASSOWARY", "LILLYPILLY"], from: words)[1]
        let wonga_oreilly_opossums_station = rectangle3x4.containing(["WONGA", "OREILLY", "OPOSSUMS", "STATION"], from: words)[0]
        let idriess_wonga_ion_station = square3x3.containing(["IDRIESS", "WONGA", "ION", "STATION"], from: words)[0]
        let mulga_macrozamia = edges.containing(["MULGA", "MACROZAMIA"], from: words)[4]
        let swagmen_bats = edges.containing(["SWAGMEN", "BATS"], from: words)[1]

        let winningShapes = [
            sturt_lizards_matilda_macrozamia,
            lizards_swagmen_macrozamia_iron,
            wombat_sturt_ewe_matilda,
            lizards_opossums,
            oreilly_skink_opossums_station,
            oreilly_lillypilly,
            cassowary_lillypilly,
            wonga_oreilly_opossums_station,
            idriess_wonga_ion_station,
            mulga_macrozamia,
            swagmen_bats
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9202(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9202)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 70,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 140,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 60,
            widthMax: widthMax,
            heightMax: heightMax))

        let shuttle_rapunzel_thumb_lizards = square3x3.containing(["SHUTTLE", "RAPUNZEL", "THUMB", "LIZARDS"], from: words)[0]
        let shuttle_rapunzel_servant_thumb = rectangle3x4.containing(["SHUTTLE", "RAPUNZEL", "SERVANT", "THUMB"], from: words)[0]
        let trolls_servant = edges.containing(["TROLLS", "SERVANT"], from: words)[2]
        let trolls_tower = edges.containing(["TROLLS", "TOWER"], from: words)[1]
        let hare_tower = edges.containing(["HARE", "TOWER"], from: words)[0]
        let dreams_duck_lizards_beauty = square3x3_BottomLeft.containing(["DREAMS", "DUCK", "LIZARDS", "BEAUTY"], from: words)[0]
        let gryphon_beauty = edges.containing(["GRYPHON", "BEAUTY"], from: words)[0]
        let dreams_puss = edges.containing(["DREAMS", "PUSS"], from: words)[0]
        let straw_puss = edges.containing(["STRAW", "PUSS"], from: words)[1]
        let straw_frog = edges.containing(["STRAW", "FROG"], from: words)[0]
        let straw_wand = edges.containing(["STRAW", "WAND"], from: words)[0]
        let spells_puss = edges.containing(["SPELLS", "PUSS"], from: words)[0]
        let giant_spells_imps_nose = rectangle3x4.containing(["GIANT", "SPELLS", "IMPS", "NOSE"], from: words)[0]
        let spells_goose = edges.containing(["SPELLS", "GOOSE"], from: words)[1]
        let trolls_lie = edges.containing(["TROLLS", "LIE"], from: words)[1]

        let winningShapes = [
            shuttle_rapunzel_thumb_lizards,
            shuttle_rapunzel_servant_thumb,
            trolls_servant,
            trolls_tower,
            hare_tower,
            dreams_duck_lizards_beauty,
            gryphon_beauty,
            dreams_puss,
            straw_puss,
            straw_frog,
            straw_wand,
            spells_puss,
            giant_spells_imps_nose,
            spells_goose,
            trolls_lie
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9203(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9203)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x4(
           words: words,
           end: end,
           len: len,
           scoreMin: 166,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 106,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 62,
            widthMax: widthMax,
            heightMax: heightMax))

        let guilt_stay_usher_lawsuit_law_penalty = c2x4.containing(["GUILT", "STAY", "USHER", "LAWSUIT", "LAW", "PENALTY"], from: words)[0]
        let aver_assault_lawsuit_penalty = square3x3.containing(["AVER", "ASSAULT", "LAWSUIT", "PENALTY"], from: words)[0]
        let assault_writ = edges.containing(["ASSAULT", "WRIT"], from: words)[0]
        let witness_writ = edges.containing(["WITNESS", "WRIT"], from: words)[0]
        let witness_seal = edges.containing(["WITNESS", "SEAL"], from: words)[1]
        let bribery_usher = edges.containing(["BRIBERY", "USHER"], from: words)[1]
        let bribery_larceny = edges.containing(["BRIBERY", "LARCENY"], from: words)[3]
        let felony_larceny = edges.containing(["FELONY", "LARCENY"], from: words)[0]
        let felony_legacy = edges.containing(["FELONY", "LEGACY"], from: words)[2]
        let felony_proof = edges.containing(["FELONY", "PROOF"], from: words)[1]
        let forgery_proof = edges.containing(["FORGERY", "PROOF"], from: words)[0]
        let court_forgery_judge_custody = rectangle3x4.containing(["COURT", "FORGERY", "JUDGE", "CUSTODY"], from: words)[0]
        let plea_legacy = edges.containing(["PLEA", "LEGACY"], from: words)[0]

        let winningShapes = [
            guilt_stay_usher_lawsuit_law_penalty,
            aver_assault_lawsuit_penalty,
            assault_writ,
            witness_writ,
            witness_seal,
            bribery_usher,
            bribery_larceny,
            felony_larceny,
            felony_legacy,
            felony_proof,
            forgery_proof,
            court_forgery_judge_custody,
            plea_legacy
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9204(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9204)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax

        
        //let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let special9204 = SpecialShapesCalculator.C9204(words: words)

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 88,
            widthMax: widthMax,
            heightMax: heightMax))

        let ritual_saucers_beans_shrub_iced_tea_urn_assam = special9204.containing(["RITUAL", "SAUCERS", "BEANS", "SHRUB", "ICED", "TEA", "URN", "ASSAM"], from: words)[0]
        let taste_saucers_tips_shrub = rectangle3x4.containing(["TASTE", "SAUCERS", "TIPS", "SHRUB"], from: words)[0]
        let cup_tips = edges.containing(["CUP", "TIPS"], from: words)[0]
        let amoy_assam = edges.containing(["AMOY", "ASSAM"], from: words)[2]
        let amoy_hyson = edges.containing(["AMOY", "HYSON"], from: words)[0]
        let spray_anhwei_hyson_brew = square3x3.containing(["SPRAY", "ANHWEI", "HYSON", "BREW"], from: words)[0]
        let spray_ceremony = edges.containing(["SPRAY", "CEREMONY"], from: words)[1]
        let cup_nice = edges.containing(["CUP", "NICE"], from: words)[0]
        let amoy_asia = edges.containing(["AMOY", "ASIA"], from: words)[0]
        let chests_asia = edges.containing(["CHESTS", "ASIA"], from: words)[1]
        let chests_teapot_mocha_set = rectangle3x4.containing(["CHESTS", "TEAPOT", "MOCHA", "SET"], from: words)[0]
        let teapot_shoot = edges.containing(["TEAPOT", "SHOOT"], from: words)[2]
        let pekoe_ceremony = edges.containing(["PEKOE", "CEREMONY"], from: words)[3]
        let pekoe_yemen = edges.containing(["PEKOE", "YEMEN"], from: words)[2]
        let kenya_yemen = edges.containing(["KENYA", "YEMEN"], from: words)[0]

        let winningShapes = [
            ritual_saucers_beans_shrub_iced_tea_urn_assam,
            taste_saucers_tips_shrub,
            cup_tips,
            amoy_assam,
            amoy_hyson,
            spray_anhwei_hyson_brew,
            spray_ceremony,
            cup_nice,
            amoy_asia,
            chests_asia,
            chests_teapot_mocha_set,
            teapot_shoot,
            pekoe_ceremony,
            pekoe_yemen,
            kenya_yemen
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    

    
    
    private static func Shapes_9206(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9206)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 102,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 54,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 60,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let clot_eczema_lozenge_anatomy = square3x3.containing(["CLOT", "ECZEMA", "LOZENGE", "ANATOMY"], from: words)[0]
        let galen_anatomy = edges.containing(["GALEN", "ANATOMY"], from: words)[1]
        let eczema_reid = edges.containing(["ECZEMA", "REID"], from: words)[0]
        let eyes_lozenge = edges.containing(["EYES", "LOZENGE"], from: words)[3]
        let ail_eczema_anatomy_salve = rectangle3x4_BottomRight.containing(["AIL", "ECZEMA", "ANATOMY", "SALVE"], from: words)[0]
        let salk_salve = edges.containing(["SALK", "SALVE"], from: words)[0]
        let virus_salve = edges.containing(["VIRUS", "SALVE"], from: words)[0]
        let body_virus_remedy_burnet_dose = c2x3.containing(["BODY", "VIRUS", "REMEDY", "BURNET", "DOSE"], from: words)[0]
        let body_oxygen = edges.containing(["BODY", "OXYGEN"], from: words)[1]
        let bone_remedy_oxygen_embryo = rectangle3x5.containing(["BONE", "REMEDY", "OXYGEN", "EMBRYO"], from: words)[0]
        let cure_nurse_pulse_burnet = square3x3_BottomRight.containing(["CURE", "NURSE", "PULSE", "BURNET"], from: words)[0]
        let thomas_burnet = edges.containing(["THOMAS", "BURNET"], from: words)[0]
        let thomas_iodine_cold_pain = square3x3.containing(["THOMAS", "IODINE", "COLD", "PAIN"], from: words)[0]

        let winningShapes = [
            clot_eczema_lozenge_anatomy,
            galen_anatomy,
            eczema_reid,
            eyes_lozenge,
            ail_eczema_anatomy_salve,
            salk_salve,
            virus_salve,
            body_virus_remedy_burnet_dose,
            body_oxygen,
            bone_remedy_oxygen_embryo,
            cure_nurse_pulse_burnet,
            thomas_burnet,
            thomas_iodine_cold_pain
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9207(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9207)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 36,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 86,
            widthMax: widthMax,
            heightMax: heightMax))

        let cyclist_trophy_olympic_medley = square3x3.containing(["CYCLIST", "TROPHY", "OLYMPIC", "MEDLEY"], from: words)[0]
        let moscow_cyclist_medley_discus = rectangle3x4.containing(["MOSCOW", "CYCLIST", "MEDLEY", "DISCUS"], from: words)[0]
        let cyclist_team = edges.containing(["CYCLIST", "TEAM"], from: words)[0]
        let trophy_soccer_teammates_olympic = rectangle3x4.containing(["TROPHY", "SOCCER", "TEAMMATES", "OLYMPIC"], from: words)[0]
        let table_teammates = edges.containing(["TABLE", "TEAMMATES"], from: words)[0]
        let moscow_cyclist_discus_sport = rectangle3x4_BottomRight.containing(["MOSCOW", "CYCLIST", "DISCUS", "SPORT"], from: words)[0]
        let sculls_sport = edges.containing(["SCULLS", "SPORT"], from: words)[0]
        let sculls_solo = edges.containing(["SCULLS", "SOLO"], from: words)[1]
        let tokyo_sport = edges.containing(["TOKYO", "SPORT"], from: words)[0]
        let tokyo_torch_oath_roycroft = square3x3.containing(["TOKYO", "TORCH", "OATH", "ROYCROFT"], from: words)[0]
        let winter_roycroft = edges.containing(["WINTER", "ROYCROFT"], from: words)[0]
        let rome_cyclist_olympic_medley = square3x3.containing(["ROME", "CYCLIST", "OLYMPIC", "MEDLEY"], from: words)[0]

        let winningShapes = [
            cyclist_trophy_olympic_medley,
            moscow_cyclist_medley_discus,
            cyclist_team,
            trophy_soccer_teammates_olympic,
            table_teammates,
            moscow_cyclist_discus_sport,
            sculls_sport,
            sculls_solo,
            tokyo_sport,
            tokyo_torch_oath_roycroft,
            winter_roycroft,
            rome_cyclist_olympic_medley
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9208(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9208)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 120,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle5x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 140,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let theatre_donizetti_intermezzo_tetrazzini = rectangle5x6.containing(["THEATRE", "DONIZETTI", "INTERMEZZO", "TETRAZZINI"], from: words)[0]
        let theatre_bizet_tetrazzini_operetta = rectangle3x4.containing(["THEATRE", "BIZET", "TETRAZZINI", "OPERETTA"], from: words)[1]
        let libretto_theatre_tetrazzini_operetta = square3x3.containing(["LIBRETTO", "THEATRE", "TETRAZZINI", "OPERETTA"], from: words)[1]
        let donizetti_borodin_intermezzo_tetrazzini = rectangle3x5.containing(["DONIZETTI", "BORODIN", "INTERMEZZO", "TETRAZZINI"], from: words)[0]
        let donizetti_valois = edges.containing(["DONIZETTI", "VALOIS"], from: words)[0]
        let chorus_valois = edges.containing(["CHORUS", "VALOIS"], from: words)[1]
        let ulanova_valois = edges.containing(["ULANOVA", "VALOIS"], from: words)[0]
        let singer_ulanova_manon_aria = rectangle3x4.containing(["SINGER", "ULANOVA", "MANON", "ARIA"], from: words)[0]
        let ulanova_duets = edges.containing(["ULANOVA", "DUETS"], from: words)[0]
        let tutu_duets = edges.containing(["TUTU", "DUETS"], from: words)[0]
        let tutu_trio = edges.containing(["TUTU", "TRIO"], from: words)[1]
        let carmen_manon = edges.containing(["CARMEN", "MANON"], from: words)[0]

        let winningShapes = [
            theatre_donizetti_intermezzo_tetrazzini,
            theatre_bizet_tetrazzini_operetta,
            libretto_theatre_tetrazzini_operetta,
            donizetti_borodin_intermezzo_tetrazzini,
            donizetti_valois,
            chorus_valois,
            ulanova_valois,
            singer_ulanova_manon_aria,
            ulanova_duets,
            tutu_duets,
            tutu_trio,
            carmen_manon
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9209(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9209)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax

        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let pacman3x3_BottomRight = ShapeCalculator.toShapes(pacmans: PacmanCalculatorV1.BottomRight(
            words: words,
            end: end,
            len: len,
            scoreMin: 124,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 58,
            widthMax: widthMax,
            heightMax: heightMax))

        let special9209 = SpecialShapesCalculator.C9209(words: words)

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let uniform_enemy_rifle_foray = rectangle3x4.containing(["UNIFORM", "ENEMY", "RIFLE", "FORAY"], from: words)[0]
        let patrol_enemy_smuts_turret_onset_rifle = pacman3x3_BottomRight.containing(["PATROL", "ENEMY", "SMUTS", "TURRET", "ONSET", "RIFLE"], from: words)[0]
        let patrol_smuts_armour_turret = square3x3.containing(["PATROL", "SMUTS", "ARMOUR", "TURRET"], from: words)[0]
        let fort_turret = edges.containing(["FORT", "TURRET"], from: words)[0]
        let alamo_foray = edges.containing(["ALAMO", "FORAY"], from: words)[1]
        let alamo_corps_tnt_divisions_action_mons_fortify = special9209.containing(["ALAMO", "CORPS", "TNT", "DIVISIONS", "ACTION", "MONS", "FORTIFY"], from: words)[0]
        let tnt_allenby_action_fortify = rectangle3x4.containing(["TNT", "ALLENBY", "ACTION", "FORTIFY"], from: words)[0]
        let corps_ypres = edges.containing(["CORPS", "YPRES"], from: words)[2]
        let army_ypres = edges.containing(["ARMY", "YPRES"], from: words)[0]
        let divisions_slim = edges.containing(["DIVISIONS", "SLIM"], from: words)[4]
        let divisions_allenby_medal_action = rectangle3x4.containing(["DIVISIONS", "ALLENBY", "MEDAL", "ACTION"], from: words)[0]
        let bren_armour = edges.containing(["BREN", "ARMOUR"], from: words)[1]

        let winningShapes = [
            uniform_enemy_rifle_foray,
            patrol_enemy_smuts_turret_onset_rifle,
            patrol_smuts_armour_turret,
            fort_turret,
            alamo_foray,
            alamo_corps_tnt_divisions_action_mons_fortify,
            tnt_allenby_action_fortify,
            corps_ypres,
            army_ypres,
            divisions_slim,
            divisions_allenby_medal_action,
            bren_armour
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    private static func Shapes_9210(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9210)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 100,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 112,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 64,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 72,
            widthMax: widthMax,
            heightMax: heightMax))

        let manzanilla_brandy_spain_fizzy = square3x3.containing(["MANZANILLA", "BRANDY", "SPAIN", "FIZZY"], from: words)[0]
        let france_manzanilla_fizzy_cellar = rectangle3x5.containing(["FRANCE", "MANZANILLA", "FIZZY", "CELLAR"], from: words)[0]
        let toast_rhine_cellar_sherry_asti = c2x3.containing(["TOAST", "RHINE", "CELLAR", "SHERRY", "ASTI"], from: words)[0]
        let dry_sherry = edges.containing(["DRY", "SHERRY"], from: words)[2]
        let toast_taste = edges.containing(["TOAST", "TASTE"], from: words)[0]
        let vault_still_mull_taste = square3x3_BottomRight.containing(["VAULT", "STILL", "MULL", "TASTE"], from: words)[0]
        let vault_still_vat_mull = square3x3.containing(["VAULT", "STILL", "VAT", "MULL"], from: words)[0]
        let rhine_dregs_sherry_negus = square3x3.containing(["RHINE", "DREGS", "SHERRY", "NEGUS"], from: words)[0]
        let sec_asti = edges.containing(["SEC", "ASTI"], from: words)[0]
        let press_spain = edges.containing(["PRESS", "SPAIN"], from: words)[2]
        let press_port = edges.containing(["PRESS", "PORT"], from: words)[0]
        let brandy_wine_sweet_drink = square3x3_TopLeft.containing(["BRANDY", "WINE", "SWEET", "DRINK"], from: words)[1]
        let sec_marc = edges.containing(["SEC", "MARC"], from: words)[0]

        let winningShapes = [
            manzanilla_brandy_spain_fizzy,
            france_manzanilla_fizzy_cellar,
            toast_rhine_cellar_sherry_asti,
            dry_sherry,
            toast_taste,
            vault_still_mull_taste,
            vault_still_vat_mull,
            rhine_dregs_sherry_negus,
            sec_asti,
            press_spain,
            press_port,
            brandy_wine_sweet_drink,
            sec_marc
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9211(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9211)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax

        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 96,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 126,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let laika_spitz_felis_schnauzer = rectangle3x5.containing(["LAIKA", "SPITZ", "FELIS", "SCHNAUZER"], from: words)[0]
        let flush_laika_saluki_schnauzer = square3x3.containing(["FLUSH", "LAIKA", "SALUKI", "SCHNAUZER"], from: words)[0]
        let crofts_nana_schnauzer_coon = square3x3.containing(["CROFTS", "NANA", "SCHNAUZER", "COON"], from: words)[0]
        let crofts_spaniel_cats_sphynx = c2x2.containing(["CROFTS", "SPANIEL", "CATS", "SPHYNX"], from: words)[0]
        let skye_manx_asta_sphynx = square3x3.containing(["SKYE", "MANX", "ASTA", "SPHYNX"], from: words)[0]
        let claws_flush_saluki_schnauzer = square3x3.containing(["CLAWS", "FLUSH", "SALUKI", "SCHNAUZER"], from: words)[0]
        let chow_spaniel_cats_whine = square4x4.containing(["CHOW", "SPANIEL", "CATS", "WHINE"], from: words)[0]
        let boxer_schnauzer = edges.containing(["BOXER", "SCHNAUZER"], from: words)[1]
        let hair_whine = edges.containing(["HAIR", "WHINE"], from: words)[0]
        let spaniel_lassie = edges.containing(["SPANIEL", "LASSIE"], from: words)[0]
        let dogs_macavity_korat_lassie = rectangle3x4_BottomRight.containing(["DOGS", "MACAVITY", "KORAT", "LASSIE"], from: words)[0]
        //let nana_asta = edges.containing(["NANA", "ASTA"], from: words)[0]
        // let flush_felis = edges.containing(["FLUSH", "FELIS"], from: words)[0]

        let winningShapes = [
            laika_spitz_felis_schnauzer,
            flush_laika_saluki_schnauzer,
            crofts_nana_schnauzer_coon,
            crofts_spaniel_cats_sphynx,
            skye_manx_asta_sphynx,
            claws_flush_saluki_schnauzer,
            chow_spaniel_cats_whine,
            boxer_schnauzer,
            hair_whine,
            spaniel_lassie,
            dogs_macavity_korat_lassie
            //nana_asta,
            //flush_felis
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9212(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9212)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 82,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 118,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let bear_blizzard_eskimos_breeze = rectangle3x4.containing(["BEAR", "BLIZZARD", "ESKIMOS", "BREEZE"], from: words)[0]
        let fox_walrus_furs_eskimos = c2x2.containing(["FOX", "WALRUS", "FURS", "ESKIMOS"], from: words)[0]
        let walrus_norway = edges.containing(["WALRUS", "NORWAY"], from: words)[1]
        let kayak_norway = edges.containing(["KAYAK", "NORWAY"], from: words)[2]
        let tent_walrus_norway_owl = rectangle3x4_TopRight.containing(["TENT", "WALRUS", "NORWAY", "OWL"], from: words)[0]
        let nansen_tent_nunataks_scott = rectangle4x5.containing(["NANSEN", "TENT", "NUNATAKS", "SCOTT"], from: words)[0]
        let snow_furs = edges.containing(["SNOW", "FURS"], from: words)[0]
        let base_ermine_breeze_somerset = square3x3.containing(["BASE", "ERMINE", "BREEZE", "SOMERSET"], from: words)[0]
        let atlas_somerset = edges.containing(["ATLAS", "SOMERSET"], from: words)[2]
        let atlas_mosses = edges.containing(["ATLAS", "MOSSES"], from: words)[1]
        let dogs_mosses = edges.containing(["DOGS", "MOSSES"], from: words)[3]
        let nome_scott = edges.containing(["NOME", "SCOTT"], from: words)[0]
        let ermine_ice = edges.containing(["ERMINE", "ICE"], from: words)[2]

        let winningShapes = [
            bear_blizzard_eskimos_breeze,
            fox_walrus_furs_eskimos,
            walrus_norway,
            kayak_norway,
            tent_walrus_norway_owl,
            nansen_tent_nunataks_scott,
            snow_furs,
            base_ermine_breeze_somerset,
            atlas_somerset,
            atlas_mosses,
            dogs_mosses,
            nome_scott,
            ermine_ice
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9301(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9301)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 128,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 104,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 62,
            widthMax: widthMax,
            heightMax: heightMax))

        let brazil_customs_salzburg_boat = rectangle3x4_BottomLeft.containing(["BRAZIL", "CUSTOMS", "SALZBURG", "BOAT"], from: words)[0]
        let customs_gift_salzburg_boat = rectangle3x4.containing(["CUSTOMS", "GIFT", "SALZBURG", "BOAT"], from: words)[0]
        let customs_asia = edges.containing(["CUSTOMS", "ASIA"], from: words)[1]
        let ship_salzburg = edges.containing(["SHIP", "SALZBURG"], from: words)[0]
        let ship_trip = edges.containing(["SHIP", "TRIP"], from: words)[0]
        let italy_jet_trip_yacht = rectangle4x5_BottomLeft.containing(["ITALY", "JET", "TRIP", "YACHT"], from: words)[0]
        let china_salzburg = edges.containing(["CHINA", "SALZBURG"], from: words)[0]
        let china_bali = edges.containing(["CHINA", "BALI"], from: words)[0]
        let car_bali = edges.containing(["CAR", "BALI"], from: words)[0]
        let brazil_bus = edges.containing(["BRAZIL", "BUS"], from: words)[0]
        let tickets_bus = edges.containing(["TICKETS", "BUS"], from: words)[0]
        let tickets_boston_cab_athens = square3x3.containing(["TICKETS", "BOSTON", "CAB", "ATHENS"], from: words)[0]
        let egypt_athens = edges.containing(["EGYPT", "ATHENS"], from: words)[1]
        let york_egypt_voyage_norway = rectangle3x4.containing(["YORK", "EGYPT", "VOYAGE", "NORWAY"], from: words)[0]
        let venice_york_voyage_norway = square3x3.containing(["VENICE", "YORK", "VOYAGE", "NORWAY"], from: words)[0]
        let tickets_tax = edges.containing(["TICKETS", "TAX"], from: words)[0]

        let winningShapes = [
            brazil_customs_salzburg_boat,
            customs_gift_salzburg_boat,
            customs_asia,
            ship_salzburg,
            ship_trip,
            italy_jet_trip_yacht,
            china_salzburg,
            china_bali,
            car_bali,
            brazil_bus,
            tickets_bus,
            tickets_boston_cab_athens,
            egypt_athens,
            york_egypt_voyage_norway,
            venice_york_voyage_norway,
            tickets_tax
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9302(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9302)!
        
        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 62,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let kunzite_amazonite = edges.containing(["KUNZITE", "AMAZONITE"], from: words)[1]
        let garnet_kunzite_agate_fire = square3x3_BottomRight.containing(["GARNET", "KUNZITE", "AGATE", "FIRE"], from: words)[0]
        let garnet_trinkets = edges.containing(["GARNET", "TRINKETS"], from: words)[0]
        let coin_buckle_locket_trinkets = square3x3.containing(["COIN", "BUCKLE", "LOCKET", "TRINKETS"], from: words)[0]
        let buckle_amethyst_ruby_locket = square3x3.containing(["BUCKLE", "AMETHYST", "RUBY", "LOCKET"], from: words)[0]
        let kunzite_beauty = edges.containing(["KUNZITE", "BEAUTY"], from: words)[0]
        let rarity_beauty = edges.containing(["RARITY", "BEAUTY"], from: words)[2]
        let rarity_watch_crown_carat = square3x3.containing(["RARITY", "WATCH", "CROWN", "CARAT"], from: words)[0]
        let pyrope_beauty = edges.containing(["PYROPE", "BEAUTY"], from: words)[0]
        let pyrope_onyx = edges.containing(["PYROPE", "ONYX"], from: words)[1]
        let coral_onyx = edges.containing(["CORAL", "ONYX"], from: words)[0]

        let winningShapes = [
            kunzite_amazonite,
            garnet_kunzite_agate_fire,
            garnet_trinkets,
            coin_buckle_locket_trinkets,
            buckle_amethyst_ruby_locket,
            kunzite_beauty,
            rarity_beauty,
            rarity_watch_crown_carat,
            pyrope_beauty,
            pyrope_onyx,
            coral_onyx
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9303(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9303)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 98,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 88,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 88,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 106,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 64,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 108,
            widthMax: widthMax,
            heightMax: heightMax))

        let annuity_yield_security_trade = rectangle3x5.containing(["ANNUITY", "YIELD", "SECURITY", "TRADE"], from: words)[0]
        let pistole_annuity_security_salary = square4x4.containing(["PISTOLE", "ANNUITY", "SECURITY", "SALARY"], from: words)[0]
        let annuity_buy_audit_penny = c2x2.containing(["ANNUITY", "BUY", "AUDIT", "PENNY"], from: words)[0]
        let pounds_pistole_net_salary = square3x3.containing(["POUNDS", "PISTOLE", "NET", "SALARY"], from: words)[0]
        let lira_yield_security_trade = square3x3.containing(["LIRA", "YIELD", "SECURITY", "TRADE"], from: words)[0]
        let buy_quote_sou_audit = rectangle3x4_TopLeft.containing(["BUY", "QUOTE", "SOU", "AUDIT"], from: words)[0]
        let bonus_sou = edges.containing(["BONUS", "SOU"], from: words)[0]
        let rupee_bonus_proxy_ecu = square3x3.containing(["RUPEE", "BONUS", "PROXY", "ECU"], from: words)[0]
        let pay_proxy = edges.containing(["PAY", "PROXY"], from: words)[1]
        let rupee_bonus_dinero_proxy = square3x3_BottomLeft.containing(["RUPEE", "BONUS", "DINERO", "PROXY"], from: words)[0]
        let rupee_rouble = edges.containing(["RUPEE", "ROUBLE"], from: words)[2]
        let margin_ducat_rouble_notes = rectangle3x4.containing(["MARGIN", "DUCAT", "ROUBLE", "NOTES"], from: words)[0]
        let yield_aid = edges.containing(["YIELD", "AID"], from: words)[1]

        let winningShapes = [
            annuity_yield_security_trade,
            pistole_annuity_security_salary,
            annuity_buy_audit_penny,
            pounds_pistole_net_salary,
            lira_yield_security_trade,
            buy_quote_sou_audit,
            bonus_sou,
            rupee_bonus_proxy_ecu,
            pay_proxy,
            rupee_bonus_dinero_proxy,
            rupee_rouble,
            margin_ducat_rouble_notes,
            yield_aid
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9304(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9304)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 130,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 132,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x4(
           words: words,
           end: end,
           len: len,
           scoreMin: 122,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 70,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 58,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 60,
            widthMax: widthMax,
            heightMax: heightMax))

        let kilohertz_ream_troy_outsize = c2x2.containing(["KILOHERTZ", "REAM", "TROY", "OUTSIZE"], from: words)[0]
        let ream_yard_troy_acre = square3x3.containing(["REAM", "YARD", "TROY", "ACRE"], from: words)[0]
        let step_kilohertz_cask_tierce_bushel_pocket = c2x4.containing(["STEP", "KILOHERTZ", "CASK", "TIERCE", "BUSHEL", "POCKET"], from: words)[0]
        let kilohertz_feet_tierce_pocket = rectangle3x5.containing(["KILOHERTZ", "FEET", "TIERCE", "POCKET"], from: words)[0]
        let kilohertz_keg_pocket_erg = square3x3.containing(["KILOHERTZ", "KEG", "POCKET", "ERG"], from: words)[0]
        let quarto_step_bushel_dram = rectangle3x4_BottomRight.containing(["QUARTO", "STEP", "BUSHEL", "DRAM"], from: words)[0]
        let quarto_pole = edges.containing(["QUARTO", "POLE"], from: words)[0]
        let proof_pole = edges.containing(["PROOF", "POLE"], from: words)[0]
        let proof_foot = edges.containing(["PROOF", "FOOT"], from: words)[0]
        let ohm_pint_foot_moiety = square3x3_BottomLeft.containing(["OHM", "PINT", "FOOT", "MOIETY"], from: words)[0]
        let tun_dyne_moiety_unit_stone = c2x3.containing(["TUN", "DYNE", "MOIETY", "UNIT", "STONE"], from: words)[0]
        let watt_unit = edges.containing(["WATT", "UNIT"], from: words)[0]

        let winningShapes = [
            kilohertz_ream_troy_outsize,
            ream_yard_troy_acre,
            step_kilohertz_cask_tierce_bushel_pocket,
            kilohertz_feet_tierce_pocket,
            kilohertz_keg_pocket_erg,
            quarto_step_bushel_dram,
            quarto_pole,
            proof_pole,
            proof_foot,
            ohm_pint_foot_moiety,
            tun_dyne_moiety_unit_stone,
            watt_unit
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9305(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9305)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 104,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 106,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let brazil_spritz = edges.containing(["BRAZIL", "SPRITZ"], from: words)[2]
        let pies_spritz = edges.containing(["PIES", "SPRITZ"], from: words)[0]
        let gums_pies_syrup_mints_russe = c2x3.containing(["GUMS", "PIES", "SYRUP", "MINTS", "RUSSE"], from: words)[0]
        let taffy_syrup = edges.containing(["TAFFY", "SYRUP"], from: words)[0]
        let sorbet_gums_syrup_russe = rectangle3x4.containing(["SORBET", "GUMS", "SYRUP", "RUSSE"], from: words)[0]
        let pies_torte_mints_spritz = square3x3.containing(["PIES", "TORTE", "MINTS", "SPRITZ"], from: words)[0]
        let sorbet_truffles = edges.containing(["SORBET", "TRUFFLES"], from: words)[3]
        let nuts_mints = edges.containing(["NUTS", "MINTS"], from: words)[2]
        let nuts_simnel = edges.containing(["NUTS", "SIMNEL"], from: words)[0]
        let taffy_bars = edges.containing(["TAFFY", "BARS"], from: words)[0]
        let floss_bars = edges.containing(["FLOSS", "BARS"], from: words)[1]
        let floss_sweets = edges.containing(["FLOSS", "SWEETS"], from: words)[0]
        let trifle_yogurt_pastry_sweets = rectangle3x6.containing(["TRIFLE", "YOGURT", "PASTRY", "SWEETS"], from: words)[0]
        let trifle_yogurt_pastry_fruit = rectangle3x4.containing(["TRIFLE", "YOGURT", "PASTRY", "FRUIT"], from: words)[0]
        let tarts_fruit = edges.containing(["TARTS", "FRUIT"], from: words)[2]
        let floss_peel = edges.containing(["FLOSS", "PEEL"], from: words)[0]
        let drops_peel = edges.containing(["DROPS", "PEEL"], from: words)[0]

        let winningShapes = [
            brazil_spritz,
            pies_spritz,
            gums_pies_syrup_mints_russe,
            taffy_syrup,
            sorbet_gums_syrup_russe,
            pies_torte_mints_spritz,
            sorbet_truffles,
            nuts_mints,
            nuts_simnel,
            taffy_bars,
            floss_bars,
            floss_sweets,
            trifle_yogurt_pastry_sweets,
            trifle_yogurt_pastry_fruit,
            tarts_fruit,
            floss_peel,
            drops_peel
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9306(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9306)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 88,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle5x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 146,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let zeugloptera_dayfly_buzzardet_botfly = rectangle5x6.containing(["ZEUGLOPTERA", "DAYFLY", "BUZZARDET", "BOTFLY"], from: words)[0]
        let dayfly_tau_buzzardet_maybug = square3x3.containing(["DAYFLY", "TAU", "BUZZARDET", "MAYBUG"], from: words)[0]
        let zeugloptera_thrips_termite_zoraptera = rectangle3x6.containing(["ZEUGLOPTERA", "THRIPS", "TERMITE", "ZORAPTERA"], from: words)[0]
        let epizoon_zoraptera = edges.containing(["EPIZOON", "ZORAPTERA"], from: words)[2]
        let tsetse_thrips_zoraptera_mantis = rectangle3x4.containing(["TSETSE", "THRIPS", "ZORAPTERA", "MANTIS"], from: words)[0]
        let wasp_tsetse_mantis_dipterans = square3x3.containing(["WASP", "TSETSE", "MANTIS", "DIPTERANS"], from: words)[1]
        let aphis_dipterans = edges.containing(["APHIS", "DIPTERANS"], from: words)[3]
        let dayfly_lema = edges.containing(["DAYFLY", "LEMA"], from: words)[1]
        let mite_lema = edges.containing(["MITE", "LEMA"], from: words)[0]
        let borer_buzzardet = edges.containing(["BORER", "BUZZARDET"], from: words)[0]

        let winningShapes = [
            zeugloptera_dayfly_buzzardet_botfly,
            dayfly_tau_buzzardet_maybug,
            zeugloptera_thrips_termite_zoraptera,
            epizoon_zoraptera,
            tsetse_thrips_zoraptera_mantis,
            wasp_tsetse_mantis_dipterans,
            aphis_dipterans,
            dayfly_lema,
            mite_lema,
            borer_buzzardet
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9307(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9307)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 130,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 106,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 50,
            widthMax: widthMax,
            heightMax: heightMax))

        let square5x5_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 4,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let tanzania_belize_brazil_venezuela = square3x3.containing(["TANZANIA", "BELIZE", "BRAZIL", "VENEZUELA"], from: words)[1]
        let qatar_tanzania_malta_brazil = rectangle3x4.containing(["QATAR", "TANZANIA", "MALTA", "BRAZIL"], from: words)[0]
        let belize_kenya_peru_egypt = square3x3_TopLeft.containing(["BELIZE", "KENYA", "PERU", "EGYPT"], from: words)[0]
        let kenya_austria_peru_egypt = square3x3.containing(["KENYA", "AUSTRIA", "PERU", "EGYPT"], from: words)[0]
        let tanzania_sudan = edges.containing(["TANZANIA", "SUDAN"], from: words)[4]
        let uruguay_sudan = edges.containing(["URUGUAY", "SUDAN"], from: words)[0]
        let uruguay_syria = edges.containing(["URUGUAY", "SYRIA"], from: words)[2]
        let uruguay_cuba = edges.containing(["URUGUAY", "CUBA"], from: words)[1]
        let uruguay_turkey = edges.containing(["URUGUAY", "TURKEY"], from: words)[3]
        let libya_turkey = edges.containing(["LIBYA", "TURKEY"], from: words)[0]
        let libya_iraq_fiji_italy = square3x3_TopLeft.containing(["LIBYA", "IRAQ", "FIJI", "ITALY"], from: words)[0]
        let libya_yemen_italy_iran = square5x5_TopRight.containing(["LIBYA", "YEMEN", "ITALY", "IRAN"], from: words)[0]

        let winningShapes = [
            tanzania_belize_brazil_venezuela,
            qatar_tanzania_malta_brazil,
            belize_kenya_peru_egypt,
            kenya_austria_peru_egypt,
            tanzania_sudan,
            uruguay_sudan,
            uruguay_syria,
            uruguay_cuba,
            uruguay_turkey,
            libya_turkey,
            libya_iraq_fiji_italy,
            libya_yemen_italy_iran
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9308(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9308)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 68,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let square5x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 4,
            words: words,
            lengths: len,
            scoreMin: 90,
            widthMax: widthMax,
            heightMax: heightMax))

        let velazquez_ernst_rubens_cezanne = square3x3.containing(["VELAZQUEZ", "ERNST", "RUBENS", "CEZANNE"], from: words)[0]
        let velazquez_greuze = edges.containing(["VELAZQUEZ", "GREUZE"], from: words)[0]
        let velazquez_weyden_vernet_heyden = c2x2.containing(["VELAZQUEZ", "WEYDEN", "VERNET", "HEYDEN"], from: words)[0]
        let romney_heyden = edges.containing(["ROMNEY", "HEYDEN"], from: words)[1]
        let weyden_eyck = edges.containing(["WEYDEN", "EYCK"], from: words)[0]
        let weyden_scott_watts_vernet = square5x5.containing(["WEYDEN", "SCOTT", "WATTS", "VERNET"], from: words)[0]
        let redon_dyck_lely_rubens = rectangle3x4_BottomRight.containing(["REDON", "DYCK", "LELY", "RUBENS"], from: words)[0]
        let ernst_steer_rubens_cezanne = square3x3.containing(["ERNST", "STEER", "RUBENS", "CEZANNE"], from: words)[0]
        let ernst_sargent = edges.containing(["ERNST", "SARGENT"], from: words)[3]
        let hals_sargent = edges.containing(["HALS", "SARGENT"], from: words)[0]
        let bril_greuze = edges.containing(["BRIL", "GREUZE"], from: words)[0]
        let hooch_heyden = edges.containing(["HOOCH", "HEYDEN"], from: words)[1]

        let winningShapes = [
            velazquez_ernst_rubens_cezanne,
            velazquez_greuze,
            velazquez_weyden_vernet_heyden,
            romney_heyden,
            weyden_eyck,
            weyden_scott_watts_vernet,
            redon_dyck_lely_rubens,
            ernst_steer_rubens_cezanne,
            ernst_sargent,
            hals_sargent,
            bril_greuze,
            hooch_heyden
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9309(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9309)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 68,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 130,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 104,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 56,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let minuet_zapateado_passamezzo_hula = rectangle3x4.containing(["MINUET", "ZAPATEADO", "PASSAMEZZO", "HULA"], from: words)[0]
        let pirouette_step_passamezzo_reel = square3x3.containing(["PIROUETTE", "STEP", "PASSAMEZZO", "REEL"], from: words)[0]
        let pirouette_cancan_tango_valse = square3x3_TopRight.containing(["PIROUETTE", "CANCAN", "TANGO", "VALSE"], from: words)[0]
        let valeta_cancan_valse_fan = c2x2.containing(["VALETA", "CANCAN", "VALSE", "FAN"], from: words)[1]
        let valeta_poussette_valse_trot = rectangle4x5.containing(["VALETA", "POUSSETTE", "VALSE", "TROT"], from: words)[0]
        let zapateado_polka_tap_ball = square3x3.containing(["ZAPATEADO", "POLKA", "TAP", "BALL"], from: words)[0]
        let zapateado_polka_ball_jota = square3x3.containing(["ZAPATEADO", "POLKA", "BALL", "JOTA"], from: words)[0]
        let twostep_jota = edges.containing(["TWOSTEP", "JOTA"], from: words)[0]
        let twostep_twist = edges.containing(["TWOSTEP", "TWIST"], from: words)[5]
        let zapateado_pas = edges.containing(["ZAPATEADO", "PAS"], from: words)[0]
        let twostep_hop = edges.containing(["TWOSTEP", "HOP"], from: words)[0]
        let jive_twist = edges.containing(["JIVE", "TWIST"], from: words)[0]

        let winningShapes = [
            minuet_zapateado_passamezzo_hula,
            pirouette_step_passamezzo_reel,
            pirouette_cancan_tango_valse,
            valeta_cancan_valse_fan,
            valeta_poussette_valse_trot,
            zapateado_polka_tap_ball,
            zapateado_polka_ball_jota,
            twostep_jota,
            twostep_twist,
            zapateado_pas,
            twostep_hop,
            jive_twist
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9310(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9310)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 36,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 108,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let donizetti_rodriguez = edges.containing(["DONIZETTI", "RODRIGUEZ"], from: words)[0]
        let moussorgsky_rodriguez = edges.containing(["MOUSSORGSKY", "RODRIGUEZ"], from: words)[0]
        let delius_moussorgsky_stravinsky_debussy = square3x3.containing(["DELIUS", "MOUSSORGSKY", "STRAVINSKY", "DEBUSSY"], from: words)[1]
        let strauss_stravinsky = edges.containing(["STRAUSS", "STRAVINSKY"], from: words)[3]
        let strauss_szymanowski_rodriguez_tosti = square3x3_TopLeft.containing(["STRAUSS", "SZYMANOWSKI", "RODRIGUEZ", "TOSTI"], from: words)[0]
        let marks_szymanowski_mascagni_raybould = square3x3.containing(["MARKS", "SZYMANOWSKI", "MASCAGNI", "RAYBOULD"], from: words)[1]
        let szymanowski_gaul_mascagni_raybould = rectangle3x4.containing(["SZYMANOWSKI", "GAUL", "MASCAGNI", "RAYBOULD"], from: words)[0]
        let szymanowski_verdi_rodriguez_tosti = square3x3.containing(["SZYMANOWSKI", "VERDI", "RODRIGUEZ", "TOSTI"], from: words)[0]

        let winningShapes = [
            donizetti_rodriguez,
            moussorgsky_rodriguez,
            delius_moussorgsky_stravinsky_debussy,
            strauss_stravinsky,
            strauss_szymanowski_rodriguez_tosti,
            marks_szymanowski_mascagni_raybould,
            szymanowski_gaul_mascagni_raybould,
            szymanowski_verdi_rodriguez_tosti
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9311(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9311)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 112,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightSquare(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 72,
            widthMax: widthMax,
            heightMax: heightMax))

        let tarpaulin_mizzentop_trice_horizon = square3x3.containing(["TARPAULIN", "MIZZENTOP", "TRICE", "HORIZON"], from: words)[0]
        let tarpaulin_mizzentop_horizon_scuttle = rectangle3x4.containing(["TARPAULIN", "MIZZENTOP", "HORIZON", "SCUTTLE"], from: words)[0]
        let stowaway_tarpaulin_scuttle_wind = rectangle3x4.containing(["STOWAWAY", "TARPAULIN", "SCUTTLE", "WIND"], from: words)[0]
        let stowaway_buoy = edges.containing(["STOWAWAY", "BUOY"], from: words)[1]
        let after_stowaway_aft_crew = rectangle3x5.containing(["AFTER", "STOWAWAY", "AFT", "CREW"], from: words)[0]
        let hatch_horizon = edges.containing(["HATCH", "HORIZON"], from: words)[1]
        let embargo_hatch_mast_rig = square4x4_BottomRight.containing(["EMBARGO", "HATCH", "MAST", "RIG"], from: words)[0]
        let embargo_hatch_ashore_mast = rectangle3x4_TopLeft.containing(["EMBARGO", "HATCH", "ASHORE", "MAST"], from: words)[0]
        let seaworthy_scuttle = edges.containing(["SEAWORTHY", "SCUTTLE"], from: words)[1]
        let port_seaworthy_float_jetty = square3x3.containing(["PORT", "SEAWORTHY", "FLOAT", "JETTY"], from: words)[1]

        let winningShapes = [
            tarpaulin_mizzentop_trice_horizon,
            tarpaulin_mizzentop_horizon_scuttle,
            stowaway_tarpaulin_scuttle_wind,
            stowaway_buoy,
            after_stowaway_aft_crew,
            hatch_horizon,
            embargo_hatch_mast_rig,
            embargo_hatch_ashore_mast,
            seaworthy_scuttle,
            port_seaworthy_float_jetty
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9312(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9312)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 112,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 124,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let vesuvius_ruwenzori_quizapu_fuji = rectangle3x4.containing(["VESUVIUS", "RUWENZORI", "QUIZAPU", "FUJI"], from: words)[0]
        let erebus_ruwenzori_ural_jura_sulaiman = c2x3.containing(["EREBUS", "RUWENZORI", "URAL", "JURA", "SULAIMAN"], from: words)[0]
        let ruwenzori_itaculomi_peteroa_quizapu = rectangle3x4.containing(["RUWENZORI", "ITACULOMI", "PETEROA", "QUIZAPU"], from: words)[0]
        let itaculomi_barry_caha_rocky = square4x4.containing(["ITACULOMI", "BARRY", "CAHA", "ROCKY"], from: words)[0]
        let ural_rosa = edges.containing(["URAL", "ROSA"], from: words)[0]
        let atlas_rosa = edges.containing(["ATLAS", "ROSA"], from: words)[0]
        let atlas_everest = edges.containing(["ATLAS", "EVEREST"], from: words)[1]
        let simplon_sulaiman = edges.containing(["SIMPLON", "SULAIMAN"], from: words)[4]
        let simplon_alps = edges.containing(["SIMPLON", "ALPS"], from: words)[0]
        let itaculomi_olives = edges.containing(["ITACULOMI", "OLIVES"], from: words)[3]
        let pelee_everest = edges.containing(["PELEE", "EVEREST"], from: words)[0]

        let winningShapes = [
            vesuvius_ruwenzori_quizapu_fuji,
            erebus_ruwenzori_ural_jura_sulaiman,
            ruwenzori_itaculomi_peteroa_quizapu,
            itaculomi_barry_caha_rocky,
            ural_rosa,
            atlas_rosa,
            atlas_everest,
            simplon_sulaiman,
            simplon_alps,
            itaculomi_olives,
            pelee_everest
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9401(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9401)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 92,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 88,
            widthMax: widthMax,
            heightMax: heightMax))

        let waltzing_squash_bezique_tennis = rectangle3x4.containing(["WALTZING", "SQUASH", "BEZIQUE", "TENNIS"], from: words)[0]
        let waltzing_bowls = edges.containing(["WALTZING", "BOWLS"], from: words)[0]
        let rodeo_quoits_croquet_bowls = rectangle4x5.containing(["RODEO", "QUOITS", "CROQUET", "BOWLS"], from: words)[0]
        let test_croquet = edges.containing(["TEST", "CROQUET"], from: words)[2]
        let test_lotto_netball_skating = rectangle3x4.containing(["TEST", "LOTTO", "NETBALL", "SKATING"], from: words)[0]
        let lotto_rugby_skating_hobby = rectangle3x4.containing(["LOTTO", "RUGBY", "SKATING", "HOBBY"], from: words)[0]
        let squash_skittles = edges.containing(["SQUASH", "SKITTLES"], from: words)[0]
        let darts_skittles = edges.containing(["DARTS", "SKITTLES"], from: words)[2]
        let skiing_skittles = edges.containing(["SKIING", "SKITTLES"], from: words)[4]
        let judo_croquet = edges.containing(["JUDO", "CROQUET"], from: words)[0]
        let waltzing_golf = edges.containing(["WALTZING", "GOLF"], from: words)[0]
        let quoits_diving = edges.containing(["QUOITS", "DIVING"], from: words)[1]
        let squash_hockey = edges.containing(["SQUASH", "HOCKEY"], from: words)[0]
        let play_hockey = edges.containing(["PLAY", "HOCKEY"], from: words)[0]
        let play_ball = edges.containing(["PLAY", "BALL"], from: words)[1]
        let darts_canasta = edges.containing(["DARTS", "CANASTA"], from: words)[1]
        let bait_canasta = edges.containing(["BAIT", "CANASTA"], from: words)[2]

        let winningShapes = [
            waltzing_squash_bezique_tennis,
            waltzing_bowls,
            rodeo_quoits_croquet_bowls,
            test_croquet,
            test_lotto_netball_skating,
            lotto_rugby_skating_hobby,
            squash_skittles,
            darts_skittles,
            skiing_skittles,
            judo_croquet,
            waltzing_golf,
            quoits_diving,
            squash_hockey,
            play_hockey,
            play_ball,
            darts_canasta,
            bait_canasta
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9402(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9402)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 102,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 72,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 92,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 88,
            widthMax: widthMax,
            heightMax: heightMax))

        let square5x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 4,
            words: words,
            lengths: len,
            scoreMin: 64,
            widthMax: widthMax,
            heightMax: heightMax))

        let zonurus_stegosaurus_lizard_dinosaur = square3x3.containing(["ZONURUS", "STEGOSAURUS", "LIZARD", "DINOSAUR"], from: words)[0]
        let zonurus_turtle_serpent_snake = rectangle3x5.containing(["ZONURUS", "TURTLE", "SERPENT", "SNAKE"], from: words)[0]
        let turtle_tuatara_taipan_dinosaur_rattler = c2x3.containing(["TURTLE", "TUATARA", "TAIPAN", "DINOSAUR", "RATTLER"], from: words)[0]
        let python_krait_taipan_rattler = rectangle3x4_BottomLeft.containing(["PYTHON", "KRAIT", "TAIPAN", "RATTLER"], from: words)[0]
        let python_krait_rattler_newt = square4x4.containing(["PYTHON", "KRAIT", "RATTLER", "NEWT"], from: words)[0]
        let waral_stegosaurus_worrel_lamia = square5x5.containing(["WARAL", "STEGOSAURUS", "WORREL", "LAMIA"], from: words)[0]
        let stegosaurus_elaps = edges.containing(["STEGOSAURUS", "ELAPS"], from: words)[0]
        let stegosaurus_frog = edges.containing(["STEGOSAURUS", "FROG"], from: words)[1]
        let tuatara_paddock = edges.containing(["TUATARA", "PADDOCK"], from: words)[0]
        let testudo_skink_dipsas_paddock = rectangle3x5.containing(["TESTUDO", "SKINK", "DIPSAS", "PADDOCK"], from: words)[0]
        let toad_testudo_monitor_dipsas = rectangle3x4.containing(["TOAD", "TESTUDO", "MONITOR", "DIPSAS"], from: words)[0]
        let testudo_skink_dipsas_kufi = square3x3.containing(["TESTUDO", "SKINK", "DIPSAS", "KUFI"], from: words)[0]

        let winningShapes = [
            zonurus_stegosaurus_lizard_dinosaur,
            zonurus_turtle_serpent_snake,
            turtle_tuatara_taipan_dinosaur_rattler,
            python_krait_taipan_rattler,
            python_krait_rattler_newt,
            waral_stegosaurus_worrel_lamia,
            stegosaurus_elaps,
            stegosaurus_frog,
            tuatara_paddock,
            testudo_skink_dipsas_paddock,
            toad_testudo_monitor_dipsas,
            testudo_skink_dipsas_kufi
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9403(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9403)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 54,
            widthMax: widthMax,
            heightMax: heightMax))

        let velasquez_stanley_hudson_pizzaro = square3x3.containing(["VELASQUEZ", "STANLEY", "HUDSON", "PIZZARO"], from: words)[0]
        let stanley_byrd = edges.containing(["STANLEY", "BYRD"], from: words)[0]
        let velasquez_eannes_evans_nansen = rectangle3x4.containing(["VELASQUEZ", "EANNES", "EVANS", "NANSEN"], from: words)[0]
        let stanley_jenkinson_hudson_pizzaro = square3x3.containing(["STANLEY", "JENKINSON", "HUDSON", "PIZZARO"], from: words)[0]
        let stanley_jenkinson_pizzaro_polo = square3x3_BottomRight.containing(["STANLEY", "JENKINSON", "PIZZARO", "POLO"], from: words)[0]
        let peary_pizzaro = edges.containing(["PEARY", "PIZZARO"], from: words)[0]
        let peary_kennedy = edges.containing(["PEARY", "KENNEDY"], from: words)[2]
        let cook_burton_oates_kennedy = square3x3.containing(["COOK", "BURTON", "OATES", "KENNEDY"], from: words)[0]
        let burton_ross_osborn_oates = rectangle3x4.containing(["BURTON", "ROSS", "OSBORN", "OATES"], from: words)[0]
        let adams_mosto_mawson_osborn = square3x3.containing(["ADAMS", "MOSTO", "MAWSON", "OSBORN"], from: words)[1]
        let adams_mosto_tasman_mawson = square3x3.containing(["ADAMS", "MOSTO", "TASMAN", "MAWSON"], from: words)[0]
        let torres_austin_stewart_tasman = rectangle4x6.containing(["TORRES", "AUSTIN", "STEWART", "TASMAN"], from: words)[0]
        let scott_torres_cortes_tasman = rectangle3x4.containing(["SCOTT", "TORRES", "CORTES", "TASMAN"], from: words)[0]
        let eannes_leif = edges.containing(["EANNES", "LEIF"], from: words)[0]

        let winningShapes = [
            velasquez_stanley_hudson_pizzaro,
            stanley_byrd,
            velasquez_eannes_evans_nansen,
            stanley_jenkinson_hudson_pizzaro,
            stanley_jenkinson_pizzaro_polo,
            peary_pizzaro,
            peary_kennedy,
            cook_burton_oates_kennedy,
            burton_ross_osborn_oates,
            adams_mosto_mawson_osborn,
            adams_mosto_tasman_mawson,
            torres_austin_stewart_tasman,
            scott_torres_cortes_tasman,
            eannes_leif
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9404(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9404)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 118,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 52,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 78,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 62,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let schizanthus_banks_herbs_zinnia = rectangle3x4.containing(["SCHIZANTHUS", "BANKS", "HERBS", "ZINNIA"], from: words)[0]
        let banks_hake_zinnia_asters = square3x3.containing(["BANKS", "HAKE", "ZINNIA", "ASTERS"], from: words)[0]
        let schizanthus_thyme_henry_spore = rectangle3x5.containing(["SCHIZANTHUS", "THYME", "HENRY", "SPORE"], from: words)[0]
        let schizanthus_seeds_stamens_herbs = rectangle3x5.containing(["SCHIZANTHUS", "SEEDS", "STAMENS", "HERBS"], from: words)[0]
        let seeds_lotus_forsyth_stamens = square3x3.containing(["SEEDS", "LOTUS", "FORSYTH", "STAMENS"], from: words)[0]
        let viola_seeds_forsyth_stamens = square3x3.containing(["VIOLA", "SEEDS", "FORSYTH", "STAMENS"], from: words)[0]
        let hake_flores_flowers_asters = rectangle3x5_TopLeft.containing(["HAKE", "FLORES", "FLOWERS", "ASTERS"], from: words)[0]
        let flores_tweedie_flowers_reeves = square3x3.containing(["FLORES", "TWEEDIE", "FLOWERS", "REEVES"], from: words)[0]
        let tweedie_rue_flowers_reeves = square3x3.containing(["TWEEDIE", "RUE", "FLOWERS", "REEVES"], from: words)[0]
        let flores_tweedie_reeves_kew = rectangle3x4_BottomLeft.containing(["FLORES", "TWEEDIE", "REEVES", "KEW"], from: words)[0]
        let viola_david = edges.containing(["VIOLA", "DAVID"], from: words)[0]
        let petals_flowers = edges.containing(["PETALS", "FLOWERS"], from: words)[1]
        let petals_fruit = edges.containing(["PETALS", "FRUIT"], from: words)[0]
        let gum_fruit = edges.containing(["GUM", "FRUIT"], from: words)[0]
        let shrubs_reeves = edges.containing(["SHRUBS", "REEVES"], from: words)[0]
        let shrubs_ferns = edges.containing(["SHRUBS", "FERNS"], from: words)[2]
        let ward_kew = edges.containing(["WARD", "KEW"], from: words)[0]
        let robin_asters = edges.containing(["ROBIN", "ASTERS"], from: words)[0]
        let lotus_lupin = edges.containing(["LOTUS", "LUPIN"], from: words)[0]

        let winningShapes = [
            schizanthus_banks_herbs_zinnia,
            banks_hake_zinnia_asters,
            schizanthus_thyme_henry_spore,
            schizanthus_seeds_stamens_herbs,
            seeds_lotus_forsyth_stamens,
            viola_seeds_forsyth_stamens,
            hake_flores_flowers_asters,
            flores_tweedie_flowers_reeves,
            tweedie_rue_flowers_reeves,
            flores_tweedie_reeves_kew,
            viola_david,
            petals_flowers,
            petals_fruit,
            gum_fruit,
            shrubs_reeves,
            shrubs_ferns,
            ward_kew,
            robin_asters,
            lotus_lupin
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9406(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9406)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x7 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 6,
            words: words,
            lengths: len,
            scoreMin: 100,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle5x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 104,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let mashrig_zollner_ramazzini_insulin = square3x3.containing(["MASHRIG", "ZOLLNER", "RAMAZZINI", "INSULIN"], from: words)[0]
        let sarpi_hygiene_surgery_ramazzini = rectangle3x7.containing(["SARPI", "HYGIENE", "SURGERY", "RAMAZZINI"], from: words)[0]
        let mashrig_zollner_frank_germs = square3x3.containing(["MASHRIG", "ZOLLNER", "FRANK", "GERMS"], from: words)[1]
        let evans_mayo_germs_tetany = square3x3.containing(["EVANS", "MAYO", "GERMS", "TETANY"], from: words)[0]
        let morton_evans_tetany_nurse = rectangle3x4.containing(["MORTON", "EVANS", "TETANY", "NURSE"], from: words)[0]
        let mayo_oxygen = edges.containing(["MAYO", "OXYGEN"], from: words)[1]
        let whytt_bile_wright_oxygen = square3x3.containing(["WHYTT", "BILE", "WRIGHT", "OXYGEN"], from: words)[0]
        let whytt_stokes_wright_vitamins = rectangle5x6.containing(["WHYTT", "STOKES", "WRIGHT", "VITAMINS"], from: words)[0]
        let hygiene_harvey = edges.containing(["HYGIENE", "HARVEY"], from: words)[0]
        let simpson_ramazzini = edges.containing(["SIMPSON", "RAMAZZINI"], from: words)[3]
        let simpson_florey_monro_botany = rectangle4x5.containing(["SIMPSON", "FLOREY", "MONRO", "BOTANY"], from: words)[0]
        let hand_monro = edges.containing(["HAND", "MONRO"], from: words)[0]

        let winningShapes = [
            mashrig_zollner_ramazzini_insulin,
            sarpi_hygiene_surgery_ramazzini,
            mashrig_zollner_frank_germs,
            evans_mayo_germs_tetany,
            morton_evans_tetany_nurse,
            mayo_oxygen,
            whytt_bile_wright_oxygen,
            whytt_stokes_wright_vitamins,
            hygiene_harvey,
            simpson_ramazzini,
            simpson_florey_monro_botany,
            hand_monro
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9407(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9407)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax

        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 90,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 92,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 140,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 90,
            widthMax: widthMax,
            heightMax: heightMax))

        let special9407 = SpecialShapesCalculator.C9407(words: words)

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 88,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 92,
            widthMax: widthMax,
            heightMax: heightMax))

        let blizzard_frozen_subzero_horizon = square3x3.containing(["BLIZZARD", "FROZEN", "SUBZERO", "HORIZON"], from: words)[0]
        let blizzard_byrd_hillary_subzero = rectangle4x5_BottomRight.containing(["BLIZZARD", "BYRD", "HILLARY", "SUBZERO"], from: words)[0]
        let fuchs_blizzard_subzero_horizon = square3x3.containing(["FUCHS", "BLIZZARD", "SUBZERO", "HORIZON"], from: words)[0]
        let fuchs_petrels = edges.containing(["FUCHS", "PETRELS"], from: words)[0]
        let supplies_scott_storm_petrels = square3x3.containing(["SUPPLIES", "SCOTT", "STORM", "PETRELS"], from: words)[0]
        let inuit_scott_winter_gust_ice_storm = special9407.containing(["INUIT", "SCOTT", "WINTER", "GUST", "ICE", "STORM"], from: words)[0]
        let supplies_skuas_igloos_sastrugi = rectangle3x6.containing(["SUPPLIES", "SKUAS", "IGLOOS", "SASTRUGI"], from: words)[0]
        let alaska_skuas_sastrugi_whales = rectangle3x4.containing(["ALASKA", "SKUAS", "SASTRUGI", "WHALES"], from: words)[0]
        //let alaska_igloos = edges.containing(["ALASKA", "IGLOOS"], from: words)[0]
        let wind_sastrugi = edges.containing(["WIND", "SASTRUGI"], from: words)[0]
        let wind_weasels_walrus_drifts = rectangle4x6.containing(["WIND", "WEASELS", "WALRUS", "DRIFTS"], from: words)[0]
        let seals_weasels_snow_walrus = square4x4.containing(["SEALS", "WEASELS", "SNOW", "WALRUS"], from: words)[0]
        //let frozen_snow = edges.containing(["FROZEN", "SNOW"], from: words)[0]
        let seals_pole = edges.containing(["SEALS", "POLE"], from: words)[0]

        let winningShapes = [
            blizzard_frozen_subzero_horizon,
            blizzard_byrd_hillary_subzero,
            fuchs_blizzard_subzero_horizon,
            fuchs_petrels,
            supplies_scott_storm_petrels,
            inuit_scott_winter_gust_ice_storm,
            supplies_skuas_igloos_sastrugi,
            alaska_skuas_sastrugi_whales,
            //alaska_igloos,
            wind_sastrugi,
            wind_weasels_walrus_drifts,
            seals_weasels_snow_walrus,
            //frozen_snow,
            seals_pole
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9408(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9408)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 76,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 60,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 62,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let coster_typography_types_royal = square3x3.containing(["COSTER", "TYPOGRAPHY", "TYPES", "ROYAL"], from: words)[0]
        let typography_quill_stylus_mould = square3x3.containing(["TYPOGRAPHY", "QUILL", "STYLUS", "MOULD"], from: words)[0]
        let quill_papyrus_quarto_stylus = c2x2.containing(["QUILL", "PAPYRUS", "QUARTO", "STYLUS"], from: words)[0]
        let page_papyrus_papers_demy = rectangle3x4.containing(["PAGE", "PAPYRUS", "PAPERS", "DEMY"], from: words)[0]
        let script_rollers_press_quarto = c2x2.containing(["SCRIPT", "ROLLERS", "PRESS", "QUARTO"], from: words)[0]
        let plates_rollers_print_rolls = c2x2.containing(["PLATES", "ROLLERS", "PRINT", "ROLLS"], from: words)[0]
        let rollers_sewn_press_balloon = square4x4.containing(["ROLLERS", "SEWN", "PRESS", "BALLOON"], from: words)[0]
        let papyrus_script_papers_pair = rectangle3x4.containing(["PAPYRUS", "SCRIPT", "PAPERS", "PAIR"], from: words)[0]
        let font_plates_rolls_title = square3x3.containing(["FONT", "PLATES", "ROLLS", "TITLE"], from: words)[0]
        let bed_title = edges.containing(["BED", "TITLE"], from: words)[0]
        let rollers_text_print_box = rectangle3x4_TopRight.containing(["ROLLERS", "TEXT", "PRINT", "BOX"], from: words)[0]
        let plates_ems = edges.containing(["PLATES", "EMS"], from: words)[1]
        let proofs_stylus = edges.containing(["PROOFS", "STYLUS"], from: words)[0]
        let proofs_pica = edges.containing(["PROOFS", "PICA"], from: words)[0]
        let ream_rollers_quarto_balloon = square3x3.containing(["REAM", "ROLLERS", "QUARTO", "BALLOON"], from: words)[0]
        let script_forme_crown_press = rectangle3x4.containing(["SCRIPT", "FORME", "CROWN", "PRESS"], from: words)[0]
        let ink_crown = edges.containing(["INK", "CROWN"], from: words)[0]
        
        let winningShapes = [
            coster_typography_types_royal,
            typography_quill_stylus_mould,
            quill_papyrus_quarto_stylus,
            page_papyrus_papers_demy,
            script_rollers_press_quarto,
            plates_rollers_print_rolls,
            rollers_sewn_press_balloon,
            papyrus_script_papers_pair,
            font_plates_rolls_title,
            bed_title,
            rollers_text_print_box,
            plates_ems,
            proofs_stylus,
            proofs_pica,
            ream_rollers_quarto_balloon,
            script_forme_crown_press,
            ink_crown
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9409(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9409)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 58,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 64,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 104,
            widthMax: widthMax,
            heightMax: heightMax))

        let gyrostat_stabilizer_galien_rozier = square3x3.containing(["GYROSTAT", "STABILIZER", "GALIEN", "ROZIER"], from: words)[0]
        let shuttle_gyrostat_curtiss_mercury = square3x3_BottomLeft.containing(["SHUTTLE", "GYROSTAT", "CURTISS", "MERCURY"], from: words)[0]
        let ulm_ejector_curtiss_mercury = square3x3.containing(["ULM", "EJECTOR", "CURTISS", "MERCURY"], from: words)[0]
        let haste_gyrostat_heath_smithy = rectangle3x4.containing(["HASTE", "GYROSTAT", "HEATH", "SMITHY"], from: words)[0]
        let byrd_smithy = edges.containing(["BYRD", "SMITHY"], from: words)[0]
        let byrd_wings_bank_rise = square3x3.containing(["BYRD", "WINGS", "BANK", "RISE"], from: words)[0]
        let shuttle_strut = edges.containing(["SHUTTLE", "STRUT"], from: words)[5]
        let stultz_tiro_strut_ufo = rectangle3x4_TopLeft.containing(["STULTZ", "TIRO", "STRUT", "UFO"], from: words)[0]
        let stultz_zeppelin = edges.containing(["STULTZ", "ZEPPELIN"], from: words)[1]
        let kites_stabilizer_pilot_galien = rectangle4x5_BottomLeft.containing(["KITES", "STABILIZER", "PILOT", "GALIEN"], from: words)[0]
        let stabilizer_airliner_galien_rozier = rectangle3x4.containing(["STABILIZER", "AIRLINER", "GALIEN", "ROZIER"], from: words)[0]
        let stabilizer_airliner_bell_galien = rectangle3x4.containing(["STABILIZER", "AIRLINER", "BELL", "GALIEN"], from: words)[0]
        let ejector_dive = edges.containing(["EJECTOR", "DIVE"], from: words)[1]
        let ejector_green = edges.containing(["EJECTOR", "GREEN"], from: words)[1]
 
        let winningShapes = [
            gyrostat_stabilizer_galien_rozier,
            shuttle_gyrostat_curtiss_mercury,
            ulm_ejector_curtiss_mercury,
            haste_gyrostat_heath_smithy,
            byrd_smithy,
            byrd_wings_bank_rise,
            shuttle_strut,
            stultz_tiro_strut_ufo,
            stultz_zeppelin,
            kites_stabilizer_pilot_galien,
            stabilizer_airliner_galien_rozier,
            stabilizer_airliner_bell_galien,
            ejector_dive,
            ejector_green
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9410(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9410)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let pacman3x3_BottomRight = ShapeCalculator.toShapes(pacmans: PacmanCalculatorV1.BottomRight(
            words: words,
            end: end,
            len: len,
            scoreMin: 152,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 78,
            widthMax: widthMax,
            heightMax: heightMax))

        let lien_usury_rules_attorney = rectangle3x4.containing(["LIEN", "USURY", "RULES", "ATTORNEY"], from: words)[0]
        let suspect_attorney = edges.containing(["SUSPECT", "ATTORNEY"], from: words)[0]
        let trespass_suspect_forger_case_surtax_witness = pacman3x3_BottomRight.containing(["TRESPASS", "SUSPECT", "FORGER", "CASE", "SURTAX", "WITNESS"], from: words)[0]
        let suspect_tort_surtax_inquest = rectangle3x4.containing(["SUSPECT", "TORT", "SURTAX", "INQUEST"], from: words)[0]
        let trial_suspect_witness_inquest = rectangle3x5.containing(["TRIAL", "SUSPECT", "WITNESS", "INQUEST"], from: words)[0]
        let writ_witness = edges.containing(["WRIT", "WITNESS"], from: words)[0]
        let trespass_cruelty = edges.containing(["TRESPASS", "CRUELTY"], from: words)[2]
        let jury_cruelty = edges.containing(["JURY", "CRUELTY"], from: words)[2]
        let executor_acquittal_cruelty_oath = rectangle3x4.containing(["EXECUTOR", "ACQUITTAL", "CRUELTY", "OATH"], from: words)[0]
        let jury_justice = edges.containing(["JURY", "JUSTICE"], from: words)[1]
        let forger_felony = edges.containing(["FORGER", "FELONY"], from: words)[2]
        let bigamy_felony = edges.containing(["BIGAMY", "FELONY"], from: words)[0]
        let forger_guilty = edges.containing(["FORGER", "GUILTY"], from: words)[0]
        let legacy_guilty = edges.containing(["LEGACY", "GUILTY"], from: words)[2]
        let bigamy_false = edges.containing(["BIGAMY", "FALSE"], from: words)[0]

        let winningShapes = [
            lien_usury_rules_attorney,
            suspect_attorney,
            trespass_suspect_forger_case_surtax_witness,
            suspect_tort_surtax_inquest,
            trial_suspect_witness_inquest,
            writ_witness,
            trespass_cruelty,
            jury_cruelty,
            executor_acquittal_cruelty_oath,
            jury_justice,
            forger_felony,
            bigamy_felony,
            forger_guilty,
            legacy_guilty,
            bigamy_false
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9411(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9411)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x4(
           words: words,
           end: end,
           len: len,
           scoreMin: 116,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 136,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let magazine_tabard_helmet_howitzer = rectangle3x5.containing(["MAGAZINE", "TABARD", "HELMET", "HOWITZER"], from: words)[0]
        let detonator_quiver_howitzer_torpedo = rectangle3x4.containing(["DETONATOR", "QUIVER", "HOWITZER", "TORPEDO"], from: words)[0]
        let brass_shot_lance_detonator_bolo_mortar = c2x4.containing(["BRASS", "SHOT", "LANCE", "DETONATOR", "BOLO", "MORTAR"], from: words)[0]
        let mauser_brass_mortar_guns = square3x3.containing(["MAUSER", "BRASS", "MORTAR", "GUNS"], from: words)[0]
        let brass_lance_mortar_spear = rectangle3x4.containing(["BRASS", "LANCE", "MORTAR", "SPEAR"], from: words)[0]
        let shot_darts = edges.containing(["SHOT", "DARTS"], from: words)[0]
        let jet_darts = edges.containing(["JET", "DARTS"], from: words)[0]
        let arrow_spear = edges.containing(["ARROW", "SPEAR"], from: words)[2]
        let arrow_bow = edges.containing(["ARROW", "BOW"], from: words)[1]
        let mauser_ram = edges.containing(["MAUSER", "RAM"], from: words)[2]
        let arrow_axe = edges.containing(["ARROW", "AXE"], from: words)[0]
        let petard_axe = edges.containing(["PETARD", "AXE"], from: words)[1]
        let petard_deringer_tank_dirk = rectangle3x4.containing(["PETARD", "DERINGER", "TANK", "DIRK"], from: words)[0]
        let sword_darts = edges.containing(["SWORD", "DARTS"], from: words)[2]
        let sword_siren = edges.containing(["SWORD", "SIREN"], from: words)[0]
        let barb_mine_bomb_siren = square3x3.containing(["BARB", "MINE", "BOMB", "SIREN"], from: words)[0]

        let winningShapes = [
            magazine_tabard_helmet_howitzer,
            detonator_quiver_howitzer_torpedo,
            brass_shot_lance_detonator_bolo_mortar,
            mauser_brass_mortar_guns,
            brass_lance_mortar_spear,
            shot_darts,
            jet_darts,
            arrow_spear,
            arrow_bow,
            mauser_ram,
            arrow_axe,
            petard_axe,
            petard_deringer_tank_dirk,
            sword_darts,
            sword_siren,
            barb_mine_bomb_siren
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9412(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9412)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 104,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 86,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 70,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 108,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 104,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 100,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let egypt_glory_yule_myrrh = rectangle3x4_BottomLeft.containing(["EGYPT", "GLORY", "YULE", "MYRRH"], from: words)[0]
        let egypt_night = edges.containing(["EGYPT", "NIGHT"], from: words)[1]
        let magi_night = edges.containing(["MAGI", "NIGHT"], from: words)[1]
        let egypt_three = edges.containing(["EGYPT", "THREE"], from: words)[1]
        let watch_three = edges.containing(["WATCH", "THREE"], from: words)[0]
        let watch_wish = edges.containing(["WATCH", "WISH"], from: words)[0]
        let tidings_wish = edges.containing(["TIDINGS", "WISH"], from: words)[2]
        let feast_tidings_father_spirit = rectangle3x4.containing(["FEAST", "TIDINGS", "FATHER", "SPIRIT"], from: words)[0]
        let tidings_frost_father_spirit = square4x4.containing(["TIDINGS", "FROST", "FATHER", "SPIRIT"], from: words)[0]
        let frost_saint = edges.containing(["FROST", "SAINT"], from: words)[0]
        let nativity_east_noel_saint = rectangle3x4.containing(["NATIVITY", "EAST", "NOEL", "SAINT"], from: words)[0]
        let son_nativity_stable_joy = c2x2.containing(["SON", "NATIVITY", "STABLE", "JOY"], from: words)[0]
        let east_away_snow_hay = rectangle3x4_TopRight.containing(["EAST", "AWAY", "SNOW", "HAY"], from: words)[0]
        let bless_halo_eve_stable_love = c2x3.containing(["BLESS", "HALO", "EVE", "STABLE", "LOVE"], from: words)[0]
        let bless_stall_kiss_star = c2x2.containing(["BLESS", "STALL", "KISS", "STAR"], from: words)[0]
        let stall_prayer_star_holly = square3x3.containing(["STALL", "PRAYER", "STAR", "HOLLY"], from: words)[0]
        let inn_spirit = edges.containing(["INN", "SPIRIT"], from: words)[1]

        let winningShapes = [
            egypt_glory_yule_myrrh,
            egypt_night,
            magi_night,
            egypt_three,
            watch_three,
            watch_wish,
            tidings_wish,
            feast_tidings_father_spirit,
            tidings_frost_father_spirit,
            frost_saint,
            nativity_east_noel_saint,
            son_nativity_stable_joy,
            east_away_snow_hay,
            bless_halo_eve_stable_love,
            bless_stall_kiss_star,
            stall_prayer_star_holly,
            inn_spirit
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9501(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9501)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x6 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x6(
           words: words,
           end: end,
           len: len,
           scoreMin: 222,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 70,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let automated_interest_sum_transfer_terms_business_assets_futures = c2x6.containing(["AUTOMATED", "INTEREST", "SUM", "TRANSFER", "TERMS", "BUSINESS", "ASSETS", "FUTURES"], from: words)[0]
        let interest_transfer_gilt_shares = rectangle3x5.containing(["INTEREST", "TRANSFER", "GILT", "SHARES"], from: words)[0]
        let buy_automated_book_stamp = rectangle3x4_BottomLeft.containing(["BUY", "AUTOMATED", "BOOK", "STAMP"], from: words)[0]
        let buy_duty = edges.containing(["BUY", "DUTY"], from: words)[1]
        let equity_duty = edges.containing(["EQUITY", "DUTY"], from: words)[0]
        let equity_yield = edges.containing(["EQUITY", "YIELD"], from: words)[2]
        let fee_equity_duty_debt = square3x3_TopLeft.containing(["FEE", "EQUITY", "DUTY", "DEBT"], from: words)[0]
        let bonds_shares = edges.containing(["BONDS", "SHARES"], from: words)[0]
        let terms_cash = edges.containing(["TERMS", "CASH"], from: words)[0]
        let bonds_auction = edges.containing(["BONDS", "AUCTION"], from: words)[0]
        let ruin_title_auction_unit = square3x3.containing(["RUIN", "TITLE", "AUCTION", "UNIT"], from: words)[0]
        let par_stamp = edges.containing(["PAR", "STAMP"], from: words)[1]
        let par_free = edges.containing(["PAR", "FREE"], from: words)[0]
        let house_cash = edges.containing(["HOUSE", "CASH"], from: words)[0]
        let title_buyer = edges.containing(["TITLE", "BUYER"], from: words)[0]
        let bulls_risk_buyer_loans = rectangle3x5.containing(["BULLS", "RISK", "BUYER", "LOANS"], from: words)[0]
        let bulls_risk_loans_sale = rectangle3x5_BottomRight.containing(["BULLS", "RISK", "LOANS", "SALE"], from: words)[0]
        
        let winningShapes = [
            automated_interest_sum_transfer_terms_business_assets_futures,
            interest_transfer_gilt_shares,
            buy_automated_book_stamp,
            buy_duty,
            equity_duty,
            equity_yield,
            fee_equity_duty_debt,
            bonds_shares,
            terms_cash,
            bonds_auction,
            ruin_title_auction_unit,
            par_stamp,
            par_free,
            house_cash,
            title_buyer,
            bulls_risk_buyer_loans,
            bulls_risk_loans_sale
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9502(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9502)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 54,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 82,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 62,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let trapezium_sheet_zone_roulette = rectangle3x4.containing(["TRAPEZIUM", "SHEET", "ZONE", "ROULETTE"], from: words)[0]
        let quadrant_trapezium_lune_roulette = rectangle3x4.containing(["QUADRANT", "TRAPEZIUM", "LUNE", "ROULETTE"], from: words)[0]
        let evolute_trident_roulette_octant = rectangle3x6.containing(["EVOLUTE", "TRIDENT", "ROULETTE", "OCTANT"], from: words)[0]
        let evolute_trident_conic_octant = rectangle3x4.containing(["EVOLUTE", "TRIDENT", "CONIC", "OCTANT"], from: words)[0]
        let trapezium_sheet_prism_zone = rectangle3x4.containing(["TRAPEZIUM", "SHEET", "PRISM", "ZONE"], from: words)[0]
        let hyperbola_quadrant_conoid_lamina = rectangle3x5.containing(["HYPERBOLA", "QUADRANT", "CONOID", "LAMINA"], from: words)[0]
        let hyperbola_cylinder = edges.containing(["HYPERBOLA", "CYLINDER"], from: words)[0]
        let quadrant_sector = edges.containing(["QUADRANT", "SECTOR"], from: words)[0]
        let solid_cone_sector_spline = square3x3.containing(["SOLID", "CONE", "SECTOR", "SPLINE"], from: words)[0]
        let locus_spline = edges.containing(["LOCUS", "SPLINE"], from: words)[1]
        let hyperbola_ogive_conoid_lamina = square3x3.containing(["HYPERBOLA", "OGIVE", "CONOID", "LAMINA"], from: words)[0]
        let hyperbola_arc = edges.containing(["HYPERBOLA", "ARC"], from: words)[0]
        let rhomb_sector = edges.containing(["RHOMB", "SECTOR"], from: words)[1]
        let rhomb_evolute_octant_cube = square3x3_BottomRight.containing(["RHOMB", "EVOLUTE", "OCTANT", "CUBE"], from: words)[0]
        let trapezium_torus = edges.containing(["TRAPEZIUM", "TORUS"], from: words)[0]
        let kite_cylinder = edges.containing(["KITE", "CYLINDER"], from: words)[0]
        let line_roulette = edges.containing(["LINE", "ROULETTE"], from: words)[2]

        let winningShapes = [
            trapezium_sheet_zone_roulette,
            quadrant_trapezium_lune_roulette,
            evolute_trident_roulette_octant,
            evolute_trident_conic_octant,
            trapezium_sheet_prism_zone,
            hyperbola_quadrant_conoid_lamina,
            hyperbola_cylinder,
            quadrant_sector,
            solid_cone_sector_spline,
            locus_spline,
            hyperbola_ogive_conoid_lamina,
            hyperbola_arc,
            rhomb_sector,
            rhomb_evolute_octant_cube,
            trapezium_torus,
            kite_cylinder,
            line_roulette
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9503(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9503)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 70,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 70,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 108,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 92,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let taxi_buggy_tilbury_jitney = rectangle4x5.containing(["TAXI", "BUGGY", "TILBURY", "JITNEY"], from: words)[0]
        let taxi_wain_tilbury_van = c2x2.containing(["TAXI", "WAIN", "TILBURY", "VAN"], from: words)[0]
        let wain_yawl = edges.containing(["WAIN", "YAWL"], from: words)[1]
        let shay_gig_sledge_yawl = rectangle4x5_BottomRight.containing(["SHAY", "GIG", "SLEDGE", "YAWL"], from: words)[0]
        let buggy_jalopy_coaster_tilbury = square3x3_TopLeft.containing(["BUGGY", "JALOPY", "COASTER", "TILBURY"], from: words)[0]
        let sedan_lorry_coaster_dray = rectangle3x4.containing(["SEDAN", "LORRY", "COASTER", "DRAY"], from: words)[0]
        let cart_coaster = edges.containing(["CART", "COASTER"], from: words)[2]
        let truck_jitney = edges.containing(["TRUCK", "JITNEY"], from: words)[0]
        let truck_sulky = edges.containing(["TRUCK", "SULKY"], from: words)[0]
        let yacht_sulky = edges.containing(["YACHT", "SULKY"], from: words)[0]
        let yacht_tanker = edges.containing(["YACHT", "TANKER"], from: words)[1]
        let saloon_tube_litter_tanker = rectangle3x4.containing(["SALOON", "TUBE", "LITTER", "TANKER"], from: words)[0]
        let saloon_monorail_sampan_litter = rectangle3x6.containing(["SALOON", "MONORAIL", "SAMPAN", "LITTER"], from: words)[0]
        let sedan_hansom = edges.containing(["SEDAN", "HANSOM"], from: words)[1]
        let truck_bike = edges.containing(["TRUCK", "BIKE"], from: words)[0]
        let bus_bike = edges.containing(["BUS", "BIKE"], from: words)[0]
        let bus_ship = edges.containing(["BUS", "SHIP"], from: words)[0]
        let jalopy_cab = edges.containing(["JALOPY", "CAB"], from: words)[0]

        let winningShapes = [
            taxi_buggy_tilbury_jitney,
            taxi_wain_tilbury_van,
            wain_yawl,
            shay_gig_sledge_yawl,
            buggy_jalopy_coaster_tilbury,
            sedan_lorry_coaster_dray,
            cart_coaster,
            truck_jitney,
            truck_sulky,
            yacht_sulky,
            yacht_tanker,
            saloon_tube_litter_tanker,
            saloon_monorail_sampan_litter,
            sedan_hansom,
            truck_bike,
            bus_bike,
            bus_ship,
            jalopy_cab
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9504(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9504)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 70,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 110,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 140,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 140,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let derby_gorgonzola_enzymes_yeast = rectangle3x4.containing(["DERBY", "GORGONZOLA", "ENZYMES", "YEAST"], from: words)[0]
        let gorgonzola_swiss_goats_enzymes = rectangle4x5.containing(["GORGONZOLA", "SWISS", "GOATS", "ENZYMES"], from: words)[0]
        let aroma_feta_swiss_goats_raw = c2x3.containing(["AROMA", "FETA", "SWISS", "GOATS", "RAW"], from: words)[0]
        let swiss_savoury = edges.containing(["SWISS", "SAVOURY"], from: words)[2]
        let dairy_savoury = edges.containing(["DAIRY", "SAVOURY"], from: words)[2]
        let churn_savoury = edges.containing(["CHURN", "SAVOURY"], from: words)[0]
        let churn_ketones = edges.containing(["CHURN", "KETONES"], from: words)[0]
        let gorgonzola_bar = edges.containing(["GORGONZOLA", "BAR"], from: words)[0]
        let gorgonzola_aged = edges.containing(["GORGONZOLA", "AGED"], from: words)[0]
        let mature_aged = edges.containing(["MATURE", "AGED"], from: words)[1]
        let sapid_mature_skim_industry = square4x4.containing(["SAPID", "MATURE", "SKIM", "INDUSTRY"], from: words)[0]
        let white_gruyere_hard_industry = square3x3.containing(["WHITE", "GRUYERE", "HARD", "INDUSTRY"], from: words)[0]
        let white_gruyere_industry_cream = square3x3_TopRight.containing(["WHITE", "GRUYERE", "INDUSTRY", "CREAM"], from: words)[0]
        let fat_milk_cream_tint = c2x2.containing(["FAT", "MILK", "CREAM", "TINT"], from: words)[0]
        let byre_milk_tint_yak = square3x3_TopLeft.containing(["BYRE", "MILK", "TINT", "YAK"], from: words)[0]
        let dessert_tint = edges.containing(["DESSERT", "TINT"], from: words)[1]
        let cows_dessert_acid_ewes = square3x3.containing(["COWS", "DESSERT", "ACID", "EWES"], from: words)[0]

        let winningShapes = [
            derby_gorgonzola_enzymes_yeast,
            gorgonzola_swiss_goats_enzymes,
            aroma_feta_swiss_goats_raw,
            swiss_savoury,
            dairy_savoury,
            churn_savoury,
            churn_ketones,
            gorgonzola_bar,
            gorgonzola_aged,
            mature_aged,
            sapid_mature_skim_industry,
            white_gruyere_hard_industry,
            white_gruyere_industry_cream,
            fat_milk_cream_tint,
            byre_milk_tint_yak,
            dessert_tint,
            cows_dessert_acid_ewes
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9505(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9505)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 98,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x7_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 6,
            words: words,
            lengths: len,
            scoreMin: 128,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 92,
            widthMax: widthMax,
            heightMax: heightMax))

        let prize_assets_poster_zippers = rectangle4x7_BottomLeft.containing(["PRIZE", "ASSETS", "POSTER", "ZIPPERS"], from: words)[0]
        let assets_firm_staff_ewers = rectangle3x4.containing(["ASSETS", "FIRM", "STAFF", "EWERS"], from: words)[0]
        let firm_lifts_staff_item_ewers = c2x3.containing(["FIRM", "LIFTS", "STAFF", "ITEM", "EWERS"], from: words)[0]
        let prize_soap_poster_zippers = rectangle3x4.containing(["PRIZE", "SOAP", "POSTER", "ZIPPERS"], from: words)[0]
        let assets_credit = edges.containing(["ASSETS", "CREDIT"], from: words)[1]
        let stock_desk_credit_traps = rectangle3x5_TopLeft.containing(["STOCK", "DESK", "CREDIT", "TRAPS"], from: words)[0]
        let stock_desk_traps_cash = rectangle3x5_BottomRight.containing(["STOCK", "DESK", "TRAPS", "CASH"], from: words)[0]
        let sheets_cash = edges.containing(["SHEETS", "CASH"], from: words)[0]
        let sheets_display = edges.containing(["SHEETS", "DISPLAY"], from: words)[1]
        let grocery_display = edges.containing(["GROCERY", "DISPLAY"], from: words)[0]
        let grocery_purse_luxury_store = rectangle3x4_TopLeft.containing(["GROCERY", "PURSE", "LUXURY", "STORE"], from: words)[1]
        let money_luxury = edges.containing(["MONEY", "LUXURY"], from: words)[0]
        let purse_quality_luxury_silk = square3x3.containing(["PURSE", "QUALITY", "LUXURY", "SILK"], from: words)[0]
        let quality_buyer = edges.containing(["QUALITY", "BUYER"], from: words)[1]
        let wares_buyer = edges.containing(["WARES", "BUYER"], from: words)[1]
        let wares_goods = edges.containing(["WARES", "GOODS"], from: words)[0]
        let lifts_sale = edges.containing(["LIFTS", "SALE"], from: words)[0]
        let sheets_spend = edges.containing(["SHEETS", "SPEND"], from: words)[2]

        let winningShapes = [
            prize_assets_poster_zippers,
            assets_firm_staff_ewers,
            firm_lifts_staff_item_ewers,
            prize_soap_poster_zippers,
            assets_credit,
            stock_desk_credit_traps,
            stock_desk_traps_cash,
            sheets_cash,
            sheets_display,
            grocery_display,
            grocery_purse_luxury_store,
            money_luxury,
            purse_quality_luxury_silk,
            quality_buyer,
            wares_buyer,
            wares_goods,
            lifts_sale,
            sheets_spend
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9506(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9506)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 88,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x4 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x4(
           words: words,
           end: end,
           len: len,
           scoreMin: 142,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 72,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 136,
            widthMax: widthMax,
            heightMax: heightMax))

        let quetzal_osprey_cuckoo_buzzard = square4x4.containing(["QUETZAL", "OSPREY", "CUCKOO", "BUZZARD"], from: words)[0]
        let osprey_lyrebird = edges.containing(["OSPREY", "LYREBIRD"], from: words)[3]
        let osprey_crow_cuckoo_swan = c2x2.containing(["OSPREY", "CROW", "CUCKOO", "SWAN"], from: words)[0]
        let crow_eagle_rail_swan = rectangle3x4_BottomRight.containing(["CROW", "EAGLE", "RAIL", "SWAN"], from: words)[0]
        let eider_quail_emu_lyrebird = rectangle3x5_BottomRight.containing(["EIDER", "QUAIL", "EMU", "LYREBIRD"], from: words)[0]
        let eagle_gull = edges.containing(["EAGLE", "GULL"], from: words)[0]
        let eagle_oriole = edges.containing(["EAGLE", "ORIOLE"], from: words)[1]
        let stork_bittern_starling_ratite_oriole_tern = c2x4.containing(["STORK", "BITTERN", "STARLING", "RATITE", "ORIOLE", "TERN"], from: words)[1]
        let bluetit_stork_ratite_tern = square3x3.containing(["BLUETIT", "STORK", "RATITE", "TERN"], from: words)[0]
        let bittern_sparrow_starling_oriole = square3x3.containing(["BITTERN", "SPARROW", "STARLING", "ORIOLE"], from: words)[0]
        let bittern_sparrow_ibis_starling = rectangle3x4.containing(["BITTERN", "SPARROW", "IBIS", "STARLING"], from: words)[0]
        let brolga_bluetit_auk_ratite = square3x3_TopLeft.containing(["BROLGA", "BLUETIT", "AUK", "RATITE"], from: words)[0]
        let sparrow_wren_parrot_starling = rectangle3x4.containing(["SPARROW", "WREN", "PARROT", "STARLING"], from: words)[0]
        let owl_gull = edges.containing(["OWL", "GULL"], from: words)[0]
        let robin_buzzard = edges.containing(["ROBIN", "BUZZARD"], from: words)[0]
        let bluetit_cob = edges.containing(["BLUETIT", "COB"], from: words)[0]

        let winningShapes = [
            quetzal_osprey_cuckoo_buzzard,
            osprey_lyrebird,
            osprey_crow_cuckoo_swan,
            crow_eagle_rail_swan,
            eider_quail_emu_lyrebird,
            eagle_gull,
            eagle_oriole,
            stork_bittern_starling_ratite_oriole_tern,
            bluetit_stork_ratite_tern,
            bittern_sparrow_starling_oriole,
            bittern_sparrow_ibis_starling,
            brolga_bluetit_auk_ratite,
            sparrow_wren_parrot_starling,
            owl_gull,
            robin_buzzard,
            bluetit_cob
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9507(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9507)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax

        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 62,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let outer2x3 = ShapeCalculator.toShapes(outers: OuterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 96,
           widthMax: widthMax,
           heightMax: heightMax))

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 84,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 70,
            widthMax: widthMax,
            heightMax: heightMax))

        let artists_zoo_razzamatazz_show = square3x3.containing(["ARTISTS", "ZOO", "RAZZAMATAZZ", "SHOW"], from: words)[0]
        let trapeze_razzamatazz = edges.containing(["TRAPEZE", "RAZZAMATAZZ"], from: words)[2]
        let van_cage_artists_act_gymnast = outer2x3.containing(["VAN", "CAGE", "ARTISTS", "ACT", "GYMNAST"], from: words)[0]
        let flyer_gymnast = edges.containing(["FLYER", "GYMNAST"], from: words)[0]
        let wagon_show = edges.containing(["WAGON", "SHOW"], from: words)[1]
        let flyer_busker = edges.containing(["FLYER", "BUSKER"], from: words)[1]
        let lions_busker = edges.containing(["LIONS", "BUSKER"], from: words)[0]
        let star_trapeze_actors_rope = square3x3.containing(["STAR", "TRAPEZE", "ACTORS", "ROPE"], from: words)[0]
        let trapeze_bears_trainer_actors = c2x2.containing(["TRAPEZE", "BEARS", "TRAINER", "ACTORS"], from: words)[1]
        let bears_skill_tumblers_trainer = square3x3.containing(["BEARS", "SKILL", "TUMBLERS", "TRAINER"], from: words)[0]
        
        let artists_magic = edges.containing(["ARTISTS", "MAGIC"], from: words)[0]
        
        let tamer_ring_trainer_risk = c2x2.containing(["TAMER", "RING", "TRAINER", "RISK"], from: words)[1]
        let tamer_truck_tent_risk = rectangle4x5.containing(["TAMER", "TRUCK", "TENT", "RISK"], from: words)[0]
        let fun_tumblers = edges.containing(["FUN", "TUMBLERS"], from: words)[0]
        let lions_whip = edges.containing(["LIONS", "WHIP"], from: words)[0]
        let clown_whip = edges.containing(["CLOWN", "WHIP"], from: words)[0]
        let band_actors = edges.containing(["BAND", "ACTORS"], from: words)[0]
        //let ring_magic = edges.containing(["RING", "MAGIC"], from: words)[0]
        
        let cage_nets = edges.containing(["CAGE", "NETS"], from: words)[0]

        let winningShapes = [
            artists_zoo_razzamatazz_show,
            trapeze_razzamatazz,
            van_cage_artists_act_gymnast,
            flyer_gymnast,
            wagon_show,
            flyer_busker,
            lions_busker,
            star_trapeze_actors_rope,
            trapeze_bears_trainer_actors,
            bears_skill_tumblers_trainer,
            artists_magic,
            tamer_ring_trainer_risk,
            tamer_truck_tent_risk,
            fun_tumblers,
            lions_whip,
            clown_whip,
            band_actors,
            //ring_magic,
            
            cage_nets
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9508(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9508)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax

        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 78,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 148,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let outer2x3 = ShapeCalculator.toShapes(outers: OuterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 98,
           widthMax: widthMax,
           heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 92,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 86,
            widthMax: widthMax,
            heightMax: heightMax))

        let grapes_slivovitz_gin_port_azerbaijan = c2x3.containing(["GRAPES", "SLIVOVITZ", "GIN", "PORT", "AZERBAIJAN"], from: words)[0]
        let greece_winery_azerbaijan_perry = rectangle4x5.containing(["GREECE", "WINERY", "AZERBAIJAN", "PERRY"], from: words)[0]
        let slivovitz_nog_spain_vodka_grog = outer2x3.containing(["SLIVOVITZ", "NOG", "SPAIN", "VODKA", "GROG"], from: words)[0]
        let cask_water_sweet_vodka = c2x2.containing(["CASK", "WATER", "SWEET", "VODKA"], from: words)[0]
        let water_tokay_sweet_turkey = rectangle3x4.containing(["WATER", "TOKAY", "SWEET", "TURKEY"], from: words)[0]
        let tokay_rye = edges.containing(["TOKAY", "RYE"], from: words)[0]
        let italy_turkey = edges.containing(["ITALY", "TURKEY"], from: words)[1]
        let slivovitz_rose = edges.containing(["SLIVOVITZ", "ROSE"], from: words)[0]
        let grapes_ussr = edges.containing(["GRAPES", "USSR"], from: words)[1]
        let soil_ussr = edges.containing(["SOIL", "USSR"], from: words)[0]
        let winery_rhone = edges.containing(["WINERY", "RHONE"], from: words)[2]
        let corks_sherry_rhone_malmsey = rectangle3x4.containing(["CORKS", "SHERRY", "RHONE", "MALMSEY"], from: words)[0]
        let rum_perry = edges.containing(["RUM", "PERRY"], from: words)[0]
        //let rum_malmsey = edges.containing(["RUM", "MALMSEY"], from: words)[0]
        let apple_port = edges.containing(["APPLE", "PORT"], from: words)[1]
        let soil_wine = edges.containing(["SOIL", "WINE"], from: words)[0]
        let italy_chianti = edges.containing(["ITALY", "CHIANTI"], from: words)[1]
        //let cask_chianti = edges.containing(["CASK", "CHIANTI"], from: words)[0]

        let winningShapes = [
            grapes_slivovitz_gin_port_azerbaijan,
            greece_winery_azerbaijan_perry,
            slivovitz_nog_spain_vodka_grog,
            cask_water_sweet_vodka,
            water_tokay_sweet_turkey,
            tokay_rye,
            italy_turkey,
            slivovitz_rose,
            grapes_ussr,
            soil_ussr,
            winery_rhone,
            corks_sherry_rhone_malmsey,
            rum_perry,
            //rum_malmsey,
            apple_port,
            soil_wine,
            italy_chianti
            //cask_chianti
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9509(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9509)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 64,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 98,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 144,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 78,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 88,
            widthMax: widthMax,
            heightMax: heightMax))

        let zeus_font_zealots_pulpit = rectangle3x5.containing(["ZEUS", "FONT", "ZEALOTS", "PULPIT"], from: words)[0]
        let priory_zeus_pulpit_vespers = c2x2.containing(["PRIORY", "ZEUS", "PULPIT", "VESPERS"], from: words)[0]
        let priory_grotto_bishop_york = square3x3_BottomLeft.containing(["PRIORY", "GROTTO", "BISHOP", "YORK"], from: words)[0]
        let grotto_ark_grail_york = c2x2.containing(["GROTTO", "ARK", "GRAIL", "YORK"], from: words)[1]
        let grotto_transept = edges.containing(["GROTTO", "TRANSEPT"], from: words)[2]
        let altar_transept = edges.containing(["ALTAR", "TRANSEPT"], from: words)[0]
        let beads_spire_transept_shinto = square3x3.containing(["BEADS", "SPIRE", "TRANSEPT", "SHINTO"], from: words)[0]
        let grotto_totem = edges.containing(["GROTTO", "TOTEM"], from: words)[3]
        let tomb_romsey_totem_abbey = rectangle3x4.containing(["TOMB", "ROMSEY", "TOTEM", "ABBEY"], from: words)[0]
        let pisa_priory_vespers_bishop = square3x3.containing(["PISA", "PRIORY", "VESPERS", "BISHOP"], from: words)[0]
        let nave_vespers = edges.containing(["NAVE", "VESPERS"], from: words)[0]
        let shrine_zealots = edges.containing(["SHRINE", "ZEALOTS"], from: words)[1]
        let shrine_icon = edges.containing(["SHRINE", "ICON"], from: words)[1]
        let romsey_kirk = edges.containing(["ROMSEY", "KIRK"], from: words)[0]
        let zeus_kalpa_zealots_pulpit = square3x3.containing(["ZEUS", "KALPA", "ZEALOTS", "PULPIT"], from: words)[0]
        let nave_niche = edges.containing(["NAVE", "NICHE"], from: words)[0]
        let spire_easter = edges.containing(["SPIRE", "EASTER"], from: words)[2]
        let see_niche = edges.containing(["SEE", "NICHE"], from: words)[1]
        let see_wells = edges.containing(["SEE", "WELLS"], from: words)[2]

        let winningShapes = [
            zeus_font_zealots_pulpit,
            priory_zeus_pulpit_vespers,
            priory_grotto_bishop_york,
            grotto_ark_grail_york,
            grotto_transept,
            altar_transept,
            beads_spire_transept_shinto,
            grotto_totem,
            tomb_romsey_totem_abbey,
            pisa_priory_vespers_bishop,
            nave_vespers,
            shrine_zealots,
            shrine_icon,
            romsey_kirk,
            zeus_kalpa_zealots_pulpit,
            nave_niche,
            spire_easter,
            see_niche,
            see_wells
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9510(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9510)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 132,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 88,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 126,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 60,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 70,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 120,
            widthMax: widthMax,
            heightMax: heightMax))

        let zither_musette_zampogna_rattle = rectangle3x6.containing(["ZITHER", "MUSETTE", "ZAMPOGNA", "RATTLE"], from: words)[0]
        let musette_violin_zampogna_spinet = square3x3.containing(["MUSETTE", "VIOLIN", "ZAMPOGNA", "SPINET"], from: words)[0]
        let violin_horn_viol_zampogna = square3x3.containing(["VIOLIN", "HORN", "VIOL", "ZAMPOGNA"], from: words)[0]
        let tudum_spinet = edges.containing(["TUDUM", "SPINET"], from: words)[0]
        let panpipe_zither_cornet_fife = square3x3.containing(["PANPIPE", "ZITHER", "CORNET", "FIFE"], from: words)[0]
        let cello_panpipe_cornet_oboe = rectangle4x5.containing(["CELLO", "PANPIPE", "CORNET", "OBOE"], from: words)[0]
        let panpipe_harp = edges.containing(["PANPIPE", "HARP"], from: words)[0]
        let wurlitzer_tabor_kazoo_harp = square3x3_BottomRight.containing(["WURLITZER", "TABOR", "KAZOO", "HARP"], from: words)[0]
        let darbuk_wurlitzer_drum_kazoo = rectangle3x6.containing(["DARBUK", "WURLITZER", "DRUM", "KAZOO"], from: words)[0]
        let wurlitzer_tabor_lute_kazoo = rectangle3x4.containing(["WURLITZER", "TABOR", "LUTE", "KAZOO"], from: words)[0]
        let pipe_lute = edges.containing(["PIPE", "LUTE"], from: words)[0]
        let pipe_sitar_spoons_psaltery = rectangle3x5.containing(["PIPE", "SITAR", "SPOONS", "PSALTERY"], from: words)[0]
        let lyre_psaltery = edges.containing(["LYRE", "PSALTERY"], from: words)[1]
        let ocarina_sitar_spoons_psaltery = square3x3.containing(["OCARINA", "SITAR", "SPOONS", "PSALTERY"], from: words)[0]

        let winningShapes = [
            zither_musette_zampogna_rattle,
            musette_violin_zampogna_spinet,
            violin_horn_viol_zampogna,
            tudum_spinet,
            panpipe_zither_cornet_fife,
            cello_panpipe_cornet_oboe,
            panpipe_harp,
            wurlitzer_tabor_kazoo_harp,
            darbuk_wurlitzer_drum_kazoo,
            wurlitzer_tabor_lute_kazoo,
            pipe_lute,
            pipe_sitar_spoons_psaltery,
            lyre_psaltery,
            ocarina_sitar_spoons_psaltery
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    
    private static func Shapes_9511(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9511)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 62,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let pacman3x3_BottomRight = ShapeCalculator.toShapes(pacmans: PacmanCalculatorV1.BottomRight(
            words: words,
            end: end,
            len: len,
            scoreMin: 138,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 60,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_TopRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 104,
            widthMax: widthMax,
            heightMax: heightMax))

        let zigzagger_zippers = edges.containing(["ZIGZAGGER", "ZIPPERS"], from: words)[0]
        let pin_reel_zippers_pleats = rectangle3x4_BottomLeft.containing(["PIN", "REEL", "ZIPPERS", "PLEATS"], from: words)[0]
        let zigzagger_art = edges.containing(["ZIGZAGGER", "ART"], from: words)[0]
        let tie_art = edges.containing(["TIE", "ART"], from: words)[0]
        let canvas_raise_pleats_weave = square3x3_BottomRight.containing(["CANVAS", "RAISE", "PLEATS", "WEAVE"], from: words)[0]
        let work_canvas_weave_press = rectangle3x4.containing(["WORK", "CANVAS", "WEAVE", "PRESS"], from: words)[0]
        let work_sleeves_press_welded = square3x3_TopRight.containing(["WORK", "SLEEVES", "PRESS", "WELDED"], from: words)[0]
        let seams_cut_sleeves_lace_muslin_adjust = pacman3x3_BottomRight.containing(["SEAMS", "CUT", "SLEEVES", "LACE", "MUSLIN", "ADJUST"], from: words)[0]
        let sleeves_weaving_velvets_muslin = rectangle3x4.containing(["SLEEVES", "WEAVING", "VELVETS", "MUSLIN"], from: words)[0]
        let dior_seams_cross_lace = square3x3_TopRight.containing(["DIOR", "SEAMS", "CROSS", "LACE"], from: words)[0]
        let weaving_piped_welt_welded = c2x2.containing(["WEAVING", "PIPED", "WELT", "WELDED"], from: words)[1]
        let weaving_satins_welt_velvets = square4x4.containing(["WEAVING", "SATINS", "WELT", "VELVETS"], from: words)[0]
        let tuck_velvets = edges.containing(["TUCK", "VELVETS"], from: words)[0]
        let piped_satins_bias_welt = square3x3.containing(["PIPED", "SATINS", "BIAS", "WELT"], from: words)[0]
        let raise_wools_drawn_iron = square3x3.containing(["RAISE", "WOOLS", "DRAWN", "IRON"], from: words)[0]

        let winningShapes = [
            zigzagger_zippers,
            pin_reel_zippers_pleats,
            zigzagger_art,
            tie_art,
            canvas_raise_pleats_weave,
            work_canvas_weave_press,
            work_sleeves_press_welded,
            seams_cut_sleeves_lace_muslin_adjust,
            sleeves_weaving_velvets_muslin,
            dior_seams_cross_lace,
            weaving_piped_welt_welded,
            weaving_satins_welt_velvets,
            tuck_velvets,
            piped_satins_bias_welt,
            raise_wools_drawn_iron
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9512(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9512)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 82,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 28,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 86,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x6 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: len,
            scoreMin: 92,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 54,
            widthMax: widthMax,
            heightMax: heightMax))

        let spices_thyme_pimento_cherry = rectangle3x6.containing(["SPICES", "THYME", "PIMENTO", "CHERRY"], from: words)[0]
        let spices_thyme_cherry_sesame = rectangle3x6.containing(["SPICES", "THYME", "CHERRY", "SESAME"], from: words)[0]
        let salt_mint_sesame_melons = square3x3.containing(["SALT", "MINT", "SESAME", "MELONS"], from: words)[0]
        let mint_savory_melons_tansy = c2x2.containing(["MINT", "SAVORY", "MELONS", "TANSY"], from: words)[0]
        let savory_betony = edges.containing(["SAVORY", "BETONY"], from: words)[1]
        let cranberry_tansy = edges.containing(["CRANBERRY", "TANSY"], from: words)[1]
        let salsify_tansy = edges.containing(["SALSIFY", "TANSY"], from: words)[0]
        let salsify_costmary = edges.containing(["SALSIFY", "COSTMARY"], from: words)[2]
        let salsify_lemon_rosemary_fennel = square3x3.containing(["SALSIFY", "LEMON", "ROSEMARY", "FENNEL"], from: words)[0]
        let lemon_cicely_lime_rosemary = rectangle3x4.containing(["LEMON", "CICELY", "LIME", "ROSEMARY"], from: words)[0]
        let lemon_rue_rosemary_fennel = square3x3.containing(["LEMON", "RUE", "ROSEMARY", "FENNEL"], from: words)[0]
        let thyme_mulberry = edges.containing(["THYME", "MULBERRY"], from: words)[1]
        let cranberry_comfrey_mulberry_curry = square3x3.containing(["CRANBERRY", "COMFREY", "MULBERRY", "CURRY"], from: words)[0]
        let bay_mulberry = edges.containing(["BAY", "MULBERRY"], from: words)[0]
        let cranberry_comfrey_cocoa_balm = square3x3.containing(["CRANBERRY", "COMFREY", "COCOA", "BALM"], from: words)[0]
        let mace_melons = edges.containing(["MACE", "MELONS"], from: words)[0]
        let port_costmary = edges.containing(["PORT", "COSTMARY"], from: words)[1]

        let winningShapes = [
            spices_thyme_pimento_cherry,
            spices_thyme_cherry_sesame,
            salt_mint_sesame_melons,
            mint_savory_melons_tansy,
            savory_betony,
            cranberry_tansy,
            salsify_tansy,
            salsify_costmary,
            salsify_lemon_rosemary_fennel,
            lemon_cicely_lime_rosemary,
            lemon_rue_rosemary_fennel,
            thyme_mulberry,
            cranberry_comfrey_mulberry_curry,
            bay_mulberry,
            cranberry_comfrey_cocoa_balm,
            mace_melons,
            port_costmary
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9601(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9601)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax

        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 84,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let outer2x4 = ShapeCalculator.toShapes(outers: OuterCalculatorV1.C2x4(
           words: words,
           end: end,
           len: len,
           scoreMin: 0,
           widthMax: widthMax,
           heightMax: heightMax))
        
//        for item in outer2x4 {
//            print(item.ToString(words: words))
//        }

        let rectangle4x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 96,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let barge_mizzen_prize_galleon = square3x3.containing(["BARGE", "MIZZEN", "PRIZE", "GALLEON"], from: words)[0]
        let barge_mizzen_brig_prize = square3x3.containing(["BARGE", "MIZZEN", "BRIG", "PRIZE"], from: words)[0]
        let log_galleon = edges.containing(["LOG", "GALLEON"], from: words)[3]
        let log_coble = edges.containing(["LOG", "COBLE"], from: words)[0]
        let rowboat_coble = edges.containing(["ROWBOAT", "COBLE"], from: words)[2]
        let tramp_rowboat_trawler_punt = rectangle4x5.containing(["TRAMP", "ROWBOAT", "TRAWLER", "PUNT"], from: words)[0]
        let tosher_rowboat_wherry_trawler = square3x3.containing(["TOSHER", "ROWBOAT", "WHERRY", "TRAWLER"], from: words)[1]
        let galley_wherry = edges.containing(["GALLEY", "WHERRY"], from: words)[1]
        let ferry_galley_scow_slaver_argosy_yawl = outer2x4.containing(["FERRY", "GALLEY", "SCOW", "SLAVER", "ARGOSY", "YAWL"], from: words)[0]
        let scow_dory_shoaler_argosy = square3x3.containing(["SCOW", "DORY", "SHOALER", "ARGOSY"], from: words)[0]
        let tosher_tug_tub_cog = c2x2.containing(["TOSHER", "TUG", "TUB", "COG"], from: words)[0]
        let slaver_raft = edges.containing(["SLAVER", "RAFT"], from: words)[1]
        let dugout_raft = edges.containing(["DUGOUT", "RAFT"], from: words)[0]
        let dugout_ketch_junk_boat = square3x3.containing(["DUGOUT", "KETCH", "JUNK", "BOAT"], from: words)[0]
        let ark_shoaler = edges.containing(["ARK", "SHOALER"], from: words)[1]
        let ferry_skiff = edges.containing(["FERRY", "SKIFF"], from: words)[0]
        let ship_skiff = edges.containing(["SHIP", "SKIFF"], from: words)[0]
        let ship_gig = edges.containing(["SHIP", "GIG"], from: words)[0]

        let winningShapes = [
            barge_mizzen_prize_galleon,
            barge_mizzen_brig_prize,
            log_galleon,
            log_coble,
            rowboat_coble,
            tramp_rowboat_trawler_punt,
            tosher_rowboat_wherry_trawler,
            galley_wherry,
            ferry_galley_scow_slaver_argosy_yawl,
            scow_dory_shoaler_argosy,
            tosher_tug_tub_cog,
            slaver_raft,
            dugout_raft,
            dugout_ketch_junk_boat,
            ark_shoaler,
            ferry_skiff,
            ship_skiff,
            ship_gig
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    private static func Shapes_9602(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9602)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 74,
           widthMax: widthMax,
           heightMax: heightMax))

        let c2x3 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x3(
           words: words,
           end: end,
           len: len,
           scoreMin: 110,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 80,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 76,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomRight = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.BottomRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 120,
            widthMax: widthMax,
            heightMax: heightMax))

        let magazines_tripod_meter_zoom = rectangle3x5.containing(["MAGAZINES", "TRIPOD", "METER", "ZOOM"], from: words)[0]
        let tripod_rays_meter_magnify = square3x3.containing(["TRIPOD", "RAYS", "METER", "MAGNIFY"], from: words)[0]
        let magazines_tripod_zoom_lens = square3x3_BottomRight.containing(["MAGAZINES", "TRIPOD", "ZOOM", "LENS"], from: words)[0]
        let lever_magazines_lens_vision = square3x3.containing(["LEVER", "MAGAZINES", "LENS", "VISION"], from: words)[0]
        let box_sun_bulbs_vision = c2x2.containing(["BOX", "SUN", "BULBS", "VISION"], from: words)[0]
        let rays_shot = edges.containing(["RAYS", "SHOT"], from: words)[0]
        let still_shot = edges.containing(["STILL", "SHOT"], from: words)[1]
        let still_snap = edges.containing(["STILL", "SNAP"], from: words)[0]
        let time_magnify = edges.containing(["TIME", "MAGNIFY"], from: words)[0]
        let tape_snap = edges.containing(["TAPE", "SNAP"], from: words)[0]
        let tape_shoot = edges.containing(["TAPE", "SHOOT"], from: words)[0]
        let spools_bulbs = edges.containing(["SPOOLS", "BULBS"], from: words)[0]
        let spools_maxwell_prism_biconvex = rectangle3x5.containing(["SPOOLS", "MAXWELL", "PRISM", "BICONVEX"], from: words)[0]
        let spools_view_biconvex_scene = square3x3.containing(["SPOOLS", "VIEW", "BICONVEX", "SCENE"], from: words)[0]
        let cubes_prism = edges.containing(["CUBES", "PRISM"], from: words)[0]
        let cubes_colour = edges.containing(["CUBES", "COLOUR"], from: words)[0]
        let mirror_biconvex = edges.containing(["MIRROR", "BICONVEX"], from: words)[0]
        let mirror_hypo = edges.containing(["MIRROR", "HYPO"], from: words)[0]
        let light_eye_image_hypo_plate = c2x3.containing(["LIGHT", "EYE", "IMAGE", "HYPO", "PLATE"], from: words)[0]
        let lever_roll = edges.containing(["LEVER", "ROLL"], from: words)[2]

        let winningShapes = [magazines_tripod_meter_zoom,
            tripod_rays_meter_magnify,
            magazines_tripod_zoom_lens,
            lever_magazines_lens_vision,
            box_sun_bulbs_vision,
            rays_shot,
            still_shot,
            still_snap,
            time_magnify,
            tape_snap,
            tape_shoot,
            spools_bulbs,
            spools_maxwell_prism_biconvex,
            spools_view_biconvex_scene,
            cubes_prism,
            cubes_colour,
            mirror_biconvex,
            mirror_hypo,
            light_eye_image_hypo_plate,
            lever_roll]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9603(words: [String]) -> ([ShapeModel], [String], Int, Int) {
        
        let game = GameList().getGame(gameId: 9603)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax
        
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 78,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 70,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3_BottomLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 60,
            widthMax: widthMax,
            heightMax: heightMax))

        let vigil_palfrey_gorget_tiltyard = square3x3.containing(["VIGIL", "PALFREY", "GORGET", "TILTYARD"], from: words)[0]
        let crest_vigil_cavalry_tiltyard = rectangle3x5.containing(["CREST", "VIGIL", "CAVALRY", "TILTYARD"], from: words)[0]
        let palfrey_panoply = edges.containing(["PALFREY", "PANOPLY"], from: words)[2]
        let essay_panoply = edges.containing(["ESSAY", "PANOPLY"], from: words)[1]
        let essay_warrior_epic_surcoat = square3x3.containing(["ESSAY", "WARRIOR", "EPIC", "SURCOAT"], from: words)[0]
        let valour_essay_herald_spurs = square3x3_BottomLeft.containing(["VALOUR", "ESSAY", "HERALD", "SPURS"], from: words)[0]
        let cuirass_valour_quiver_spurs = rectangle3x5.containing(["CUIRASS", "VALOUR", "QUIVER", "SPURS"], from: words)[0]
        let warrior_rank_sword_prince = square3x3.containing(["WARRIOR", "RANK", "SWORD", "PRINCE"], from: words)[1]
        let hero_herald = edges.containing(["HERO", "HERALD"], from: words)[0]
        let jennet_prince = edges.containing(["JENNET", "PRINCE"], from: words)[0]
        let warrior_court_epic_surcoat = square3x3_BottomLeft.containing(["WARRIOR", "COURT", "EPIC", "SURCOAT"], from: words)[0]
        let court_castle = edges.containing(["COURT", "CASTLE"], from: words)[1]
        let squire_lists_castle_quest = square3x3.containing(["SQUIRE", "LISTS", "CASTLE", "QUEST"], from: words)[0]
        let squire_lists_quest_arms = square3x3.containing(["SQUIRE", "LISTS", "QUEST", "ARMS"], from: words)[0]

        let winningShapes = [
            vigil_palfrey_gorget_tiltyard,
            crest_vigil_cavalry_tiltyard,
            palfrey_panoply,
            essay_panoply,
            essay_warrior_epic_surcoat,
            valour_essay_herald_spurs,
            cuirass_valour_quiver_spurs,
            warrior_rank_sword_prince,
            hero_herald,
            jennet_prince,
            warrior_court_epic_surcoat,
            court_castle,
            squire_lists_castle_quest,
            squire_lists_quest_arms
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9604(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9604)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax

        let words = game.winningWords
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let c2x2 = ShapeCalculator.toShapes(clusters: ClusterCalculatorV1.C2x2(
           words: words,
           end: end,
           len: len,
           scoreMin: 74,
           widthMax: widthMax,
           heightMax: heightMax))

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 22,
            widthMax: widthMax,
            heightMax: heightMax))

        let outer2x4 = ShapeCalculator.toShapes(outers: OuterCalculatorV1.C2x4(
           words: words,
           end: end,
           len: len,
           scoreMin: 94,
           widthMax: widthMax,
           heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 90,
            widthMax: widthMax,
            heightMax: heightMax))

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 68,
            widthMax: widthMax,
            heightMax: heightMax))

        let square4x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 3,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let alcazar_window_mezzanine_armoury = square3x3.containing(["ALCAZAR", "WINDOW", "MEZZANINE", "ARMOURY"], from: words)[0]
        let window_gallery_mezzanine_armoury = rectangle3x4.containing(["WINDOW", "GALLERY", "MEZZANINE", "ARMOURY"], from: words)[0]
        let plan_gallery_pagoda_wall_alette_mezzanine = outer2x4.containing(["PLAN", "GALLERY", "PAGODA", "WALL", "ALETTE", "MEZZANINE"], from: words)[0]
        //let window_plan_wall_mezzanine = square3x3.containing(["WINDOW", "PLAN", "WALL", "MEZZANINE"], from: words)[0]
        let hostel_eaves_pagoda_alette = square3x3.containing(["HOSTEL", "EAVES", "PAGODA", "ALETTE"], from: words)[0]
        let dome_mezzanine = edges.containing(["DOME", "MEZZANINE"], from: words)[0]
        let alcazar_theatre = edges.containing(["ALCAZAR", "THEATRE"], from: words)[0]
        let atrium_armoury = edges.containing(["ATRIUM", "ARMOURY"], from: words)[0]
        let atrium_door_stud_monastery = c2x2.containing(["ATRIUM", "DOOR", "STUD", "MONASTERY"], from: words)[0]
        let piazza_cottage_monastery_ziggurat = square3x3.containing(["PIAZZA", "COTTAGE", "MONASTERY", "ZIGGURAT"], from: words)[0]
        let abbey_monastery = edges.containing(["ABBEY", "MONASTERY"], from: words)[2]
        let scape_door_stud_pier = square4x4.containing(["SCAPE", "DOOR", "STUD", "PIER"], from: words)[0]
        let atrium_hut = edges.containing(["ATRIUM", "HUT"], from: words)[1]
        let labyrinth_ziggurat = edges.containing(["LABYRINTH", "ZIGGURAT"], from: words)[3]
        let labyrinth_bay = edges.containing(["LABYRINTH", "BAY"], from: words)[2]
        //let abbey_bay = edges.containing(["ABBEY", "BAY"], from: words)[1]

        let winningShapes = [
            alcazar_window_mezzanine_armoury,
            window_gallery_mezzanine_armoury,
            plan_gallery_pagoda_wall_alette_mezzanine,
            //window_plan_wall_mezzanine,
            hostel_eaves_pagoda_alette,
            dome_mezzanine,
            alcazar_theatre,
            atrium_armoury,
            atrium_door_stud_monastery,
            piazza_cottage_monastery_ziggurat,
            abbey_monastery,
            scape_door_stud_pier,
            atrium_hut,
            labyrinth_ziggurat,
            labyrinth_bay
            //abbey_bay
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
    
    private static func Shapes_9605(words: [String]) -> ([ShapeModel], [String], Int, Int) {

        let game = GameList().getGame(gameId: 9605)!

        let widthMax = game.widthMax
        let heightMax = game.heightMax

        let words = game.winningWords
        //let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)

        let edges = ShapeCalculator.toShapes(edges: EdgeCalculatorV1.Execute(
            words: words,
            scoreMin: 24,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x4 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: len,
            scoreMin: 90,
            widthMax: widthMax,
            heightMax: heightMax))

        let rectangle3x5_TopLeft = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: len,
            scoreMin: 66,
            widthMax: widthMax,
            heightMax: heightMax))

        let special9605 = SpecialShapesCalculator.C9605(words: words)

        let square3x3 = ShapeCalculator.toShapes(rectangles:RectangleCalculatorV1.Square(
            interlockWidth: 2,
            words: words,
            lengths: len,
            scoreMin: 74,
            widthMax: widthMax,
            heightMax: heightMax))

        let prize_assizes = edges.containing(["PRIZE", "ASSIZES"], from: words)[1]
        let bar_testimony_treason_surtax_false_assizes_sue_testator_rent = special9605.containing(["BAR", "TESTIMONY", "TREASON", "SURTAX", "FALSE", "ASSIZES", "SUE", "TESTATOR", "RENT"], from: words)[0]
        let abet_witness_act_testator = rectangle3x4.containing(["ABET", "WITNESS", "ACT", "TESTATOR"], from: words)[0]
        let usury_testimony_insult_summons = square3x3.containing(["USURY", "TESTIMONY", "INSULT", "SUMMONS"], from: words)[0]
        let usury_jury = edges.containing(["USURY", "JURY"], from: words)[3]
        let suit_jury = edges.containing(["SUIT", "JURY"], from: words)[0]
        let suit_steal = edges.containing(["SUIT", "STEAL"], from: words)[1]
        let escrow_summons = edges.containing(["ESCROW", "SUMMONS"], from: words)[2]
        let escrow_arrest_oath_prison = rectangle3x5_TopLeft.containing(["ESCROW", "ARREST", "OATH", "PRISON"], from: words)[0]
        let escrow_law = edges.containing(["ESCROW", "LAW"], from: words)[0]
        let arrest_bench_rob_prison = square3x3.containing(["ARREST", "BENCH", "ROB", "PRISON"], from: words)[0]
        let writ_oath = edges.containing(["WRIT", "OATH"], from: words)[0]
        let case_assizes = edges.containing(["CASE", "ASSIZES"], from: words)[2]
        let treason_lawsuit = edges.containing(["TREASON", "LAWSUIT"], from: words)[1]
        let use_lawsuit = edges.containing(["USE", "LAWSUIT"], from: words)[0]
        //let witness_lawsuit = edges.containing(["WITNESS", "LAWSUIT"], from: words)[0]
        let lien_insult = edges.containing(["LIEN", "INSULT"], from: words)[0]

        let winningShapes = [
            prize_assizes,
            bar_testimony_treason_surtax_false_assizes_sue_testator_rent,
            abet_witness_act_testator,
            usury_testimony_insult_summons,
            usury_jury,
            suit_jury,
            suit_steal,
            escrow_summons,
            escrow_arrest_oath_prison,
            escrow_law,
            arrest_bench_rob_prison,
            writ_oath,
            case_assizes,
            treason_lawsuit,
            use_lawsuit,
            //witness_lawsuit,
            lien_insult
        ]
        return (winningShapes, words, widthMax, heightMax)
    }
}
