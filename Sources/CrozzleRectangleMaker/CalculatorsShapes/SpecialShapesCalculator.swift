//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 15/6/2023.
//

import Foundation
public class SpecialShapesCalculator {
    
    public static func C8703(words: [String]) -> ShapeModel {
        let h = ["JIFFY","LATE","ALWAYS"]
        let v = ["DAILY","FAST","OFT","YEAR"]
        
        let hid = WordCalculator.extractPositions(ofWords: h, from: words)
        let vid = WordCalculator.extractPositions(ofWords: v, from: words)
        let hl = WordCalculator.lengths8(words: h)
        let vl = WordCalculator.lengths8(words: v)
        
        let placements = [
            PlacementModel(i: hid[0], h: true, x: 3, y: 3, l: hl[0]),
            PlacementModel(i: hid[1], h: true, x: 4, y: 4, l: hl[1]),
            PlacementModel(i: hid[2], h: true, x: 0, y: 5, l: hl[2]),
            
            PlacementModel(i: vid[0], h: false, x: 5, y: 0, l: vl[0]),
            PlacementModel(i: vid[1], h: false, x: 6, y: 2, l: vl[1]),
            PlacementModel(i: vid[2], h: false, x: 7, y: 1, l: vl[2]),
            PlacementModel(i: vid[3], h: false, x: 8, y: 2, l: vl[3])
        ]
        
        let shape = ShapeModel(score: 0, width: placements.width(), height: placements.height(), placements: placements)
        //print(shape.ToString(words: words))
        let (shapeWithScore, _) = ShapeCalculator.ToValidShape(shape: shape, words: words)
        return shapeWithScore!
    }
    
    public static func C8805(words: [String]) -> ShapeModel {
        let h = ["WOOL","MEAT","TANK","HARVEST"]
        let v = ["EWE","OATS","ROTATION"]
        
        let hid = WordCalculator.extractPositions(ofWords: h, from: words)
        let vid = WordCalculator.extractPositions(ofWords: v, from: words)
        let hl = WordCalculator.lengths8(words: h)
        let vl = WordCalculator.lengths8(words: v)
        
        let placements = [
            PlacementModel(i: hid[0], h: true, x: 4, y: 2, l: hl[0]),
            PlacementModel(i: hid[1], h: true, x: 3, y: 3, l: hl[1]),
            PlacementModel(i: hid[2], h: true, x: 5, y: 4, l: hl[2]),
            PlacementModel(i: hid[3], h: true, x: 0, y: 5, l: hl[3]),
            
            PlacementModel(i: vid[0], h: false, x: 5, y: 0, l: vl[0]),
            PlacementModel(i: vid[1], h: false, x: 6, y: 1, l: vl[1]),
            PlacementModel(i: vid[2], h: false, x: 7, y: 0, l: vl[2])
        ]
        
        let shape = ShapeModel(score: 0, width: placements.width(), height: placements.height(), placements: placements)
        //print(shape.ToString(words: words))
        let (shapeWithScore, _) = ShapeCalculator.ToValidShape(shape: shape, words: words)
        return shapeWithScore!
    }
    
    public static func C9002a(words: [String]) -> ShapeModel {
        let h = ["NEPTUNE","MARS","JUNO"]
        let v = ["REMUS","PAN","TROY","URANUS"]
        
        let hid = WordCalculator.extractPositions(ofWords: h, from: words)
        let vid = WordCalculator.extractPositions(ofWords: v, from: words)
        let hl = WordCalculator.lengths8(words: h)
        let vl = WordCalculator.lengths8(words: v)
        
        let placements = [
            PlacementModel(i: hid[0], h: true, x: 0, y: 5, l: hl[0]),
            PlacementModel(i: hid[1], h: true, x: 1, y: 6, l: hl[1]),
            PlacementModel(i: hid[2], h: true, x: 0, y: 7, l: hl[2]),
            
            PlacementModel(i: vid[0], h: false, x: 2, y: 3, l: vl[0]),
            PlacementModel(i: vid[1], h: false, x: 3, y: 4, l: vl[1]),
            PlacementModel(i: vid[2], h: false, x: 4, y: 4, l: vl[2]),
            PlacementModel(i: vid[3], h: false, x: 5, y: 0, l: vl[3])
        ]
        
        let shape = ShapeModel(score: 0, width: placements.width(), height: placements.height(), placements: placements)
        //print(shape.ToString(words: words))
        let (shapeWithScore, _) = ShapeCalculator.ToValidShape(shape: shape, words: words)
        return shapeWithScore!
    }
    
