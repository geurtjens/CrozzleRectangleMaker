//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 19/5/2023.
//

import Foundation
public struct ToCsv {
    public static func Save(filename: String, rectangles: [TopLeftBottomRightModel]) {
        var csvContent = "Score,Width,Height,W1,W2,W3,W4,D1,D2,D3,D4,X1,X2,X3,X4,Y1,Y2,Y3,Y4,Type"
        for rectangle in rectangles {
            let csv = rectangle.ToCsv()
            csvContent += "\n" + csv
        }
        
        
        let fileManager = FileManager.default
        do {
            let path = try fileManager.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
            let fileURL = path.appendingPathComponent(filename)
            try csvContent.write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {
            print("error creating file")
        }
        
        
    }
}
