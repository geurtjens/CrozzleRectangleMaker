//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 14/6/2023.
//

import Foundation
public struct OuterModel : ShapeProtocol {
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
                
        // lets find the outer
        
        
        
        self.lengthsHorizontal = _lengthsHorizontal
        self.lengthsVertical = _lengthsVertical
//        self.score = ClusterModel.scoreCalculator(wordsHorizontal: wordsHorizontal,
//                                     patternHorizontal: patternHorizontal,
//                                     start: start,
//                                     end: end,
//                                     horizontalWordCount: wordsHorizontal.count,
//                                     verticalWordCount: wordsVertical.count)
//
        self.width = ClusterModel.widthCalculation(words: wordsHorizontal, patterns: patternHorizontal, wordCountOther: wordsVertical.count, len: _lengthsHorizontal)
        
        
        var outerStart = outerPos[0]
        var outerLocation = 0
        var middleLocation = 1
        if outerStart == -1 {
            outerLocation = 1
            middleLocation = 0
            outerStart = outerPos[1]
        }
        
        let middleWord = start[wordsVertical[middleLocation]]
        let outerWord = start[wordsVertical[outerLocation]]
        
        var score = (wordsHorizontal.count + wordsVertical.count) * 10
        
        for letter in middleWord {
            score += ScoreCalculator.score(forLetter: letter)
        }
        for i in 0..<wordsHorizontal.count {
            score += ScoreCalculator.score(forLetter: outerWord[outerStart + i])
        }
        
        self.score = UInt16(score)
        
        
        var _height = _lengthsVertical[outerLocation] + 2
        if outerPos[0] == -1 {
            _height = _lengthsVertical[1] + 2
        }
        
        self.height = _height
    }
    
    public func isValid(scoreMin: Int, widthMax: Int, heightMax: Int) -> Bool {
        if self.score < scoreMin {
            return false
        }
        if (self.width <= widthMax && self.height <= heightMax) ||
            (self.width <= heightMax && self.height <= widthMax) {
            return true
        } else {
            return false
        }
    }
    
    public func maxLeftCalculate() -> Int {
        
        var maxLeft = 0
        
        for i in 0..<wordsHorizontal.count {
            let length = Int(lengthsHorizontal[i]) - wordsVertical.count
            
            if patternHorizontal[i] == .leading && length > maxLeft {
                maxLeft = length
            }
        }
        return maxLeft
    }
    
    public func ToPlacement() -> [PlacementModel] {

        let interlockWidth = wordsVertical.count
        //let interlockHeight = wordsHorizontal.count
        
        // Get the outerStart
        
        var maxUp = 1
        for item in self.outerPos {
            if item != -1 {
                maxUp = item
            }
        }

        // This means that outerStart + 1 is the y location of middle and also the starting y of all the horizontal words
        
        
        
        let maxLeft = maxLeftCalculate()
        
        var placements: [PlacementModel] = []
        for i in 0..<wordsHorizontal.count {
            let pattern = patternHorizontal[i]
            let length = Int(lengthsHorizontal[i]) - interlockWidth
            let y = maxUp + i + 1
            let wordId = wordsHorizontal[i]
            if pattern == .leading {
                let placement = PlacementModel(w: UInt8(wordId), x: UInt8(maxLeft - length), y: UInt8(y), z: true, l: lengthsHorizontal[i])
                placements.append(placement)
            } else {
                let placement = PlacementModel(w: UInt8(wordId), x: UInt8(maxLeft), y: UInt8(y), z: true, l: lengthsHorizontal[i])
                placements.append(placement)
            }
        }
        
        // the outer is the one at the top and the middle is the one starting at maxUp
        
        var outerLocation = 0
        //var middleLocation = 1
        if self.outerPos[0] == -1 {
            outerLocation = 1
            //middleLocation = 0
        }
        
        let w0 = UInt8(self.wordsVertical[0])
        let w1 = UInt8(self.wordsVertical[1])
        let len0 = UInt8(self.lengthsVertical[0])
        let len1 = UInt8(self.lengthsVertical[1])
        
        if outerLocation == 0 {
            
            let outerPlacement = PlacementModel(w: w0, x: UInt8(maxLeft+1), y: 0, z: false, l: len0)
            let middlePlacement = PlacementModel(w: w1, x: UInt8(maxLeft+2), y: UInt8(maxUp), z: false, l: len1)
            
            placements.append(outerPlacement)
            placements.append(middlePlacement)
        } else {
            let middlePlacement = PlacementModel(w: w0, x: UInt8(maxLeft+1), y: UInt8(maxUp), z: false, l: len0)
            let outerPlacement = PlacementModel(w: w1, x: UInt8(maxLeft+2), y: 0, z: false, l: len1)
            
            placements.append(middlePlacement)
            placements.append(outerPlacement)
        }
        
        //placements.sort { $0.w < $1.w }
        return placements
    }
}
