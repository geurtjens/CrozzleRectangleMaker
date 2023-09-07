//
//  JeanCharlesFileConverterTests.swift
//  
//
//  Created by Michael Geurtjens on 7/9/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class JeanCharlesFileConverterTests: XCTestCase {

    
    func test_getFilenames() throws {
        let names = JeanCharlesFileConverter.getFilenames()
        print(names)
        
        let contents = JeanCharlesFileConverter.loadFilenames()
        XCTAssertEqual(names.count, contents.count)
    }
    
    func test_processFiles() {
        let result = JeanCharlesFileConverter.processFiles()
        XCTAssertEqual(605, result.count)
    }

    func test_execute() {
        JeanCharlesFileConverter.execute()
        //XCTAssertEqual(605, result.count)
    }
}
