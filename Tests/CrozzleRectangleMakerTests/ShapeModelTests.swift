//
//  ShapeModelTests.swift
//  
//
//  Created by Michael Geurtjens on 5/6/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class ShapeModelTests: XCTestCase {

    func test_area() {
        let gameList = GameList()
        
        if let game = gameList.getGame(gameId: 8612) {
            
            let edges = EdgeCalculator.Execute(words: game.words, scoreMin: 0, widthMax: 17, heightMax: 15)
            var shapes = ShapeCalculator.toShapes(edges: edges)
            
            //shapes.sort() { $0.density > $1.density}
            
            let shape = shapes[0]
            
            let text = shape.ToString(words: game.words)
            
            print(text)
            XCTAssertEqual(84, shape.score)
            XCTAssertEqual(6, shape.width)
            XCTAssertEqual(7, shape.height)
            
            // this is (6-2) * (7 - 2) = 4 * 5 = 20
            XCTAssertEqual(20, shape.area)
            
            // 84 divide by 20 = 4.2
            XCTAssertEqual(4.2, shape.density)
            
        }
    }

}
