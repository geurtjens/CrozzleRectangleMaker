//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 15/6/2023.
//

import Foundation
/// Faking that it is calculating the shapes
public class SpecialShapesCalculator {
    
    public static func C8703(words: [String]) -> [ShapeModel] {
        let h = ["JIFFY","LATE","ALWAYS"]
        let v = ["DAILY","FAST","OFT","YEAR"]
        
        let hid = WordCalculator.extractPositions(ofWords: h, from: words)
        let vid = WordCalculator.extractPositions(ofWords: v, from: words)
        let hl = WordCalculator.lengths8(words: h)
        let vl = WordCalculator.lengths8(words: v)
        
        let placements = [
            PlacementModel(w: hid[0], x: 3, y: 3, z: true, l: hl[0]),
            PlacementModel(w: hid[1], x: 4, y: 4, z: true, l: hl[1]),
            PlacementModel(w: hid[2], x: 0, y: 5, z: true, l: hl[2]),
            
            PlacementModel(w: vid[0], x: 5, y: 0, z: false, l: vl[0]),
            PlacementModel(w: vid[1], x: 6, y: 2, z: false, l: vl[1]),
            PlacementModel(w: vid[2], x: 7, y: 1, z: false, l: vl[2]),
            PlacementModel(w: vid[3], x: 8, y: 2, z: false, l: vl[3])
        ]
        
        let shape = ShapeModel(score: 0, width: placements.width(), height: placements.height(), placements: placements)
        //print(shape.ToString(words: words))
        let (shapeWithScore, _) = ShapeCalculator.ToValidShape(shape: shape, words: words)
        return [shapeWithScore!]
    }
    
    public static func C8805(words: [String]) -> [ShapeModel] {
        let h = ["WOOL","MEAT","TANK","HARVEST"]
        let v = ["EWE","OATS","ROTATION"]
        
        let hid = WordCalculator.extractPositions(ofWords: h, from: words)
        let vid = WordCalculator.extractPositions(ofWords: v, from: words)
        let hl = WordCalculator.lengths8(words: h)
        let vl = WordCalculator.lengths8(words: v)
        
        let placements = [
            PlacementModel(w: hid[0], x: 4, y: 2, z: true, l: hl[0]),
            PlacementModel(w: hid[1], x: 3, y: 3, z: true, l: hl[1]),
            PlacementModel(w: hid[2], x: 5, y: 4, z: true, l: hl[2]),
            PlacementModel(w: hid[3], x: 0, y: 5, z: true, l: hl[3]),
            
            PlacementModel(w: vid[0], x: 5, y: 0, z: false, l: vl[0]),
            PlacementModel(w: vid[1], x: 6, y: 1, z: false, l: vl[1]),
            PlacementModel(w: vid[2], x: 7, y: 0, z: false, l: vl[2])
        ]
        
        let shape = ShapeModel(score: 0, width: placements.width(), height: placements.height(), placements: placements)
        //print(shape.ToString(words: words))
        let (shapeWithScore, _) = ShapeCalculator.ToValidShape(shape: shape, words: words)
        return [shapeWithScore!]
    }
    
    public static func C9002a(words: [String]) -> [ShapeModel] {
        let h = ["NEPTUNE","MARS","JUNO"]
        let v = ["REMUS","PAN","TROY","URANUS"]
        
        let hid = WordCalculator.extractPositions(ofWords: h, from: words)
        let vid = WordCalculator.extractPositions(ofWords: v, from: words)
        let hl = WordCalculator.lengths8(words: h)
        let vl = WordCalculator.lengths8(words: v)
        
        let placements = [
            PlacementModel(w: hid[0], x: 0, y: 5, z: true, l: hl[0]),
            PlacementModel(w: hid[1], x: 1, y: 6, z: true, l: hl[1]),
            PlacementModel(w: hid[2], x: 0, y: 7, z: true, l: hl[2]),
            
            PlacementModel(w: vid[0], x: 2, y: 3, z: false, l: vl[0]),
            PlacementModel(w: vid[1], x: 3, y: 4, z: false, l: vl[1]),
            PlacementModel(w: vid[2], x: 4, y: 4, z: false, l: vl[2]),
            PlacementModel(w: vid[3], x: 5, y: 0, z: false, l: vl[3])
        ]
        
        let shape = ShapeModel(score: 0, width: placements.width(), height: placements.height(), placements: placements)
        //print(shape.ToString(words: words))
        let (shapeWithScore, _) = ShapeCalculator.ToValidShape(shape: shape, words: words)
        return [shapeWithScore!]
    }
    
