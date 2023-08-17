//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 18/8/2023.
//

import Foundation
public class Cluster2Calculator {
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
                                            start: words,
                                            end: end,
                                            len: len
                                        )
                                        
                                        if cluster.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
                        
                                            //let text = cluster.ToText(words:words)
                                            //if text.contains("#") == false {
                                                result.append(cluster)
                                            //}
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
                    
                    if (right1.start == 0 && // Its the starting word that is matching
                        len[right1.id] >= interlockWidth &&
                        right1.id != _down1) {
                        
                        //print("right1:\(words[right1.id]), interlock:\(words[right1.id][1])")
                        
                        let up2Words = letterIndex.find(words[right1.id][1])
                        
                        for up2 in up2Words {
                            
                            if (up2.end == 1 && // Interlocks with second last letter from the end of up2
                                len[up2.id] >= interlockHeight &&
                                up2.id != right1.id &&
                                up2.id != _down1) {
                                
                                //print("up2:\(words[up2.id]), interlock:\(end[up2.id][0])")
                                
                                let left2Words = letterIndex.find(end[up2.id][0])
                                
                                // This is where I put the (up2+1)
                                for left2 in left2Words {
                                    
                                    if (left2.id > up2.id && // To avoid duplicates we assure that left is higher than up
                                        left2.end == 0 &&
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
                                            start: words,
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
                    
                    if (right1.start == 0 && /// Interlocks with first letter of right1
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
                                            start: words,
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
}
