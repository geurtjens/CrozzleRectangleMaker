//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 6/6/2023.
//

import Foundation
public struct PacmanModel : ShapeProtocol {

    public let pacmanType: PacmanType
    public let wordsHorizontal: [Int]
    public let wordsVertical: [Int]
    public let patternHorizontal: [ClusterPosition]
    public let patternVertical: [ClusterPosition]
    
    public let hLen: [UInt8]
    public let vLen: [UInt8]
    
    public let score: UInt16
    public let width: UInt8
    public let height: UInt8
    
    public init(pacmanType: PacmanType, wordsHorizontal: [Int], wordsVertical: [Int], patternHorizontal: [ClusterPosition], patternVertical: [ClusterPosition], words: [String], end: [String], len:[Int]) {
        self.pacmanType = pacmanType
        self.wordsHorizontal = wordsHorizontal
        self.wordsVertical = wordsVertical
        self.patternHorizontal = patternHorizontal
        self.patternVertical = patternVertical
        
        var _hLen: [UInt8] = []
        for i in 0..<wordsHorizontal.count {
            _hLen.append(UInt8(len[wordsHorizontal[i]]))
        }
        var _vLen: [UInt8] = []
        for i in 0..<wordsVertical.count {
            _vLen.append(UInt8(len[wordsVertical[i]]))
        }
                
        self.hLen = _hLen
        self.vLen = _vLen
        self.score = PacmanModel.scoreCalculator(
            type: pacmanType,
            wordsHorizontal: wordsHorizontal,
            start: words,
            end: end)
        
        self.width = PacmanModel.widthCalculator(
            type: pacmanType,
            len: _hLen)
        
        self.height = PacmanModel.heightCalculator(
            type: pacmanType,
            len: _vLen)
    }
    
    
    public static func widthCalculator(type: PacmanType, len:[UInt8]) -> UInt8 {
        
        let len0 = Int(len[0])
        let len1 = Int(len[1])
        let len2 = Int(len[2])

        let interlockWidth = 3
        
        switch type {
        case .topRight:
            let maxLeading = max(len0 + 1, len2)
            let maxTrailing = len1
            return UInt8(maxLeading + maxTrailing - interlockWidth + 2)
        case .bottomRight:
            let maxLeading = max(len0, len2 + 1)
            let maxTrailing = len1
            return UInt8(maxLeading + maxTrailing - interlockWidth + 2)
        case .topLeft:
            let maxLeading = len1
            let maxTrailing = max(len0 + 1, len2)
            return UInt8(maxLeading + maxTrailing - interlockWidth + 2)
        }
    }
    
    public static func heightCalculator(type: PacmanType, len:[UInt8]) -> UInt8 {
        
        let len0 = Int(len[0])
        let len1 = Int(len[1])
        let len2 = Int(len[2])

        let interlockHeight = 3
        
        switch type {
        case .topRight:
            let maxLeading = len1
            let maxTrailing = max(len0, len2 + 1)
            return UInt8(maxLeading + maxTrailing - interlockHeight + 2)
        case .bottomRight:
            let maxLeading = max(len0, len2 + 1)
            let maxTrailing = len1
            return UInt8(maxLeading + maxTrailing - interlockHeight + 2)
        case .topLeft:
            let maxLeading = len1
            let maxTrailing = max(len0 + 1, len2)
            return UInt8(maxLeading + maxTrailing - interlockHeight + 2)
        }
    }
    
    
    
    
    