    public static func C9002b(words: [String]) -> [ShapeModel] {
        let h = ["OLYMPUS","ROMULUS","JANUS","SATYR"]
        let v = ["URANUS","JASON","MUSES","MEDUSA"]
        
        let hid = WordCalculator.extractPositions(ofWords: h, from: words)
        let vid = WordCalculator.extractPositions(ofWords: v, from: words)
        let hl = WordCalculator.lengths8(words: h)
        let vl = WordCalculator.lengths8(words: v)
        
        let placements = [
            PlacementModel(w: hid[0], x: 0, y: 3, z: true, l: hl[0]),
            PlacementModel(w: hid[1], x: 5, y: 4, z: true, l: hl[1]),
            PlacementModel(w: hid[2], x: 4, y: 5, z: true, l: hl[2]),
            PlacementModel(w: hid[3], x: 7, y: 6, z: true, l: hl[3]),
            
            PlacementModel(w: vid[0], x: 6, y: 2, z: false, l: vl[0]),
            PlacementModel(w: vid[1], x: 7, y: 0, z: false, l: vl[1]),
            PlacementModel(w: vid[2], x: 8, y: 3, z: false, l: vl[2]),
            PlacementModel(w: vid[3], x: 9, y: 0, z: false, l: vl[3])
        ]
        
        let shape = ShapeModel(score: 0, width: placements.width(), height: placements.height(), placements: placements)
        //print(shape.ToString(words: words))
        let (shapeWithScore, _) = ShapeCalculator.ToValidShape(shape: shape, words: words)
        return [shapeWithScore!]
    }
    
    public static func C9101(words: [String]) -> [ShapeModel] {
        let h = ["BAT","AMUSEMENT","SUN","HAT"]
        let v = ["BUSH","CASUAL","TENT"]
        
        let hid = WordCalculator.extractPositions(ofWords: h, from: words)
        let vid = WordCalculator.extractPositions(ofWords: v, from: words)
        let hl = WordCalculator.lengths8(words: h)
        let vl = WordCalculator.lengths8(words: v)
        
        let placements = [
            PlacementModel(w: hid[0], x: 2, y: 2, z: true, l: hl[0]),
            PlacementModel(w: hid[1], x: 0, y: 3, z: true, l: hl[1]),
            PlacementModel(w: hid[2], x: 2, y: 4, z: true, l: hl[2]),
            PlacementModel(w: hid[3], x: 2, y: 5, z: true, l: hl[3]),
            
            PlacementModel(w: vid[0], x: 3, y: 1, z: false, l: vl[0]),
            PlacementModel(w: vid[1], x: 4, y: 0, z: false, l: vl[1]),
            PlacementModel(w: vid[2], x: 5, y: 1, z: false, l: vl[2])
        ]
        
        let shape = ShapeModel(score: 0, width: placements.width(), height: placements.height(), placements: placements)
        //print(shape.ToString(words: words))
        let (shapeWithScore, _) = ShapeCalculator.ToValidShape(shape: shape, words: words)
        return [shapeWithScore!]
    }
    
    
    public static func C9102(words: [String]) -> [ShapeModel] {
        let h = ["SPEED","DOT","CANON","TYPE"]
        let v = ["DATA","SONY","LAPTOP","NEC"]
        
        let hid = WordCalculator.extractPositions(ofWords: h, from: words)
        let vid = WordCalculator.extractPositions(ofWords: v, from: words)
        let hl = WordCalculator.lengths8(words: h)
        let vl = WordCalculator.lengths8(words: v)
        
        let placements = [
            PlacementModel(w: hid[0], x: 2, y: 3, z: true, l: hl[0]),
            PlacementModel(w: hid[1], x: 1, y: 4, z: true, l: hl[1]),
            PlacementModel(w: hid[2], x: 0, y: 5, z: true, l: hl[2]),
            PlacementModel(w: hid[3], x: 1, y: 6, z: true, l: hl[3]),
            
            PlacementModel(w: vid[0], x: 2, y: 3, z: false, l: vl[0]),
            PlacementModel(w: vid[1], x: 3, y: 2, z: false, l: vl[1]),
            PlacementModel(w: vid[2], x: 4, y: 0, z: false, l: vl[2]),
            PlacementModel(w: vid[3], x: 5, y: 4, z: false, l: vl[3])
        ]
        
        let shape = ShapeModel(score: 0, width: placements.width(), height: placements.height(), placements: placements)
        //print(shape.ToString(words: words))
        let (shapeWithScore, _) = ShapeCalculator.ToValidShape(shape: shape, words: words)
        return [shapeWithScore!]
    }
    
