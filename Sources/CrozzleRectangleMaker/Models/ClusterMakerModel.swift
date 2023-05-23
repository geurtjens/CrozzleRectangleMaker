//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 21/5/2023.
//

import Foundation

// This will construct the shape and get its width height and score so we can work out if its valid

struct ClusterMakerModel : ShapeProtocol {
    
    let wordsHorizontal: [Int]
    let wordsVertical: [Int]
    let patternHorizontal: [ClusterPosition]
    let patternVertical: [ClusterPosition]
    
    let lengthsHorizontal: [UInt8]
    let lengthsVertical: [UInt8]
    
    let score: Int
    let width: Int
    let height: Int
    
    init(wordsHorizontal: [Int], wordsVertical: [Int], patternHorizontal: [ClusterPosition], patternVertical: [ClusterPosition], start: [String], end: [String], len:[Int]) {
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
        self.score = ClusterMakerModel.scoreCalculator(wordsHorizontal: wordsHorizontal,
                                     patternHorizontal: patternHorizontal,
                                     start: start,
                                     end: end,
                                     horizontalWordCount: wordsHorizontal.count,
                                     verticalWordCount: wordsVertical.count)
        
        self.width = ClusterMakerModel.widthCalculation(words: wordsHorizontal, patterns: patternHorizontal, wordCountOther: wordsVertical.count, len: _lengthsHorizontal)
        
        self.height = ClusterMakerModel.widthCalculation(words: wordsVertical, patterns: patternVertical, wordCountOther: wordsHorizontal.count, len: _lengthsVertical)
    }
    
    
    
    func maxLeftCalculate() -> Int {
        
        var maxLeft = 0
        
        for i in 0..<wordsHorizontal.count {
            let length = Int(lengthsHorizontal[i]) - wordsVertical.count
            
            if patternHorizontal[i] == .leading && length > maxLeft {
                maxLeft = length
            }
        }
        return maxLeft
    }
    
    func maxUpCalculate() -> Int {
        
        var maxUp = 0
        
        for i in 0..<wordsVertical.count {
            let length = Int(lengthsVertical[i]) - wordsHorizontal.count
            
            if patternVertical[i] == .leading && length > maxUp {
                maxUp = length
            }
        }
        return maxUp
    }
    
    static func widthCalculation(words: [Int], patterns: [ClusterPosition], wordCountOther: Int, len:[UInt8]) -> Int {
        
        var maxLeft = 0
        var maxRight = 0
        for i in 0..<words.count {
            let length = Int(len[i]) - wordCountOther
            let pattern = patterns[i]
            
            switch (pattern) {
            case .leading:
                if length > maxLeft {
                    maxLeft = length
                }
            case .trailing:
                if length > maxRight {
                    maxRight = length
                }
            case .middle:
                break
            case .outer:
                break
            }
        }
        let width = maxLeft + maxRight + wordCountOther + 2
        return width
    }
    
    static func scoreCalculator(wordsHorizontal: [Int],patternHorizontal: [ClusterPosition], start: [String], end: [String], horizontalWordCount: Int, verticalWordCount: Int) -> Int {
        
        var score = (horizontalWordCount + verticalWordCount) * 10
        
        for i in 0..<patternHorizontal.count {
            switch (patternHorizontal[i]) {
            case .leading:
                for j in 0..<verticalWordCount {
                    score += ScoreCalculator.score(forLetter: end[wordsHorizontal[i]][j])
                }
            case .trailing:
                for j in 0..<verticalWordCount {
                    score += ScoreCalculator.score(forLetter: end[wordsHorizontal[i]][j])
                }
            case .middle:
                for j in 0..<verticalWordCount {
                    score += ScoreCalculator.score(forLetter: end[wordsHorizontal[i]][j])
                }
            case .outer:
                break;
            }
        }
        return score
    }
    
    public func csvWords(words:[String]) -> String {
        // lets have a look what we are doing first
        var csv = ""
        for i in wordsHorizontal {
            csv += words[i] + ","
        }
        for i in wordsVertical {
            csv += words[i] + ","
        }
        print(csv)
        return csv
    }

        
    func ToPlacement() -> [PlacementModel] {

        let interlockWidth = wordsVertical.count
        let interlockHeight = wordsHorizontal.count
        
        let maxLeft = maxLeftCalculate()
        let maxUp = maxUpCalculate()
        
        var placements: [PlacementModel] = []
        for i in 0..<wordsHorizontal.count {
            let pattern = patternHorizontal[i]
            let length = Int(lengthsHorizontal[i]) - interlockWidth
            let y = maxUp + i + 1
            let wordId = wordsHorizontal[i]
            if pattern == .leading {
                let placement = PlacementModel(i: wordId, h: true, x: maxLeft - length, y: y)
                placements.append(placement)
            } else {
                let placement = PlacementModel(i: wordId, h: true, x: maxLeft, y: y)
                placements.append(placement)
            }
        }
        for i in 0..<wordsVertical.count {
            let pattern = patternVertical[i]
            let length = Int(lengthsVertical[i]) - interlockHeight
            let x = maxLeft + i + 1
            let wordId = wordsVertical[i]
            if pattern == .leading {
                let placement = PlacementModel(i: wordId, h: false, x: x, y: maxUp - length)
                placements.append(placement)
            } else {
                // y is maxUp - 1 because it needs to add his .
                let placement = PlacementModel(i: wordId, h: false, x: x, y: maxUp)
                placements.append(placement)
            }
        }
        return placements
    }
    
    func isValid(scoreMin: Int, widthMax: Int, heightMax: Int) -> Bool {
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
}
