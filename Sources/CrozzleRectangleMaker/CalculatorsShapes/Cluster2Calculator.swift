//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 18/8/2023.
//

import Foundation
public class Cluster2Calculator {
    
    
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
                                 
                                 //print("up2:\(words[up2]), interlock:\()")
                                 let left2Words = letterIndex.find(end[up2.id][1])
                                 
                                 for left2 in left2Words {

                                     if (left2.end == 0 &&
                                         len[left2.id] >= interlockWidth &&
                                         end[left2.id][1] == words[_down1][1] &&
                                         left2.id != up2.id &&
                                         left2.id != right1.id &&
                                         left2.id != _down1) {
                                         
                                         //print("left2:\(words[left2]), interlock:\()")
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
                 //print("up1:\(words[up1]), interlock:\()")
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
                                         //print("left2:\(words[left2]), interlock:\()")

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
    
    
    
    
    
    
    
    
    
    public static func C2x4_LRLR_DU(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = (wordsMax == 0) ? words.count : wordsMax
         let interlockWidth = 2
         let interlockHeight = 4
         var result: [ClusterModel] = []

         for down1 in 0..<wordCount {

             if (len[down1] >= interlockHeight) {
                 //print("down1:\(words[down1])")

                 for left1 in 0..<wordCount {

                     if (len[left1] >= interlockWidth &&
                         end[left1][1] == words[down1][0] &&
                         left1 != down1) {
                         //print("left1:\(words[left1])")

                         for up2 in 0..<wordCount {

                             if (len[up2] >= interlockHeight &&
                                 end[up2][3] == end[left1][0] &&
                                 up2 != left1 &&
                                 up2 != down1) {
                                 //print("up2:\(words[up2])")

                                 for right2 in 0..<wordCount {

                                     if (len[right2] >= interlockWidth &&
                                         words[right2][0] == words[down1][1] &&
                                         words[right2][1] == end[up2][2] &&
                                         right2 != up2 &&
                                         right2 != left1 &&
                                         right2 != down1) {
                                         //print("right2:\(words[right2])")

                                         for left3 in 0..<wordCount {

                                             if (len[left3] >= interlockWidth &&
                                                 end[left3][1] == words[down1][2] &&
                                                 end[left3][0] == end[up2][1] &&
                                                 left3 != right2 &&
                                                 left3 != up2 &&
                                                 left3 != left1 &&
                                                 left3 != down1) {
                                                 //print("left3:\(words[left3])")

                                                 for right4 in 0..<wordCount {

                                                     if (len[right4] >= interlockWidth &&
                                                         words[right4][0] == words[down1][3] &&
                                                         words[right4][1] == end[up2][0] &&
                                                         right4 != left3 &&
                                                         right4 != right2 &&
                                                         right4 != up2 &&
                                                         right4 != left1 &&
                                                         right4 != down1) {
                                                         //print("right4:\(words[right4])")

                                                         let cluster = ClusterModel(
                                                             wordsHorizontal: [left1, right2, left3, right4],
                                                             wordsVertical: [down1, up2],
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
    
    public static func C2x4_LRLR_UD(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = words.count
         let interlockWidth = 2
         let interlockHeight = 4
         var result: [ClusterModel] = []

         for up1 in 0..<wordCount {

             if (len[up1] >= interlockHeight) {
                 //print("up1:\(words[up1])")

                 for left1 in 0..<wordCount {

                     if (len[left1] >= interlockWidth &&
                         end[left1][1] == end[up1][3] &&
                         left1 != up1) {
                         //print("left1:\(words[left1])")

                         for down2 in 0..<wordCount {

                             if (len[down2] >= interlockHeight &&
                                 words[down2][0] == end[left1][0] &&
                                 down2 != left1 &&
                                 down2 != up1) {
                                 //print("down2:\(words[down2])")

                                 for right2 in 0..<wordCount {

                                     if (len[right2] >= interlockWidth &&
                                         words[right2][0] == end[up1][2] &&
                                         words[right2][1] == words[down2][1] &&
                                         right2 != down2 &&
                                         right2 != left1 &&
                                         right2 != up1) {
                                         //print("right2:\(words[right2])")

                                         for left3 in 0..<wordCount {

                                             if (len[left3] >= interlockWidth &&
                                                 end[left3][1] == end[up1][1] &&
                                                 end[left3][0] == words[down2][2] &&
                                                 left3 != right2 &&
                                                 left3 != down2 &&
                                                 left3 != left1 &&
                                                 left3 != up1) {
                                                 //print("left3:\(words[left3])")

                                                 for right4 in 0..<wordCount {

                                                     if (len[right4] >= interlockWidth &&
                                                         words[right4][0] == end[up1][0] &&
                                                         words[right4][1] == words[down2][3] &&
                                                         right4 != left3 &&
                                                         right4 != right2 &&
                                                         right4 != down2 &&
                                                         right4 != left1 &&
                                                         right4 != up1) {
                                                         //print("right4:\(words[right4])")

                                                         let cluster = ClusterModel(
                                                             wordsHorizontal: [left1, right2, left3, right4],
                                                             wordsVertical: [up1, down2],
                                                             patternHorizontal: [.leading, .trailing, .leading, .trailing],
                                                             patternVertical: [.leading, .trailing],
                                                             words: words,
                                                             end: end,
                                                             len: len)

                                                         if cluster.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
                                                             let text = cluster.ToText(words:words)
                                                             if text.contains("#") == false {
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

    public static func C2x4_RLRL_DU(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = words.count
         let interlockWidth = 2
         let interlockHeight = 4
         var result: [ClusterModel] = []

         for down1 in 0..<wordCount {

             if (len[down1] >= interlockHeight) {
                 //print("down1:\(words[down1])")

                 for right1 in 0..<wordCount {

                     if (len[right1] >= interlockWidth &&
                         words[right1][0] == words[down1][0] &&
                         right1 != down1) {
                         //print("right1:\(words[right1])")

                         for up2 in 0..<wordCount {

                             if (len[up2] >= interlockHeight &&
                                 end[up2][3] == words[right1][1] &&
                                 up2 != right1 &&
                                 up2 != down1) {
                                 //print("up2:\(words[up2])")

                                 for left2 in 0..<wordCount {

                                     if (len[left2] >= interlockWidth &&
                                         end[left2][1] == words[down1][1] &&
                                         end[left2][0] == end[up2][2] &&
                                         left2 != up2 &&
                                         left2 != right1 &&
                                         left2 != down1) {
                                         //print("left2:\(words[left2])")

                                         for right3 in 0..<wordCount {

                                             if (len[right3] >= interlockWidth &&
                                                 words[right3][0] == words[down1][2] &&
                                                 words[right3][1] == end[up2][1] &&
                                                 right3 != left2 &&
                                                 right3 != up2 &&
                                                 right3 != right1 &&
                                                 right3 != down1) {
                                                 //print("right3:\(words[right3])")

                                                 for left4 in 0..<wordCount {

                                                     if (len[left4] >= interlockWidth &&
                                                         end[left4][1] == words[down1][3] &&
                                                         end[left4][0] == end[up2][0] &&
                                                         left4 != right3 &&
                                                         left4 != left2 &&
                                                         left4 != up2 &&
                                                         left4 != right1 &&
                                                         left4 != down1) {
                                                         //print("left4:\(words[left4])")

                                                         let cluster = ClusterModel(
                                                             wordsHorizontal: [right1, left2, right3, left4],
                                                             wordsVertical: [down1, up2],
                                                             patternHorizontal: [.trailing, .leading, .trailing, .leading],
                                                             patternVertical: [.trailing, .leading],
                                                             words: words,
                                                             end: end,
                                                             len: len)

                                                         if cluster.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
                                                             let text = cluster.ToText(words:words)
                                                             if text.contains("#") == false {
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
    
    
    public static func C2x4_RLRL_UD(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = words.count
         let interlockWidth = 2
         let interlockHeight = 4
         var result: [ClusterModel] = []

         for up1 in 0..<wordCount {

             if (len[up1] >= interlockHeight) {
                 //print("up1:\(words[up1])")

                 for right1 in 0..<wordCount {

                     if (len[right1] >= interlockWidth &&
                         words[right1][0] == end[up1][3] &&
                         right1 != up1) {
                         //print("right1:\(words[right1])")

                         for down2 in 0..<wordCount {

                             if (len[down2] >= interlockHeight &&
                                 words[down2][0] == words[right1][1] &&
                                 down2 != right1 &&
                                 down2 != up1) {
                                 //print("down2:\(words[down2])")

                                 for left2 in 0..<wordCount {

                                     if (len[left2] >= interlockWidth &&
                                         end[left2][1] == end[up1][2] &&
                                         end[left2][0] == words[down2][1] &&
                                         left2 != down2 &&
                                         left2 != right1 &&
                                         left2 != up1) {
                                         //print("left2:\(words[left2])")

                                         for right3 in 0..<wordCount {

                                             if (len[right3] >= interlockWidth &&
                                                 words[right3][0] == end[up1][1] &&
                                                 words[right3][1] == words[down2][2] &&
                                                 right3 != left2 &&
                                                 right3 != down2 &&
                                                 right3 != right1 &&
                                                 right3 != up1) {
                                                 //print("right3:\(words[right3])")

                                                 for left4 in 0..<wordCount {

                                                     if (len[left4] >= interlockWidth &&
                                                         end[left4][1] == end[up1][0] &&
                                                         end[left4][0] == words[down2][3] &&
                                                         left4 != right3 &&
                                                         left4 != left2 &&
                                                         left4 != down2 &&
                                                         left4 != right1 &&
                                                         left4 != up1) {
                                                         //print("left4:\(words[left4])")

                                                         let cluster = ClusterModel(
                                                             wordsHorizontal: [right1, left2, right3, left4],
                                                             wordsVertical: [up1, down2],
                                                             patternHorizontal: [.trailing, .leading, .trailing, .leading],
                                                             patternVertical: [.leading, .trailing],
                                                             words: words,
                                                             end: end,
                                                             len: len)

                                                         if cluster.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
                                                             let text = cluster.ToText(words:words)
                                                             if text.contains("#") == false {
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
}