    public static func C9002b(words: [String]) -> ShapeModel {
        let h = ["OLYMPUS","ROMULUS","JANUS","SATYR"]
        let v = ["URANUS","JASON","MUSES","MEDUSA"]
        
        let hid = WordCalculator.extractPositions(ofWords: h, from: words)
        let vid = WordCalculator.extractPositions(ofWords: v, from: words)
        let hl = WordCalculator.lengths8(words: h)
        let vl = WordCalculator.lengths8(words: v)
        
        let placements = [
            PlacementModel(i: hid[0], h: true, x: 0, y: 3, l: hl[0]),
            PlacementModel(i: hid[1], h: true, x: 5, y: 4, l: hl[1]),
            PlacementModel(i: hid[2], h: true, x: 4, y: 5, l: hl[2]),
            PlacementModel(i: hid[3], h: true, x: 7, y: 6, l: hl[3]),
            
            PlacementModel(i: vid[0], h: false, x: 6, y: 2, l: vl[0]),
            PlacementModel(i: vid[1], h: false, x: 7, y: 0, l: vl[1]),
            PlacementModel(i: vid[2], h: false, x: 8, y: 3, l: vl[2]),
            PlacementModel(i: vid[3], h: false, x: 9, y: 0, l: vl[3])
        ]
        
        let shape = ShapeModel(score: 0, width: placements.width(), height: placements.height(), placements: placements)
        //print(shape.ToString(words: words))
        let (shapeWithScore, _) = ShapeCalculator.ToValidShape(shape: shape, words: words)
        return shapeWithScore!
    }
    
    public static func C9101(words: [String]) -> ShapeModel {
        let h = ["BAT","AMUSEMENT","SUN","HAT"]
        let v = ["BUSH","CASUAL","TENT"]
        
        let hid = WordCalculator.extractPositions(ofWords: h, from: words)
        let vid = WordCalculator.extractPositions(ofWords: v, from: words)
        let hl = WordCalculator.lengths8(words: h)
        let vl = WordCalculator.lengths8(words: v)
        
        let placements = [
            PlacementModel(i: hid[0], h: true, x: 2, y: 2, l: hl[0]),
            PlacementModel(i: hid[1], h: true, x: 0, y: 3, l: hl[1]),
            PlacementModel(i: hid[2], h: true, x: 2, y: 4, l: hl[2]),
            PlacementModel(i: hid[3], h: true, x: 2, y: 5, l: hl[3]),
            
            PlacementModel(i: vid[0], h: false, x: 3, y: 1, l: vl[0]),
            PlacementModel(i: vid[1], h: false, x: 4, y: 0, l: vl[1]),
            PlacementModel(i: vid[2], h: false, x: 5, y: 1, l: vl[2])
        ]
        
        let shape = ShapeModel(score: 0, width: placements.width(), height: placements.height(), placements: placements)
        //print(shape.ToString(words: words))
        let (shapeWithScore, _) = ShapeCalculator.ToValidShape(shape: shape, words: words)
        return shapeWithScore!
    }
    
    
    public static func C9102(words: [String]) -> ShapeModel {
        let h = ["SPEED","DOT","CANON","TYPE"]
        let v = ["DATA","SONY","LAPTOP","NEC"]
        
        let hid = WordCalculator.extractPositions(ofWords: h, from: words)
        let vid = WordCalculator.extractPositions(ofWords: v, from: words)
        let hl = WordCalculator.lengths8(words: h)
        let vl = WordCalculator.lengths8(words: v)
        
        let placements = [
            PlacementModel(i: hid[0], h: true, x: 2, y: 3, l: hl[0]),
            PlacementModel(i: hid[1], h: true, x: 1, y: 4, l: hl[1]),
            PlacementModel(i: hid[2], h: true, x: 0, y: 5, l: hl[2]),
            PlacementModel(i: hid[3], h: true, x: 1, y: 6, l: hl[3]),
            
            PlacementModel(i: vid[0], h: false, x: 2, y: 3, l: vl[0]),
            PlacementModel(i: vid[1], h: false, x: 3, y: 2, l: vl[1]),
            PlacementModel(i: vid[2], h: false, x: 4, y: 0, l: vl[2]),
            PlacementModel(i: vid[3], h: false, x: 5, y: 4, l: vl[3])
        ]
        
        let shape = ShapeModel(score: 0, width: placements.width(), height: placements.height(), placements: placements)
        //print(shape.ToString(words: words))
        let (shapeWithScore, _) = ShapeCalculator.ToValidShape(shape: shape, words: words)
        return shapeWithScore!
    }
    
