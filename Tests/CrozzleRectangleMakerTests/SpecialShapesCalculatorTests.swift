//
//  SpecialShapesCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 15/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class SpecialShapesCalculatorTests: XCTestCase {

    func test_C8703() {
        let words = ["JIFFY","LATE","ALWAYS","DAILY","FAST","OFT","YEAR"]
        
        let shape = SpecialShapesCalculator.C8703(words: words)
        
        print(shape.ToString(words: words))
    }
    
    func test_C8805() {
        let words = ["WOOL","MEAT","TANK","HARVEST","EWE","OATS","ROTATION"]
        
        let shape = SpecialShapesCalculator.C8805(words: words)
        
        print(shape.ToString(words: words))
    }

    func test_C9002a() {
        let words = ["NEPTUNE","MARS","JUNO","REMUS","PAN","TROY","URANUS"]
        
        let shape = SpecialShapesCalculator.C9002a(words: words)
        
        print(shape.ToString(words: words))
    }
    
    func test_C9002b() {
        let words = ["OLYMPUS","ROMULUS","JANUS","SATYR","URANUS","JASON","MUSES","MEDUSA"]
        
        let shape = SpecialShapesCalculator.C9002b(words: words)
        
        print(shape.ToString(words: words))
    }
    
    func test_C9101() {
        let words = ["BAT","AMUSEMENT","SUN","HAT","BUSH","CASUAL","TENT"]
        
        let shape = SpecialShapesCalculator.C9101(words: words)
        
        print(shape.ToString(words: words))
    }
    
    func test_C9102() {
        let words = ["SPEED","DOT","CANON","TYPE","DATA","SONY","LAPTOP","NEC"]
        
        let shape = SpecialShapesCalculator.C9102(words: words)
        
        print(shape.ToString(words: words))
    }
    
    func test_C9109() {
        let words = ["COPYPAPER","ANSWER","POST","TELLER","ORDER","PASTE","ENTER","BUZZERS"]
        
        let shape = SpecialShapesCalculator.C9109(words: words)
        
        print(shape.ToString(words: words))
    }
    
    func test_C9204() {
        let words = ["RITUAL","SAUCERS","BEANS","SHRUB","ICED","TEA","URN","ASSAM"]
        
        let shape = SpecialShapesCalculator.C9204(words: words)
        
        print(shape.ToString(words: words))
    }
    
    func test_C9209() {
        let words = ["ALAMO","CORPS","TNT","DIVISIONS","ACTION","MONS","FORTIFY"]
        
        let shape = SpecialShapesCalculator.C9209(words: words)
        
        print(shape.ToString(words: words))
    }
    
    func test_C9407() {
        let words = ["INUIT","SCOTT","WINTER","GUST","ICE","STORM"]
        
        let shape = SpecialShapesCalculator.C9407(words: words)
        
        print(shape.ToString(words: words))
    }
    
    func test_C9605() {
        let words = ["BAR","TESTIMONY","TREASON","SURTAX","FALSE","ASSIZES","SUE","TESTATOR","RENT"]
        
        let shape = SpecialShapesCalculator.C9605(words: words)
        
        print(shape.ToString(words: words))
    }
}
