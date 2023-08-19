//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 18/8/2023.
//

import Foundation
public class Cluster2Calculator {
    
    public static func Execute(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {
        
        let letterIndex = LetterIndexModel(words: words)
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        let c2x2 = C2x2(letterIndex:letterIndex, words:words, end:end, len:len, scoreMin:scoreMin, widthMax:widthMax, heightMax:heightMax)
        let c2x3 = C2x3(letterIndex:letterIndex, words:words, end:end, len:len, scoreMin:scoreMin, widthMax:widthMax, heightMax:heightMax)
        let c2x4 = C2x4(letterIndex:letterIndex, words:words, end:end, len:len, scoreMin:scoreMin, widthMax:widthMax, heightMax:heightMax)
        let c2x5 = C2x5(letterIndex:letterIndex, words:words, end:end, len:len, scoreMin:scoreMin, widthMax:widthMax, heightMax:heightMax)
        let c2x6 = C2x6(letterIndex:letterIndex, words:words, end:end, len:len, scoreMin:scoreMin, widthMax:widthMax, heightMax:heightMax)
        
        let c3x3 = C3x3(letterIndex:letterIndex, words:words, end:end, len:len, scoreMin:scoreMin, widthMax:widthMax, heightMax:heightMax)
        let c3x4 = C3x4(letterIndex:letterIndex, words:words, end:end, len:len, scoreMin:scoreMin, widthMax:widthMax, heightMax:heightMax)
        let c3x5 = C3x5(letterIndex:letterIndex, words:words, end:end, len:len, scoreMin:scoreMin, widthMax:widthMax, heightMax:heightMax)
        
        var result = c2x2 + c2x3 + c2x4 + c2x5 + c2x6 + c3x3 + c3x4 + c3x5
        
        result.sort {
            if $0.score == $1.score {
                return $0.width * $0.height < $1.width * $1.height
            } else {
                return $0.score > $1.score
            }
        }
        
        return result
    }
    
    public static func C2x2(letterIndex: LetterIndexModel, words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {
        let C2x2_LR_UD = C2x2_LR_UD(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let C2x2_RL_DU = C2x2_RL_DU(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let C2x2_RL_UD = C2x2_RL_UD(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let result = C2x2_LR_UD + C2x2_RL_DU + C2x2_RL_UD
        
        return result
    }
    
    public static func C2x3(letterIndex: LetterIndexModel, words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {
        let C2x3_LRL_DU = C2x3_LRL_DU(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let C2x3_LRL_UD = C2x3_LRL_UD(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let C2x3_RLR_DU = C2x3_RLR_DU(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let C2x3_RLR_UD = C2x3_RLR_UD(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let result = C2x3_LRL_DU + C2x3_LRL_UD + C2x3_RLR_DU + C2x3_RLR_UD
        
        return result
    }
    
    public static func C2x4(letterIndex: LetterIndexModel, words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {
        
        let C2x4_LRLR_DU = C2x4_LRLR_DU(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let C2x4_LRLR_UD = C2x4_LRLR_UD(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let C2x4_RLRL_DU = C2x4_RLRL_DU(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let C2x4_RLRL_UD = C2x4_RLRL_UD(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let result = C2x4_LRLR_DU + C2x4_LRLR_UD + C2x4_RLRL_DU + C2x4_RLRL_UD
        
        return result
    }
    
    public static func C2x5(letterIndex: LetterIndexModel, words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {
        
        let C2x5_LRLRL_DU = C2x5_LRLRL_DU(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let C2x5_LRLRL_UD = C2x5_LRLRL_UD(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let C2x5_RLRLR_DU = C2x5_RLRLR_DU(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let C2x5_RLRLR_UD = C2x5_RLRLR_UD(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let result = C2x5_LRLRL_DU + C2x5_LRLRL_UD + C2x5_RLRLR_DU + C2x5_RLRLR_UD
        
        return result
    }
    
    public static func C2x6(letterIndex: LetterIndexModel, words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {
        
        let C2x6_LRLRLR_DU = C2x6_LRLRLR_DU(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let C2x6_LRLRLR_UD = C2x6_LRLRLR_UD(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let C2x6_RLRLRL_DU = C2x6_RLRLRL_DU(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let C2x6_RLRLRL_UD = C2x6_RLRLRL_UD(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let result = C2x6_LRLRLR_DU + C2x6_LRLRLR_UD + C2x6_RLRLRL_DU + C2x6_RLRLRL_UD
        
        return result
    }
    
    public static func C3x3(letterIndex: LetterIndexModel, words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {
        let C3x3_LRL_UDU = C3x3_LRL_UDU(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let C3x3_RLR_DUD = C3x3_RLR_DUD(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let C3x3_RLR_UDU = C3x3_RLR_UDU(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let result = C3x3_LRL_UDU + C3x3_RLR_DUD + C3x3_RLR_UDU
        
        return result
    }
    
    public static func C3x4(letterIndex: LetterIndexModel, words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {
        
        let C3x4_LRLR_DUD = C3x4_LRLR_DUD(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let C3x4_LRLR_UDU = C3x4_LRLR_UDU(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let C3x4_RLRL_DUD = C3x4_RLRL_DUD(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let C3x4_RLRL_UDU = C3x4_RLRL_UDU(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let result = C3x4_LRLR_DUD + C3x4_LRLR_UDU + C3x4_RLRL_DUD + C3x4_RLRL_UDU
        
        return result
    }
    
    public static func C3x5(letterIndex: LetterIndexModel, words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {
        
        let C3x5_LRLRL_DUD = C3x5_LRLRL_DUD(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let C3x5_LRLRL_UDU = C3x5_LRLRL_UDU(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let C3x5_RLRLR_DUD = C3x5_RLRLR_DUD(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let C3x5_RLRLR_UDU = C3x5_RLRLR_UDU(
            letterIndex: letterIndex,
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let result = C3x5_LRLRL_DUD + C3x5_LRLRL_UDU + C3x5_RLRLR_DUD + C3x5_RLRLR_UDU
        
        return result
    }
    
    
    
    
    
    
    
    public static func C2x2_LR_UD(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {
        
        let wordCount = words.count
        let interlockWidth = 2
        let interlockHeight = 2
        var result: [ClusterModel] = []
        
        for _up1 in 0..<wordCount {
            
            if (len[_up1] >= interlockHeight) {
                
                //print("up1:\(words[_up1]), interlock:\(end[_up1][1])")
                
                let left1Words = letterIndex.find(end[_up1][1])
                
                for left1 in left1Words {
                    if (left1.end == 1 &&
                        len[left1.id] >= interlockWidth &&
                        left1.id > _up1) {
                        
                        //print("left1:\(words[left1.id]), interlock:\(end[left1.id][0])")
                        
                        let down2Words = letterIndex.find(end[left1.id][0])
                        
                        for down2 in down2Words {
                            
                            if (down2.start == 0 &&
                                len[down2.id] >= interlockHeight &&
                                down2.id != left1.id &&
                                down2.id != _up1) {
                                
                                //print("down2:\(words[down2.id]), interlock:\(words[down2.id][1])")
                                
                                let right2Words = letterIndex.find(words[down2.id][1])
                                
                                for right2 in right2Words {
                                    
                                    if (right2.start == 1 &&
                                        len[right2.id] >= interlockWidth &&
                                        words[right2.id][0] == end[_up1][0] &&
                                        
                                        right2.id != down2.id &&
                                        right2.id != left1.id &&
                                        right2.id != _up1) {
                                        
                                        //print("right2:\(words[right2.id])")
                                        
                                        let cluster = ClusterModel(
                                            wordsHorizontal: [left1.id, right2.id], // We could put id here if needed
                                            wordsVertical: [_up1, down2.id],
                                            patternHorizontal: [.leading, .trailing],
                                            patternVertical: [.leading, .trailing],
                                            words: words,
                                            end: end,
                                            len: len
                                        )
                                        
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
        return result
    }
    
    
    public static func C2x2_RL_DU(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {
        
        let wordCount = words.count
        let interlockWidth = 2
        let interlockHeight = 2
        var result: [ClusterModel] = []
        
        for _down1 in 0..<wordCount {
            
            if (len[_down1] >= interlockHeight) {
                
                //print("down2:\(words[_down1]), interlock:\(words[_down1][0])")
                
                let right1Words = letterIndex.find(words[_down1][0])
                
                for right1 in right1Words {
                    
                    if (right1.start == 0 &&
                        len[right1.id] >= interlockWidth &&
                        right1.id != _down1) {
                        
                        //print("right1:\(words[right1.id]), interlock:\(words[right1.id][1])")
                        
                        let up2Words = letterIndex.find(words[right1.id][1])
                        
                        for up2 in up2Words {
                            
                            if (up2.end == 1 &&
                                len[up2.id] >= interlockHeight &&
                                up2.id != right1.id &&
                                up2.id != _down1) {
                                
                                //print("up2:\(words[up2.id]), interlock:\(end[up2.id][0])")
                                
                                let left2Words = letterIndex.find(end[up2.id][0])
                                
                                // This is where I put the (up2+1)
                                for left2 in left2Words {
                                    
                                    if (left2.end == 0 &&
                                        left2.id > up2.id && // To avoid duplicates we assure that left is higher than up
                                        len[left2.id] >= interlockWidth &&
                                        end[left2.id][1] == words[_down1][1] &&
                                        left2.id != up2.id &&
                                        left2.id != right1.id &&
                                        left2.id != _down1) {
                                        
                                        //print("left2:\(words[left2.id])")
                                        
                                        let cluster = ClusterModel(
                                            wordsHorizontal: [right1.id, left2.id], // We could put id here if needed
                                            wordsVertical: [_down1, up2.id],
                                            patternHorizontal: [.trailing, .leading],
                                            patternVertical: [.trailing, .leading],
                                            words: words,
                                            end: end,
                                            len: len
                                        )
                                        
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
        return result
    }
    
    // This one does not need duplicate removal
    public static func C2x2_RL_UD(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {
        
        let wordCount = words.count
        let interlockWidth = 2
        let interlockHeight = 2
        var result: [ClusterModel] = []
        
        for _up1 in 0..<wordCount {
            
            if (len[_up1] >= interlockHeight) {
                
                //print("up1:\(words[_up1]), interlock:\(end[_up1][1])")
                
                let right1Words = letterIndex.find(end[_up1][1])
                
                for right1 in right1Words {
                    
                    if (right1.start == 0 &&
                        len[right1.id] >= interlockWidth &&
                        right1.id != _up1) {
                        
                        //print("right1:\(words[right1.id]), interlock:\(words[right1.id][1])")
                        
                        let down2Words = letterIndex.find(words[right1.id][1])
                        
                        for down2 in down2Words {
                            
                            if (down2.start == 0 &&
                                len[down2.id] >= interlockHeight &&
                                down2.id != right1.id &&
                                down2.id != _up1) {
                                
                                //print("down2:\(words[down2.id]), interlock:\(words[down2.id][1])")
                                
                                let left2Words = letterIndex.find(words[down2.id][1])
                                
                                for left2 in left2Words {
                                    
                                    if (left2.end == 0 &&
                                        len[left2.id] >= interlockWidth &&
                                        end[left2.id][1] == end[_up1][0] &&
                                        left2.id != down2.id &&
                                        left2.id != right1.id &&
                                        left2.id != _up1) {
                                        
                                        //print("left2:\(words[left2.id])")
                                        
                                        let cluster = ClusterModel(
                                            wordsHorizontal: [right1.id, left2.id], // We could put id here if needed
                                            wordsVertical: [_up1, down2.id],
                                            patternHorizontal: [.trailing, .leading],
                                            patternVertical: [.leading, .trailing],
                                            words: words,
                                            end: end,
                                            len: len)
                                        
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
        return result
    }
    
    
    
    
    
    public static func C2x3_LRL_DU(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {
        
        let wordCount = words.count
        let interlockWidth = 2
        let interlockHeight = 3
        var result: [ClusterModel] = []
        
        for _down1 in 0..<wordCount {
            
            if (len[_down1] >= interlockHeight) {
             
                //print("down1:\(words[down1]), interlock:\(end[_down1][0])")
                let left1Words = letterIndex.find(words[_down1][0])
                
                for left1 in left1Words {
                    
                    if (left1.end == 1 &&
                        len[left1.id] >= interlockWidth &&
                        left1.id != _down1) {
                        
                        //print("left1:\(words[left1]), interlock:\(end[left1.id][0])")
                        let up2Words = letterIndex.find(end[left1.id][0])
                        
                        for up2 in up2Words {
                            
                            if (up2.end == 2 &&
                                len[up2.id] >= interlockHeight &&
                                up2.id != left1.id &&
                                up2.id != _down1) {
                                
                                //print("up2:\(words[up2]), interlock:\(end[up2.id][1])")
                                let right2Words = letterIndex.find(end[up2.id][1])
                                
                                for right2 in right2Words {
                                    
                                    if (right2.start == 1 &&
                                        len[right2.id] >= interlockWidth &&
                                        words[right2.id][0] == words[_down1][1] &&
                                        right2.id != up2.id &&
                                        right2.id != left1.id &&
                                        right2.id != _down1) {
                                        
                                        //print("right2:\(words[right2]), interlock:\()")
                                         let left3Words = letterIndex.find(words[_down1][2])
 
                                         for left3 in left3Words {
 
                                             if (left3.end == 1 &&
                                                 len[left3.id] >= interlockWidth &&
                                                 end[left3.id][1] == words[_down1][2] &&
                                                 end[left3.id][0] == end[up2.id][0] &&
                                                 left3.id != right2.id &&
                                                 left3.id != up2.id &&
                                                 left3.id != left1.id &&
                                                 left3.id != _down1) {

//                                                print("left3:\(words[left3]))
//
                                                let cluster = ClusterModel(
                                                    wordsHorizontal: [left1.id, right2.id, left3.id],
                                                    wordsVertical: [_down1, up2.id],
                                                    patternHorizontal: [.leading, .trailing, .leading],
                                                    patternVertical: [.trailing, .leading],
                                                    words: words,
                                                    end: end,
                                                    len: len)

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
        return result
    }
    
    public static func C2x3_LRL_UD(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {

        let wordCount = words.count
        let interlockWidth = 2
        let interlockHeight = 3
        var result: [ClusterModel] = []

        for _up1 in 0..<wordCount {

            if (len[_up1] >= interlockHeight) {

            //print("up1:\(words[_up1]), interlock:\(end[_up1][2])")
              
                let left1Words = letterIndex.find(end[_up1][2])

                for left1 in left1Words {

                    if (left1.end == 1 &&
                        len[left1.id] >= interlockWidth &&
                        left1.id != _up1) {
    
                        //print("left1:\(words[left1]), interlock:\(end[left1.id][0])")
                        let down2Words = letterIndex.find(end[left1.id][0])

                        for down2 in down2Words {

                            if (down2.start == 0 &&
                                len[down2.id] >= interlockHeight &&
                                down2.id != left1.id &&
                                down2.id != _up1) {
    
                                //print("down2:\(words[down2]), interlock:\(words[down2.id][1])")
                                let right2Words = letterIndex.find(words[down2.id][1])

                                for right2 in right2Words {

                                    if (right2.start == 1 &&
                                        len[right2.id] >= interlockWidth &&
                                        words[right2.id][0] == end[_up1][1] &&
                                        right2.id != down2.id &&
                                        right2.id != left1.id &&
                                        right2.id != _up1) {
                                        
                                        //print("right2:\(words[right2]), interlock:\(words[down2.id][2])")
                                        let left3Words = letterIndex.find(words[down2.id][2])
                                        
                                        for left3 in left3Words {

                                            if (left3.end == 0 &&
                                                len[left3.id] >= interlockWidth &&
                                                end[left3.id][1] == end[_up1][0] &&
                                                left3.id != right2.id &&
                                                left3.id != down2.id &&
                                                left3.id != left1.id &&
                                                left3.id != _up1) {
                                                
                                                //print("left3:\(words[left3.id])

                                                let cluster = ClusterModel(
                                                    wordsHorizontal: [left1.id, right2.id, left3.id],
                                                    wordsVertical: [_up1, down2.id],
                                                    patternHorizontal: [.leading, .trailing, .leading],
                                                    patternVertical: [.leading, .trailing],
                                                    words: words,
                                                    end: end,
                                                    len: len)

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
         return result
     }

    public static func C2x3_RLR_DU(letterIndex: LetterIndexModel, words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

        let wordCount = words.count
        let interlockWidth = 2
        let interlockHeight = 3
        var result: [ClusterModel] = []

        for _down1 in 0..<wordCount {

             if (len[_down1] >= interlockHeight) {
                 
                 //print("down1:\(words[down1]), interlock:\(words[_down1][0])")
                 let right1Words = letterIndex.find(words[_down1][0])

                 for right1 in right1Words {

                     if (right1.start == 0 &&
                         len[right1.id] >= interlockWidth &&
                         right1.id != _down1) {
                         
                         //print("right1:\(words[right1]), interlock:\(words[right1.id][1])")
                         let up2Words = letterIndex.find(words[right1.id][1])
                         
                         for up2 in up2Words {

                             if (up2.end == 2 &&
                                 len[up2.id] >= interlockHeight &&
                                 up2.id != right1.id &&
                                 up2.id != _down1) {
                                 
                                 //print("up2:\(words[up2]), interlock:\(end[up2.id][1])")
                                 let left2Words = letterIndex.find(end[up2.id][1])
                                 
                                 for left2 in left2Words {

                                     if (left2.end == 0 &&
                                         len[left2.id] >= interlockWidth &&
                                         end[left2.id][1] == words[_down1][1] &&
                                         left2.id != up2.id &&
                                         left2.id != right1.id &&
                                         left2.id != _down1) {
                                         
                                         //print("left2:\(words[left2]), interlock:\(end[up2.id][0])")
                                         let right3Words = letterIndex.find(end[up2.id][0])
                                         
                                         for right3 in right3Words {

                                             if (right3.start == 1 &&
                                                 len[right3.id] >= interlockWidth &&
                                                 words[right3.id][0] == words[_down1][2] &&
                                                 right3.id != left2.id &&
                                                 right3.id != up2.id &&
                                                 right3.id != right1.id &&
                                                 right3.id != _down1) {
                                                 //print("right3:\(words[right3])")

                                                 let cluster = ClusterModel(
                                                    wordsHorizontal: [right1.id, left2.id, right3.id],
                                                    wordsVertical: [_down1, up2.id],
                                                     patternHorizontal: [.trailing, .leading, .trailing],
                                                     patternVertical: [.trailing, .leading],
                                                     words: words,
                                                     end: end,
                                                     len: len)

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
         return result
    }

    public static func C2x3_RLR_UD(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {

         let wordCount = words.count
         let interlockWidth = 2
         let interlockHeight = 3
         var result: [ClusterModel] = []

         for _up1 in 0..<wordCount {

             if (len[_up1] >= interlockHeight) {
                 //print("up1:\(words[up1]), interlock:\(end[_up1][2])")
                 let right1Words = letterIndex.find(end[_up1][2])
                 for right1 in right1Words {

                     if (right1.start == 0 &&
                         len[right1.id] >= interlockWidth &&
                         right1.id != _up1) {
                         //print("right1:\(words[right1]), interlock:\()")

                         let down2Words = letterIndex.find(words[right1.id][1])
                         
                         for down2 in down2Words {

                             if (down2.start == 0 &&
                                 len[down2.id] >= interlockHeight &&
                                 down2.id != right1.id &&
                                 down2.id != _up1) {
                                 //print("down2:\(words[down2]), interlock:\()")

                                 let left2Words = letterIndex.find(words[down2.id][1])
                                 
                                 for left2 in left2Words {

                                     if (left2.end == 0 &&
                                         len[left2.id] >= interlockWidth &&
                                         end[left2.id][1] == end[_up1][1] &&
                                         left2.id != down2.id &&
                                         left2.id != right1.id &&
                                         left2.id != _up1) {
                                         //print("left2:\(words[left2]), interlock:\(words[down2.id][2])")

                                         let right3Words = letterIndex.find(words[down2.id][2])
                                         
                                         for right3 in right3Words {

                                             if (right3.start == 1 &&
                                                 len[right3.id] >= interlockWidth &&
                                                 words[right3.id][0] == end[_up1][0] &&
                                                 right3.id != left2.id &&
                                                 right3.id != down2.id &&
                                                 right3.id != right1.id &&
                                                 right3.id != _up1) {
                                                 //print("right3:\(words[right3]), interlock:\()")

                                                 let cluster = ClusterModel(
                                                    wordsHorizontal: [right1.id, left2.id, right3.id],
                                                    wordsVertical: [_up1, down2.id],
                                                     patternHorizontal: [.trailing, .leading, .trailing],
                                                     patternVertical: [.leading, .trailing],
                                                     words: words,
                                                     end: end,
                                                     len: len)

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
         return result
     }
    
    
    
    
    
    
    
    public static func C2x4_LRLR_DU(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {

            let wordCount = words.count
            let interlockWidth = 2
            let interlockHeight = 4
            var result: [ClusterModel] = []

            for _down1 in 0..<wordCount {

                if (len[_down1] >= interlockHeight) {
                    
                    //print("down1:\(words[_down1]), interlock: \(words[_down1][0])")
                    let left1Words = letterIndex.find(words[_down1][0])

                    for left1 in left1Words {

                        if (left1.end == 1 &&
                            len[left1.id] >= interlockWidth &&
                            left1.id != _down1) {
                            
                            //print("left1:\(words[left1.id]), interlock: \(end[left1.id][0])")
                            let up2Words = letterIndex.find(end[left1.id][0])

                            for up2 in up2Words {

                                if (up2.end == 3 &&
                                    len[up2.id] >= interlockHeight &&
                                    up2.id != left1.id &&
                                    up2.id != _down1) {
                                    
                                    //print("up2:\(words[up2.id]), interlock: \(end[up2.id][2])")
                                    let right2Words = letterIndex.find(end[up2.id][2])

                                    for right2 in right2Words {

                                        if (right2.start == 1 &&
                                            len[right2.id] >= interlockWidth &&
                                            words[right2.id][0] == words[_down1][1] &&
                                            right2.id != up2.id &&
                                            right2.id != left1.id &&
                                            right2.id != _down1) {

                                            //print("right2:\(words[right2.id]), interlock: \(end[up2.id][1])")
                                            let left3Words = letterIndex.find(end[up2.id][1])

                                            for left3 in left3Words {

                                                if (left3.end == 0 &&
                                                    len[left3.id] >= interlockWidth &&
                                                    end[left3.id][1] == words[_down1][2] &&
                                                    left3.id != right2.id &&
                                                    left3.id != up2.id &&
                                                    left3.id != left1.id &&
                                                    left3.id != _down1) {
                                                    
                                                    //print("left3:\(words[left3.id]), interlock: \(end[up2.id][0])")
                                                    let right4Words = letterIndex.find(end[up2.id][0])

                                                    for right4 in right4Words {

                                                        if (right4.start == 1 &&
                                                            len[right4.id] >= interlockWidth &&
                                                            words[right4.id][0] == words[_down1][3] &&
                                                            right4.id != left3.id &&
                                                            right4.id != right2.id &&
                                                            right4.id != up2.id &&
                                                            right4.id != left1.id &&
                                                            right4.id != _down1) {
                                                            
                                                            //print("right4:\(words[right4.id])")

                                                            let cluster = ClusterModel(
                                                                wordsHorizontal: [left1.id, right2.id, left3.id, right4.id],
                                                                wordsVertical: [_down1, up2.id],
                                                                patternHorizontal: [.leading, .trailing, .leading, .trailing],
                                                                patternVertical: [.trailing, .leading],
                                                                words: words,
                                                                end: end,
                                                                len: len)

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

    public static func C2x4_LRLR_UD(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {

            let wordCount = words.count
            let interlockWidth = 2
            let interlockHeight = 4
            var result: [ClusterModel] = []

            for _up1 in 0..<wordCount {

                if (len[_up1] >= interlockHeight) {
                    
                    //print("up1:\(words[_up1]), interlock: \(end[_up1][3])")
                    let left1Words = letterIndex.find(end[_up1][3])

                    for left1 in left1Words {

                        if (left1.end == 1 &&
                            len[left1.id] >= interlockWidth &&
                            left1.id != _up1) {
                            
                            //print("left1:\(words[left1.id]), interlock: \(end[left1.id][0])")
                            let down2Words = letterIndex.find(end[left1.id][0])

                            for down2 in down2Words {

                                if (down2.start == 0 &&
                                    len[down2.id] >= interlockHeight &&
                                    down2.id != left1.id &&
                                    down2.id != _up1) {
                                    
                                    //print("down2:\(words[down2.id]), interlock: \(words[down2.id][1])")
                                    let right2Words = letterIndex.find(words[down2.id][1])

                                    for right2 in right2Words {

                                        if (right2.start == 1 &&
                                            len[right2.id] >= interlockWidth &&
                                            words[right2.id][0] == end[_up1][2] &&
                                            right2.id != down2.id &&
                                            right2.id != left1.id &&
                                            right2.id != _up1) {
                                            
                                            //print("right2:\(words[right2.id]), interlock: \(words[down2.id][2])")
                                            let left3Words = letterIndex.find(words[down2.id][2])

                                            for left3 in left3Words {

                                                if (left3.end == 0 &&
                                                    len[left3.id] >= interlockWidth &&
                                                    end[left3.id][1] == end[_up1][1] &&
                                                    left3.id != right2.id &&
                                                    left3.id != down2.id &&
                                                    left3.id != left1.id &&
                                                    left3.id != _up1) {
                                                    
                                                    //print("left3:\(words[left3.id]), interlock: \(words[down2.id][3])")
                                                    let right4Words = letterIndex.find(words[down2.id][3])

                                                    for right4 in right4Words {

                                                        if (right4.start == 1 &&
                                                            len[right4.id] >= interlockWidth &&
                                                            words[right4.id][0] == end[_up1][0] &&
                                                            right4.id != left3.id &&
                                                            right4.id != right2.id &&
                                                            right4.id != down2.id &&
                                                            right4.id != left1.id &&
                                                            right4.id != _up1) {
                                                            
                                                            //print("right4:\(words[right4.id])")

                                                            let cluster = ClusterModel(
                                                                wordsHorizontal: [left1.id, right2.id, left3.id, right4.id],
                                                                wordsVertical: [_up1, down2.id],
                                                                patternHorizontal: [.leading, .trailing, .leading, .trailing],
                                                                patternVertical: [.leading, .trailing],
                                                                words: words,
                                                                end: end,
                                                                len: len)

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

    public static func C2x4_RLRL_DU(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {

            let wordCount = words.count
            let interlockWidth = 2
            let interlockHeight = 4
            var result: [ClusterModel] = []

            for _down1 in 0..<wordCount {

                if (len[_down1] >= interlockHeight) {
                    
                    //print("down1:\(words[_down1]), interlock: \(words[_down1][0])")
                    let right1Words = letterIndex.find(words[_down1][0])

                    for right1 in right1Words {

                        if (right1.start == 0 &&
                            len[right1.id] >= interlockWidth &&
                            right1.id != _down1) {
                            
                            //print("right1:\(words[right1.id]), interlock: \(words[right1.id][1])")
                            let up2Words = letterIndex.find(words[right1.id][1])

                            for up2 in up2Words {

                                if (up2.end == 3 &&
                                    len[up2.id] >= interlockHeight &&
                                    up2.id != right1.id &&
                                    up2.id != _down1) {
                                    
                                    //print("up2:\(words[up2.id]), interlock: \(end[up2.id][2])")
                                    let left2Words = letterIndex.find(end[up2.id][2])

                                    for left2 in left2Words {

                                        if (left2.end == 0 &&
                                            len[left2.id] >= interlockWidth &&
                                            end[left2.id][1] == words[_down1][1] &&
                                            left2.id != up2.id &&
                                            left2.id != right1.id &&
                                            left2.id != _down1) {
                                            
                                            //print("left2:\(words[left2.id]), interlock: \(end[up2.id][1])") ***
                                            let right3Words = letterIndex.find(end[up2.id][1])

                                            for right3 in right3Words {

                                                if (right3.start == 1 &&
                                                    len[right3.id] >= interlockWidth &&
                                                    words[right3.id][0] == words[_down1][2] &&
                                                    right3.id != left2.id &&
                                                    right3.id != up2.id &&
                                                    right3.id != right1.id &&
                                                    right3.id != _down1) {
                                                    
                                                    //print("right3:\(words[right3.id]), interlock: \(end[up2.id][0])") ***
                                                    let left4Words = letterIndex.find(end[up2.id][0])

                                                    for left4 in left4Words {

                                                        if (left4.end == 0 &&
                                                            len[left4.id] >= interlockWidth &&
                                                            end[left4.id][1] == words[_down1][3] &&
                                                            left4.id != right3.id &&
                                                            left4.id != left2.id &&
                                                            left4.id != up2.id &&
                                                            left4.id != right1.id &&
                                                            left4.id != _down1) {
                                                            
                                                            //print("left4:\(words[left4.id])")

                                                            let cluster = ClusterModel(
                                                                wordsHorizontal: [right1.id, left2.id, right3.id, left4.id],
                                                                wordsVertical: [_down1, up2.id],
                                                                patternHorizontal: [.trailing, .leading, .trailing, .leading],
                                                                patternVertical: [.trailing, .leading],
                                                                words: words,
                                                                end: end,
                                                                len: len)

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


    public static func C2x4_RLRL_UD(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {

            let wordCount = words.count
            let interlockWidth = 2
            let interlockHeight = 4
            var result: [ClusterModel] = []

            for _up1 in 0..<wordCount {

                if (len[_up1] >= interlockHeight) {
                    
                    //print("up1:\(words[_up1]), interlock: \(end[_up1][3])")
                    let right1Words = letterIndex.find(end[_up1][3])

                    for right1 in right1Words {

                        if (right1.start == 0 &&
                            len[right1.id] >= interlockWidth &&
                            right1.id != _up1) {
                            
                            //print("right1:\(words[right1.id]), interlock: \(words[right1.id][1])")
                            let down2Words = letterIndex.find(words[right1.id][1])

                            for down2 in down2Words {

                                if (down2.start == 0 && //words[down2.id][0] == words[right1.id][1] &&
                                    len[down2.id] >= interlockHeight &&
                                    down2.id != right1.id &&
                                    down2.id != _up1) {
                                    
                                    //print("down2:\(words[down2.id]), interlock: \(words[down2.id][1])")
                                    let left2Words = letterIndex.find(words[down2.id][1])

                                    for left2 in left2Words {

                                        if (left2.end == 0 && //end[left2.id][0] == words[down2.id][1] &&
                                            len[left2.id] >= interlockWidth &&
                                            end[left2.id][1] == end[_up1][2] &&
                                            left2.id != down2.id &&
                                            left2.id != right1.id &&
                                            left2.id != _up1) {
                                            
                                            //print("left2:\(words[left2.id]), interlock: \(words[down2.id][2])")  ***
                                            let right3Words = letterIndex.find(words[down2.id][2])

                                            for right3 in right3Words {

                                                if (right3.start == 1 && //words[right3.id][1] == words[down2.id][2] &&
                                                    len[right3.id] >= interlockWidth &&
                                                    words[right3.id][0] == end[_up1][1] &&
                                                    right3.id != left2.id &&
                                                    right3.id != down2.id &&
                                                    right3.id != right1.id &&
                                                    right3.id != _up1) {
                                                    
                                                    //print("right3:\(words[right3.id]), interlock: \(words[down2.id][3])") ***
                                                    let left4Words = letterIndex.find(words[down2.id][3])

                                                    for left4 in left4Words {

                                                        if (left4.end == 0 && //end[left4.id][0] == words[down2.id][3] &&
                                                            len[left4.id] >= interlockWidth &&
                                                            end[left4.id][1] == end[_up1][0] &&
                                                            left4.id != right3.id &&
                                                            left4.id != left2.id &&
                                                            left4.id != down2.id &&
                                                            left4.id != right1.id &&
                                                            left4.id != _up1) {
                                                            
                                                            //print("left4:\(words[left4.id])")

                                                            let cluster = ClusterModel(
                                                                wordsHorizontal: [right1.id, left2.id, right3.id, left4.id],
                                                                wordsVertical: [_up1, down2.id],
                                                                patternHorizontal: [.trailing, .leading, .trailing, .leading],
                                                                patternVertical: [.leading, .trailing],
                                                                words: words,
                                                                end: end,
                                                                len: len)

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


    public static func C2x5_LRLRL_DU(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {

            let wordCount = words.count
            let interlockWidth = 2
            let interlockHeight = 5
            var result: [ClusterModel] = []

            for _down1 in 0..<wordCount {

                if (len[_down1] >= interlockHeight) {
                    
                    //print("down1:\(words[_down1]), interlock: \(words[_down1][0])")
                    let left1Words = letterIndex.find(words[_down1][0])

                    for left1 in left1Words {

                        if (left1.end == 1 && //end[left1.id][1] == words[_down1][0] &&
                            len[left1.id] >= interlockWidth &&
                            left1.id != _down1) {
                            
                            //print("left1:\(words[left1.id]), interlock: \(end[left1.id][0])")
                            let up2Words = letterIndex.find(end[left1.id][0])

                            for up2 in up2Words {

                                if (up2.end == 4 && //end[up2.id][4] == end[left1.id][0] &&
                                    len[up2.id] >= interlockHeight &&
                                    up2.id != left1.id &&
                                    up2.id != _down1) {
                                    
                                    //print("up2:\(words[up2.id]), interlock: \(end[up2.id][3])")
                                    let right2Words = letterIndex.find(end[up2.id][3])

                                    for right2 in right2Words {

                                        if (right2.start == 1 && //words[right2.id][1] == end[up2.id][3] &&
                                            len[right2.id] >= interlockWidth &&
                                            words[right2.id][0] == words[_down1][1] &&
                                            right2.id != up2.id &&
                                            right2.id != left1.id &&
                                            right2.id != _down1) {
                                            
                                            //print("right2:\(words[right2.id]), interlock: \(end[up2.id][2])") ***
                                            let left3Words = letterIndex.find(end[up2.id][2])

                                            for left3 in left3Words {

                                                if (left3.end == 0 && //end[left3.id][0] == end[up2.id][2] &&
                                                    len[left3.id] >= interlockWidth &&
                                                    end[left3.id][1] == words[_down1][2] &&
                                                    left3.id != right2.id &&
                                                    left3.id != up2.id &&
                                                    left3.id != left1.id &&
                                                    left3.id != _down1) {
                                                    
                                                    //print("left3:\(words[left3.id]), interlock: \(end[up2.id][1])") ***
                                                    let right4Words = letterIndex.find(end[up2.id][1])

                                                    for right4 in right4Words {

                                                        if (right4.start == 1 && //words[right4.id][1] == end[up2.id][1] &&
                                                            len[right4.id] >= interlockWidth &&
                                                            words[right4.id][0] == words[_down1][3] &&
                                                            right4.id != left3.id &&
                                                            right4.id != right2.id &&
                                                            right4.id != up2.id &&
                                                            right4.id != left1.id &&
                                                            right4.id != _down1) {
                                                            
                                                            //print("right4:\(words[right4.id]), interlock: \(end[up2.id][0])") ***
                                                            let left5Words = letterIndex.find(end[up2.id][0])

                                                            for left5 in left5Words {

                                                                if (left5.end == 0 && //end[left5.id][0] == end[up2.id][0] &&
                                                                    len[left5.id] >= interlockWidth &&
                                                                    end[left5.id][1] == words[_down1][4] &&
                                                                    left5.id != right4.id &&
                                                                    left5.id != left3.id &&
                                                                    left5.id != right2.id &&
                                                                    left5.id != up2.id &&
                                                                    left5.id != left1.id &&
                                                                    left5.id != _down1) {
                                                                    
                                                                    //print("left5:\(words[left5.id])")

                                                                    let cluster = ClusterModel(
                                                                        wordsHorizontal: [left1.id, right2.id, left3.id, right4.id, left5.id],
                                                                        wordsVertical: [_down1, up2.id],
                                                                        patternHorizontal: [.leading, .trailing, .leading, .trailing, .leading],
                                                                        patternVertical: [.trailing, .leading],
                                                                        words: words,
                                                                        end: end,
                                                                        len: len)

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


    public static func C2x5_LRLRL_UD(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {

            let wordCount = words.count
            let interlockWidth = 2
            let interlockHeight = 5
            var result: [ClusterModel] = []

            for _up1 in 0..<wordCount {

                if (len[_up1] >= interlockHeight) {
                    //print("up1:\(words[_up1]), interlock: \(end[_up1][4])")
                    let left1Words = letterIndex.find(end[_up1][4])

                    for left1 in left1Words {

                        if (left1.end == 1 && //end[left1.id][1] == end[_up1][4] &&
                            len[left1.id] >= interlockWidth &&
                            left1.id != _up1) {
                            
                            //print("left1:\(words[left1.id]), interlock: \(end[left1.id][0])")
                            let down2Words = letterIndex.find(end[left1.id][0])

                            for down2 in down2Words {

                                if (down2.start == 0 && //words[down2.id][0] == end[left1.id][0] &&
                                    len[down2.id] >= interlockHeight &&
                                    down2.id != left1.id &&
                                    down2.id != _up1) {
                                    
                                    //print("down2:\(words[down2.id]), interlock: \(words[down2.id][1])")
                                    let right2Words = letterIndex.find(words[down2.id][1])

                                    for right2 in right2Words {

                                        if (right2.start == 1 && //words[right2.id][1] == words[down2.id][1] &&
                                            len[right2.id] >= interlockWidth &&
                                            words[right2.id][0] == end[_up1][3] &&
                                            right2.id != down2.id &&
                                            right2.id != left1.id &&
                                            right2.id != _up1) {
                                            
                                            //print("right2:\(words[right2.id]), interlock: \(words[down2.id][2])") ***
                                            let left3Words = letterIndex.find(words[down2.id][2])

                                            for left3 in left3Words {

                                                if (left3.end == 0 && //end[left3.id][0] == words[down2.id][2] &&
                                                    len[left3.id] >= interlockWidth &&
                                                    end[left3.id][1] == end[_up1][2] &&
                                                    left3.id != right2.id &&
                                                    left3.id != down2.id &&
                                                    left3.id != left1.id &&
                                                    left3.id != _up1) {
                                                    
                                                    //print("left3:\(words[left3.id]), interlock: \(words[down2.id][3])") ***
                                                    let right4Words = letterIndex.find(words[down2.id][3])

                                                    for right4 in right4Words {

                                                        if (right4.start == 1 && //words[right4.id][1] == words[down2.id][3] &&
                                                            len[right4.id] >= interlockWidth &&
                                                            words[right4.id][0] == end[_up1][1] &&
                                                            right4.id != left3.id &&
                                                            right4.id != right2.id &&
                                                            right4.id != down2.id &&
                                                            right4.id != left1.id &&
                                                            right4.id != _up1) {
                                                            
                                                            //print("right4:\(words[right4.id]), interlock: \(words[down2.id][4])") ***
                                                            let left5Words = letterIndex.find(words[down2.id][4])

                                                            for left5 in left5Words {

                                                                if (left5.end == 0 && //end[left5.id][0] == words[down2.id][4] &&
                                                                    len[left5.id] >= interlockWidth &&
                                                                    end[left5.id][1] == end[_up1][0] &&
                                                                    left5.id != right4.id &&
                                                                    left5.id != left3.id &&
                                                                    left5.id != right2.id &&
                                                                    left5.id != down2.id &&
                                                                    left5.id != left1.id &&
                                                                    left5.id != _up1) {
                                                                    
                                                                    //print("left5:\(words[left5.id])")

                                                                    let cluster = ClusterModel(
                                                                        wordsHorizontal: [left1.id, right2.id, left3.id, right4.id, left5.id],
                                                                        wordsVertical: [_up1, down2.id],
                                                                        patternHorizontal: [.leading, .trailing, .leading, .trailing, .leading],
                                                                        patternVertical: [.leading, .trailing],
                                                                        words: words,
                                                                        end: end,
                                                                        len: len)

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

    public static func C2x5_RLRLR_DU(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {

            let wordCount = words.count
            let interlockWidth = 2
            let interlockHeight = 5
            var result: [ClusterModel] = []

            for _down1 in 0..<wordCount {

                if (len[_down1] >= interlockHeight) {
                    
                    //print("down1:\(words[_down1]), interlock: \(words[_down1][0])")
                    let right1Words = letterIndex.find(words[_down1][0])

                    for right1 in right1Words {

                        if (right1.start == 0 && //words[right1.id][0] == words[_down1][0] &&
                            len[right1.id] >= interlockWidth &&
                            right1.id != _down1) {
                            
                            //print("right1:\(words[right1.id]), interlock: \(words[right1.id][1])")
                            let up2Words = letterIndex.find(words[right1.id][1])

                            for up2 in up2Words {

                                if (up2.end == 4 && //end[up2.id][4] == words[right1.id][1] &&
                                    len[up2.id] >= interlockHeight &&
                                    up2.id != right1.id &&
                                    up2.id != _down1) {
                                    
                                    //print("up2:\(words[up2.id]), interlock: \(end[up2.id][3])")
                                    let left2Words = letterIndex.find(end[up2.id][3])

                                    for left2 in left2Words {

                                        if (left2.end == 0 && //end[left2.id][0] == end[up2.id][3] &&
                                            len[left2.id] >= interlockWidth &&
                                            end[left2.id][1] == words[_down1][1] &&
                                            left2.id != up2.id &&
                                            left2.id != right1.id &&
                                            left2.id != _down1) {
                                            
                                            //print("left2:\(words[left2.id]), interlock: \(end[up2.id][2])")
                                            let right3Words = letterIndex.find(end[up2.id][2])

                                            for right3 in right3Words {

                                                if (right3.start == 1 && //words[right3.id][1] == end[up2.id][2] &&
                                                    len[right3.id] >= interlockWidth &&
                                                    words[right3.id][0] == words[_down1][2] &&
                                                    right3.id != left2.id &&
                                                    right3.id != up2.id &&
                                                    right3.id != right1.id &&
                                                    right3.id != _down1) {
                                                    
                                                    //print("right3:\(words[right3.id]), interlock: \(end[up2.id][1])")
                                                    let left4Words = letterIndex.find(end[up2.id][1])

                                                    for left4 in left4Words {

                                                        if (left4.end == 0 && //end[left4.id][0] == end[up2.id][1] &&
                                                            len[left4.id] >= interlockWidth &&
                                                            end[left4.id][1] == words[_down1][3] &&
                                                            left4.id != right3.id &&
                                                            left4.id != left2.id &&
                                                            left4.id != up2.id &&
                                                            left4.id != right1.id &&
                                                            left4.id != _down1) {
                                                            
                                                            //print("left4:\(words[left4.id]), interlock: \(end[up2.id][0])")
                                                            let right5Words = letterIndex.find(end[up2.id][0])

                                                            for right5 in right5Words {

                                                                if (right5.start == 1 && //words[right5.id][1] == end[up2.id][0] &&
                                                                    len[right5.id] >= interlockWidth &&
                                                                    words[right5.id][0] == words[_down1][4] &&
                                                                    right5.id != left4.id &&
                                                                    right5.id != right3.id &&
                                                                    right5.id != left2.id &&
                                                                    right5.id != up2.id &&
                                                                    right5.id != right1.id &&
                                                                    right5.id != _down1) {
                                                                    
                                                                    //print("right5:\(words[right5.id])")

                                                                    let cluster = ClusterModel(
                                                                        wordsHorizontal: [right1.id, left2.id, right3.id, left4.id, right5.id],
                                                                        wordsVertical: [_down1, up2.id],
                                                                        patternHorizontal: [.trailing, .leading, .trailing, .leading, .trailing],
                                                                        patternVertical: [.trailing, .leading],
                                                                        words: words,
                                                                        end: end,
                                                                        len: len)

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


    public static func C2x5_RLRLR_UD(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {

            let wordCount = words.count
            let interlockWidth = 2
            let interlockHeight = 5
            var result: [ClusterModel] = []

            for _up1 in 0..<wordCount {

                if (len[_up1] >= interlockHeight) {
                    
                    //print("up1:\(words[_up1]), interlock: \(end[_up1][4])")
                    let right1Words = letterIndex.find(end[_up1][4])

                    for right1 in right1Words {

                        if (right1.start == 0 && //words[right1.id][0] == end[_up1][4] &&
                            len[right1.id] >= interlockWidth &&
                            right1.id != _up1) {
                            
                            //print("right1:\(words[right1.id]), interlock: \(words[right1.id][1])")
                            let down2Words = letterIndex.find(words[right1.id][1])

                            for down2 in down2Words {

                                if (down2.start == 0 && //words[down2.id][0] == words[right1.id][1] &&
                                    len[down2.id] >= interlockHeight &&
                                    down2.id != right1.id &&
                                    down2.id != _up1) {
                                    
                                    //print("down2:\(words[down2.id]), interlock: \(words[down2.id][1])")
                                    let left2Words = letterIndex.find(words[down2.id][1])

                                    for left2 in left2Words {

                                        if (left2.end == 0 && //end[left2.id][0] == words[down2.id][1] &&
                                            len[left2.id] >= interlockWidth &&
                                            end[left2.id][1] == end[_up1][3] &&
                                            left2.id != down2.id &&
                                            left2.id != right1.id &&
                                            left2.id != _up1) {
                                            
                                            //print("left2:\(words[left2.id]), interlock: \(words[down2.id][2])")
                                            let right3Words = letterIndex.find(words[down2.id][2])

                                            for right3 in right3Words {

                                                if (right3.start == 1 && //words[right3.id][1] == words[down2.id][2] &&
                                                    len[right3.id] >= interlockWidth &&
                                                    words[right3.id][0] == end[_up1][2] &&
                                                    right3.id != left2.id &&
                                                    right3.id != down2.id &&
                                                    right3.id != right1.id &&
                                                    right3.id != _up1) {
                                                    
                                                    //print("right3:\(words[right3.id]), interlock: \(words[down2.id][3])")
                                                    let left4Words = letterIndex.find(words[down2.id][3])

                                                    for left4 in left4Words {

                                                        if (left4.end == 0 && //end[left4.id][0] == words[down2.id][3] &&
                                                            len[left4.id] >= interlockWidth &&
                                                            end[left4.id][1] == end[_up1][1] &&
                                                            left4.id != right3.id &&
                                                            left4.id != left2.id &&
                                                            left4.id != down2.id &&
                                                            left4.id != right1.id &&
                                                            left4.id != _up1) {
                                                            
                                                            //print("left4:\(words[left4.id]), interlock: \(words[down2.id][4])")
                                                            let right5Words = letterIndex.find(words[down2.id][4])

                                                            for right5 in right5Words {

                                                                if (right5.start == 1 && //words[right5.id][1] == words[down2.id][4] &&
                                                                    len[right5.id] >= interlockWidth &&
                                                                    words[right5.id][0] == end[_up1][0] &&
                                                                    right5.id != left4.id &&
                                                                    right5.id != right3.id &&
                                                                    right5.id != left2.id &&
                                                                    right5.id != down2.id &&
                                                                    right5.id != right1.id &&
                                                                    right5.id != _up1) {
                                                                    
                                                                    //print("right5:\(words[right5.id])")

                                                                    let cluster = ClusterModel(
                                                                        wordsHorizontal: [right1.id, left2.id, right3.id, left4.id, right5.id],
                                                                        wordsVertical: [_up1, down2.id],
                                                                        patternHorizontal: [.trailing, .leading, .trailing, .leading, .trailing],
                                                                        patternVertical: [.leading, .trailing],
                                                                        words: words,
                                                                        end: end,
                                                                        len: len)

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


    public static func C2x6_LRLRLR_DU(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {

            let wordCount = words.count
            let interlockWidth = 2
            let interlockHeight = 6
            var result: [ClusterModel] = []

            for _down1 in 0..<wordCount {

                if (len[_down1] >= interlockHeight) {
                    
                    //print("down1:\(words[_down1]), interlock: \(words[_down1][0])")
                    let left1Words = letterIndex.find(words[_down1][0])

                    for left1 in left1Words {

                        if (left1.end == 1 && //end[left1.id][1] == words[_down1][0] &&
                            len[left1.id] >= interlockWidth &&
                            left1.id != _down1) {
                            
                            //print("left1:\(words[left1.id]), interlock: \(end[left1.id][0])")
                            let up2Words = letterIndex.find(end[left1.id][0])

                            for up2 in up2Words {

                                if (up2.id != left1.id &&
                                    len[up2.id] >= interlockHeight &&
                                    up2.end == 5 && //end[up2.id][5] == end[left1.id][0] &&
                                    up2.id != _down1) {
                                    
                                    //print("up2:\(words[up2.id]), interlock: \(end[up2.id][4])")
                                    let right2Words = letterIndex.find(end[up2.id][4])

                                    for right2 in right2Words {

                                        if (right2.start == 1 && //words[right2.id][1] == end[up2.id][4] &&
                                            len[right2.id] >= interlockWidth &&
                                            words[right2.id][0] == words[_down1][1] &&
                                            right2.id != up2.id &&
                                            right2.id != left1.id &&
                                            right2.id != _down1) {
                                            
                                            //print("right2:\(words[right2.id])")
                                            //print("up2:\(words[up2.id]), interlock: \(end[up2.id][3])")
                                            let left3Words = letterIndex.find(end[up2.id][3])

                                            for left3 in left3Words {

                                                if (left3.end == 0 && //end[left3.id][0] == end[up2.id][3] &&
                                                    len[left3.id] >= interlockWidth &&
                                                    end[left3.id][1] == words[_down1][2] &&
                                                    left3.id != right2.id &&
                                                    left3.id != up2.id &&
                                                    left3.id != left1.id &&
                                                    left3.id != _down1) {
                                                    
                                                    //print("left3:\(words[left3.id])")
                                                    //print("up2:\(words[up2.id]), interlock: \(end[up2.id][2])")
                                                    let right4Words = letterIndex.find(end[up2.id][2])

                                                    for right4 in right4Words {

                                                        if (right4.start == 1 && //words[right4.id][1] == end[up2.id][2] &&
                                                            len[right4.id] >= interlockWidth &&
                                                            words[right4.id][0] == words[_down1][3] &&
                                                            right4.id != left3.id &&
                                                            right4.id != right2.id &&
                                                            right4.id != up2.id &&
                                                            right4.id != left1.id &&
                                                            right4.id != _down1) {
                                                            
                                                            //print("right4:\(words[right4.id])")
                                                            //print("up2:\(words[up2.id]), interlock: \(end[up2.id][1])")
                                                            let left5Words = letterIndex.find(end[up2.id][1])

                                                            for left5 in left5Words {

                                                                if (left5.end == 0 && //end[left5.id][0] == end[up2.id][1] &&
                                                                    len[left5.id] >= interlockWidth &&
                                                                    end[left5.id][1] == words[_down1][4] &&
                                                                    left5.id != right4.id &&
                                                                    left5.id != left3.id &&
                                                                    left5.id != right2.id &&
                                                                    left5.id != up2.id &&
                                                                    left5.id != left1.id &&
                                                                    left5.id != _down1) {
                                                                    
                                                                    //print("left5:\(words[left5.id])")
                                                                    //print("up2:\(words[up2.id]), interlock: \(end[up2.id][1])")
                                                                    let right6Words = letterIndex.find(end[up2.id][0])

                                                                    for right6 in right6Words {

                                                                        if (right6.start == 1 && //words[right6.id][1] == end[up2.id][0] &&
                                                                            len[right6.id] >= interlockWidth &&
                                                                            words[right6.id][0] == words[_down1][5] &&
                                                                            right6.id != left5.id &&
                                                                            right6.id != right4.id &&
                                                                            right6.id != left3.id &&
                                                                            right6.id != right2.id &&
                                                                            right6.id != up2.id &&
                                                                            right6.id != left1.id &&
                                                                            right6.id != _down1) {
                                                                            
                                                                            //print("right6:\(words[right6.id])")

                                                                            let cluster = ClusterModel(
                                                                                wordsHorizontal: [left1.id, right2.id, left3.id, right4.id, left5.id, right6.id],
                                                                                wordsVertical: [_down1, up2.id],
                                                                                patternHorizontal: [.leading, .trailing, .leading, .trailing, .leading, .trailing],
                                                                                patternVertical: [.trailing, .leading],
                                                                                words: words,
                                                                                end: end,
                                                                                len: len)

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
                }
            }
            return result
        }

    public static func C2x6_LRLRLR_UD(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {

            let wordCount = words.count
            let interlockWidth = 2
            let interlockHeight = 6
            var result: [ClusterModel] = []

            for _up1 in 0..<wordCount {

                if (len[_up1] >= interlockHeight) {
                    
                    //print("up1:\(words[_up1]), interlock: \(end[_up1][5])")
                    let left1Words = letterIndex.find(end[_up1][5])

                    for left1 in left1Words {

                        if (left1.end == 1 && //end[left1.id][1] == end[_up1][5] &&
                            len[left1.id] >= interlockWidth &&
                            left1.id != _up1) {
                            
                            //print("left1:\(words[left1.id]), interlock: \(end[left1.id][0])")
                            let down2Words = letterIndex.find(end[left1.id][0])

                            for down2 in down2Words {

                                if (down2.start == 0 && //words[down2.id][0] == end[left1.id][0] &&
                                    len[down2.id] >= interlockHeight &&
                                    down2.id != left1.id &&
                                    down2.id != _up1) {
                                    
                                    //print("down2:\(words[down2.id]), interlock: \(words[down2.id][1])")
                                    let right2Words = letterIndex.find(words[down2.id][1])

                                    for right2 in right2Words {

                                        if (right2.start == 1 && //words[right2.id][1] == words[down2.id][1] &&
                                            len[right2.id] >= interlockWidth &&
                                            words[right2.id][0] == end[_up1][4] &&
                                            right2.id != down2.id &&
                                            right2.id != left1.id &&
                                            right2.id != _up1) {
                                            
                                            //print("right2:\(words[right2.id]), interlock: \(words[down2.id][2])")
                                            let left3Words = letterIndex.find(words[down2.id][2])

                                            for left3 in left3Words {

                                                if (left3.end == 0 && //end[left3.id][0] == words[down2.id][2] &&
                                                    len[left3.id] >= interlockWidth &&
                                                    end[left3.id][1] == end[_up1][3] &&
                                                    left3.id != right2.id &&
                                                    left3.id != down2.id &&
                                                    left3.id != left1.id &&
                                                    left3.id != _up1) {
                                                    
                                                    //print("left3:\(words[left3.id]), interlock: \(words[down2.id][3])")
                                                    let right4Words = letterIndex.find(words[down2.id][3])

                                                    for right4 in right4Words {

                                                        if (right4.start == 1 && //words[right4.id][1] == words[down2.id][3] &&
                                                            len[right4.id] >= interlockWidth &&
                                                            words[right4.id][0] == end[_up1][2] &&
                                                            right4.id != left3.id &&
                                                            right4.id != right2.id &&
                                                            right4.id != down2.id &&
                                                            right4.id != left1.id &&
                                                            right4.id != _up1) {
                                                            
                                                            //print("right4:\(words[right4.id]), interlock: \(words[down2.id][4])")
                                                            let left5Words = letterIndex.find(words[down2.id][4])

                                                            for left5 in left5Words {

                                                                if (left5.end == 0 && //end[left5.id][0] == words[down2.id][4] &&
                                                                    len[left5.id] >= interlockWidth &&
                                                                    end[left5.id][1] == end[_up1][1] &&
                                                                    left5.id != right4.id &&
                                                                    left5.id != left3.id &&
                                                                    left5.id != right2.id &&
                                                                    left5.id != down2.id &&
                                                                    left5.id != left1.id &&
                                                                    left5.id != _up1) {
                                                                    
                                                                    //print("left5:\(words[left5.id]), interlock: \(words[down2.id][5])")
                                                                    let right6Words = letterIndex.find(words[down2.id][5])

                                                                    for right6 in right6Words {

                                                                        if (right6.start == 1 && //words[right6.id][1] == words[down2.id][5] &&
                                                                            len[right6.id] >= interlockWidth &&
                                                                            words[right6.id][0] == end[_up1][0] &&
                                                                            right6.id != left5.id &&
                                                                            right6.id != right4.id &&
                                                                            right6.id != left3.id &&
                                                                            right6.id != right2.id &&
                                                                            right6.id != down2.id &&
                                                                            right6.id != left1.id &&
                                                                            right6.id != _up1) {
                                                                            
                                                                            //print("right6:\(words[right6.id])")

                                                                            let cluster = ClusterModel(
                                                                                wordsHorizontal: [left1.id, right2.id, left3.id, right4.id, left5.id, right6.id],
                                                                                wordsVertical: [_up1, down2.id],
                                                                                patternHorizontal: [.leading, .trailing, .leading, .trailing, .leading, .trailing],
                                                                                patternVertical: [.leading, .trailing],
                                                                                words: words,
                                                                                end: end,
                                                                                len: len)

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
                }
            }
            return result
        }


    public static func C2x6_RLRLRL_DU(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {

            let wordCount = words.count
            let interlockWidth = 2
            let interlockHeight = 6
            var result: [ClusterModel] = []

            for _down1 in 0..<wordCount {

                if (len[_down1] >= interlockHeight) {
                    
                    //print("down1:\(words[_down1]), interlock: \(words[_down1][0])")
                    let right1Words = letterIndex.find(words[_down1][0])

                    for right1 in right1Words {

                        if (right1.start == 0 && //words[right1.id][0] == words[_down1][0] &&
                            len[right1.id] >= interlockWidth &&
                            right1.id != _down1) {
                            
                            //print("right1:\(words[right1.id]), interlock: \(words[right1.id][1])")
                            let up2Words = letterIndex.find(words[right1.id][1])

                            for up2 in up2Words {

                                if (up2.id != right1.id &&
                                    len[up2.id] >= interlockHeight &&
                                    up2.end == 5 && //end[up2.id][5] == words[right1.id][1] &&
                                    up2.id != _down1) {
                                    
                                    //print("up2:\(words[up2.id]), interlock: \(end[up2.id][4])")
                                    let left2Words = letterIndex.find(end[up2.id][4])

                                    for left2 in left2Words {

                                        if (left2.end == 0 && //end[left2.id][0] == end[up2.id][4] &&
                                            len[left2.id] >= interlockWidth &&
                                            end[left2.id][1] == words[_down1][1] &&
                                            left2.id != up2.id &&
                                            left2.id != right1.id &&
                                            left2.id != _down1) {
                                            
                                            //print("left2:\(words[left2.id]), interlock: \(end[up2.id][3])")
                                            let right3Words = letterIndex.find(end[up2.id][3])

                                            for right3 in right3Words {

                                                if (right3.start == 1 && //words[right3.id][1] == end[up2.id][3] &&
                                                    len[right3.id] >= interlockWidth &&
                                                    words[right3.id][0] == words[_down1][2] &&
                                                    right3.id != left2.id &&
                                                    right3.id != up2.id &&
                                                    right3.id != right1.id &&
                                                    right3.id != _down1) {
                                                    
                                                    //print("right3:\(words[right3.id]), interlock: \(end[up2.id][2])")
                                                    let left4Words = letterIndex.find(end[up2.id][2])

                                                    for left4 in left4Words {

                                                        if (left4.end == 0 && //end[left4.id][0] == end[up2.id][2] &&
                                                            len[left4.id] >= interlockWidth &&
                                                            end[left4.id][1] == words[_down1][3] &&
                                                            left4.id != right3.id &&
                                                            left4.id != left2.id &&
                                                            left4.id != up2.id &&
                                                            left4.id != right1.id &&
                                                            left4.id != _down1) {
                                                            
                                                            //print("left4:\(words[left4.id]), interlock: \(end[up2.id][1])")
                                                            let right5Words = letterIndex.find(end[up2.id][1])

                                                            for right5 in right5Words {

                                                                if (right5.start == 1 && //words[right5.id][1] == end[up2.id][1] &&
                                                                    len[right5.id] >= interlockWidth &&
                                                                    words[right5.id][0] == words[_down1][4] &&
                                                                    right5.id != left4.id &&
                                                                    right5.id != right3.id &&
                                                                    right5.id != left2.id &&
                                                                    right5.id != up2.id &&
                                                                    right5.id != right1.id &&
                                                                    right5.id != _down1) {
                                                                    
                                                                    //print("right5:\(words[right5.id]), interlock: \(end[up2.id][0])")
                                                                    let left6Words = letterIndex.find(end[up2.id][0])

                                                                    for left6 in left6Words {

                                                                        if (left6.end == 0 && //end[left6.id][0] == end[up2.id][0] &&
                                                                            len[left6.id] >= interlockWidth &&
                                                                            end[left6.id][1] == words[_down1][5] &&
                                                                            left6.id != right5.id &&
                                                                            left6.id != left4.id &&
                                                                            left6.id != right3.id &&
                                                                            left6.id != left2.id &&
                                                                            left6.id != up2.id &&
                                                                            left6.id != right1.id &&
                                                                            left6.id != _down1) {
                                                                            
                                                                            //print("left6:\(words[left6.id])")

                                                                            let cluster = ClusterModel(
                                                                                wordsHorizontal: [right1.id, left2.id, right3.id, left4.id, right5.id, left6.id],
                                                                                wordsVertical: [_down1, up2.id],
                                                                                patternHorizontal: [.trailing, .leading, .trailing, .leading, .trailing, .leading],
                                                                                patternVertical: [.trailing, .leading],
                                                                                words: words,
                                                                                end: end,
                                                                                len: len)

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
                }
            }
            return result
        }

    public static func C2x6_RLRLRL_UD(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {

            let wordCount = words.count
            let interlockWidth = 2
            let interlockHeight = 6
            var result: [ClusterModel] = []

            for _up1 in 0..<wordCount {

                if (len[_up1] >= interlockHeight) {
                    
                    //print("up1:\(words[_up1]), interlock: \(end[_up1][5])")
                    let right1Words = letterIndex.find(end[_up1][5])

                    for right1 in right1Words {

                        if (right1.start == 0 && //words[right1.id][0] == end[_up1][5] &&
                            len[right1.id] >= interlockWidth &&
                            right1.id != _up1) {
                            
                            //print("right1:\(words[right1.id]), interlock: \(words[right1.id][1])")
                            let down2Words = letterIndex.find(words[right1.id][1])

                            for down2 in down2Words {

                                if (down2.start == 0 && //words[down2.id][0] == words[right1.id][1] &&
                                    len[down2.id] >= interlockHeight &&
                                    down2.id != right1.id &&
                                    down2.id != _up1) {
                                    
                                    //print("down2:\(words[down2.id]), interlock: \(words[down2.id][1])")
                                    let left2Words = letterIndex.find(words[down2.id][1])

                                    for left2 in left2Words {

                                        if (left2.end == 0 && //end[left2.id][0] == words[down2.id][1] &&
                                            len[left2.id] >= interlockWidth &&
                                            end[left2.id][1] == end[_up1][4] &&
                                            left2.id != down2.id &&
                                            left2.id != right1.id &&
                                            left2.id != _up1) {
                                            
                                            //print("left2:\(words[left2.id]), interlock: \(words[down2.id][2])")
                                            let right3Words = letterIndex.find(words[down2.id][2])

                                            for right3 in right3Words {

                                                if (right3.start == 1 && //words[right3.id][1] == words[down2.id][2] &&
                                                    len[right3.id] >= interlockWidth &&
                                                    words[right3.id][0] == end[_up1][3] &&
                                                    right3.id != left2.id &&
                                                    right3.id != down2.id &&
                                                    right3.id != right1.id &&
                                                    right3.id != _up1) {
                                                    
                                                    //print("right3:\(words[right3.id]), interlock: \(words[down2.id][3])")
                                                    let left4Words = letterIndex.find(words[down2.id][3])

                                                    for left4 in left4Words {

                                                        if (left4.end == 0 && //end[left4.id][0] == words[down2.id][3] &&
                                                            len[left4.id] >= interlockWidth &&
                                                            end[left4.id][1] == end[_up1][2] &&
                                                            left4.id != right3.id &&
                                                            left4.id != left2.id &&
                                                            left4.id != down2.id &&
                                                            left4.id != right1.id &&
                                                            left4.id != _up1) {
                                                            
                                                            //print("left4:\(words[left4.id]), interlock: \(words[down2.id][4])")
                                                            let right5Words = letterIndex.find(words[down2.id][4])

                                                            for right5 in right5Words {

                                                                if (right5.start == 1 && //words[right5.id][1] == words[down2.id][4] &&
                                                                    len[right5.id] >= interlockWidth &&
                                                                    words[right5.id][0] == end[_up1][1] &&
                                                                    right5.id != left4.id &&
                                                                    right5.id != right3.id &&
                                                                    right5.id != left2.id &&
                                                                    right5.id != down2.id &&
                                                                    right5.id != right1.id &&
                                                                    right5.id != _up1) {
                                                                    
                                                                    //print("right5:\(words[right5.id]), interlock: \(words[down2.id][5])")
                                                                    let left6Words = letterIndex.find(words[down2.id][5])

                                                                    for left6 in left6Words {

                                                                        if (left6.end == 0 && //end[left6.id][0] == words[down2.id][5] &&
                                                                            len[left6.id] >= interlockWidth &&
                                                                            end[left6.id][1] == end[_up1][0] &&
                                                                            left6.id != right5.id &&
                                                                            left6.id != left4.id &&
                                                                            left6.id != right3.id &&
                                                                            left6.id != left2.id &&
                                                                            left6.id != down2.id &&
                                                                            left6.id != right1.id &&
                                                                            left6.id != _up1) {
                                                                            
                                                                            //print("left6:\(words[left6.id])")

                                                                            let cluster = ClusterModel(
                                                                                wordsHorizontal: [right1.id, left2.id, right3.id, left4.id, right5.id, left6.id],
                                                                                wordsVertical: [_up1, down2.id],
                                                                                patternHorizontal: [.trailing, .leading, .trailing, .leading, .trailing, .leading],
                                                                                patternVertical: [.leading, .trailing],
                                                                                words: words,
                                                                                end: end,
                                                                                len: len)

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
                }
            }
            return result
        }




    public static func C3x3_LRL_UDU(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {

            let wordCount = words.count
            let interlockWidth = 3
            let interlockHeight = 3
            var result: [ClusterModel] = []

            for _up1 in 0..<wordCount {

                if (len[_up1] >= interlockHeight) {
                    
                    //print("up1:\(words[_up1]), interlock: \(end[_up1][2])")
                    let left1Words = letterIndex.find(end[_up1][2])

                    for left1 in left1Words {

                        if (left1.end == 2 && //end[left1.id][2] == end[_up1][2] &&
                            len[left1.id] >= interlockWidth &&
                            left1.id > _up1) {
                            
                            //print("left1:\(words[left1.id]), interlock: \(end[left1.id][1])")
                            let down2Words = letterIndex.find(end[left1.id][1])

                            for down2 in down2Words {

                                if (down2.start == 0 && //words[down2.id][0] == end[left1.id][1] &&
                                    len[down2.id] >= interlockHeight &&
                                    down2.id != left1.id &&
                                    down2.id != _up1) {
                                    
                                    //print("down2:\(words[down2.id]), interlock: \(words[down2.id][1])")
                                    let right2Words = letterIndex.find(words[down2.id][1])

                                    for right2 in right2Words {

                                        if (right2.start == 1 && //words[right2.id][1] == words[down2.id][1] &&
                                            len[right2.id] >= interlockWidth &&
                                            words[right2.id][0] == end[_up1][1] &&
                                            right2.id != down2.id &&
                                            right2.id != left1.id &&
                                            right2.id != _up1) {
                                            
                                            //print("right2:\(words[right2.id]), interlock: \(words[right2.id][2])")
                                            let up3Words = letterIndex.find(words[right2.id][2])

                                            for up3 in up3Words {

                                                if (up3.end == 1 && //end[up3.id][1] == words[right2.id][2] &&
                                                    len[up3.id] >= interlockHeight &&
                                                    end[up3.id][2] == end[left1.id][0] &&
                                                    up3.id != right2.id &&
                                                    up3.id != down2.id &&
                                                    up3.id != left1.id &&
                                                    up3.id != _up1) {
                                                    
                                                    //print("up3:\(words[up3.id]), interlock: \(end[up3.id][0])")
                                                    let left3Words = letterIndex.find(end[up3.id][0])

                                                    for left3 in left3Words {

                                                        if (left3.end == 0 && //end[left3.id][0] == end[up3.id][0] &&
                                                            len[left3.id] >= interlockWidth &&
                                                            end[left3.id][2] == end[_up1][0] &&
                                                            end[left3.id][1] == words[down2.id][2] &&
                                                            left3.id != up3.id &&
                                                            left3.id != right2.id &&
                                                            left3.id != down2.id &&
                                                            left3.id != left1.id &&
                                                            left3.id != _up1) {
                                                            
                                                            //print("left3:\(words[left3.id])")
                    
                                                            let cluster = ClusterModel(
                                                                wordsHorizontal: [left1.id, right2.id, left3.id],
                                                                wordsVertical: [_up1, down2.id, up3.id],
                                                                patternHorizontal: [.leading, .trailing, .leading],
                                                                patternVertical: [.leading, .trailing, .leading],
                                                                words: words,
                                                                end: end,
                                                                len: len)

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

    public static func C3x3_RLR_DUD(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {

            let wordCount = words.count
            let interlockWidth = 3
            let interlockHeight = 3
            var result: [ClusterModel] = []

            for _down1 in 0..<wordCount {

                if (len[_down1] >= interlockHeight) {
                    
                    //print("down1:\(words[_down1]), interlock: \(words[_down1][0])")
                    let right1Words = letterIndex.find(words[_down1][0])

                    for right1 in right1Words {

                        if (right1.start == 0 && //words[right1.id][0] == words[_down1][0] &&
                            len[right1.id] >= interlockWidth &&
                            right1.id > _down1) {
                            
                            //print("right1:\(words[right1.id]), interlock: \(words[right1.id][1])")
                            let up2Words = letterIndex.find(words[right1.id][1])

                            for up2 in up2Words {

                                if (up2.end == 2 && //end[up2.id][2] == words[right1.id][1] &&
                                    len[up2.id] >= interlockHeight &&
                                    up2.id != right1.id &&
                                    up2.id != _down1) {
                                    
                                    //print("up2:\(words[up2.id]), interlock: \(end[up2.id][1])")
                                    let left2Words = letterIndex.find(end[up2.id][1])

                                    for left2 in left2Words {

                                        if (left2.end == 1 && //end[left2.id][1] == end[up2.id][1] &&
                                            len[left2.id] >= interlockWidth &&
                                            end[left2.id][2] == words[_down1][1] &&
                                            left2.id != up2.id &&
                                            left2.id != right1.id &&
                                            left2.id != _down1) {
                                            
                                            //print("left2:\(words[left2.id]), interlock: \(end[left2.id][0])")
                                            let down3Words = letterIndex.find(end[left2.id][0])

                                            for down3 in down3Words {

                                                if (down3.start == 1 && //words[down3.id][1] == end[left2.id][0] &&
                                                    len[down3.id] >= interlockHeight &&
                                                    words[down3.id][0] == words[right1.id][2] &&
                                                    down3.id != left2.id &&
                                                    down3.id != up2.id &&
                                                    down3.id != right1.id &&
                                                    down3.id != _down1) {
                                                    
                                                    //print("down3:\(words[down3.id]), interlock: \(words[down3.id][2])")
                                                    let right3Words = letterIndex.find(words[down3.id][2])

                                                    for right3 in right3Words {

                                                        if (right3.start == 2 && //words[right3.id][2] == words[down3.id][2] &&
                                                            len[right3.id] >= interlockWidth &&
                                                            words[right3.id][0] == words[_down1][2] &&
                                                            words[right3.id][1] == end[up2.id][0] &&
                                                            right3.id != down3.id &&
                                                            right3.id != left2.id &&
                                                            right3.id != up2.id &&
                                                            right3.id != right1.id &&
                                                            right3.id != _down1) {
                                                            
                                                            //print("right3:\(words[right3.id])")

                                                            let cluster = ClusterModel(
                                                                wordsHorizontal: [right1.id, left2.id, right3.id],
                                                                wordsVertical: [_down1, up2.id, down3.id],
                                                                patternHorizontal: [.trailing, .leading, .trailing],
                                                                patternVertical: [.trailing, .leading, .trailing],
                                                                words: words,
                                                                end: end,
                                                                len: len)

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

    // Does not require duplicate checking as it forms a different shape LRL_DUD so we also exclude LRL_DUD as this provides LRL_DUD also
    public static func C3x3_RLR_UDU(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {

            let wordCount = words.count
            let interlockWidth = 3
            let interlockHeight = 3
            var result: [ClusterModel] = []

            for _up1 in 0..<wordCount {

                if (len[_up1] >= interlockHeight) {
                    
                    //print("up1:\(words[_up1]), interlock: \(end[_up1][2])")
                    let right1Words = letterIndex.find(end[_up1][2])

                    for right1 in right1Words {

                        if (right1.start == 0 && //words[right1.id][0] == end[_up1][2] &&
                            len[right1.id] >= interlockWidth &&
                            right1.id != _up1) {
                            
                            //print("right1:\(words[right1.id]), interlock: \(words[right1.id][1])")
                            let down2Words = letterIndex.find(words[right1.id][1])

                            for down2 in down2Words {

                                if (down2.start == 0 && //words[down2.id][0] == words[right1.id][1] &&
                                    len[down2.id] >= interlockHeight &&
                                    down2.id != right1.id &&
                                    down2.id != _up1) {
                                    
                                    //print("down2:\(words[down2.id]), interlock: \(words[down2.id][1])")
                                    let left2Words = letterIndex.find(words[down2.id][1])

                                    for left2 in left2Words {

                                        if (left2.end == 1 && //end[left2.id][1] == words[down2.id][1] &&
                                            len[left2.id] >= interlockWidth &&
                                            end[left2.id][2] == end[_up1][1] &&
                                            left2.id != down2.id &&
                                            left2.id != right1.id &&
                                            left2.id != _up1) {
                                                                                
                                            //print("left2:\(words[left2.id]), interlock: \(end[left2.id][0])")
                                            let up3Words = letterIndex.find(end[left2.id][0])

                                            for up3 in up3Words {

                                                if (up3.end == 1 && //end[up3.id][1] == end[left2.id][0] &&
                                                    len[up3.id] >= interlockHeight &&
                                                    end[up3.id][2] == words[right1.id][2] &&
                                                    up3.id != left2.id &&
                                                    up3.id != down2.id &&
                                                    up3.id != right1.id &&
                                                    up3.id != _up1) {
                                                    
                                                    //print("up3:\(words[up3.id]), interlock: \(end[up3.id][0])")
                                                    let right3Words = letterIndex.find(end[up3.id][0])

                                                    for right3 in right3Words {

                                                        if (right3.start == 2 && //words[right3.id][2] == end[up3.id][0] &&
                                                            len[right3.id] >= interlockWidth &&
                                                            words[right3.id][0] == end[_up1][0] &&
                                                            words[right3.id][1] == words[down2.id][2] &&
                                                            right3.id != up3.id &&
                                                            right3.id != left2.id &&
                                                            right3.id != down2.id &&
                                                            right3.id != right1.id &&
                                                            right3.id != _up1) {
                                                            
                                                            //print("right3:\(words[right3.id])")

                                                            let cluster = ClusterModel(
                                                                wordsHorizontal: [right1.id, left2.id, right3.id],
                                                                wordsVertical: [_up1, down2.id, up3.id],
                                                                patternHorizontal: [.trailing, .leading, .trailing],
                                                                patternVertical: [.leading, .trailing, .leading],
                                                                words: words,
                                                                end: end,
                                                                len: len)

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



    public static func C3x4_LRLR_DUD(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {

            let wordCount = words.count
            let interlockWidth = 3
            let interlockHeight = 4
            var result: [ClusterModel] = []

            for _down1 in 0..<wordCount {

                if (len[_down1] >= interlockHeight) {
                    
                    //print("down1:\(words[_down1]), interlock: \(words[_down1][0])")
                    let left1Words = letterIndex.find(words[_down1][0])

                    for left1 in left1Words {

                        if (left1.end == 2 && //end[left1.id][2] == words[_down1][0] &&
                            len[left1.id] >= interlockWidth &&
                            left1.id != _down1) {
                            
                            //print("left1:\(words[left1.id]), interlock: \(end[left1.id][1])")
                            let up2Words = letterIndex.find(end[left1.id][1])

                            for up2 in up2Words {

                                if (up2.end == 3 && //end[up2.id][3] == end[left1.id][1] &&
                                    len[up2.id] >= interlockHeight &&
                                    up2.id != left1.id &&
                                    up2.id != _down1) {
                                    
                                    //print("up2:\(words[up2.id]), interlock: \(end[up2.id][2])")
                                    let right2Words = letterIndex.find(end[up2.id][2])

                                    for right2 in right2Words {

                                        if (right2.start == 1 && //words[right2.id][1] == end[up2.id][2] &&
                                            len[right2.id] >= interlockWidth &&
                                            words[right2.id][0] == words[_down1][1] &&
                                            right2.id != up2.id &&
                                            right2.id != left1.id &&
                                            right2.id != _down1) {
                                            
                                            //print("right2:\(words[right2.id]), interlock: \(words[right2.id][2])")
                                            let down3Words = letterIndex.find(words[right2.id][2])

                                            for down3 in down3Words {

                                                if (down3.start == 1 && //words[down3.id][1] == words[right2.id][2] &&
                                                    len[down3.id] >= interlockHeight &&
                                                    words[down3.id][0] == end[left1.id][0] &&
                                                    down3.id != right2.id &&
                                                    down3.id != up2.id &&
                                                    down3.id != left1.id &&
                                                    down3.id != _down1) {
                                                    
                                                    //print("down3:\(words[down3.id]), interlock: \(words[down3.id][2])")
                                                    let left3Words = letterIndex.find(words[down3.id][2])

                                                    for left3 in left3Words {

                                                        if (left3.end == 0 && //end[left3.id][0] == words[down3.id][2] &&
                                                            len[left3.id] >= interlockWidth &&
                                                            end[left3.id][2] == words[_down1][2] &&
                                                            end[left3.id][1] == end[up2.id][1] &&
                                                            left3.id != down3.id &&
                                                            left3.id != right2.id &&
                                                            left3.id != up2.id &&
                                                            left3.id != left1.id &&
                                                            left3.id != _down1) {
                                                            
                                                            //print("left3:\(words[left3.id]), interlock: \(words[down3.id][3])")
                                                            let right4Words = letterIndex.find(words[down3.id][3])

                                                            for right4 in right4Words {

                                                                if (right4.start == 2 && //words[right4.id][2] == words[down3.id][3] &&
                                                                    len[right4.id] >= interlockWidth &&
                                                                    words[right4.id][0] == words[_down1][3] &&
                                                                    words[right4.id][1] == end[up2.id][0] &&
                                                                    right4.id != left3.id &&
                                                                    right4.id != down3.id &&
                                                                    right4.id != right2.id &&
                                                                    right4.id != up2.id &&
                                                                    right4.id != left1.id &&
                                                                    right4.id != _down1) {
                                                                    
                                                                    //print("right4:\(words[right4.id])")

                                                                    let cluster = ClusterModel(
                                                                        wordsHorizontal: [left1.id, right2.id, left3.id, right4.id],
                                                                        wordsVertical: [_down1, up2.id, down3.id],
                                                                        patternHorizontal: [.leading, .trailing, .leading, .trailing],
                                                                        patternVertical: [.trailing, .leading, .trailing],
                                                                        words: words,
                                                                        end: end,
                                                                        len: len)

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

    public static func C3x4_RLRL_DUD(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {

            let wordCount = words.count
            let interlockWidth = 3
            let interlockHeight = 4
            var result: [ClusterModel] = []

            for _down1 in 0..<wordCount {

                if (len[_down1] >= interlockHeight) {
                    
                    //print("down1:\(words[_down1]), interlock: \(words[_down1][0])")
                    let right1Words = letterIndex.find(words[_down1][0])

                    for right1 in right1Words {

                        if (right1.start == 0 && //words[right1.id][0] == words[_down1][0] &&
                            len[right1.id] >= interlockWidth &&
                            right1.id != _down1) {
                            
                            //print("right1:\(words[right1.id]), interlock: \(words[right1.id][1])")
                            let up2Words = letterIndex.find(words[right1.id][1])

                            for up2 in up2Words {

                                if (up2.end == 3 && //end[up2.id][3] == words[right1.id][1] &&
                                    len[up2.id] >= interlockHeight &&
                                    up2.id != right1.id &&
                                    up2.id != _down1) {
                                    
                                    //print("up2:\(words[up2.id]), interlock: \(end[up2.id][2])")
                                    let left2Words = letterIndex.find(end[up2.id][2])

                                    for left2 in left2Words {

                                        if (left2.end == 1 && //end[left2.id][1] == end[up2.id][2] &&
                                            len[left2.id] >= interlockWidth &&
                                            end[left2.id][2] == words[_down1][1] &&
                                            left2.id != up2.id &&
                                            left2.id != right1.id &&
                                            left2.id != _down1) {
                                            
                                            //print("left2:\(words[left2.id]), interlock: \(end[left2.id][0])")
                                            let down3Words = letterIndex.find(end[left2.id][0])

                                            for down3 in down3Words {
                                                
                                                if (down3.start == 1 && //words[down3.id][1] == end[left2.id][0] &&
                                                    len[down3.id] >= interlockHeight &&
                                                    words[down3.id][0] == words[right1.id][2] &&
                                                    down3.id != left2.id &&
                                                    down3.id != up2.id &&
                                                    down3.id != right1.id &&
                                                    down3.id != _down1) {
                                                    
                                                    //print("down3:\(words[down3.id]), interlock: \(words[down3.id][2])")
                                                    let right3Words = letterIndex.find(words[down3.id][2])

                                                    for right3 in right3Words {

                                                        if (right3.start == 2 && //words[right3.id][2] == words[down3.id][2] &&
                                                            len[right3.id] >= interlockWidth &&
                                                            words[right3.id][0] == words[_down1][2] &&
                                                            words[right3.id][1] == end[up2.id][1] &&
                                                            right3.id != down3.id &&
                                                            right3.id != left2.id &&
                                                            right3.id != up2.id &&
                                                            right3.id != right1.id &&
                                                            right3.id != _down1) {
                                                            
                                                            //print("right3:\(words[right3.id])")
                                                            //print("down3:\(words[down3.id]), interlock: \(words[down3.id][3])")
                                                            let left4Words = letterIndex.find(words[down3.id][3])

                                                            for left4 in left4Words {

                                                                if (left4.end == 0 && //end[left4.id][0] == words[down3.id][3] &&
                                                                    len[left4.id] >= interlockWidth &&
                                                                    end[left4.id][2] == words[_down1][3] &&
                                                                    end[left4.id][1] == end[up2.id][0] &&
                                                                    left4.id != right3.id &&
                                                                    left4.id != down3.id &&
                                                                    left4.id != left2.id &&
                                                                    left4.id != up2.id &&
                                                                    left4.id != right1.id &&
                                                                    left4.id != _down1) {
                                                                    
                                                                    //print("left4:\(words[left4.id])")
                                                                    
                                                                    let cluster = ClusterModel(
                                                                        wordsHorizontal: [right1.id, left2.id, right3.id, left4.id],
                                                                        wordsVertical: [_down1, up2.id, down3.id],
                                                                        patternHorizontal: [.trailing, .leading, .trailing, .leading],
                                                                        patternVertical: [.trailing, .leading, .trailing],
                                                                        words: words,
                                                                        end: end,
                                                                        len: len)

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

    public static func C3x4_LRLR_UDU(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {

            let wordCount = words.count
            let interlockWidth = 3
            let interlockHeight = 4
            var result: [ClusterModel] = []

        
            for _up1 in 0..<wordCount {

                if (len[_up1] >= interlockHeight) {
                    
                    //print("up1:\(words[_up1]), interlock: \(end[_up1][3])")
                    let left1Words = letterIndex.find(end[_up1][3])

                    for left1 in left1Words {

                        if (left1.end == 2 && //end[left1.id][2] == end[_up1][3] &&
                            len[left1.id] >= interlockWidth &&
                            left1.id != _up1) {
                            
                            //print("left1:\(words[left1.id]), interlock: \(end[left1.id][1])")
                            let down2Words = letterIndex.find(end[left1.id][1])

                            for down2 in down2Words {

                                if (down2.start == 0 && //words[down2.id][0] == end[left1.id][1] &&
                                    len[down2.id] >= interlockHeight &&
                                    down2.id != left1.id &&
                                    down2.id != _up1) {
                                    
                                    //print("down2:\(words[down2.id]), interlock: \(words[down2.id][1])")
                                    let right2Words = letterIndex.find(words[down2.id][1])

                                    for right2 in right2Words {

                                        if (right2.start == 1 && //words[right2.id][1] == words[down2.id][1] &&
                                            len[right2.id] >= interlockWidth &&
                                            words[right2.id][0] == end[_up1][2] &&
                                            right2.id != down2.id &&
                                            right2.id != left1.id &&
                                            right2.id != _up1) {
                                            
                                            //print("right2:\(words[right2.id]), interlock: \(words[right2.id][2])")
                                            let up3Words = letterIndex.find(words[right2.id][2])

                                            for up3 in up3Words {

                                                if (up3.end == 2 && //end[up3.id][2] == words[right2.id][2] &&
                                                    len[up3.id] >= interlockHeight &&
                                                    end[up3.id][3] == end[left1.id][0] &&
                                                    up3.id != right2.id &&
                                                    up3.id != down2.id &&
                                                    up3.id != left1.id &&
                                                    up3.id != _up1) {
                                                    
                                                    //print("up3:\(words[up3.id]), interlock: \(end[up3.id][1])")
                                                    let left3Words = letterIndex.find(end[up3.id][1])

                                                    for left3 in left3Words {

                                                        if (left3.end == 0 && //end[left3.id][0] == end[up3.id][1] &&
                                                            len[left3.id] >= interlockWidth &&
                                                            end[left3.id][2] == end[_up1][1] &&
                                                            end[left3.id][1] == words[down2.id][2] &&
                                                            left3.id != up3.id &&
                                                            left3.id != right2.id &&
                                                            left3.id != down2.id &&
                                                            left3.id != left1.id &&
                                                            left3.id != _up1) {
                                                            
                                                            //print("left3:\(words[left3.id]), interlock: \(end[up3.id][0])")
                                                            let right4Words = letterIndex.find(end[up3.id][0])

                                                            for right4 in right4Words {

                                                                if (right4.start == 2 && //words[right4.id][2] == end[up3.id][0] &&
                                                                    len[right4.id] >= interlockWidth &&
                                                                    words[right4.id][0] == end[_up1][0] &&
                                                                    words[right4.id][1] == words[down2.id][3] &&
                                                                    right4.id != left3.id &&
                                                                    right4.id != up3.id &&
                                                                    right4.id != right2.id &&
                                                                    right4.id != down2.id &&
                                                                    right4.id != left1.id &&
                                                                    right4.id != _up1) {
                                                                    
                                                                    //print("right4:\(words[right4.id])")

                                                                    let cluster = ClusterModel(
                                                                        wordsHorizontal: [left1.id, right2.id, left3.id, right4.id],
                                                                        wordsVertical: [_up1, down2.id, up3.id],
                                                                        patternHorizontal: [.leading, .trailing, .leading, .trailing],
                                                                        patternVertical: [.leading, .trailing, .leading],
                                                                        words: words,
                                                                        end: end,
                                                                        len: len)

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

    public static func C3x4_RLRL_UDU(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {

            let wordCount = words.count
            let interlockWidth = 3
            let interlockHeight = 4
            var result: [ClusterModel] = []

            for _up1 in 0..<wordCount {

                if (len[_up1] >= interlockHeight) {
                    
                    //print("up1:\(words[_up1]), interlock: \(end[_up1][3])")
                    let right1Words = letterIndex.find(end[_up1][3])

                    for right1 in right1Words {

                        if (right1.start == 0 && //words[right1.id][0] == end[_up1][3] &&
                            len[right1.id] >= interlockWidth &&
                            right1.id != _up1) {
                            
                            //print("right1:\(words[right1.id]), interlock: \(words[right1.id][1])")
                            let down2Words = letterIndex.find(words[right1.id][1])

                            for down2 in down2Words {

                                if (down2.start == 0 && //words[down2.id][0] == words[right1.id][1] &&
                                    len[down2.id] >= interlockHeight &&
                                    down2.id != right1.id &&
                                    down2.id != _up1) {
                                    
                                    //print("down2:\(words[down2.id]), interlock: \(words[down2.id][1])")
                                    let left2Words = letterIndex.find(words[down2.id][1])

                                    for left2 in left2Words {

                                        if (left2.end == 1 && //end[left2.id][1] == words[down2.id][1] &&
                                            len[left2.id] >= interlockWidth &&
                                            end[left2.id][2] == end[_up1][2] &&
                                            left2.id != down2.id &&
                                            left2.id != right1.id &&
                                            left2.id != _up1) {
                                            
                                            //print("left2:\(words[left2.id]), interlock: \(end[left2.id][0])")
                                            let up3Words = letterIndex.find(end[left2.id][0])

                                            for up3 in up3Words {

                                                if (up3.end == 2 && //end[up3.id][2] == end[left2.id][0] &&
                                                    len[up3.id] >= interlockHeight &&
                                                    end[up3.id][3] == words[right1.id][2] &&
                                                    up3.id != left2.id &&
                                                    up3.id != down2.id &&
                                                    up3.id != right1.id &&
                                                    up3.id != _up1) {
                                                    
                                                    //print("up3:\(words[up3.id]), interlock: \(end[up3.id][1])")
                                                    let right3Words = letterIndex.find(end[up3.id][1])

                                                    for right3 in right3Words {

                                                        if (right3.start == 2 && //words[right3.id][2] == end[up3.id][1] &&
                                                            len[right3.id] >= interlockWidth &&
                                                            words[right3.id][0] == end[_up1][1] &&
                                                            words[right3.id][1] == words[down2.id][2] &&
                                                            right3.id != up3.id &&
                                                            right3.id != left2.id &&
                                                            right3.id != down2.id &&
                                                            right3.id != right1.id &&
                                                            right3.id != _up1) {
                                                            
                                                            //print("right3:\(words[right3.id]), interlock: \(end[up3.id][0])")
                                                            let left4Words = letterIndex.find(end[up3.id][0])

                                                            for left4 in left4Words {

                                                                if (left4.end == 0 && //end[left4.id][0] == end[up3.id][0] &&
                                                                    len[left4.id] >= interlockWidth &&
                                                                    end[left4.id][2] == end[_up1][0] &&
                                                                    end[left4.id][1] == words[down2.id][3] &&
                                                                    left4.id != right3.id &&
                                                                    left4.id != up3.id &&
                                                                    left4.id != left2.id &&
                                                                    left4.id != down2.id &&
                                                                    left4.id != right1.id &&
                                                                    left4.id != _up1) {
                                                                    
                                                                    //print("left4:\(words[left4.id])")

                                                                    let cluster = ClusterModel(
                                                                        wordsHorizontal: [right1.id, left2.id, right3.id, left4.id],
                                                                        wordsVertical: [_up1, down2.id, up3.id],
                                                                        patternHorizontal: [.trailing, .leading, .trailing, .leading],
                                                                        patternVertical: [.leading, .trailing, .leading],
                                                                        words: words,
                                                                        end: end,
                                                                        len: len)

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

    public static func C3x5_LRLRL_DUD(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {

            let wordCount = words.count
            let interlockWidth = 3
            let interlockHeight = 5
            var result: [ClusterModel] = []

            for _down1 in 0..<wordCount {

                if (len[_down1] >= interlockHeight) {
                    
                    //print("down1:\(words[_down1]), interlock: \(words[_down1][0])")
                    let left1Words = letterIndex.find(words[_down1][0])

                    for left1 in left1Words {

                        if (left1.end == 2 && //end[left1.id][2] == words[_down1][0] &&
                            len[left1.id] >= interlockWidth &&
                            left1.id != _down1) {
                            
                            //print("left1:\(words[left1.id]), interlock: \(end[left1.id][1])")
                            let up2Words = letterIndex.find(end[left1.id][1])

                            for up2 in up2Words {

                                if (up2.end == 4 && //end[up2.id][4] == end[left1.id][1] &&
                                    len[up2.id] >= interlockHeight &&
                                    up2.id != left1.id &&
                                    up2.id != _down1) {
                                    
                                    //print("up2:\(words[up2.id]), interlock: \(end[up2.id][3])")
                                    let right2Words = letterIndex.find(end[up2.id][3])

                                    for right2 in right2Words {

                                        if (right2.start == 1 && //words[right2.id][1] == end[up2.id][3] &&
                                            len[right2.id] >= interlockWidth &&
                                            words[right2.id][0] == words[_down1][1] &&
                                            right2.id != up2.id &&
                                            right2.id != left1.id &&
                                            right2.id != _down1) {
                                            
                                            //print("right2:\(words[right2.id]), interlock: \(words[right2.id][2])")
                                            let down3Words = letterIndex.find(words[right2.id][2])

                                            for down3 in down3Words {

                                                if (down3.start == 1 && //words[down3.id][1] == words[right2.id][2] &&
                                                    len[down3.id] >= interlockHeight &&
                                                    words[down3.id][0] == end[left1.id][0] &&
                                                    down3.id != right2.id &&
                                                    down3.id != up2.id &&
                                                    down3.id != left1.id &&
                                                    down3.id != _down1) {
                                                    
                                                    //print("down3:\(words[down3.id]), interlock: \(words[down3.id][2])")
                                                    let left3Words = letterIndex.find(words[down3.id][2])

                                                    for left3 in left3Words {

                                                        if (left3.end == 0 && //end[left3.id][0] == words[down3.id][2] &&
                                                            len[left3.id] >= interlockWidth &&
                                                            end[left3.id][2] == words[_down1][2] &&
                                                            end[left3.id][1] == end[up2.id][2] &&
                                                            left3.id != down3.id &&
                                                            left3.id != right2.id &&
                                                            left3.id != up2.id &&
                                                            left3.id != left1.id &&
                                                            left3.id != _down1) {
                                                            
                                                            //print("left3:\(words[left3.id]), interlock: \(words[down3.id][3])")
                                                            let right4Words = letterIndex.find(words[down3.id][3])

                                                            for right4 in right4Words {

                                                                if (right4.start == 2 && //words[right4.id][2] == words[down3.id][3] &&
                                                                    len[right4.id] >= interlockWidth &&
                                                                    words[right4.id][0] == words[_down1][3] &&
                                                                    words[right4.id][1] == end[up2.id][1] &&
                                                                    right4.id != left3.id &&
                                                                    right4.id != down3.id &&
                                                                    right4.id != right2.id &&
                                                                    right4.id != up2.id &&
                                                                    right4.id != left1.id &&
                                                                    right4.id != _down1) {
                                                                    
                                                                    //print("right4:\(words[right4.id]), interlock: \(words[down3.id][4])")
                                                                    let left5Words = letterIndex.find(words[down3.id][4])

                                                                    for left5 in left5Words {

                                                                        if (left5.end == 0 && //end[left5.id][0] == words[down3.id][4] &&
                                                                            len[left5.id] >= interlockWidth &&
                                                                            end[left5.id][2] == words[_down1][4] &&
                                                                            end[left5.id][1] == end[up2.id][0] &&
                                                                            left5.id != right4.id &&
                                                                            left5.id != left3.id &&
                                                                            left5.id != down3.id &&
                                                                            left5.id != right2.id &&
                                                                            left5.id != up2.id &&
                                                                            left5.id != left1.id &&
                                                                            left5.id != _down1) {
                                                                            
                                                                            //print("left5:\(words[left5.id])")

                                                                            let cluster = ClusterModel(
                                                                                wordsHorizontal: [left1.id, right2.id, left3.id, right4.id, left5.id],
                                                                                wordsVertical: [_down1, up2.id, down3.id],
                                                                                patternHorizontal: [.leading, .trailing, .leading, .trailing, .leading],
                                                                                patternVertical: [.trailing, .leading, .trailing],
                                                                                words: words,
                                                                                end: end,
                                                                                len: len)

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
                }
            }
            return result
        }

    public static func C3x5_LRLRL_UDU(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {

            let wordCount = words.count
            let interlockWidth = 3
            let interlockHeight = 5
            var result: [ClusterModel] = []

            for _up1 in 0..<wordCount {

                if (len[_up1] >= interlockHeight) {
                    
                    //print("up1:\(words[_up1]), interlock: \(end[_up1][4])")
                    let left1Words = letterIndex.find(end[_up1][4])

                    for left1 in left1Words {

                        if (left1.end == 2 && //end[left1.id][2] == end[_up1][4] &&
                            len[left1.id] >= interlockWidth &&
                            left1.id != _up1) {
                            
                            //print("left1:\(words[left1.id]), interlock: \(end[left1.id][1])")
                            let down2Words = letterIndex.find(end[left1.id][1])

                            for down2 in down2Words {

                                if (down2.start == 0 && //words[down2.id][0] == end[left1.id][1] &&
                                    len[down2.id] >= interlockHeight &&
                                    down2.id != left1.id &&
                                    down2.id != _up1) {
                                    
                                    //print("down2:\(words[down2.id]), interlock: \(words[down2.id][1])")
                                    let right2Words = letterIndex.find(words[down2.id][1])

                                    for right2 in right2Words {

                                        if (right2.start == 1 && //words[right2.id][1] == words[down2.id][1] &&
                                            len[right2.id] >= interlockWidth &&
                                            words[right2.id][0] == end[_up1][3] &&
                                            right2.id != down2.id &&
                                            right2.id != left1.id &&
                                            right2.id != _up1) {
                                            
                                            //print("right2:\(words[right2.id]), interlock: \(words[right2.id][2])")
                                            let up3Words = letterIndex.find(words[right2.id][2])

                                            for up3 in up3Words {

                                                if (up3.end == 3 && //end[up3.id][3] == words[right2.id][2] &&
                                                    len[up3.id] >= interlockHeight &&
                                                    end[up3.id][4] == end[left1.id][0] &&
                                                    up3.id != right2.id &&
                                                    up3.id != down2.id &&
                                                    up3.id != left1.id &&
                                                    up3.id != _up1) {
                                                    
                                                    //print("up3:\(words[up3.id]), interlock: \(end[up3.id][2])")
                                                    let left3Words = letterIndex.find(end[up3.id][2])

                                                    for left3 in left3Words {

                                                        if (left3.end == 0 && //end[left3.id][0] == end[up3.id][2] &&
                                                            len[left3.id] >= interlockWidth &&
                                                            end[left3.id][2] == end[_up1][2] &&
                                                            end[left3.id][1] == words[down2.id][2] &&
                                                            left3.id != up3.id &&
                                                            left3.id != right2.id &&
                                                            left3.id != down2.id &&
                                                            left3.id != left1.id &&
                                                            left3.id != _up1) {
                                                            
                                                            //print("left3:\(words[left3.id]), interlock: \(end[up3.id][1])")
                                                            let right4Words = letterIndex.find(end[up3.id][1])

                                                            for right4 in right4Words {

                                                                if (right4.start == 2 && //words[right4.id][2] == end[up3.id][1] &&
                                                                    len[right4.id] >= interlockWidth &&
                                                                    words[right4.id][0] == end[_up1][1] &&
                                                                    words[right4.id][1] == words[down2.id][3] &&
                                                                    right4.id != left3.id &&
                                                                    right4.id != up3.id &&
                                                                    right4.id != right2.id &&
                                                                    right4.id != down2.id &&
                                                                    right4.id != left1.id &&
                                                                    right4.id != _up1) {
                                                                    
                                                                    //print("right4:\(words[right4.id]), interlock: \(end[up3.id][0])") ***
                                                                    let left5Words = letterIndex.find(end[up3.id][0])

                                                                    for left5 in left5Words {

                                                                        if (left5.end == 0 && //end[left5.id][0] == end[up3.id][0] &&
                                                                            len[left5.id] >= interlockWidth &&
                                                                            end[left5.id][2] == end[_up1][0] &&
                                                                            end[left5.id][1] == words[down2.id][4] &&
                                                                            left5.id != right4.id &&
                                                                            left5.id != left3.id &&
                                                                            left5.id != up3.id &&
                                                                            left5.id != right2.id &&
                                                                            left5.id != down2.id &&
                                                                            left5.id != left1.id &&
                                                                            left5.id != _up1) {
                                                                            
                                                                            //print("left5:\(words[left5.id])")

                                                                            let cluster = ClusterModel(
                                                                                wordsHorizontal: [left1.id, right2.id, left3.id, right4.id, left5.id],
                                                                                wordsVertical: [_up1, down2.id, up3.id],
                                                                                patternHorizontal: [.leading, .trailing, .leading, .trailing, .leading],
                                                                                patternVertical: [.leading, .trailing, .leading],
                                                                                words: words,
                                                                                end: end,
                                                                                len: len)

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
                }
            }
            return result
        }

    public static func C3x5_RLRLR_DUD(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {

            let wordCount = words.count
            let interlockWidth = 3
            let interlockHeight = 5
            var result: [ClusterModel] = []

            for _down1 in 0..<wordCount {

                if (len[_down1] >= interlockHeight) {
                    
                    //print("down1:\(words[_down1]), interlock: \(words[_down1][0])")
                    let right1Words = letterIndex.find(words[_down1][0])

                    for right1 in right1Words {

                        if (right1.start == 0 && //words[right1.id][0] == words[_down1][0] &&
                            len[right1.id] >= interlockWidth &&
                            right1.id != _down1) {
                            
                            //print("right1:\(words[right1.id]), interlock: \(words[right1.id][1])")
                            let up2Words = letterIndex.find(words[right1.id][1])

                            for up2 in up2Words {

                                if (up2.end == 4 && //end[up2.id][4] == words[right1.id][1] &&
                                    len[up2.id] >= interlockHeight &&
                                    up2.id != right1.id &&
                                    up2.id != _down1) {
                                    
                                    //print("up2:\(words[up2.id]), interlock: \(end[up2.id][3])")
                                    let left2Words = letterIndex.find(end[up2.id][3])

                                    for left2 in left2Words {

                                        if (left2.end == 1 && //end[left2.id][1] == end[up2.id][3] &&
                                            len[left2.id] >= interlockWidth &&
                                            end[left2.id][2] == words[_down1][1] &&
                                            left2.id != up2.id &&
                                            left2.id != right1.id &&
                                            left2.id != _down1) {
                                            
                                            //print("left2:\(words[left2.id]), interlock: \(end[left2.id][0])")
                                            let down3Words = letterIndex.find(end[left2.id][0])

                                            for down3 in down3Words {

                                                if (down3.start == 1 && //words[down3.id][1] == end[left2.id][0] &&
                                                    len[down3.id] >= interlockHeight &&
                                                    words[down3.id][0] == words[right1.id][2] &&
                                                    down3.id != left2.id &&
                                                    down3.id != up2.id &&
                                                    down3.id != right1.id &&
                                                    down3.id != _down1) {
                                                    
                                                    //print("down3:\(words[down3.id]), interlock: \(words[down3.id][2])")
                                                    let right3Words = letterIndex.find(words[down3.id][2])

                                                    for right3 in right3Words {

                                                        if (right3.start == 2 && //words[right3.id][2] == words[down3.id][2] &&
                                                            len[right3.id] >= interlockWidth &&
                                                            words[right3.id][0] == words[_down1][2] &&
                                                            words[right3.id][1] == end[up2.id][2] &&
                                                            right3.id != down3.id &&
                                                            right3.id != left2.id &&
                                                            right3.id != up2.id &&
                                                            right3.id != right1.id &&
                                                            right3.id != _down1) {
                                                            
                                                            //print("right3:\(words[right3.id]), interlock: \(words[down3.id][3])") ***
                                                            let left4Words = letterIndex.find(words[down3.id][3])

                                                            for left4 in left4Words {

                                                                if (left4.end == 0 && //end[left4.id][0] == words[down3.id][3] &&
                                                                    len[left4.id] >= interlockWidth &&
                                                                    end[left4.id][2] == words[_down1][3] &&
                                                                    end[left4.id][1] == end[up2.id][1] &&
                                                                    left4.id != right3.id &&
                                                                    left4.id != down3.id &&
                                                                    left4.id != left2.id &&
                                                                    left4.id != up2.id &&
                                                                    left4.id != right1.id &&
                                                                    left4.id != _down1) {
                                                                    
                                                                    //print("left4:\(words[left4.id]), interlock: \(words[down3.id][4])") ***
                                                                    let right5Words = letterIndex.find(words[down3.id][4])

                                                                    for right5 in right5Words {

                                                                        if (right5.start == 2 && //words[right5.id][2] == words[down3.id][4] &&
                                                                            len[right5.id] >= interlockWidth &&
                                                                            words[right5.id][0] == words[_down1][4] &&
                                                                            words[right5.id][1] == end[up2.id][0] &&
                                                                            right5.id != left4.id &&
                                                                            right5.id != right3.id &&
                                                                            right5.id != down3.id &&
                                                                            right5.id != left2.id &&
                                                                            right5.id != up2.id &&
                                                                            right5.id != right1.id &&
                                                                            right5.id != _down1) {
                                                                            
                                                                            //print("right5:\(words[right5.id])")

                                                                            let cluster = ClusterModel(
                                                                                wordsHorizontal: [right1.id, left2.id, right3.id, left4.id, right5.id],
                                                                                wordsVertical: [_down1, up2.id, down3.id],
                                                                                patternHorizontal: [.trailing, .leading, .trailing, .leading, .trailing],
                                                                                patternVertical: [.trailing, .leading, .trailing],
                                                                                words: words,
                                                                                end: end,
                                                                                len: len)

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
                }
            }
            return result
        }

    public static func C3x5_RLRLR_UDU(letterIndex: LetterIndexModel, words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterModel] {

            let wordCount = words.count
            let interlockWidth = 3
            let interlockHeight = 5
            var result: [ClusterModel] = []

            for _up1 in 0..<wordCount {

                if (len[_up1] >= interlockHeight) {
                    
                    //print("up1:\(words[_up1]), interlock: \(end[_up1][4])")
                    let right1Words = letterIndex.find(end[_up1][4])

                    for right1 in right1Words {

                        if (right1.start == 0 && //words[right1.id][0] == end[_up1][4] &&
                            len[right1.id] >= interlockWidth &&
                            right1.id != _up1) {
                            
                            //print("right1:\(words[right1.id]), interlock: \(words[right1.id][1])")
                            let down2Words = letterIndex.find(words[right1.id][1])

                            for down2 in down2Words {

                                if (down2.start == 0 && //words[down2.id][0] == words[right1.id][1] &&
                                    len[down2.id] >= interlockHeight &&
                                    down2.id != right1.id &&
                                    down2.id != _up1) {
                                    
                                    //print("down2:\(words[down2.id]), interlock: \(words[down2.id][1])")
                                    let left2Words = letterIndex.find(words[down2.id][1])

                                    for left2 in left2Words {

                                        if (left2.end == 1 && //end[left2.id][1] == words[down2.id][1] &&
                                            len[left2.id] >= interlockWidth &&
                                            end[left2.id][2] == end[_up1][3] &&
                                            left2.id != down2.id &&
                                            left2.id != right1.id &&
                                            left2.id != _up1) {
                                            
                                            //print("left2:\(words[left2.id]), interlock: \(end[left2.id][0])")
                                            let up3Words = letterIndex.find(end[left2.id][0])

                                            for up3 in up3Words {

                                                if (up3.end == 3 && //end[up3.id][3] == end[left2.id][0] &&
                                                    len[up3.id] >= interlockHeight &&
                                                    end[up3.id][4] == words[right1.id][2] &&
                                                    up3.id != left2.id &&
                                                    up3.id != down2.id &&
                                                    up3.id != right1.id &&
                                                    up3.id != _up1) {
                                                    
                                                    //print("up3:\(words[up3.id]), interlock: \(end[up3.id][2])")
                                                    let right3Words = letterIndex.find(end[up3.id][2])

                                                    for right3 in right3Words {

                                                        if (right3.start == 2 && //words[right3.id][2] == end[up3.id][2] &&
                                                            len[right3.id] >= interlockWidth &&
                                                            words[right3.id][0] == end[_up1][2] &&
                                                            words[right3.id][1] == words[down2.id][2] &&
                                                            right3.id != up3.id &&
                                                            right3.id != left2.id &&
                                                            right3.id != down2.id &&
                                                            right3.id != right1.id &&
                                                            right3.id != _up1) {
                                                            
                                                            //print("right3:\(words[right3.id]), interlock: \(end[up3.id][1])") ***
                                                            let left4Words = letterIndex.find(end[up3.id][1])

                                                            for left4 in left4Words {

                                                                if (left4.end == 0 && //end[left4.id][0] == end[up3.id][1] &&
                                                                    len[left4.id] >= interlockWidth &&
                                                                    end[left4.id][2] == end[_up1][1] &&
                                                                    end[left4.id][1] == words[down2.id][3] &&
                                                                    left4.id != right3.id &&
                                                                    left4.id != up3.id &&
                                                                    left4.id != left2.id &&
                                                                    left4.id != down2.id &&
                                                                    left4.id != right1.id &&
                                                                    left4.id != _up1) {
                                                                    
                                                                    //print("left4:\(words[left4.id]), interlock: \(end[up3.id][0]") ***
                                                                    let right5Words = letterIndex.find(end[up3.id][0])

                                                                    for right5 in right5Words {

                                                                        if (right5.start == 2 && //words[right5.id][2] == end[up3.id][0] &&
                                                                            len[right5.id] >= interlockWidth &&
                                                                            words[right5.id][0] == end[_up1][0] &&
                                                                            words[right5.id][1] == words[down2.id][4] &&
                                                                            right5.id != left4.id &&
                                                                            right5.id != right3.id &&
                                                                            right5.id != up3.id &&
                                                                            right5.id != left2.id &&
                                                                            right5.id != down2.id &&
                                                                            right5.id != right1.id &&
                                                                            right5.id != _up1) {
                                                                            
                                                                            //print("right5:\(words[right5.id])")

                                                                            let cluster = ClusterModel(
                                                                                wordsHorizontal: [right1.id, left2.id, right3.id, left4.id, right5.id],
                                                                                wordsVertical: [_up1, down2.id, up3.id],
                                                                                patternHorizontal: [.trailing, .leading, .trailing, .leading, .trailing],
                                                                                patternVertical: [.leading, .trailing, .leading],
                                                                                words: words,
                                                                                end: end,
                                                                                len: len)

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
                }
            }
            return result
        }

}
