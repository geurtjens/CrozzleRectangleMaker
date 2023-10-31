
//
//  OuterCalculatorV2.swift
//
//
//  Created by Michael Geurtjens on 23/8/2023.
//

import Foundation
public class OuterCalculatorV2 {
    
    public static func ExecuteAllSerial(scoreMin: Int, includeBreakdown: Bool = true) -> Int {
        let startTime = DateTimeCalculator.now()
        var count = 0
        /// We want to calculate new to see how long it takes and then compare with old
        let gameList = GameList()
        for game in gameList.games {
            
            let clusters = Execute(words: game.words, scoreMin: scoreMin, widthMax: game.widthMax, heightMax: game.heightMax)
            
//            for item in clusters {
//                print(item.ToShape().ToText(words: game.words))
//            }
            if includeBreakdown {
                print("OuterCalculatorV2.Execute: \(game.gameId), count: \(clusters.count)")
            }
            count += clusters.count
        }
        let finishTime = DateTimeCalculator.now()
        let duration = DateTimeCalculator.duration(start: startTime, finish: finishTime)
        
        print("OuterCalculatorV2.Execute: \(count) records found in \(duration)")
        return count
    }
    
    public static func Execute(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [OuterModel] {
        let letterIndex = LetterIndexModel(words: words)
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
//        let tryThisFirst = C2x4_LRLR_MO(letterIndex: letterIndex, words: words, end: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
//        return tryThisFirst
        
        let c2x3 = C2x3(letterIndex: letterIndex, words: words, end: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let c2x4 = C2x4(letterIndex: letterIndex, words: words, end: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        let result = c2x3 + c2x4
        return result
    }
    
    public static func C2x3(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [OuterModel] {
        
        let LRL_MO = C2x3_LRL_MO(letterIndex: letterIndex, words: words, end: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let LRL_OM = C2x3_LRL_OM(letterIndex: letterIndex, words: words, end: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let RLR_MO = C2x3_RLR_MO(letterIndex: letterIndex, words: words, end: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let RLR_OM = C2x3_RLR_OM(letterIndex: letterIndex, words: words, end: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
                
        let result = LRL_MO + LRL_OM + RLR_MO + RLR_OM
        
        return result
    }
    
    public static func C2x4(letterIndex: LetterIndexModel,words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [OuterModel] {
        
        let LRL_MO = C2x4_LRLR_MO(letterIndex: letterIndex, words: words, end: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let LRL_OM = C2x4_LRLR_OM(letterIndex: letterIndex, words: words, end: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let RLR_MO = C2x4_RLRL_MO(letterIndex: letterIndex, words: words, end: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let RLR_OM = C2x4_RLRL_OM(letterIndex: letterIndex, words: words, end: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
                
        let result = LRL_MO + LRL_OM + RLR_MO + RLR_OM
        
        return result
    }
    
    
    public static func C2x3_LRL_MO(letterIndex:LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [OuterModel] {
        
        let wordCount = words.count
        let interlockWidth = 2
        let interlockHeight = 3
        var result: [OuterModel] = []
        
        for _middle1 in 0..<wordCount {
            
            if (len[_middle1] == interlockHeight) {
                //print("middle1: \(words[_middle1]), interlock:\(words[_middle1][0])")
                let left1Words = letterIndex.find(words[_middle1][0])
                for left1 in left1Words {
                    
                    if (left1.end == 1 && // end[left1][1] == words[_middle1][0] &&
                        len[left1.id] >= interlockWidth &&
                        left1.id != _middle1) {
                        
                        //print("left1: \(words[left1.id]), interlock:\(end[left1.id][0])")
                        for _outer2 in 0..<wordCount {
                            
                            if (len[_outer2] >= interlockHeight+2 &&
                                _outer2 != left1.id &&
                                _outer2 != _middle1) {
                                
                                //print("outer2:\(words[_outer2])")
                                for outerPos2 in 1..<(len[_outer2]-interlockHeight) {
                                    
                                    if words[_outer2][outerPos2 + 0] == end[left1.id][0] {
                                
                                        //print("outer2:\(words[_outer2]), interlock:\(words[_middle1][1])")
                                        let right2Words = letterIndex.find(words[_middle1][1])
                                        for right2 in right2Words {
                                    
                                            if (right2.start == 0 && //words[right2.id][0] == words[_middle1][1] &&
                                                len[right2.id] >= interlockWidth &&
                                                words[right2.id][1] == words[_outer2][outerPos2 + 1] &&
                                                right2.id != _outer2 &&
                                                right2.id != left1.id &&
                                                right2.id != _middle1) {
                                        
                                                //print("right2:\(words[right2.id])")
                                                //print("middle1: \(words[_middle1]), interlock:\(words[_middle1][2])")
                                                let left3Words = letterIndex.find(words[_middle1][2])
                                                for left3 in left3Words {
                                                    
                                                    if (left3.end == 1 && //end[left3.id][1] == words[_middle1][2] &&
                                                        len[left3.id] >= interlockWidth &&
                                                        end[left3.id][0] == words[_outer2][outerPos2 + 2] &&
                                                        left3.id != right2.id &&
                                                        left3.id != _outer2 &&
                                                        left3.id != left1.id &&
                                                        left3.id != _middle1) {
                                                        
                                                        let cluster = OuterModel(
                                                            wordsHorizontal: [left1.id, right2.id, left3.id],
                                                            wordsVertical: [_middle1, _outer2],
                                                            patternHorizontal: [.leading, .trailing, .leading],
                                                            patternVertical: [.trailing, .leading],
                                                            words: words,
                                                            end: end,
                                                            len: len,
                                                            outerPos: [-1, outerPos2])
                                                        
                                                        if cluster.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
                                                            result.append(cluster)
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
    
    public static func C2x3_LRL_OM(letterIndex:LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [OuterModel] {
        
        let wordCount = words.count
        let interlockWidth = 2
        let interlockHeight = 3
        var result: [OuterModel] = []
        
        for _outer1 in 0..<wordCount {
            
            if (len[_outer1] >= interlockHeight + 2) {
                                
                for outerPos1 in 1..<(len[_outer1] - interlockHeight) {
                    
                    let left1Words = letterIndex.find(words[_outer1][outerPos1])
                    for left1 in left1Words {
                    
                        if (left1.end == 1 &&//end[left1][1] == words[_outer1][outerPos1 + 0] &&
                            len[left1.id] >= interlockWidth &&
                            left1.id != _outer1) {
                        
                            let middle2Words = letterIndex.find(end[left1.id][0])
                            for middle2 in middle2Words {
                                
                                if (middle2.start == 0 && //words[middle2][0] == end[left1][0] &&
                                    len[middle2.id] == interlockHeight &&
                                    middle2.id != left1.id &&
                                    middle2.id != _outer1) {
                                            
                                    let right2Words = letterIndex.find(words[_outer1][outerPos1 + 1])
                                    for right2 in right2Words {
                                                
                                        if (right2.start == 0 && //words[right2][0] == words[_outer1][outerPos1 + 1] &&
                                            len[right2.id] >= interlockWidth &&
                                            words[right2.id][1] == words[middle2.id][1] &&
                                            right2.id != middle2.id &&
                                            right2.id != left1.id &&
                                            right2.id != _outer1) {
                                                    
                                            let left3Words = letterIndex.find(words[_outer1][outerPos1 + 2])
                                            for left3 in left3Words {
                                                        
                                                if (left3.end == 1 && //end[left3][1] == words[_outer1][outerPos1 + 2] &&
                                                    len[left3.id] >= interlockWidth &&
                                                    end[left3.id][0] == words[middle2.id][2] &&
                                                    left3.id != right2.id &&
                                                    left3.id != middle2.id &&
                                                    left3.id != left1.id &&
                                                    left3.id != _outer1) {
                                                            
                                                    let cluster = OuterModel(
                                                        wordsHorizontal: [left1.id, right2.id, left3.id],
                                                        wordsVertical: [_outer1, middle2.id],
                                                        patternHorizontal: [.leading, .trailing, .leading],
                                                        patternVertical: [.trailing, .leading],
                                                        words: words,
                                                        end: end,
                                                        len: len,
                                                        outerPos: [outerPos1, -1])
                                                            
                                                    if cluster.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
                                                        result.append(cluster)
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
    
    
    public static func C2x3_RLR_OM(letterIndex: LetterIndexModel, words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [OuterModel] {

        let wordCount = words.count
        let interlockWidth = 2
        let interlockHeight = 3
        var result: [OuterModel] = []

        for _outer1 in 0..<wordCount {

             if (len[_outer1] >= interlockHeight + 2) {

                 for outerPos1 in 1..<(len[_outer1]-interlockHeight) {
                     
                     let right1Words = letterIndex.find(words[_outer1][outerPos1 + 0])
                     for right1 in right1Words {
                         
                         if (right1.start == 0 && //words[right1][0] == words[_outer1][outerPos1 + 0] &&
                             len[right1.id] >= interlockWidth &&
                             right1.id != _outer1) {
                             
                             let middle2Words = letterIndex.find(words[right1.id][1])
                             for middle2 in middle2Words {
                                 
                                 if (middle2.start == 0 && //words[middle2][0] == words[right1][1] &&
                                     len[middle2.id] == interlockHeight &&
                                     middle2.id != right1.id &&
                                     middle2.id != _outer1) {
                                     
                                     let left2Words = letterIndex.find(words[middle2.id][1])
                                     for left2 in left2Words {
                                         
                                         if (left2.end == 0 && //end[left2][0] == words[middle2][1] &&
                                             len[left2.id] >= interlockWidth &&
                                             end[left2.id][1] == words[_outer1][outerPos1 + 1] &&
                                             left2.id != middle2.id &&
                                             left2.id != right1.id &&
                                             left2.id != _outer1) {
                                             
                                             let right3Words = letterIndex.find(words[middle2.id][2])
                                             for right3 in right3Words {
                                                 
                                                 if (right3.start == 1 && //words[right3][1] == words[middle2][2] &&
                                                     len[right3.id] >= interlockWidth &&
                                                     words[right3.id][0] == words[_outer1][outerPos1 + 2] &&
                                                     right3.id != left2.id &&
                                                     right3.id != middle2.id &&
                                                     right3.id != right1.id &&
                                                     right3.id != _outer1) {
                                                     
                                                     let cluster = OuterModel(
                                                        wordsHorizontal: [right1.id, left2.id, right3.id],
                                                        wordsVertical: [_outer1, middle2.id],
                                                        patternHorizontal: [.trailing, .leading, .trailing],
                                                        patternVertical: [.trailing, .leading],
                                                        words: words,
                                                        end: end,
                                                        len: len,
                                                        outerPos: [outerPos1, -1])
                                                     
                                                     if cluster.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
                                                         result.append(cluster)
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
    
    public static func C2x3_RLR_MO(letterIndex: LetterIndexModel, words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [OuterModel] {

        let wordCount = words.count
        let interlockWidth = 2
        let interlockHeight = 3
        var result: [OuterModel] = []

        for _middle1 in 0..<wordCount {

             if (len[_middle1] == interlockHeight) {
       
                 let right1Words = letterIndex.find(words[_middle1][0])
                 for right1 in right1Words {
                         
                     if (right1.start == 0 && //words[right1][0] == words[_middle1][0] &&
                         len[right1.id] >= interlockWidth &&
                         right1.id != _middle1) {
                             
                         for _outer2 in 0..<wordCount {
                                 
                             if (len[_outer2] >= interlockHeight + 2 &&
                                 _outer2 != right1.id &&
                                 _outer2 != _middle1) {
                                     
                                 for outerPos2 in 1..<(len[_outer2] - interlockHeight) {
                                     
                                     if words[_outer2][outerPos2 + 0] == words[right1.id][1] {
                                     
                                         let left2Words = letterIndex.find(words[_outer2][outerPos2 + 1])
                                         for left2 in left2Words {
                                         
                                             if (left2.end == 0 && // end[left2][0] == words[outer2][outerPos2 + 1] &&
                                                 len[left2.id] >= interlockWidth &&
                                                 end[left2.id][1] == words[_middle1][1] &&
                                                 left2.id != _outer2 &&
                                                 left2.id != right1.id &&
                                                 left2.id != _middle1) {
                                             
                                                 let right3Words = letterIndex.find(words[_middle1][2])
                                                 for right3 in right3Words {
                                                     
                                                     if (right3.start == 0 && //words[right3][0] == words[_middle1][2] &&
                                                         len[right3.id] >= interlockWidth &&
                                                         words[right3.id][1] == words[_outer2][outerPos2 + 2] &&
                                                         right3.id != left2.id &&
                                                         right3.id != _outer2 &&
                                                         right3.id != right1.id &&
                                                         right3.id != _middle1) {
                                                         
                                                         let cluster = OuterModel(
                                                            wordsHorizontal: [right1.id, left2.id, right3.id],
                                                            wordsVertical: [_middle1, _outer2],
                                                            patternHorizontal: [.trailing, .leading, .trailing],
                                                            patternVertical: [.trailing, .leading],
                                                            words: words,
                                                            end: end,
                                                            len: len,
                                                            outerPos: [-1, outerPos2])
                                                         
                                                         if cluster.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
                                                             result.append(cluster)
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
    
    
    public static func C2x4_RLRL_MO(letterIndex: LetterIndexModel, words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [OuterModel] {

        let wordCount = words.count
        let interlockWidth = 2
        let interlockHeight = 4
        var result: [OuterModel] = []

        for _middle1 in 0..<wordCount {

             if (len[_middle1] == interlockHeight) {
       
                 let right1Words = letterIndex.find(words[_middle1][0])
                 for right1 in right1Words {
                         
                     if (right1.start == 0 && //words[right1.id][0] == words[_middle1][0] &&
                         len[right1.id] >= interlockWidth &&
                         right1.id != _middle1) {
                             
                         for _outer2 in 0..<wordCount {
                                 
                             if (len[_outer2] >= interlockHeight + 2 &&
                                 _outer2 != right1.id &&
                                 _outer2 != _middle1) {
                                 
                                 for outerPos2 in 1..<(len[_outer2] - interlockHeight) {
                                     
                                     if words[_outer2][outerPos2 + 0] == words[right1.id][1] {
                                         
                                         let left2Words = letterIndex.find(words[_outer2][outerPos2 + 1])
                                         for left2 in left2Words {
                                         
                                             if (left2.end == 0 && //end[left2.id][0] == words[outer2][outerPos2 + 1] &&
                                                 len[left2.id] >= interlockWidth &&
                                                 end[left2.id][1] == words[_middle1][1] &&
                                                 left2.id != _outer2 &&
                                                 left2.id != right1.id &&
                                                 left2.id != _middle1) {
                                             
                                                 let right3Words = letterIndex.find(words[_outer2][outerPos2 + 2])
                                                 for right3 in right3Words {
                                                 
                                                     if (right3.start == 1 && //words[right3.id][1] == words[outer2][outerPos2 + 2] &&
                                                        len[right3.id] >= interlockWidth &&
                                                         words[right3.id][0] == words[_middle1][2] &&
                                                         right3.id != left2.id &&
                                                         right3.id != _outer2 &&
                                                         right3.id != right1.id &&
                                                         right3.id != _middle1) {
                                                     
                                                         let left4Words = letterIndex.find(words[_outer2][outerPos2 + 3])
                                                         
                                                         for left4 in left4Words {
                                                             
                                                             if (left4.end == 0 && //end[left4.id][0] == words[outer2][outerPos2 + 3] &&
                                                                 len[left4.id] >= interlockWidth &&
                                                                 end[left4.id][1] == words[_middle1][3] &&
                                                                 left4.id != right3.id &&
                                                                 left4.id != left2.id &&
                                                                 left4.id != _outer2 &&
                                                                 left4.id != right1.id &&
                                                                 left4.id != _middle1) {
                                                                 
                                                                 let cluster = OuterModel(
                                                                    
                                                                    wordsHorizontal: [right1.id, left2.id, right3.id, left4.id],
                                                                    wordsVertical: [_middle1, _outer2],
                                                                    patternHorizontal: [.trailing, .leading, .trailing, .leading],
                                                                    patternVertical: [.trailing, .leading],
                                                                    words: words,
                                                                    end: end,
                                                                    len: len,
                                                                    outerPos: [-1, outerPos2])
                                                                 
                                                                 if cluster.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
                                                                     result.append(cluster)
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
             }
         }
         return result
    }
    
    
    public static func C2x4_RLRL_OM(letterIndex: LetterIndexModel, words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [OuterModel] {

        let wordCount = words.count
        let interlockWidth = 2
        let interlockHeight = 4
        var result: [OuterModel] = []

        for _outer1 in 0..<wordCount {

             if (len[_outer1] >= interlockHeight + 2) {

                 for outerPos1 in 1..<(len[_outer1] - interlockHeight) {
                 
                     let right1Words = letterIndex.find(words[_outer1][outerPos1 + 0])
                     for right1 in right1Words {
                         
                         if (right1.start == 0 && //words[right1.id][0] == words[_outer1][outerPos1 + 0] &&
                             len[right1.id] >= interlockWidth &&
                             right1.id != _outer1) {
                             
                             let middle2Words = letterIndex.find(words[right1.id][1])
                             for middle2 in middle2Words {
                                 
                                 if (middle2.start == 0 && //words[middle2.id][0] == words[right1.id][1] &&
                                     len[middle2.id] == interlockHeight &&
                                     middle2.id != right1.id &&
                                     middle2.id != _outer1) {
                                         
                                    let left2Words = letterIndex.find(words[middle2.id][1])
                                    for left2 in left2Words {
                                         
                                        if (left2.end == 0 && //end[left2.id][0] == words[middle2.id][1] &&
                                            len[left2.id] >= interlockWidth &&
                                            end[left2.id][1] == words[_outer1][outerPos1 + 1] &&
                                            left2.id != middle2.id &&
                                            left2.id != right1.id &&
                                            left2.id != _outer1) {
                                         
                                            let right3Words = letterIndex.find(words[middle2.id][2])
                                            for right3 in right3Words {
                                             
                                                if (right3.start == 1 && //words[right3.id][1] == words[middle2.id][2] &&
                                                     len[right3.id] >= interlockWidth &&
                                                     words[right3.id][0] == words[_outer1][outerPos1 + 2] &&
                                                     right3.id != left2.id &&
                                                     right3.id != middle2.id &&
                                                     right3.id != right1.id &&
                                                     right3.id != _outer1) {
                                                 
                                                    let left4Words = letterIndex.find(words[middle2.id][3])
                                                     for left4 in left4Words {
                                                         
                                                         if (left4.end == 0 && //end[left4.id][0] == words[middle2][3] &&
                                                             len[left4.id] >= interlockWidth &&
                                                             end[left4.id][1] == words[_outer1][outerPos1 + 3] &&
                                                             left4.id != right3.id &&
                                                             left4.id != left2.id &&
                                                             left4.id != middle2.id &&
                                                             left4.id != right1.id &&
                                                             left4.id != _outer1) {
                                                             
                                                             let cluster = OuterModel(
                                                                wordsHorizontal: [right1.id, left2.id, right3.id, left4.id],
                                                                wordsVertical: [_outer1, middle2.id],
                                                                patternHorizontal: [.trailing, .leading, .trailing, .leading],
                                                                patternVertical: [.trailing, .leading],
                                                                words: words,
                                                                end: end,
                                                                len: len,
                                                                outerPos: [outerPos1, -1])
                                                             
                                                             if cluster.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
                                                                 result.append(cluster)
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
         }
         return result
    }
    
    
    public static func C2x4_LRLR_OM(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [OuterModel] {
        
        let wordCount = words.count
        let interlockWidth = 2
        let interlockHeight = 4
        var result: [OuterModel] = []
        
        for _outer1 in 0..<wordCount {
            
            if (len[_outer1] >= interlockHeight + 2) {
                                
                for outerPos1 in 1..<(len[_outer1] - interlockHeight) {
                    
                    let left1Words = letterIndex.find(words[_outer1][outerPos1 + 0])
                    for left1 in left1Words {
                    
                        if (left1.end == 1 && //end[left1.id][1] == words[_outer1][outerPos1 + 0] &&
                            len[left1.id] >= interlockWidth &&
                            left1.id != _outer1) {
                        
                            let middle2Words = letterIndex.find(end[left1.id][0])
                            for middle2 in middle2Words {
                            
                                if (middle2.start == 0 && //words[middle2.id][0] == end[left1.id][0] &&
                                    len[middle2.id] == interlockHeight &&
                                    middle2.id != left1.id &&
                                    middle2.id != _outer1) {
   
                                    let right2Words = letterIndex.find(words[middle2.id][1])
                                    for right2 in right2Words {
                                                
                                        if (right2.start == 1 && //words[right2.id][1] == words[middle2.id][1] &&
                                            len[right2.id] >= interlockWidth &&
                                            words[right2.id][0] == words[_outer1][outerPos1 + 1] &&
                                            right2.id != middle2.id &&
                                            right2.id != left1.id &&
                                            right2.id != _outer1) {
                                                    
                                            let left3Words = letterIndex.find(words[middle2.id][2])
                                            for left3 in left3Words {
                                                        
                                                if (left3.end == 0 && //end[left3.id][0] == words[middle2.id][2] &&
                                                    len[left3.id] >= interlockWidth &&
                                                    end[left3.id][1] == words[_outer1][outerPos1 + 2] &&
                                                    left3.id != right2.id &&
                                                    left3.id != middle2.id &&
                                                    left3.id != left1.id &&
                                                    left3.id != _outer1) {
                                                          
                                                    let right4Words = letterIndex.find(words[middle2.id][3])
                                                    for right4 in right4Words {
                                                        
                                                        if (right4.start == 1 && //words[right4.id][1] == words[middle2.id][3] &&
                                                            len[right4.id] >= interlockWidth &&
                                                            words[right4.id][0] == words[_outer1][outerPos1 + 3] &&
                                                            right4.id != left3.id &&
                                                            right4.id != right2.id &&
                                                            right4.id != middle2.id &&
                                                            right4.id != left1.id &&
                                                            right4.id != _outer1) {
                                                            
                                                            let cluster = OuterModel(
                                                                wordsHorizontal: [left1.id, right2.id, left3.id, right4.id],
                                                                wordsVertical: [_outer1, middle2.id],
                                                                patternHorizontal: [.leading, .trailing, .leading, .trailing],
                                                                patternVertical: [.trailing, .leading],
                                                                words: words,
                                                                end: end,
                                                                len: len,
                                                                outerPos: [outerPos1, -1])
                                                            
                                                            if cluster.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
                                                                result.append(cluster)
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
        }
        return result
    }
    

    public static func C2x4_LRLR_MO(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [OuterModel] {
        
        let wordCount = words.count
        let interlockWidth = 2
        let interlockHeight = 4
        var result: [OuterModel] = []
        
        for _middle1 in 0..<wordCount {
            
            if (len[_middle1] == interlockHeight) {
                    
                let left1Words = letterIndex.find(words[_middle1][0])
                for left1 in left1Words {
                
                    if (left1.end == 1 && //end[left1.id][1] == words[_middle1][0] &&
                        len[left1.id] >= interlockWidth &&
                        left1.id != _middle1) {
                        
                        for outer2 in 0..<wordCount {
                            
                            if (len[outer2] >= interlockHeight + 2 &&
                                outer2 != left1.id &&
                                outer2 != _middle1) {
                                   
                                for outerPos2 in 1..<(len[outer2] - interlockHeight) {
                                    if (words[outer2][outerPos2 + 0] == end[left1.id][0]) {
                                            
                                        let right2Words = letterIndex.find(words[outer2][outerPos2 + 1])
                                        for right2 in right2Words {
                                                    
                                            if (right2.start == 1 && //words[right2.id][1] == words[outer2][outerPos2 + 1] &&
                                                len[right2.id] >= interlockWidth &&
                                                words[right2.id][0] == words[_middle1][1] &&
                                                right2.id != outer2 &&
                                                right2.id != left1.id &&
                                                right2.id != _middle1) {
                                                
                                                let left3Words = letterIndex.find(words[_middle1][2])
                                                for left3 in left3Words {
                                                    
                                                    if (left3.end == 1 && // end[left3.id][1] == words[_middle1][2] &&
                                                        len[left3.id] >= interlockWidth &&
                                                        end[left3.id][0] == words[outer2][outerPos2 + 2] &&
                                                        left3.id != right2.id &&
                                                        left3.id != outer2 &&
                                                        left3.id != left1.id &&
                                                        left3.id != _middle1) {
                                                        
                                                        let right4Words = letterIndex.find(words[_middle1][3])
                                                        for right4 in right4Words {
                                                            
                                                            if (right4.start == 0 && //words[right4.id][0] == words[_middle1][3] &&
                                                                len[right4.id] >= interlockWidth &&
                                                                words[right4.id][1] == words[outer2][outerPos2 + 3] &&
                                                                right4.id != left3.id &&
                                                                right4.id != right2.id &&
                                                                right4.id != outer2 &&
                                                                right4.id != left1.id &&
                                                                right4.id != _middle1) {

                                                                let cluster = OuterModel(
                                                                    wordsHorizontal: [left1.id, right2.id, left3.id, right4.id],
                                                                    wordsVertical: [_middle1, outer2],
                                                                    patternHorizontal: [.leading, .trailing, .leading, .trailing],
                                                                    patternVertical: [.trailing, .leading],
                                                                    words: words,
                                                                    end: end,
                                                                    len: len,
                                                                    outerPos: [-1, outerPos2])
                                                                
                                                                if cluster.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
                                                                    result.append(cluster)
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
            }
        }
        return result
    }
}
