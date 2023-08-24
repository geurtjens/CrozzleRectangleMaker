//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 22/8/2023.
//

import Foundation
class PacmanCalculatorV3 {
    
    
    public static func ExecuteAllSerial(scoreMin: Int) -> Int  {
        
        let gameList = GameList()
        
        let startTime = DateTimeCalculator.now()
        var count = 0
        
        for game in gameList.games {

            var result = ExecuteSerial(
                words: game.words,
                scoreMin: scoreMin,
                widthMax: game.maxWidth,
                heightMax: game.maxHeight)
            
            print("PacmanCalculatorV3.ExecuteSerial: \(game.gameId), count: \(result.count)")
            
            count += result.count
        }
        let finishTime = DateTimeCalculator.now()
        let duration = DateTimeCalculator.duration(start: startTime, finish: finishTime)
        
        print("\(count) records found in \(duration)")
        return count
    }
    
    public static func ExecuteAll_TopLeft(scoreMin: Int) -> Int {
       
        let startTime = DateTimeCalculator.now()
        var count = 0
        /// We want to calculate new to see how long it takes and then compare with old
        let gameList = GameList()
        for game in gameList.games {
            let words = game.words
            let len = WordCalculator.lengths(words: words)
            let letterIndex = LetterIndexModel(words: words)
            let end = WordCalculator.reverse(words: words)
            let words2 = WordCalculator.WordsToInt(words: words)
            let end2 = WordCalculator.WordsToInt(words: end)
            
            let newResults = TopLeft(letterIndex: letterIndex, words: words2, end: end2, words2: words, end2: end, len: len, scoreMin: scoreMin, widthMax: game.maxWidth, heightMax: game.maxHeight)
            
            print("PacmanCalculatorV3.TopLeft: \(game.gameId), count: \(newResults.count)")
            
            count += newResults.count
        }
        let finishTime = DateTimeCalculator.now()
        let duration = DateTimeCalculator.duration(start: startTime, finish: finishTime)
        
        print("\(count) records found in \(duration)")
        return count
    }
    
    
    
    public static func ExecuteAll_TopRight(scoreMin: Int) -> Int {
       
        let startTime = DateTimeCalculator.now()
        var count = 0
        /// We want to calculate new to see how long it takes and then compare with old
        let gameList = GameList()
        for game in gameList.games {
            let words = game.words
            let len = WordCalculator.lengths(words: words)
            let letterIndex = LetterIndexModel(words: words)
            let end = WordCalculator.reverse(words: words)
            let words2 = WordCalculator.WordsToInt(words: words)
            let end2 = WordCalculator.WordsToInt(words: end)
            
            let newResults = TopRight(letterIndex: letterIndex, words: words2, end: end2, words2: words, end2: end, len: len, scoreMin: scoreMin, widthMax: game.maxWidth, heightMax: game.maxHeight)
            
            print("PacmanCalculatorV3.TopRight: \(game.gameId), count: \(newResults.count)")
            
            count += newResults.count
        }
        let finishTime = DateTimeCalculator.now()
        let duration = DateTimeCalculator.duration(start: startTime, finish: finishTime)
        
        print("\(count) records found in \(duration)")
        return count
    }
    
    public static func ExecuteAll_BottomRight(scoreMin: Int) -> Int {
       
        let startTime = DateTimeCalculator.now()
        var count = 0
        /// We want to calculate new to see how long it takes and then compare with old
        let gameList = GameList()
        for game in gameList.games {
            let words = game.words
            let len = WordCalculator.lengths(words: words)
            let letterIndex = LetterIndexModel(words: words)
            let end = WordCalculator.reverse(words: words)
            let words2 = WordCalculator.WordsToInt(words: words)
            let end2 = WordCalculator.WordsToInt(words: end)
            
            let newResults = BottomRight(letterIndex: letterIndex, words: words2, end: end2, words2: words, end2: end, len: len, scoreMin: scoreMin, widthMax: game.maxWidth, heightMax: game.maxHeight)
            
            print("PacmanCalculatorV3.TopLeft: \(game.gameId), count: \(newResults.count)")
            
            count += newResults.count
        }
        let finishTime = DateTimeCalculator.now()
        let duration = DateTimeCalculator.duration(start: startTime, finish: finishTime)
        
        print("\(count) records found in \(duration)")
        return count
    }
    