    public static func C9109(words: [String]) -> [ShapeModel] {
        let h = ["COPYPAPER","ANSWER","POST","TELLER","ORDER"]
        let v = ["PASTE","ENTER","BUZZERS"]
        
        let hid = WordCalculator.extractPositions(ofWords: h, from: words)
        let vid = WordCalculator.extractPositions(ofWords: v, from: words)
        let hl = WordCalculator.lengths8(words: h)
        let vl = WordCalculator.lengths8(words: v)
        
        let placements = [
            PlacementModel(w: hid[0], x: 0, y: 6, z: true, l: hl[0]),
            PlacementModel(w: hid[1], x: 6, y: 7, z: true, l: hl[1]),
            PlacementModel(w: hid[2], x: 4, y: 8, z: true, l: hl[2]),
            PlacementModel(w: hid[3], x: 6, y: 9, z: true, l: hl[3]),
            PlacementModel(w: hid[4], x: 3, y: 10, z: true, l: hl[4]),
            
            PlacementModel(w: vid[0], x: 7, y: 5, z: false, l: vl[0]),
            PlacementModel(w: vid[1], x: 8, y: 5, z: false, l: vl[1]),
            PlacementModel(w: vid[2], x: 9, y: 0, z: false, l: vl[2])
        ]
        
        let shape = ShapeModel(score: 0, width: placements.width(), height: placements.height(), placements: placements)
        //print(shape.ToString(words: words))
        let (shapeWithScore, _) = ShapeCalculator.ToValidShape(shape: shape, words: words)
        return [shapeWithScore!]
    }
    
    public static func C9204(words: [String]) -> [ShapeModel] {
        let h = ["RITUAL","SAUCERS","BEANS"]
        let v = ["SHRUB","ICED","TEA","URN","ASSAM"]
        
        let hid = WordCalculator.extractPositions(ofWords: h, from: words)
        let vid = WordCalculator.extractPositions(ofWords: v, from: words)
        let hl = WordCalculator.lengths8(words: h)
        let vl = WordCalculator.lengths8(words: v)
        
        let placements = [
            PlacementModel(w: hid[0], x: 2, y: 3, z: true, l: hl[0]),
            PlacementModel(w: hid[1], x: 0, y: 4, z: true, l: hl[1]),
            PlacementModel(w: hid[2], x: 2, y: 5, z: true, l: hl[2]),
            
            PlacementModel(w: vid[0], x: 3, y: 0, z: false, l: vl[0]),
            PlacementModel(w: vid[1], x: 4, y: 2, z: false, l: vl[1]),
            PlacementModel(w: vid[2], x: 5, y: 2, z: false, l: vl[2]),
            PlacementModel(w: vid[3], x: 6, y: 2, z: false, l: vl[3]),
            PlacementModel(w: vid[4], x: 7, y: 2, z: false, l: vl[4])
        ]
        
        let shape = ShapeModel(score: 0, width: placements.width(), height: placements.height(), placements: placements)
        //print(shape.ToString(words: words))
        let (shapeWithScore, _) = ShapeCalculator.ToValidShape(shape: shape, words: words)
        return [shapeWithScore!]
    }
    