    public static func C9109(words: [String]) -> ShapeModel {
        let h = ["COPYPAPER","ANSWER","POST","TELLER","ORDER"]
        let v = ["PASTE","ENTER","BUZZERS"]
        
        let hid = WordCalculator.extractPositions(ofWords: h, from: words)
        let vid = WordCalculator.extractPositions(ofWords: v, from: words)
        let hl = WordCalculator.lengths8(words: h)
        let vl = WordCalculator.lengths8(words: v)
        
        let placements = [
            PlacementModel(i: hid[0], h: true, x: 0, y: 6, l: hl[0]),
            PlacementModel(i: hid[1], h: true, x: 6, y: 7, l: hl[1]),
            PlacementModel(i: hid[2], h: true, x: 4, y: 8, l: hl[2]),
            PlacementModel(i: hid[3], h: true, x: 6, y: 9, l: hl[3]),
            PlacementModel(i: hid[4], h: true, x: 3, y: 10, l: hl[4]),
            
            PlacementModel(i: vid[0], h: false, x: 7, y: 5, l: vl[0]),
            PlacementModel(i: vid[1], h: false, x: 8, y: 5, l: vl[1]),
            PlacementModel(i: vid[2], h: false, x: 9, y: 0, l: vl[2])
        ]
        
        let shape = ShapeModel(score: 0, width: placements.width(), height: placements.height(), placements: placements)
        //print(shape.ToString(words: words))
        let (shapeWithScore, _) = ShapeCalculator.ToValidShape(shape: shape, words: words)
        return shapeWithScore!
    }
    
    public static func C9204(words: [String]) -> ShapeModel {
        let h = ["RITUAL","SAUCERS","BEANS"]
        let v = ["SHRUB","ICED","TEA","URN","ASSAM"]
        
        let hid = WordCalculator.extractPositions(ofWords: h, from: words)
        let vid = WordCalculator.extractPositions(ofWords: v, from: words)
        let hl = WordCalculator.lengths8(words: h)
        let vl = WordCalculator.lengths8(words: v)
        
        let placements = [
            PlacementModel(i: hid[0], h: true, x: 2, y: 3, l: hl[0]),
            PlacementModel(i: hid[1], h: true, x: 0, y: 4, l: hl[1]),
            PlacementModel(i: hid[2], h: true, x: 2, y: 5, l: hl[2]),
            
            PlacementModel(i: vid[0], h: false, x: 3, y: 0, l: vl[0]),
            PlacementModel(i: vid[1], h: false, x: 4, y: 2, l: vl[1]),
            PlacementModel(i: vid[2], h: false, x: 5, y: 2, l: vl[2]),
            PlacementModel(i: vid[3], h: false, x: 6, y: 2, l: vl[3]),
            PlacementModel(i: vid[4], h: false, x: 7, y: 2, l: vl[4])
        ]
        
        let shape = ShapeModel(score: 0, width: placements.width(), height: placements.height(), placements: placements)
        //print(shape.ToString(words: words))
        let (shapeWithScore, _) = ShapeCalculator.ToValidShape(shape: shape, words: words)
        return shapeWithScore!
    }
    