    // Its like PacmanCalculatorV4 but uses Int rather than UInt8
    
    // flips to bottom left so does not need to worry about duplicates.  Visually inspected
    
    static func ExecuteSerial(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [PacmanModel] {
        
        let letterIndex = LetterIndexModel(words: words)
        
        let len = WordCalculator.lengths(words: words)
        
        let end = WordCalculator.reverse(words: words)
        
        
        let uWords = WordCalculator.WordsToInt(words: words)
        let uEnd = WordCalculator.WordsToInt(words: end)
        
        
        let topRight = TopRight(letterIndex: letterIndex, words: uWords, end: uEnd, words2: words, end2: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let bottomRight = BottomRight(letterIndex: letterIndex, words: uWords, end: uEnd, words2: words, end2: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let topLeft = TopLeft(letterIndex: letterIndex, words: uWords, end: uEnd, words2: words, end2: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        return topRight + bottomRight + topLeft
    }
    
    
    static func TopRight(letterIndex: LetterIndexModel, words: [[Int]], end: [[Int]], words2: [String], end2: [String], len: [Int],
                         scoreMin: Int, widthMax: Int, heightMax: Int) -> [PacmanModel] {
        let interlockWidth = 3
        let interlockHeight = 3
        /*
                 .
                 B
                 U
           .PARITY.
               .RESERVE.
         .DEBENTURE.
                S.L
                T L
                . .
         */
        
        var result: [PacmanModel] = []
        let wordCount = words.count

        for _left1 in 0..<wordCount {

            if len[_left1] >= interlockWidth {

                //print("left1:\(words[_left1]), interlock: \(end[_left1][1])")
                let down1Words = letterIndex.find3(end[_left1][1])
                for down1 in down1Words {
                
                    if (down1.start == 0 && //words[_down1][0] == end[_left1][1])
                        len[down1.id] >= interlockHeight &&
                        down1.id != _left1) {

                        //print("down1:\(words[down1.id])")
                        //print("left1:\(words[_left1]), interlock: \(end[_left1][0])")
                        let up2Words = letterIndex.find3(end[_left1][0])
                        for up2 in up2Words {
                            
                            if (up2.end == 2 && //end[_up2][2] == end[_left1][0])
                                len[up2.id] >= interlockHeight &&
                                up2.id != down1.id &&
                                up2.id != _left1) {
                                 
                                //print("up2:\(words[up2.id]), interlock: \(end[up2.id][1])")
                                let right2Words = letterIndex.find3(end[up2.id][1])
                                for right2 in right2Words {
                                       
                                    if (right2.start == 1 && //words[_right2][1] == end[_up2][1])
                                        len[right2.id] >= interlockWidth &&
                                        words[right2.id][0] == words[down1.id][1] &&
                                        right2.id != up2.id &&
                                        right2.id != down1.id &&
                                        right2.id != _left1) {
                                            
                                        //print("right2:\(words[right2.id]), interlock: \(words[right2.id][2])")
                                        let down3Words = letterIndex.find3(words[right2.id][2])
                                        for down3 in down3Words {
                                                    
                                            if (down3.start == 0 && //words[_down3][0] == words[_right2][2]
                                                len[down3.id] >= interlockHeight &&
                                                down3.id != right2.id &&
                                                down3.id != up2.id &&
                                                down3.id != down1.id &&
                                                down3.id != _left1) {

                                                //print("down3:\(words[down3.id]), interlock: \(words[down3.id][1])")
                                                let left3Words = letterIndex.find3(words[down3.id][1])
                                                for left3 in left3Words {
                                                                
                                                    if (left3.end == 0 && //end[_left3][0] == words[_down3][1]
                                                        len[left3.id] >= interlockWidth &&
                                                        end[left3.id][1] == end[up2.id][0] &&
                                                        end[left3.id][2] == words[down1.id][2] &&
                                                        left3.id != down3.id &&
                                                        left3.id != down1.id &&
                                                        left3.id != up2.id &&
                                                        left3.id != right2.id &&
                                                        left3.id != _left1) {
                                                        
                                                        //print("left3:\(words[left3.id])")
                                                                   
                                                        let pacman = PacmanModel(
                                                            pacmanType: .topRight,
                                                            wordsHorizontal: [_left1, right2.id, left3.id],
                                                            wordsVertical: [down1.id, up2.id, down3.id],
                                                            patternHorizontal: [.leading, .trailing, .leading],
                                                            patternVertical: [.trailing, .leading, .trailing],
                                                            words: words2,
                                                            end: end2,
                                                            len: len)
                                                        
                                                        if pacman.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
                                                            result.append(pacman)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return result;
    }

    static func BottomRight(letterIndex: LetterIndexModel, words: [[Int]], end: [[Int]], words2: [String], end2: [String], len: [Int],
                            scoreMin: Int, widthMax: Int, heightMax: Int) -> [PacmanModel] {
        let interlockWidth = 3
        let interlockHeight = 3
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
        
        var result: [PacmanModel] = []
        let wordCount = words.count

        for _left1 in 0..<wordCount {
            
            if len[_left1] >= interlockWidth {

                //print("left1:\(words[_left1]), interlock: \(end[_left1][2])")
                let up1Words = letterIndex.find3(end[_left1][2])
                for up1 in up1Words {

                    if (up1.end == 2 && //end[_up1][2] == end[_left1][2])
                        len[up1.id] >= interlockHeight &&
                        up1.id > _left1) { /// So we dont do duplicates
                         
                        //print("down2:\(words[down2.id])")
                        //print("left1:\(words[_left1]), interlock: \(end[_left1][1])")
                        let down2Words = letterIndex.find3(end[_left1][1])
                        for down2 in down2Words {
                            
                            if (down2.start == 0 && //words[_down2][0] == end[_left1][1])
                                len[down2.id] >= interlockHeight &&
                                down2.id != up1.id &&
                                down2.id != _left1) {
                                
                                //print("down2:\(words[down2.id]), interlock: \(words[down2.id][1])")
                                let right2Words = letterIndex.find3(words[down2.id][1])
                                for right2 in right2Words {
                                        
                                    if (right2.start == 1 && //words[_right2][1] == words[_down2][1]
                                        len[right2.id] >= interlockWidth &&
                                        words[right2.id][0] == end[up1.id][1] &&
                                        right2.id != up1.id &&
                                        right2.id != down2.id &&
                                        right2.id != _left1) {
                                            
                                        //print("right2:\(words[right2.id]), interlock: \(words[right2.id][2])")
                                        let up3Words = letterIndex.find3(words[right2.id][2])
                                        for up3 in up3Words {

                                            if (up3.end == 0 && //end[_up3][0] == words[_right2][2]
                                                len[up3.id] >= interlockHeight &&
                                                end[up3.id][1] == end[_left1][0] &&
                                                up3.id != up1.id &&
                                                up3.id != down2.id &&
                                                up3.id != right2.id &&
                                                up3.id != _left1) {
                                                   
                                                //print("up3:\(words[up3.id]), interlock: \(end[up1.id][0])") // Is this supposed to be up1 and not up3?
                                                let left3Words = letterIndex.find3(end[up1.id][0])
                                                
                                                for left3 in left3Words {
                                                                
                                                    if (left3.end == 1 && //end[_left3][1] == end[_up1][0] &&
                                                        len[left3.id] >= interlockWidth &&
                                                        end[left3.id][0] == words[down2.id][2] &&
                                                        left3.id != up1.id &&
                                                        left3.id != down2.id &&
                                                        left3.id != up3.id &&
                                                        left3.id != right2.id &&
                                                        left3.id != _left1) {
                                                                       
                                                        //print("left3:\(words[left3.id])")
                                                        
                                                        let pacman = PacmanModel(
                                                            pacmanType: .bottomRight,
                                                            wordsHorizontal: [_left1, right2.id, left3.id],
                                                            wordsVertical: [up1.id, down2.id, up3.id],
                                                            patternHorizontal: [.leading, .trailing, .leading],
                                                            patternVertical: [.leading, .trailing, .leading],
                                                            words: words2,
                                                            end: end2,
                                                            len: len)
                                                                    
                                                        if pacman.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
                                                            result.append(pacman)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return result
    }
    
    
    // Flips to topLeft, visually verified
    // This does not appear in any winning game
    static func TopLeft(letterIndex: LetterIndexModel, words: [[Int]], end: [[Int]], words2: [String], end2: [String], len: [Int],
                        scoreMin: Int, widthMax: Int, heightMax: Int) -> [PacmanModel] {
        
        let interlockWidth = 3
        let interlockHeight = 3
    
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
        let wordCount = words.count
        var result: [PacmanModel] = []
        
        for _right1 in 0..<wordCount {
            
            if len[_right1] >= interlockWidth {

                //print("right1:\(words[_right1]), interlock: \(words[_right1][0])")
                let up2Words = letterIndex.find3(words[_right1][0])
                for up2 in up2Words {
                
                    if (up2.end == 2 && //end[_up2][2] == words[_right1][0])
                        len[up2.id] >= interlockHeight &&
                        up2.id != _right1) {
                        
                        //print("up2:\(words[up2.id]), interlock: \(end[up2.id][1])")
                        let left2Words = letterIndex.find3(end[up2.id][1])
                        for left2 in left2Words {
                            
                            if (left2.end == 1 && //end[_left2][1] == end[_up2][1])
                                len[left2.id] >= interlockWidth &&
                                left2.id != up2.id &&
                                left2.id != _right1) {
                                    
                                //print("left2:\(words[left2.id]), interlock: \(end[left2.id][0])")
                                let down3Words = letterIndex.find3(end[left2.id][0])
                                for down3 in down3Words {
                                        
                                    if (down3.start == 1 && //words[_down3][1] == end[_left2][0]
                                        len[down3.id] >= interlockHeight &&
                                        words[down3.id][0] == words[_right1][1] &&
                                        down3.id != up2.id &&
                                        down3.id != left2.id &&
                                        down3.id != _right1) {
                                             
                                        //print("down3:\(words[down3.id]), interlock: \(words[down3.id][2])")
                                        let right3Words = letterIndex.find3(words[down3.id][2])
                                        for right3 in right3Words {

                                            if (right3.start == 2 && //words[_right3][2] == words[_down3][2]
                                                len[right3.id] >= interlockWidth &&
                                                words[right3.id][1] == end[up2.id][0] &&
                                                right3.id != down3.id &&
                                                right3.id != left2.id &&
                                                right3.id != up2.id &&
                                                right3.id != _right1) {
            
                                                //print("right3:\(words[right3.id]), interlock: \(words[right3.id][0])")
                                                let down1Words = letterIndex.find3(words[right3.id][0])
                                                for down1 in down1Words {
                
                                                    if (down1.start == 1 && //words[_down1][1] == words[_right3][0])
                                                        len[down1.id] >= interlockHeight &&
                                                        words[down1.id][0] == end[left2.id][2] &&
                                                        down1.id != right3.id &&
                                                        down1.id != down3.id &&
                                                        down1.id != left2.id &&
                                                        down1.id != up2.id &&
                                                        down1.id > _right1) {

                                                        //print("down1:\(words[down1.id])")
                                                        
                                                        let pacman = PacmanModel(
                                                            pacmanType: .topLeft,
                                                            wordsHorizontal: [_right1, left2.id, right3.id],
                                                            wordsVertical: [down1.id, up2.id, down3.id],
                                                            patternHorizontal: [.trailing, .leading, .trailing],
                                                            patternVertical: [.trailing, .leading, .trailing],
                                                            words: words2,
                                                            end: end2,
                                                            len: len)
                                                                    
                                                        
                                                        
                                                        if pacman.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
                                                            result.append(pacman)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

        }

        //let resultNoDuplicates = ShapeCalculator.RemoveDuplicates(shapes:result)
        
        return result
    }
}
