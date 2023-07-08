//
//  ParseMarksFilesTests.swift
//  
//
//  Created by Michael Geurtjens on 9/7/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class ParseMarksFilesTests: XCTestCase {

    func test_extractGrids() {
        let filename = "/Users/michaelgeurtjens/Downloads/9605-r5/9605.txt.mintargetdump.txt"
        var grids = ParseMarksFiles.extractGrids(path: filename)
        
        // We should rotate the grids if they are not as width as they are height
        
        XCTAssertEqual(1640,grids.count)
    }
    
    func test_Execute() {
        let filename = "/Users/michaelgeurtjens/Downloads/9605-r5/9605.txt.mintargetdump.txt"
        var grids = ParseMarksFiles.execute(path: filename)
        
        // We should rotate the grids if they are not as width as they are height
        
        XCTAssertEqual(1640,grids.count)
    }
}
