//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 14/6/2023.
//

import Foundation
public struct OuterModel {
    public let wordsHorizontal: [Int]
    public let wordsVertical: [Int]
    public let patternHorizontal: [ClusterPosition]
    public let patternVertical: [ClusterPosition]
    
    public let outerPos: [Int]
    
    public let lengthsHorizontal: [UInt8]
    public let lengthsVertical: [UInt8]
    
    public let score: UInt16
    public let width: UInt8
    public let height: UInt8
    
    public init(wordsHorizontal: [Int], wordsVertical: [Int], patternHorizontal: [ClusterPosition], patternVertical: [ClusterPosition], start: [String], end: [String], len:[Int], outerPos:[Int]) {
        self.outerPos = outerPos
        self.wordsHorizontal = wordsHorizontal
        self.wordsVertical = wordsVertical
        self.patternHorizontal = patternHorizontal
        self.patternVertical = patternVertical
        
        var _lengthsHorizontal: [UInt8] = []
        for i in 0..<wordsHorizontal.count {
            _lengthsHorizontal.append(UInt8(len[wordsHorizontal[i]]))
        }
        var _lengthsVertical: [UInt8] = []
        for i in 0..<wordsVertical.count {
            _lengthsVertical.append(UInt8(len[wordsVertical[i]]))
        }
                
        self.lengthsHorizontal = _lengthsHorizontal
        self.lengthsVertical = _lengthsVertical
        self.score = ClusterModel.scoreCalculator(wordsHorizontal: wordsHorizontal,
                                     patternHorizontal: patternHorizontal,
                                     start: start,
                                     end: end,
                                     horizontalWordCount: wordsHorizontal.count,
                                     verticalWordCount: wordsVertical.count)
        
        self.width = ClusterModel.widthCalculation(words: wordsHorizontal, patterns: patternHorizontal, wordCountOther: wordsVertical.count, len: _lengthsHorizontal)
        
        self.height = ClusterModel.widthCalculation(words: wordsVertical, patterns: patternVertical, wordCountOther: wordsHorizontal.count, len: _lengthsVertical)
    }
}
