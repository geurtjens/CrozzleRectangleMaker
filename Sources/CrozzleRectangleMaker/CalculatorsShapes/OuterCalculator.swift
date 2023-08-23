//
//  OuterCalculator.swift
//  
//
//  Created by Michael Geurtjens on 14/6/2023.
//

import Foundation
public class OuterCalculator {
    
    public static func ExecuteAllSerial(scoreMin: Int) -> Int {
        let startTime = DateTimeCalculator.now()
        var count = 0
        /// We want to calculate new to see how long it takes and then compare with old
        let gameList = GameList()
        for game in gameList.games {
            
            let clusters = Execute(words: game.words, scoreMin: scoreMin, widthMax: game.maxWidth, heightMax: game.maxHeight)
            
            print("OuterCalculator.Execute: \(game.gameId), count: \(clusters.count)")
            
            count += clusters.count
        }
        let finishTime = DateTimeCalculator.now()
        let duration = DateTimeCalculator.duration(start: startTime, finish: finishTime)
        
        print("\(count) records found in \(duration)")
        return count
    }
    
    public static func Execute(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [OuterModel] {
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        let c2x3 = C2x3(words: words, end: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let c2x4 = C2x4(words: words, end: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        let result = c2x3 + c2x4
        return result
    }
    
    public static func C2x3(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [OuterModel] {
        
        let LRL_MO = C2x3_LRL_MO(words: words, end: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let LRL_OM = C2x3_LRL_OM(words: words, end: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let RLR_MO = C2x3_RLR_MO(words: words, end: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let RLR_OM = C2x3_RLR_OM(words: words, end: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
                
        let result = LRL_MO + LRL_OM + RLR_MO + RLR_OM
        
        return result
    }
    
    public static func C2x4(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [OuterModel] {
        
        let LRL_MO = C2x4_LRLR_MO(words: words, end: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let LRL_OM = C2x4_LRLR_OM(words: words, end: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let RLR_MO = C2x4_RLRL_MO(words: words, end: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        let RLR_OM = C2x4_RLRL_OM(words: words, end: end, len: len, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
                
        let result = LRL_MO + LRL_OM + RLR_MO + RLR_OM
        
        return result
    }
    
    
    public static func C2x3_LRL_MO(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [OuterModel] {
        
        let wordCount = (wordsMax == 0) ? words.count : wordsMax
        let interlockWidth = 2
        let interlockHeight = 3
        var result: [OuterModel] = []
        
        for middle1 in 0..<wordCount {
            
            if (len[middle1] == interlockHeight) {
                                
                for left1 in 0..<wordCount {
                    
                    if (len[left1] >= interlockWidth &&
                        end[left1][1] == words[middle1][0] &&
                        left1 != middle1) {
                        
                        for outer2 in 0..<wordCount {
                            
                            if (len[outer2] >= interlockHeight+2 &&
                                outer2 != left1 &&
                                outer2 != middle1) {
                                
                                for outerPos2 in 1..<(len[outer2]-interlockHeight) {
                                    
                                    if words[outer2][outerPos2 + 0] == end[left1][0] {
                                
                                        for right2 in 0..<wordCount {
                                    
                                            if (len[right2] >= interlockWidth &&
                                                words[right2][0] == words[middle1][1] &&
                                                words[right2][1] == words[outer2][outerPos2 + 1] &&
                                                right2 != outer2 &&
                                                right2 != left1 &&
                                                right2 != middle1) {
                                        
                                                for left3 in 0..<wordCount {
                                                    
                                                    if (len[left3] >= interlockWidth &&
                                                        end[left3][1] == words[middle1][2] &&
                                                        end[left3][0] == words[outer2][outerPos2 + 2] &&
                                                        left3 != right2 &&
                                                        left3 != outer2 &&
                                                        left3 != left1 &&
                                                        left3 != middle1) {
                                                        
                                                        let cluster = OuterModel(
                                                            wordsHorizontal: [left1, right2, left3],
                                                            wordsVertical: [middle1, outer2],
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
    
    public static func C2x3_LRL_OM(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [OuterModel] {
        
        let wordCount = (wordsMax == 0) ? words.count : wordsMax
        let interlockWidth = 2
        let interlockHeight = 3
        var result: [OuterModel] = []
        
        for outer1 in 0..<wordCount {
            
            if (len[outer1] >= interlockHeight + 2) {
                                
                for outerPos1 in 1..<(len[outer1] - interlockHeight) {
                    
                    for left1 in 0..<wordCount {
                    
                        if (len[left1] >= interlockWidth &&
                            end[left1][1] == words[outer1][outerPos1 + 0] &&
                            left1 != outer1) {
                        
                            for middle2 in 0..<wordCount {
                                
                                if (len[middle2] == interlockHeight &&
                                    words[middle2][0] == end[left1][0] &&
                                    middle2 != left1 &&
                                    middle2 != outer1) {
                                            
                                    for right2 in 0..<wordCount {
                                                
                                        if (len[right2] >= interlockWidth &&
                                            words[right2][0] == words[outer1][outerPos1 + 1] &&
                                            words[right2][1] == words[middle2][1] &&
                                            right2 != middle2 &&
                                            right2 != left1 &&
                                            right2 != outer1) {
                                                    
                                            for left3 in 0..<wordCount {
                                                        
                                                if (len[left3] >= interlockWidth &&
                                                    end[left3][1] == words[outer1][outerPos1 + 2] &&
                                                    end[left3][0] == words[middle2][2] &&
                                                    left3 != right2 &&
                                                    left3 != middle2 &&
                                                    left3 != left1 &&
                                                    left3 != outer1) {
                                                            
                                                    let cluster = OuterModel(
                                                        wordsHorizontal: [left1, right2, left3],
                                                        wordsVertical: [outer1, middle2],
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
    
    
    public static func C2x3_RLR_OM(words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [OuterModel] {

        let wordCount = (wordsMax == 0) ? words.count : wordsMax
        let interlockWidth = 2
        let interlockHeight = 3
        var result: [OuterModel] = []

        for outer1 in 0..<wordCount {

             if (len[outer1] >= interlockHeight + 2) {

                 for outerPos1 in 1..<(len[outer1]-interlockHeight) {
                     
                     for right1 in 0..<wordCount {
                         
                         if (len[right1] >= interlockWidth &&
                             words[right1][0] == words[outer1][outerPos1 + 0] &&
                             right1 != outer1) {
                             
                             for middle2 in 0..<wordCount {
                                 
                                 if (len[middle2] == interlockHeight &&
                                     words[middle2][0] == words[right1][1] &&
                                     middle2 != right1 &&
                                     middle2 != outer1) {
                                     
                                     for left2 in 0..<wordCount {
                                         
                                         if (len[left2] >= interlockWidth &&
                                             end[left2][1] == words[outer1][outerPos1 + 1] &&
                                             end[left2][0] == words[middle2][1] &&
                                             left2 != middle2 &&
                                             left2 != right1 &&
                                             left2 != outer1) {
                                             
                                             for right3 in 0..<wordCount {
                                                 
                                                 if (len[right3] >= interlockWidth &&
                                                     words[right3][0] == words[outer1][outerPos1 + 2] &&
                                                     words[right3][1] == words[middle2][2] &&
                                                     right3 != left2 &&
                                                     right3 != middle2 &&
                                                     right3 != right1 &&
                                                     right3 != outer1) {
                                                     
                                                     let cluster = OuterModel(
                                                        wordsHorizontal: [right1, left2, right3],
                                                        wordsVertical: [outer1, middle2],
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
    
    public static func C2x3_RLR_MO(words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [OuterModel] {

        let wordCount = (wordsMax == 0) ? words.count : wordsMax
        let interlockWidth = 2
        let interlockHeight = 3
        var result: [OuterModel] = []

        for middle1 in 0..<wordCount {

             if (len[middle1] == interlockHeight) {
       
                 for right1 in 0..<wordCount {
                         
                     if (len[right1] >= interlockWidth &&
                         words[right1][0] == words[middle1][0] &&
                         right1 != middle1) {
                             
                         for outer2 in 0..<wordCount {
                                 
                             if (len[outer2] >= interlockHeight + 2 &&
                                 outer2 != right1 &&
                                 outer2 != middle1) {
                                     
                                 for outerPos2 in 1..<(len[outer2] - interlockHeight) {
                                     
                                     if words[outer2][outerPos2 + 0] == words[right1][1] {
                                     
                                         for left2 in 0..<wordCount {
                                         
                                             if (len[left2] >= interlockWidth &&
                                                 end[left2][1] == words[middle1][1] &&
                                                 end[left2][0] == words[outer2][outerPos2 + 1] &&
                                                 left2 != outer2 &&
                                                 left2 != right1 &&
                                                 left2 != middle1) {
                                             
                                                 for right3 in 0..<wordCount {
                                                     
                                                     if (len[right3] >= interlockWidth &&
                                                         words[right3][0] == words[middle1][2] &&
                                                         words[right3][1] == words[outer2][outerPos2 + 2] &&
                                                         right3 != left2 &&
                                                         right3 != outer2 &&
                                                         right3 != right1 &&
                                                         right3 != middle1) {
                                                         
                                                         let cluster = OuterModel(
                                                            wordsHorizontal: [right1, left2, right3],
                                                            wordsVertical: [middle1, outer2],
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
    
    
    public static func C2x4_RLRL_MO(words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [OuterModel] {

        let wordCount = (wordsMax == 0) ? words.count : wordsMax
        let interlockWidth = 2
        let interlockHeight = 4
        var result: [OuterModel] = []

        for middle1 in 0..<wordCount {

             if (len[middle1] == interlockHeight) {
       
                 for right1 in 0..<wordCount {
                         
                     if (len[right1] >= interlockWidth &&
                         words[right1][0] == words[middle1][0] &&
                         right1 != middle1) {
                             
                         for outer2 in 0..<wordCount {
                                 
                             if (len[outer2] >= interlockHeight + 2 &&
                                 outer2 != right1 &&
                                 outer2 != middle1) {
                                 
                                 for outerPos2 in 1..<(len[outer2] - interlockHeight) {
                                     
                                     if words[outer2][outerPos2 + 0] == words[right1][1] {
                                         
                                         for left2 in 0..<wordCount {
                                         
                                             if (len[left2] >= interlockWidth &&
                                                 end[left2][1] == words[middle1][1] &&
                                                 end[left2][0] == words[outer2][outerPos2 + 1] &&
                                                 left2 != outer2 &&
                                                 left2 != right1 &&
                                                 left2 != middle1) {
                                             
                                                 for right3 in 0..<wordCount {
                                                 
                                                     if (len[right3] >= interlockWidth &&
                                                         words[right3][0] == words[middle1][2] &&
                                                         words[right3][1] == words[outer2][outerPos2 + 2] &&
                                                         right3 != left2 &&
                                                         right3 != outer2 &&
                                                         right3 != right1 &&
                                                         right3 != middle1) {
                                                     
                                                         for left4 in 0..<wordCount {
                                                             
                                                             if (len[left4] >= interlockWidth &&
                                                                 end[left4][1] == words[middle1][3] &&
                                                                 end[left4][0] == words[outer2][outerPos2 + 3] &&
                                                                 left4 != right3 &&
                                                                 left4 != left2 &&
                                                                 left4 != outer2 &&
                                                                 left4 != right1 &&
                                                                 left4 != middle1) {
                                                                 
                                                                 let cluster = OuterModel(
                                                                    
                                                                    wordsHorizontal: [right1, left2, right3, left4],
                                                                    wordsVertical: [middle1, outer2],
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
    
    
    public static func C2x4_RLRL_OM(words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [OuterModel] {

        let wordCount = (wordsMax == 0) ? words.count : wordsMax
        let interlockWidth = 2
        let interlockHeight = 4
        var result: [OuterModel] = []

        for outer1 in 0..<wordCount {

             if (len[outer1] >= interlockHeight + 2) {

                 for outerPos1 in 1..<(len[outer1] - interlockHeight) {
                 
                     for right1 in 0..<wordCount {
                         
                         if (len[right1] >= interlockWidth &&
                             words[right1][0] == words[outer1][outerPos1 + 0] &&
                             right1 != outer1) {
                             
                             for middle2 in 0..<wordCount {
                                 
                                 if (len[middle2] == interlockHeight &&
                                     words[middle2][0] == words[right1][1] &&
                                     middle2 != right1 &&
                                     middle2 != outer1) {
                                         
                                    for left2 in 0..<wordCount {
                                         
                                         if (len[left2] >= interlockWidth &&
                                             end[left2][1] == words[outer1][outerPos1 + 1] &&
                                             end[left2][0] == words[middle2][1] &&
                                             left2 != middle2 &&
                                             left2 != right1 &&
                                             left2 != outer1) {
                                         
                                             for right3 in 0..<wordCount {
                                             
                                                 if (len[right3] >= interlockWidth &&
                                                     words[right3][0] == words[outer1][outerPos1 + 2] &&
                                                     words[right3][1] == words[middle2][2] &&
                                                     right3 != left2 &&
                                                     right3 != middle2 &&
                                                     right3 != right1 &&
                                                     right3 != outer1) {
                                                 
                                                     for left4 in 0..<wordCount {
                                                         
                                                         if (len[left4] >= interlockWidth &&
                                                             end[left4][1] == words[outer1][outerPos1 + 3] &&
                                                             end[left4][0] == words[middle2][3] &&
                                                             left4 != right3 &&
                                                             left4 != left2 &&
                                                             left4 != middle2 &&
                                                             left4 != right1 &&
                                                             left4 != outer1) {
                                                             
                                                             let cluster = OuterModel(
                                                                
                                                                wordsHorizontal: [right1, left2, right3, left4],
                                                                wordsVertical: [outer1, middle2],
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
    
    
    public static func C2x4_LRLR_OM(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [OuterModel] {
        
        let wordCount = (wordsMax == 0) ? words.count : wordsMax
        let interlockWidth = 2
        let interlockHeight = 4
        var result: [OuterModel] = []
        
        for outer1 in 0..<wordCount {
            
            if (len[outer1] >= interlockHeight + 2) {
                                
                for outerPos1 in 1..<(len[outer1] - interlockHeight) {
                    
                    for left1 in 0..<wordCount {
                    
                        if (len[left1] >= interlockWidth &&
                            end[left1][1] == words[outer1][outerPos1 + 0] &&
                            left1 != outer1) {
                        
                            for middle2 in 0..<wordCount {
                            
                                if (len[middle2] == interlockHeight &&
                                    words[middle2][0] == end[left1][0] &&
                                    middle2 != left1 &&
                                    middle2 != outer1) {
   
                                    for right2 in 0..<wordCount {
                                                
                                        if (len[right2] >= interlockWidth &&
                                            words[right2][0] == words[outer1][outerPos1 + 1] &&
                                            words[right2][1] == words[middle2][1] &&
                                            right2 != middle2 &&
                                            right2 != left1 &&
                                            right2 != outer1) {
                                                    
                                            for left3 in 0..<wordCount {
                                                        
                                                if (len[left3] >= interlockWidth &&
                                                    end[left3][1] == words[outer1][outerPos1 + 2] &&
                                                    end[left3][0] == words[middle2][2] &&
                                                    left3 != right2 &&
                                                    left3 != middle2 &&
                                                    left3 != left1 &&
                                                    left3 != outer1) {
                                                          
                                                    for right4 in 0..<wordCount {
                                                        
                                                        if (len[right4] >= interlockWidth &&
                                                            words[right4][0] == words[outer1][outerPos1 + 3] &&
                                                            words[right4][1] == words[middle2][3] &&
                                                            right4 != left3 &&
                                                            right4 != right2 &&
                                                            right4 != middle2 &&
                                                            right4 != left1 &&
                                                            right4 != outer1) {
                                                            
                                                            let cluster = OuterModel(
                                                                wordsHorizontal: [left1, right2, left3, right4],
                                                                wordsVertical: [outer1, middle2],
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
    

    public static func C2x4_LRLR_MO(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [OuterModel] {
        
        let wordCount = (wordsMax == 0) ? words.count : wordsMax
        let interlockWidth = 2
        let interlockHeight = 4
        var result: [OuterModel] = []
        
        for middle1 in 0..<wordCount {
            
            if (len[middle1] == interlockHeight) {
                    
                for left1 in 0..<wordCount {
                
                    if (len[left1] >= interlockWidth &&
                        end[left1][1] == words[middle1][0] &&
                        left1 != middle1) {
                        
                            for outer2 in 0..<wordCount {
                            
                                if (len[outer2] >= interlockHeight + 2 &&
                                    outer2 != left1 &&
                                    outer2 != middle1) {
                                       
                                    for outerPos2 in 1..<(len[outer2] - interlockHeight) {
                                        if (words[outer2][outerPos2 + 0] == end[left1][0]) {
                                            
                                        for right2 in 0..<wordCount {
                                                    
                                            if (len[right2] >= interlockWidth &&
                                                words[right2][0] == words[middle1][1] &&
                                                words[right2][1] == words[outer2][outerPos2 + 1] &&
                                                right2 != outer2 &&
                                                right2 != left1 &&
                                                right2 != middle1) {
                                                
                                                for left3 in 0..<wordCount {
                                                    
                                                    if (len[left3] >= interlockWidth &&
                                                        end[left3][1] == words[middle1][2] &&
                                                        end[left3][0] == words[outer2][outerPos2 + 2] &&
                                                        left3 != right2 &&
                                                        left3 != outer2 &&
                                                        left3 != left1 &&
                                                        left3 != middle1) {
                                                        
                                                        for right4 in 0..<wordCount {
                                                            
                                                            if (len[right4] >= interlockWidth &&
                                                                words[right4][0] == words[middle1][3] &&
                                                                words[right4][1] == words[outer2][outerPos2 + 3] &&
                                                                right4 != left3 &&
                                                                right4 != right2 &&
                                                                right4 != outer2 &&
                                                                right4 != left1 &&
                                                                right4 != middle1) {

                                                                let cluster = OuterModel(
                                                                    wordsHorizontal: [left1, right2, left3, right4],
                                                                    wordsVertical: [middle1, outer2],
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