    public static func C9209(words: [String]) -> ShapeModel {
        let h = ["ALAMO","CORPS","TNT","DIVISIONS"]
        let v = ["ACTION","MONS","FORTIFY"]
        
        let hid = WordCalculator.extractPositions(ofWords: h, from: words)
        let vid = WordCalculator.extractPositions(ofWords: v, from: words)
        let hl = WordCalculator.lengths8(words: h)
        let vl = WordCalculator.lengths8(words: v)
        
        let placements = [
            PlacementModel(i: hid[0], h: true, x: 1, y: 2, l: hl[0]),
            PlacementModel(i: hid[1], h: true, x: 3, y: 3, l: hl[1]),
            PlacementModel(i: hid[2], h: true, x: 3, y: 4, l: hl[2]),
            PlacementModel(i: hid[3], h: true, x: 0, y: 5, l: hl[3]),
            
            PlacementModel(i: vid[0], h: false, x: 4, y: 1, l: vl[0]),
            PlacementModel(i: vid[1], h: false, x: 5, y: 1, l: vl[1]),
            PlacementModel(i: vid[2], h: false, x: 6, y: 0, l: vl[2])
        ]
        
        let shape = ShapeModel(score: 0, width: placements.width(), height: placements.height(), placements: placements)
        //print(shape.ToString(words: words))
        let (shapeWithScore, _) = ShapeCalculator.ToValidShape(shape: shape, words: words)
        return shapeWithScore!
    }
    
    
    public static func C9407(words: [String]) -> ShapeModel {
        let h = ["INUIT","SCOTT","WINTER"]
        let v = ["GUST","ICE","STORM"]
        
        let hid = WordCalculator.extractPositions(ofWords: h, from: words)
        let vid = WordCalculator.extractPositions(ofWords: v, from: words)
        let hl = WordCalculator.lengths8(words: h)
        let vl = WordCalculator.lengths8(words: v)
        
        let placements = [
            PlacementModel(i: hid[0], h: true, x: 1, y: 2, l: hl[0]),
            PlacementModel(i: hid[1], h: true, x: 3, y: 3, l: hl[1]),
            PlacementModel(i: hid[2], h: true, x: 0, y: 4, l: hl[2]),
            
            PlacementModel(i: vid[0], h: false, x: 4, y: 0, l: vl[0]),
            PlacementModel(i: vid[1], h: false, x: 5, y: 1, l: vl[1]),
            PlacementModel(i: vid[2], h: false, x: 6, y: 0, l: vl[2])
        ]
        
        let shape = ShapeModel(score: 0, width: placements.width(), height: placements.height(), placements: placements)
        //print(shape.ToString(words: words))
        let (shapeWithScore, _) = ShapeCalculator.ToValidShape(shape: shape, words: words)
        return shapeWithScore!
    }
    
    public static func C9605(words: [String]) -> ShapeModel {
        let h = ["BAR","TESTIMONY","TREASON","SURTAX","FALSE"]
        let v = ["ASSIZES","SUE","TESTATOR","RENT"]
        
        let hid = WordCalculator.extractPositions(ofWords: h, from: words)
        let vid = WordCalculator.extractPositions(ofWords: v, from: words)
        let hl = WordCalculator.lengths8(words: h)
        let vl = WordCalculator.lengths8(words: v)
        
        let placements = [
            PlacementModel(i: hid[0], h: true, x: 4, y: 5, l: hl[0]),
            PlacementModel(i: hid[1], h: true, x: 5, y: 6, l: hl[1]),
            PlacementModel(i: hid[2], h: true, x: 0, y: 7, l: hl[2]),
            PlacementModel(i: hid[3], h: true, x: 3, y: 8, l: hl[3]),
            PlacementModel(i: hid[4], h: true, x: 0, y: 9, l: hl[4]),
            
            PlacementModel(i: vid[0], h: false, x: 4, y: 6, l: vl[0]),
            PlacementModel(i: vid[1], h: false, x: 5, y: 6, l: vl[1]),
            PlacementModel(i: vid[2], h: false, x: 6, y: 0, l: vl[2]),
            PlacementModel(i: vid[3], h: false, x: 7, y: 4, l: vl[3])
        ]
        
        let shape = ShapeModel(score: 0, width: placements.width(), height: placements.height(), placements: placements)
        //print(shape.ToString(words: words))
        let (shapeWithScore, _) = ShapeCalculator.ToValidShape(shape: shape, words: words)
        return shapeWithScore!
    }
}