    public static func scoreCalculator(type: PacmanType, wordsHorizontal: [Int], start: [String], end: [String]) -> UInt16 {
        
        var score = 6 * 10
        
        switch type {
        case .topRight:
            let word0 = end[wordsHorizontal[0]]
            let word1 = start[wordsHorizontal[1]]
            let word2 = end[wordsHorizontal[2]]
            // last 2 characters in word
            
            for i in 0..<2 {
                score += ScoreCalculator.score(forLetter: word0[i])
            }
            for i in 0..<3 {
                score += ScoreCalculator.score(forLetter: word1[i])
            }
            for i in 0..<3 {
                score += ScoreCalculator.score(forLetter: word2[i])
            }
            
            return UInt16(score)
        case .bottomRight:
            let word0 = end[wordsHorizontal[0]]
            let word1 = start[wordsHorizontal[1]]
            let word2 = end[wordsHorizontal[2]]
            // last 2 characters in word
            
            for i in 0..<3 {
                score += ScoreCalculator.score(forLetter: word0[i])
            }
            for i in 0..<3 {
                score += ScoreCalculator.score(forLetter: word1[i])
            }
            for i in 0..<2 {
                score += ScoreCalculator.score(forLetter: word2[i])
            }
            
            return UInt16(score)
        case .topLeft:
            let word0 = start[wordsHorizontal[0]]
            let word1 = end[wordsHorizontal[1]]
            let word2 = start[wordsHorizontal[2]]
            
            for i in 0..<2 {
                score += ScoreCalculator.score(forLetter: word0[i])
            }
            for i in 0..<3 {
                score += ScoreCalculator.score(forLetter: word1[i])
            }
            for i in 0..<3 {
                score += ScoreCalculator.score(forLetter: word2[i])
            }
            
            return UInt16(score)
        }
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

    
    public func maxLeftCalculate(hLen0: Int, hLen1: Int, hLen2: Int) -> Int {
        
        switch pacmanType {
        case .topRight:
            return max(hLen0 + 1, hLen2)
        case .bottomRight:
            return max(hLen0, hLen2 + 1)
        case .topLeft:
            return hLen1
        }
    }
    
    
    public func maxUpCalculate(vLen0: Int, vLen1: Int, vLen2: Int) -> Int {
        
        switch pacmanType {
        case .topRight:
            return vLen1
        case .bottomRight:
            return max(vLen0, vLen2 + 1)
        case .topLeft:
            return vLen1
        }
    }
        
    
    public func ToPlacement() -> [PlacementModel] {
 
        switch pacmanType {
        case .topRight:
            return topRightPlacements()
        case .bottomRight:
            return bottomRightPlacements()
        case .topLeft:
            return topLeftPlacements()
        }
    }
    
    
    func bottomRightPlacements() -> [PlacementModel] {
        let interlockWidth = UInt8(wordsVertical.count)
        let interlockHeight = UInt8(wordsHorizontal.count)
            
        let maxLeft = UInt8(max(hLen[0], hLen[2] + 1))
        let maxUp = UInt8(max(vLen[0], vLen[2] + 1))
        
        /*
            . .
            T S
            R.E
          .BULL.
           .SOLD.
        .UNITS.
            .S
             .
         */
        
        let x0 = maxLeft - hLen[0]
        let x1 = UInt8(maxLeft - interlockWidth)
        let x2 = maxLeft - hLen[2] - 1
        
        let x3 = UInt8(maxLeft + 1 - interlockWidth)
        let x4 = UInt8(maxLeft + 2 - interlockWidth)
        let x5 = UInt8(maxLeft + 3 - interlockWidth)
        
        let y0 = UInt8(maxUp + 1 - interlockHeight)
        let y1 = UInt8(maxUp + 2 - interlockHeight)
        let y2 = UInt8(maxUp + 3 - interlockHeight)
        
        let y3 = UInt8(maxUp - vLen[0])
        let y4 = UInt8(maxUp - interlockWidth)
        let y5 = UInt8(maxUp - vLen[2] - 1)
        
        var placements = [
            PlacementModel(w: UInt8(wordsHorizontal[0]), x: x0, y: y0, z: true, l: hLen[0]),
            PlacementModel(w: UInt8(wordsHorizontal[1]), x: x1, y: y1, z: true, l: hLen[1]),
            PlacementModel(w: UInt8(wordsHorizontal[2]), x: x2, y: y2, z: true, l: hLen[2]),
            
            PlacementModel(w: UInt8(wordsVertical[0]), x: x3, y: y3, z: false, l: vLen[0]),
            PlacementModel(w: UInt8(wordsVertical[1]), x: x4, y: y4, z: false, l: vLen[1]),
            PlacementModel(w: UInt8(wordsVertical[2]), x: x5, y: y5, z: false, l: vLen[2])
        ]
        placements.sort() { $0.w < $1.w}
        return placements
        
    }
    
    func topLeftPlacements() -> [PlacementModel] {
            
        let interlockWidth = UInt8(wordsVertical.count)
        let interlockHeight = UInt8(wordsHorizontal.count)
        
        let maxLeft = UInt8(hLen[1] - interlockWidth)
        let maxUp = UInt8(vLen[1] - interlockHeight)
        
        /*
                .
                N
                O.
               .TRUST.
          .TRUSTEE.
              .ASSETS.
               X.E
               . R
                 V
                 E
                 .
        */
        let x0 = UInt8(maxLeft + 1) // Plus one because the size of the top must include the last . as its a pacman placement
        let x1 = UInt8(0)
        let x2 = UInt8(maxLeft)
        
        let x3 = UInt8(maxLeft + 1)
        let x4 = UInt8(maxLeft + 2)
        let x5 = UInt8(maxLeft + 3)
        
        let y0 = UInt8(maxUp + 1)
        let y1 = UInt8(maxUp + 2)
        let y2 = UInt8(maxUp + 3)
        
        let y3 = maxUp + 1
        let y4 = UInt8(0)
        let y5 = maxUp
        
        var placements = [
            PlacementModel(w: UInt8(wordsHorizontal[0]), x: x0, y: y0, z: true, l: hLen[0]),
            PlacementModel(w: UInt8(wordsHorizontal[1]), x: x1, y: y1, z: true, l: hLen[1]),
            PlacementModel(w: UInt8(wordsHorizontal[2]), x: x2, y: y2, z: true, l: hLen[2]),
            
            PlacementModel(w: UInt8(wordsVertical[0]), x: x3, y: y3, z: false, l: vLen[0]),
            PlacementModel(w: UInt8(wordsVertical[1]), x: x4, y: y4, z: false, l: vLen[1]),
            PlacementModel(w: UInt8(wordsVertical[2]), x: x5, y: y5, z: false, l: vLen[2])
        ]
        placements.sort() { $0.w < $1.w}
        return placements
        
 
    }
    
    func topRightPlacements() -> [PlacementModel] {
        let interlockWidth = UInt8(wordsVertical.count)
        let interlockHeight = UInt8(wordsHorizontal.count)
        
            
        let maxLeft = UInt8(max(hLen[0] + 1, hLen[2]))
        let maxUp = UInt8(vLen[1] - interlockHeight)
        
        /*
                 .
                 B
                .U
           .PARITY.
               .RESERVE.
         .DEBENTURE.
                S.L
                T L
                . .
         */
        
        //print(hLen)
        // The difference between the maximum length leading and the length of the word
        let x0 = UInt8(maxLeft - hLen[0] - 1) // Plus one because the size of the top must include the last . as its a pacman placement
        let x1 = maxLeft - interlockWidth
        let x2 = UInt8(maxLeft - hLen[2])
        
        let x3 = UInt8(maxLeft + 1 - interlockWidth)
        let x4 = UInt8(maxLeft + 2 - interlockWidth)
        let x5 = UInt8(maxLeft + 3 - interlockWidth)
        
        let y0 = UInt8(maxUp + 1)
        let y1 = UInt8(maxUp + 2)
        let y2 = UInt8(maxUp + 3)
        
        let y3 = maxUp
        let y4 = UInt8(0)
        let y5 = maxUp + 1
        
        var placements = [
            PlacementModel(w: UInt8(wordsHorizontal[0]), x: x0, y: y0, z: true, l: hLen[0]),
            PlacementModel(w: UInt8(wordsHorizontal[1]), x: x1, y: y1, z: true, l: hLen[1]),
            PlacementModel(w: UInt8(wordsHorizontal[2]), x: x2, y: y2, z: true, l: hLen[2]),
            
            PlacementModel(w: UInt8(wordsVertical[0]), x: x3, y: y3, z: false, l: vLen[0]),
            PlacementModel(w: UInt8(wordsVertical[1]), x: x4, y: y4, z: false, l: vLen[1]),
            PlacementModel(w: UInt8(wordsVertical[2]), x: x5, y: y5, z: false, l: vLen[2])
        ]
        
        placements.sort() { $0.w < $1.w}
        return placements
            
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
}