    public static func C9209(words: [String]) -> [ShapeModel] {
        let h = ["ALAMO","CORPS","TNT","DIVISIONS"]
        let v = ["ACTION","MONS","FORTIFY"]
        
        let hid = WordCalculator.extractPositions(ofWords: h, from: words)
        let vid = WordCalculator.extractPositions(ofWords: v, from: words)
        let hl = WordCalculator.lengths8(words: h)
        let vl = WordCalculator.lengths8(words: v)
        
        let placements = [
            PlacementModel(w: hid[0], x: 1, y: 2, z: true, l: hl[0]),
            PlacementModel(w: hid[1], x: 3, y: 3, z: true, l: hl[1]),
            PlacementModel(w: hid[2], x: 3, y: 4, z: true, l: hl[2]),
            PlacementModel(w: hid[3], x: 0, y: 5, z: true, l: hl[3]),
            
            PlacementModel(w: vid[0], x: 4, y: 1, z: false, l: vl[0]),
            PlacementModel(w: vid[1], x: 5, y: 1, z: false, l: vl[1]),
            PlacementModel(w: vid[2], x: 6, y: 0, z: false, l: vl[2])
        ]
        
        let shape = ShapeModel(score: 0, width: placements.width(), height: placements.height(), placements: placements)
        //print(shape.ToString(words: words))
        let (shapeWithScore, _) = ShapeCalculator.ToValidShape(shape: shape, words: words)
        return [shapeWithScore!]
    }
    
    
    public static func C9407(words: [String]) -> [ShapeModel] {
        let h = ["INUIT","SCOTT","WINTER"]
        let v = ["GUST","ICE","STORM"]
        
        let hid = WordCalculator.extractPositions(ofWords: h, from: words)
        let vid = WordCalculator.extractPositions(ofWords: v, from: words)
        let hl = WordCalculator.lengths8(words: h)
        let vl = WordCalculator.lengths8(words: v)
        
        let placements = [
            PlacementModel(w: hid[0], x: 1, y: 2, z: true, l: hl[0]),
            PlacementModel(w: hid[1], x: 3, y: 3, z: true, l: hl[1]),
            PlacementModel(w: hid[2], x: 0, y: 4, z: true, l: hl[2]),
            
            PlacementModel(w: vid[0], x: 4, y: 0, z: false, l: vl[0]),
            PlacementModel(w: vid[1], x: 5, y: 1, z: false, l: vl[1]),
            PlacementModel(w: vid[2], x: 6, y: 0, z: false, l: vl[2])
        ]
        
        let shape = ShapeModel(score: 0, width: placements.width(), height: placements.height(), placements: placements)
        //print(shape.ToString(words: words))
        let (shapeWithScore, _) = ShapeCalculator.ToValidShape(shape: shape, words: words)
        return [shapeWithScore!]
    }
    
    public static func C9605(words: [String]) -> [ShapeModel] {
        let h = ["BAR","TESTIMONY","TREASON","SURTAX","FALSE"]
        let v = ["ASSIZES","SUE","TESTATOR","RENT"]
        
        let hid = WordCalculator.extractPositions(ofWords: h, from: words)
        let vid = WordCalculator.extractPositions(ofWords: v, from: words)
        let hl = WordCalculator.lengths8(words: h)
        let vl = WordCalculator.lengths8(words: v)
        
        let placements = [
            PlacementModel(w: hid[0], x: 4, y: 5, z: true, l: hl[0]),
            PlacementModel(w: hid[1], x: 5, y: 6, z: true, l: hl[1]),
            PlacementModel(w: hid[2], x: 0, y: 7, z: true, l: hl[2]),
            PlacementModel(w: hid[3], x: 3, y: 8, z: true, l: hl[3]),
            PlacementModel(w: hid[4], x: 0, y: 9, z: true, l: hl[4]),
            
            PlacementModel(w: vid[0], x: 4, y: 6, z: false, l: vl[0]),
            PlacementModel(w: vid[1], x: 5, y: 6, z: false, l: vl[1]),
            PlacementModel(w: vid[2], x: 6, y: 0, z: false, l: vl[2]),
            PlacementModel(w: vid[3], x: 7, y: 4, z: false, l: vl[3])
        ]
        
        let shape = ShapeModel(score: 0, width: placements.width(), height: placements.height(), placements: placements)
        //print(shape.ToString(words: words))
        let (shapeWithScore, _) = ShapeCalculator.ToValidShape(shape: shape, words: words)
        return [shapeWithScore!]
    }
}
