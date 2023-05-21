//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 21/5/2023.
//

import Foundation
struct ClusterCalculator {
    static func C2x2_LR_UD(start: [String], end: [String], len:[Int], wordCount: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterMakerModel] {
        
        let interlockWidth = 2
        let interlockHeight = 2
        var result: [ClusterMakerModel] = []
        
        //var textList: [String] = []
        
        for up1 in 0..<wordCount {
            
            if (len[up1] >= interlockHeight) {
                //print("up1:\(W.Start[up1])")
                
                for left1 in (up1+1)..<wordCount {
                    
                    if (len[left1] >= interlockWidth &&
                        end[left1][1] == end[up1][1] &&
                        left1 != up1) {
                        //print("left1:\(W.Start[left1])")
                        
                        for down2 in 0..<wordCount {
                            
                            if (len[down2] >= interlockHeight &&
                                start[down2][0] == end[left1][0] &&
                                down2 != left1 &&
                                down2 != up1) {
                                //print("down2:\(W.Start[down2])")
                                
                                for right2 in 0..<wordCount {
                                    
                                    if (len[right2] >= interlockWidth &&
                                        start[right2][0] == end[up1][0] &&
                                        start[right2][1] == start[down2][1] &&
                                        right2 != down2 &&
                                        right2 != left1 &&
                                        right2 != up1) {
                                        //print("right2:\(W.Start[right2])")
                                        
                                        let cluster = ClusterMakerModel(
                                            wordsHorizontal: [left1, right2], // We could put id here if needed
                                            wordsVertical: [up1, down2],
                                            patternHorizontal: [.leading, .trailing],
                                            patternVertical: [.leading, .trailing],
                                            start: start,
                                            end: end,
                                            len: len
                                        )
                                        
                                        if cluster.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
                                            //print("left1:\(start[left1]), right2:\(start[right2]), up1:\(start[up1]), down2:\(start[down2])")
                                            //                                             let text = cluster.ToText(words:start)
                                            //
                                            //                                             textList.append(text)
                                            //                                             let textReversed = cluster.ToTextFlipped(words: start)
                                            //                                             textList.append(textReversed)
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
        //textList.sort()
        
        //        for text in textList {
        //            print(text)
        //            print("")
        //        }
        
        return result
    }
    
    
    static func C2x2_RL_DU(start: [String], end: [String], len:[Int], wordCount: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterMakerModel] {
        
        let interlockWidth = 2
        let interlockHeight = 2
        var result: [ClusterMakerModel] = []
        
        for down1 in 0..<wordCount {
            
            if (len[down1] >= interlockHeight) {
                //print("down1:\(W.Start[down1])")
                
                for right1 in 0..<wordCount {
                    
                    if (len[right1] >= interlockWidth &&
                        start[right1][0] == start[down1][0] &&
                        right1 != down1) {
                        //print("right1:\(W.Start[right1])")
                        
                        for up2 in 0..<wordCount {
                            
                            if (len[up2] >= interlockHeight &&
                                end[up2][1] == start[right1][1] &&
                                up2 != right1 &&
                                up2 != down1) {
                                //print("up2:\(W.Start[up2])")
                                
                                for left2 in (up2+1)..<wordCount {
                                    
                                    if (len[left2] >= interlockWidth &&
                                        end[left2][1] == start[down1][1] &&
                                        end[left2][0] == end[up2][0] &&
                                        left2 != up2 &&
                                        left2 != right1 &&
                                        left2 != down1) {
                                        //print("left2:\(W.Start[left2])")
                                        
                                        let cluster = ClusterMakerModel(
                                            wordsHorizontal: [right1, left2], // We could put id here if needed
                                            wordsVertical: [down1, up2],
                                            patternHorizontal: [.trailing, .leading],
                                            patternVertical: [.trailing, .leading],
                                            start: start,
                                            end: end,
                                            len: len
                                        )
                                        
                                        if cluster.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
                                            //print("left1:\(start[left1]), right2:\(start[right2]), up1:\(start[up1]), down2:\(start[down2])")
                                            //                                             let text = cluster.ToText(words:start)
                                            //
                                            //                                             textList.append(text)
                                            //                                             let textReversed = cluster.ToTextFlipped(words: start)
                                            //                                             textList.append(textReversed)
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
    static func C2x2_RL_UD(start: [String], end: [String], len:[Int], wordCount: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterMakerModel] {
        
        let interlockWidth = 2
        let interlockHeight = 2
        var result: [ClusterMakerModel] = []
        
        //var textList: [String] = []
        
        for up1 in 0..<wordCount {
            
            if (len[up1] >= interlockHeight) {
                //print("up1:\(W.Start[up1])")
                
                for right1 in 0..<wordCount {
                    
                    if (len[right1] >= interlockWidth &&
                        start[right1][0] == end[up1][1] &&
                        right1 != up1) {
                        //print("right1:\(W.Start[right1])")
                        
                        for down2 in 0..<wordCount {
                            
                            if (len[down2] >= interlockHeight &&
                                start[down2][0] == start[right1][1] &&
                                down2 != right1 &&
                                down2 != up1) {
                                //print("down2:\(W.Start[down2])")
                                
                                for left2 in 0..<wordCount {
                                    
                                    if (len[left2] >= interlockWidth &&
                                        end[left2][1] == end[up1][0] &&
                                        end[left2][0] == start[down2][1] &&
                                        left2 != down2 &&
                                        left2 != right1 &&
                                        left2 != up1) {
                                        //print("left2:\(W.Start[left2])")
                                        
                                        let cluster = ClusterMakerModel(
                                            wordsHorizontal: [right1, left2], // We could put id here if needed
                                            wordsVertical: [up1, down2],
                                            patternHorizontal: [.trailing, .leading],
                                            patternVertical: [.leading, .trailing],
                                            start: start,
                                            end: end,
                                            len: len)
                                        
                                        
                                        if cluster.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
                                            //print("left1:\(start[left1]), right2:\(start[right2]), up1:\(start[up1]), down2:\(start[down2])")
                                            //                                             let text = cluster.ToText(words:start)
                                            //
                                            //                                             textList.append(text)
                                            //                                             let textReversed = cluster.ToTextFlipped(words: start)
                                            //                                             textList.append(textReversed)
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
    
    
    
    static func C2x3_LRL_DU(start: [String], end: [String], len:[Int], wordCount: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterMakerModel] {
        
        let interlockWidth = 2
        let interlockHeight = 3
        var result: [ClusterMakerModel] = []
        
        for down1 in 0..<wordCount {
            
            if (len[down1] >= interlockHeight) {
                //print("down1:\(start[down1])")
                
                for left1 in 0..<wordCount {
                    
                    if (len[left1] >= interlockWidth &&
                        end[left1][1] == start[down1][0] &&
                        left1 != down1) {
                        //print("left1:\(start[left1])")
                        
                        for up2 in 0..<wordCount {
                            
                            if (len[up2] >= interlockHeight &&
                                end[up2][2] == end[left1][0] &&
                                up2 != left1 &&
                                up2 != down1) {
                                //print("up2:\(start[up2])")
                                
                                for right2 in 0..<wordCount {
                                    
                                    if (len[right2] >= interlockWidth &&
                                        start[right2][0] == start[down1][1] &&
                                        start[right2][1] == end[up2][1] &&
                                        right2 != up2 &&
                                        right2 != left1 &&
                                        right2 != down1) {
                                        //print("right2:\(start[right2])")
                                        
                                        for left3 in 0..<wordCount {
                                            
                                            if (len[left3] >= interlockWidth &&
                                                end[left3][1] == start[down1][2] &&
                                                end[left3][0] == end[up2][0] &&
                                                left3 != right2 &&
                                                left3 != up2 &&
                                                left3 != left1 &&
                                                left3 != down1) {
                                                //print("left3:\(start[left3])")
                                                
                                                let cluster = ClusterMakerModel(
                                                    wordsHorizontal: [left1, right2, left3],
                                                    wordsVertical: [down1, up2],
                                                    patternHorizontal: [.leading, .trailing, .leading],
                                                    patternVertical: [.trailing, .leading],
                                                    start: start,
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
    
    static func C2x3_LRL_UD(start: [String], end: [String], len:[Int], wordCount: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterMakerModel] {

         let interlockWidth = 2
         let interlockHeight = 3
         var result: [ClusterMakerModel] = []

        for up1 in 0..<wordCount {
            
            if (len[up1] >= interlockHeight) {
                //print("up1:\(start[up1])")
                
                for left1 in 0..<wordCount {
                    
                    if (len[left1] >= interlockWidth &&
                        end[left1][1] == end[up1][2] &&
                        left1 != up1) {
                        //print("left1:\(start[left1])")
                        
                        for down2 in 0..<wordCount {
                            
                            if (len[down2] >= interlockHeight &&
                                start[down2][0] == end[left1][0] &&
                                down2 != left1 &&
                                down2 != up1) {
                                //print("down2:\(start[down2])")
                                
                                for right2 in 0..<wordCount {
                                    
                                    if (len[right2] >= interlockWidth &&
                                        start[right2][0] == end[up1][1] &&
                                        start[right2][1] == start[down2][1] &&
                                        right2 != down2 &&
                                        right2 != left1 &&
                                        right2 != up1) {
                                        //print("right2:\(start[right2])")
                                        
                                        for left3 in 0..<wordCount {
                                            
                                            if (len[left3] >= interlockWidth &&
                                                end[left3][1] == end[up1][0] &&
                                                end[left3][0] == start[down2][2] &&
                                                left3 != right2 &&
                                                left3 != down2 &&
                                                left3 != left1 &&
                                                left3 != up1) {
                                                //print("left3:\(start[left3])")
                                                
                                                let cluster = ClusterMakerModel(
                                                    wordsHorizontal: [left1, right2, left3],
                                                    wordsVertical: [up1, down2],
                                                    patternHorizontal: [.leading, .trailing, .leading],
                                                    patternVertical: [.leading, .trailing],
                                                    start: start,
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
    
    static func C2x3_RLR_DU(start: [String], end: [String], len:[Int], wordCount: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterMakerModel] {

         let interlockWidth = 2
         let interlockHeight = 3
         var result: [ClusterMakerModel] = []

         for down1 in 0..<wordCount {

             if (len[down1] >= interlockHeight) {
                 //print("down1:\(start[down1])")

                 for right1 in 0..<wordCount {

                     if (len[right1] >= interlockWidth &&
                         start[right1][0] == start[down1][0] &&
                         right1 != down1) {
                         //print("right1:\(start[right1])")

                         for up2 in 0..<wordCount {

                             if (len[up2] >= interlockHeight &&
                                 end[up2][2] == start[right1][1] &&
                                 up2 != right1 &&
                                 up2 != down1) {
                                 //print("up2:\(start[up2])")

                                 for left2 in 0..<wordCount {

                                     if (len[left2] >= interlockWidth &&
                                         end[left2][1] == start[down1][1] &&
                                         end[left2][0] == end[up2][1] &&
                                         left2 != up2 &&
                                         left2 != right1 &&
                                         left2 != down1) {
                                         //print("left2:\(start[left2])")

                                         for right3 in 0..<wordCount {

                                             if (len[right3] >= interlockWidth &&
                                                 start[right3][0] == start[down1][2] &&
                                                 start[right3][1] == end[up2][0] &&
                                                 right3 != left2 &&
                                                 right3 != up2 &&
                                                 right3 != right1 &&
                                                 right3 != down1) {
                                                 //print("right3:\(start[right3])")

                                                 let cluster = ClusterMakerModel(
                                                     wordsHorizontal: [right1, left2, right3],
                                                     wordsVertical: [down1, up2],
                                                     patternHorizontal: [.trailing, .leading, .trailing],
                                                     patternVertical: [.trailing, .leading],
                                                     start: start,
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
    
    static func C2x3_RLR_UD(start: [String], end: [String], len:[Int], wordCount: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterMakerModel] {

         let interlockWidth = 2
         let interlockHeight = 3
         var result: [ClusterMakerModel] = []

         for up1 in 0..<wordCount {

             if (len[up1] >= interlockHeight) {
                 //print("up1:\(start[up1])")

                 for right1 in 0..<wordCount {

                     if (len[right1] >= interlockWidth &&
                         start[right1][0] == end[up1][2] &&
                         right1 != up1) {
                         //print("right1:\(start[right1])")

                         for down2 in 0..<wordCount {

                             if (len[down2] >= interlockHeight &&
                                 start[down2][0] == start[right1][1] &&
                                 down2 != right1 &&
                                 down2 != up1) {
                                 //print("down2:\(start[down2])")

                                 for left2 in 0..<wordCount {

                                     if (len[left2] >= interlockWidth &&
                                         end[left2][1] == end[up1][1] &&
                                         end[left2][0] == start[down2][1] &&
                                         left2 != down2 &&
                                         left2 != right1 &&
                                         left2 != up1) {
                                         //print("left2:\(start[left2])")

                                         for right3 in 0..<wordCount {

                                             if (len[right3] >= interlockWidth &&
                                                 start[right3][0] == end[up1][0] &&
                                                 start[right3][1] == start[down2][2] &&
                                                 right3 != left2 &&
                                                 right3 != down2 &&
                                                 right3 != right1 &&
                                                 right3 != up1) {
                                                 //print("right3:\(start[right3])")

                                                 let cluster = ClusterMakerModel(
                                                     wordsHorizontal: [right1, left2, right3],
                                                     wordsVertical: [up1, down2],
                                                     patternHorizontal: [.trailing, .leading, .trailing],
                                                     patternVertical: [.leading, .trailing],
                                                     start: start,
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
    
    
    static func C2x4_LRLR_DU(start: [String], end: [String], len:[Int], wordCount: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterMakerModel] {

         let interlockWidth = 2
         let interlockHeight = 4
         var result: [ClusterMakerModel] = []

         for down1 in 0..<wordCount {

             if (len[down1] >= interlockHeight) {
                 //print("down1:\(start[down1])")

                 for left1 in 0..<wordCount {

                     if (len[left1] >= interlockWidth &&
                         end[left1][1] == start[down1][0] &&
                         left1 != down1) {
                         //print("left1:\(start[left1])")

                         for up2 in 0..<wordCount {

                             if (len[up2] >= interlockHeight &&
                                 end[up2][3] == end[left1][0] &&
                                 up2 != left1 &&
                                 up2 != down1) {
                                 //print("up2:\(start[up2])")

                                 for right2 in 0..<wordCount {

                                     if (len[right2] >= interlockWidth &&
                                         start[right2][0] == start[down1][1] &&
                                         start[right2][1] == end[up2][2] &&
                                         right2 != up2 &&
                                         right2 != left1 &&
                                         right2 != down1) {
                                         //print("right2:\(start[right2])")

                                         for left3 in 0..<wordCount {

                                             if (len[left3] >= interlockWidth &&
                                                 end[left3][1] == start[down1][2] &&
                                                 end[left3][0] == end[up2][1] &&
                                                 left3 != right2 &&
                                                 left3 != up2 &&
                                                 left3 != left1 &&
                                                 left3 != down1) {
                                                 //print("left3:\(start[left3])")

                                                 for right4 in 0..<wordCount {

                                                     if (len[right4] >= interlockWidth &&
                                                         start[right4][0] == start[down1][3] &&
                                                         start[right4][1] == end[up2][0] &&
                                                         right4 != left3 &&
                                                         right4 != right2 &&
                                                         right4 != up2 &&
                                                         right4 != left1 &&
                                                         right4 != down1) {
                                                         //print("right4:\(start[right4])")

                                                         let cluster = ClusterMakerModel(
                                                             wordsHorizontal: [left1, right2, left3, right4],
                                                             wordsVertical: [down1, up2],
                                                             patternHorizontal: [.leading, .trailing, .leading, .trailing],
                                                             patternVertical: [.trailing, .leading],
                                                             start: start,
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
    
    static func C2x4_LRLR_UD(start: [String], end: [String], len:[Int], wordCount: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterMakerModel] {

         let interlockWidth = 2
         let interlockHeight = 4
         var result: [ClusterMakerModel] = []

         for up1 in 0..<wordCount {

             if (len[up1] >= interlockHeight) {
                 //print("up1:\(start[up1])")

                 for left1 in 0..<wordCount {

                     if (len[left1] >= interlockWidth &&
                         end[left1][1] == end[up1][3] &&
                         left1 != up1) {
                         //print("left1:\(start[left1])")

                         for down2 in 0..<wordCount {

                             if (len[down2] >= interlockHeight &&
                                 start[down2][0] == end[left1][0] &&
                                 down2 != left1 &&
                                 down2 != up1) {
                                 //print("down2:\(start[down2])")

                                 for right2 in 0..<wordCount {

                                     if (len[right2] >= interlockWidth &&
                                         start[right2][0] == end[up1][2] &&
                                         start[right2][1] == start[down2][1] &&
                                         right2 != down2 &&
                                         right2 != left1 &&
                                         right2 != up1) {
                                         //print("right2:\(start[right2])")

                                         for left3 in 0..<wordCount {

                                             if (len[left3] >= interlockWidth &&
                                                 end[left3][1] == end[up1][1] &&
                                                 end[left3][0] == start[down2][2] &&
                                                 left3 != right2 &&
                                                 left3 != down2 &&
                                                 left3 != left1 &&
                                                 left3 != up1) {
                                                 //print("left3:\(start[left3])")

                                                 for right4 in 0..<wordCount {

                                                     if (len[right4] >= interlockWidth &&
                                                         start[right4][0] == end[up1][0] &&
                                                         start[right4][1] == start[down2][3] &&
                                                         right4 != left3 &&
                                                         right4 != right2 &&
                                                         right4 != down2 &&
                                                         right4 != left1 &&
                                                         right4 != up1) {
                                                         //print("right4:\(start[right4])")

                                                         let cluster = ClusterMakerModel(
                                                             wordsHorizontal: [left1, right2, left3, right4],
                                                             wordsVertical: [up1, down2],
                                                             patternHorizontal: [.leading, .trailing, .leading, .trailing],
                                                             patternVertical: [.leading, .trailing],
                                                             start: start,
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

    static func C2x4_RLRL_DU(start: [String], end: [String], len:[Int], wordCount: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterMakerModel] {

         let interlockWidth = 2
         let interlockHeight = 4
         var result: [ClusterMakerModel] = []

         for down1 in 0..<wordCount {

             if (len[down1] >= interlockHeight) {
                 //print("down1:\(start[down1])")

                 for right1 in 0..<wordCount {

                     if (len[right1] >= interlockWidth &&
                         start[right1][0] == start[down1][0] &&
                         right1 != down1) {
                         //print("right1:\(start[right1])")

                         for up2 in 0..<wordCount {

                             if (len[up2] >= interlockHeight &&
                                 end[up2][3] == start[right1][1] &&
                                 up2 != right1 &&
                                 up2 != down1) {
                                 //print("up2:\(start[up2])")

                                 for left2 in 0..<wordCount {

                                     if (len[left2] >= interlockWidth &&
                                         end[left2][1] == start[down1][1] &&
                                         end[left2][0] == end[up2][2] &&
                                         left2 != up2 &&
                                         left2 != right1 &&
                                         left2 != down1) {
                                         //print("left2:\(start[left2])")

                                         for right3 in 0..<wordCount {

                                             if (len[right3] >= interlockWidth &&
                                                 start[right3][0] == start[down1][2] &&
                                                 start[right3][1] == end[up2][1] &&
                                                 right3 != left2 &&
                                                 right3 != up2 &&
                                                 right3 != right1 &&
                                                 right3 != down1) {
                                                 //print("right3:\(start[right3])")

                                                 for left4 in 0..<wordCount {

                                                     if (len[left4] >= interlockWidth &&
                                                         end[left4][1] == start[down1][3] &&
                                                         end[left4][0] == end[up2][0] &&
                                                         left4 != right3 &&
                                                         left4 != left2 &&
                                                         left4 != up2 &&
                                                         left4 != right1 &&
                                                         left4 != down1) {
                                                         //print("left4:\(start[left4])")

                                                         let cluster = ClusterMakerModel(
                                                             wordsHorizontal: [right1, left2, right3, left4],
                                                             wordsVertical: [down1, up2],
                                                             patternHorizontal: [.trailing, .leading, .trailing, .leading],
                                                             patternVertical: [.trailing, .leading],
                                                             start: start,
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
    
    
    static func C2x4_RLRL_UD(start: [String], end: [String], len:[Int], wordCount: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterMakerModel] {

         let interlockWidth = 2
         let interlockHeight = 4
         var result: [ClusterMakerModel] = []

         for up1 in 0..<wordCount {

             if (len[up1] >= interlockHeight) {
                 //print("up1:\(start[up1])")

                 for right1 in 0..<wordCount {

                     if (len[right1] >= interlockWidth &&
                         start[right1][0] == end[up1][3] &&
                         right1 != up1) {
                         //print("right1:\(start[right1])")

                         for down2 in 0..<wordCount {

                             if (len[down2] >= interlockHeight &&
                                 start[down2][0] == start[right1][1] &&
                                 down2 != right1 &&
                                 down2 != up1) {
                                 //print("down2:\(start[down2])")

                                 for left2 in 0..<wordCount {

                                     if (len[left2] >= interlockWidth &&
                                         end[left2][1] == end[up1][2] &&
                                         end[left2][0] == start[down2][1] &&
                                         left2 != down2 &&
                                         left2 != right1 &&
                                         left2 != up1) {
                                         //print("left2:\(start[left2])")

                                         for right3 in 0..<wordCount {

                                             if (len[right3] >= interlockWidth &&
                                                 start[right3][0] == end[up1][1] &&
                                                 start[right3][1] == start[down2][2] &&
                                                 right3 != left2 &&
                                                 right3 != down2 &&
                                                 right3 != right1 &&
                                                 right3 != up1) {
                                                 //print("right3:\(start[right3])")

                                                 for left4 in 0..<wordCount {

                                                     if (len[left4] >= interlockWidth &&
                                                         end[left4][1] == end[up1][0] &&
                                                         end[left4][0] == start[down2][3] &&
                                                         left4 != right3 &&
                                                         left4 != left2 &&
                                                         left4 != down2 &&
                                                         left4 != right1 &&
                                                         left4 != up1) {
                                                         //print("left4:\(start[left4])")

                                                         let cluster = ClusterMakerModel(
                                                             wordsHorizontal: [right1, left2, right3, left4],
                                                             wordsVertical: [up1, down2],
                                                             patternHorizontal: [.trailing, .leading, .trailing, .leading],
                                                             patternVertical: [.leading, .trailing],
                                                             start: start,
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
    
    
    static func C2x5_LRLRL_DU(start: [String], end: [String], len:[Int], wordCount: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterMakerModel] {

         let interlockWidth = 2
         let interlockHeight = 5
         var result: [ClusterMakerModel] = []

         for down1 in 0..<wordCount {

             if (len[down1] >= interlockHeight) {
                 //print("down1:\(start[down1])")

                 for left1 in 0..<wordCount {

                     if (len[left1] >= interlockWidth &&
                         end[left1][1] == start[down1][0] &&
                         left1 != down1) {
                         //print("left1:\(start[left1])")

                         for up2 in 0..<wordCount {

                             if (len[up2] >= interlockHeight &&
                                 end[up2][4] == end[left1][0] &&
                                 up2 != left1 &&
                                 up2 != down1) {
                                 //print("up2:\(start[up2])")

                                 for right2 in 0..<wordCount {

                                     if (len[right2] >= interlockWidth &&
                                         start[right2][0] == start[down1][1] &&
                                         start[right2][1] == end[up2][3] &&
                                         right2 != up2 &&
                                         right2 != left1 &&
                                         right2 != down1) {
                                         //print("right2:\(start[right2])")

                                         for left3 in 0..<wordCount {

                                             if (len[left3] >= interlockWidth &&
                                                 end[left3][1] == start[down1][2] &&
                                                 end[left3][0] == end[up2][2] &&
                                                 left3 != right2 &&
                                                 left3 != up2 &&
                                                 left3 != left1 &&
                                                 left3 != down1) {
                                                 //print("left3:\(start[left3])")

                                                 for right4 in 0..<wordCount {

                                                     if (len[right4] >= interlockWidth &&
                                                         start[right4][0] == start[down1][3] &&
                                                         start[right4][1] == end[up2][1] &&
                                                         right4 != left3 &&
                                                         right4 != right2 &&
                                                         right4 != up2 &&
                                                         right4 != left1 &&
                                                         right4 != down1) {
                                                         //print("right4:\(start[right4])")

                                                         for left5 in 0..<wordCount {

                                                             if (len[left5] >= interlockWidth &&
                                                                 end[left5][1] == start[down1][4] &&
                                                                 end[left5][0] == end[up2][0] &&
                                                                 left5 != right4 &&
                                                                 left5 != left3 &&
                                                                 left5 != right2 &&
                                                                 left5 != up2 &&
                                                                 left5 != left1 &&
                                                                 left5 != down1) {
                                                                 //print("left5:\(start[left5])")

                                                                 let cluster = ClusterMakerModel(
                                                                     wordsHorizontal: [left1, right2, left3, right4, left5],
                                                                     wordsVertical: [down1, up2],
                                                                     patternHorizontal: [.leading, .trailing, .leading, .trailing, .leading],
                                                                     patternVertical: [.trailing, .leading],
                                                                     start: start,
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
    
    
    static func C2x5_LRLRL_UD(start: [String], end: [String], len:[Int], wordCount: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterMakerModel] {

         let interlockWidth = 2
         let interlockHeight = 5
         var result: [ClusterMakerModel] = []

         for up1 in 0..<wordCount {

             if (len[up1] >= interlockHeight) {
                 //print("up1:\(start[up1])")

                 for left1 in 0..<wordCount {

                     if (len[left1] >= interlockWidth &&
                         end[left1][1] == end[up1][4] &&
                         left1 != up1) {
                         //print("left1:\(start[left1])")

                         for down2 in 0..<wordCount {

                             if (len[down2] >= interlockHeight &&
                                 start[down2][0] == end[left1][0] &&
                                 down2 != left1 &&
                                 down2 != up1) {
                                 //print("down2:\(start[down2])")

                                 for right2 in 0..<wordCount {

                                     if (len[right2] >= interlockWidth &&
                                         start[right2][0] == end[up1][3] &&
                                         start[right2][1] == start[down2][1] &&
                                         right2 != down2 &&
                                         right2 != left1 &&
                                         right2 != up1) {
                                         //print("right2:\(start[right2])")

                                         for left3 in 0..<wordCount {

                                             if (len[left3] >= interlockWidth &&
                                                 end[left3][1] == end[up1][2] &&
                                                 end[left3][0] == start[down2][2] &&
                                                 left3 != right2 &&
                                                 left3 != down2 &&
                                                 left3 != left1 &&
                                                 left3 != up1) {
                                                 //print("left3:\(start[left3])")

                                                 for right4 in 0..<wordCount {

                                                     if (len[right4] >= interlockWidth &&
                                                         start[right4][0] == end[up1][1] &&
                                                         start[right4][1] == start[down2][3] &&
                                                         right4 != left3 &&
                                                         right4 != right2 &&
                                                         right4 != down2 &&
                                                         right4 != left1 &&
                                                         right4 != up1) {
                                                         //print("right4:\(start[right4])")

                                                         for left5 in 0..<wordCount {

                                                             if (len[left5] >= interlockWidth &&
                                                                 end[left5][1] == end[up1][0] &&
                                                                 end[left5][0] == start[down2][4] &&
                                                                 left5 != right4 &&
                                                                 left5 != left3 &&
                                                                 left5 != right2 &&
                                                                 left5 != down2 &&
                                                                 left5 != left1 &&
                                                                 left5 != up1) {
                                                                 //print("left5:\(start[left5])")

                                                                 let cluster = ClusterMakerModel(
                                                                     wordsHorizontal: [left1, right2, left3, right4, left5],
                                                                     wordsVertical: [up1, down2],
                                                                     patternHorizontal: [.leading, .trailing, .leading, .trailing, .leading],
                                                                     patternVertical: [.leading, .trailing],
                                                                     start: start,
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
    
    static func C2x5_RLRLR_DU(start: [String], end: [String], len:[Int], wordCount: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterMakerModel] {

         let interlockWidth = 2
         let interlockHeight = 5
         var result: [ClusterMakerModel] = []

         for down1 in 0..<wordCount {

             if (len[down1] >= interlockHeight) {
                 //print("down1:\(start[down1])")

                 for right1 in 0..<wordCount {

                     if (len[right1] >= interlockWidth &&
                         start[right1][0] == start[down1][0] &&
                         right1 != down1) {
                         //print("right1:\(start[right1])")

                         for up2 in 0..<wordCount {

                             if (len[up2] >= interlockHeight &&
                                 end[up2][4] == start[right1][1] &&
                                 up2 != right1 &&
                                 up2 != down1) {
                                 //print("up2:\(start[up2])")

                                 for left2 in 0..<wordCount {

                                     if (len[left2] >= interlockWidth &&
                                         end[left2][1] == start[down1][1] &&
                                         end[left2][0] == end[up2][3] &&
                                         left2 != up2 &&
                                         left2 != right1 &&
                                         left2 != down1) {
                                         //print("left2:\(start[left2])")

                                         for right3 in 0..<wordCount {

                                             if (len[right3] >= interlockWidth &&
                                                 start[right3][0] == start[down1][2] &&
                                                 start[right3][1] == end[up2][2] &&
                                                 right3 != left2 &&
                                                 right3 != up2 &&
                                                 right3 != right1 &&
                                                 right3 != down1) {
                                                 //print("right3:\(start[right3])")

                                                 for left4 in 0..<wordCount {

                                                     if (len[left4] >= interlockWidth &&
                                                         end[left4][1] == start[down1][3] &&
                                                         end[left4][0] == end[up2][1] &&
                                                         left4 != right3 &&
                                                         left4 != left2 &&
                                                         left4 != up2 &&
                                                         left4 != right1 &&
                                                         left4 != down1) {
                                                         //print("left4:\(start[left4])")

                                                         for right5 in 0..<wordCount {

                                                             if (len[right5] >= interlockWidth &&
                                                                 start[right5][0] == start[down1][4] &&
                                                                 start[right5][1] == end[up2][0] &&
                                                                 right5 != left4 &&
                                                                 right5 != right3 &&
                                                                 right5 != left2 &&
                                                                 right5 != up2 &&
                                                                 right5 != right1 &&
                                                                 right5 != down1) {
                                                                 //print("right5:\(start[right5])")

                                                                 let cluster = ClusterMakerModel(
                                                                     wordsHorizontal: [right1, left2, right3, left4, right5],
                                                                     wordsVertical: [down1, up2],
                                                                     patternHorizontal: [.trailing, .leading, .trailing, .leading, .trailing],
                                                                     patternVertical: [.trailing, .leading],
                                                                     start: start,
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
    
    
    static func C2x5_RLRLR_UD(start: [String], end: [String], len:[Int], wordCount: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterMakerModel] {

         let interlockWidth = 2
         let interlockHeight = 5
         var result: [ClusterMakerModel] = []

         for up1 in 0..<wordCount {

             if (len[up1] >= interlockHeight) {
                 //print("up1:\(start[up1])")

                 for right1 in 0..<wordCount {

                     if (len[right1] >= interlockWidth &&
                         start[right1][0] == end[up1][4] &&
                         right1 != up1) {
                         //print("right1:\(start[right1])")

                         for down2 in 0..<wordCount {

                             if (len[down2] >= interlockHeight &&
                                 start[down2][0] == start[right1][1] &&
                                 down2 != right1 &&
                                 down2 != up1) {
                                 //print("down2:\(start[down2])")

                                 for left2 in 0..<wordCount {

                                     if (len[left2] >= interlockWidth &&
                                         end[left2][1] == end[up1][3] &&
                                         end[left2][0] == start[down2][1] &&
                                         left2 != down2 &&
                                         left2 != right1 &&
                                         left2 != up1) {
                                         //print("left2:\(start[left2])")

                                         for right3 in 0..<wordCount {

                                             if (len[right3] >= interlockWidth &&
                                                 start[right3][0] == end[up1][2] &&
                                                 start[right3][1] == start[down2][2] &&
                                                 right3 != left2 &&
                                                 right3 != down2 &&
                                                 right3 != right1 &&
                                                 right3 != up1) {
                                                 //print("right3:\(start[right3])")

                                                 for left4 in 0..<wordCount {

                                                     if (len[left4] >= interlockWidth &&
                                                         end[left4][1] == end[up1][1] &&
                                                         end[left4][0] == start[down2][3] &&
                                                         left4 != right3 &&
                                                         left4 != left2 &&
                                                         left4 != down2 &&
                                                         left4 != right1 &&
                                                         left4 != up1) {
                                                         //print("left4:\(start[left4])")

                                                         for right5 in 0..<wordCount {

                                                             if (len[right5] >= interlockWidth &&
                                                                 start[right5][0] == end[up1][0] &&
                                                                 start[right5][1] == start[down2][4] &&
                                                                 right5 != left4 &&
                                                                 right5 != right3 &&
                                                                 right5 != left2 &&
                                                                 right5 != down2 &&
                                                                 right5 != right1 &&
                                                                 right5 != up1) {
                                                                 //print("right5:\(start[right5])")

                                                                 let cluster = ClusterMakerModel(
                                                                     wordsHorizontal: [right1, left2, right3, left4, right5],
                                                                     wordsVertical: [up1, down2],
                                                                     patternHorizontal: [.trailing, .leading, .trailing, .leading, .trailing],
                                                                     patternVertical: [.leading, .trailing],
                                                                     start: start,
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
    
    
    static func C2x6_LRLRLR_DU(start: [String], end: [String], len:[Int], wordCount: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterMakerModel] {

         let interlockWidth = 2
         let interlockHeight = 6
         var result: [ClusterMakerModel] = []

         for down1 in 0..<wordCount {

             if (len[down1] >= interlockHeight) {
                 //print("down1:\(start[down1])")

                 for left1 in 0..<wordCount {

                     if (len[left1] >= interlockWidth &&
                         end[left1][1] == start[down1][0] &&
                         left1 != down1) {
                         //print("left1:\(start[left1])")

                         for up2 in 0..<wordCount {

                             if (len[up2] >= interlockHeight &&
                                 end[up2][5] == end[left1][0] &&
                                 up2 != left1 &&
                                 up2 != down1) {
                                 //print("up2:\(start[up2])")

                                 for right2 in 0..<wordCount {

                                     if (len[right2] >= interlockWidth &&
                                         start[right2][0] == start[down1][1] &&
                                         start[right2][1] == end[up2][4] &&
                                         right2 != up2 &&
                                         right2 != left1 &&
                                         right2 != down1) {
                                         //print("right2:\(start[right2])")

                                         for left3 in 0..<wordCount {

                                             if (len[left3] >= interlockWidth &&
                                                 end[left3][1] == start[down1][2] &&
                                                 end[left3][0] == end[up2][3] &&
                                                 left3 != right2 &&
                                                 left3 != up2 &&
                                                 left3 != left1 &&
                                                 left3 != down1) {
                                                 //print("left3:\(start[left3])")

                                                 for right4 in 0..<wordCount {

                                                     if (len[right4] >= interlockWidth &&
                                                         start[right4][0] == start[down1][3] &&
                                                         start[right4][1] == end[up2][2] &&
                                                         right4 != left3 &&
                                                         right4 != right2 &&
                                                         right4 != up2 &&
                                                         right4 != left1 &&
                                                         right4 != down1) {
                                                         //print("right4:\(start[right4])")

                                                         for left5 in 0..<wordCount {

                                                             if (len[left5] >= interlockWidth &&
                                                                 end[left5][1] == start[down1][4] &&
                                                                 end[left5][0] == end[up2][1] &&
                                                                 left5 != right4 &&
                                                                 left5 != left3 &&
                                                                 left5 != right2 &&
                                                                 left5 != up2 &&
                                                                 left5 != left1 &&
                                                                 left5 != down1) {
                                                                 //print("left5:\(start[left5])")

                                                                 for right6 in 0..<wordCount {

                                                                     if (len[right6] >= interlockWidth &&
                                                                         start[right6][0] == start[down1][5] &&
                                                                         start[right6][1] == end[up2][0] &&
                                                                         right6 != left5 &&
                                                                         right6 != right4 &&
                                                                         right6 != left3 &&
                                                                         right6 != right2 &&
                                                                         right6 != up2 &&
                                                                         right6 != left1 &&
                                                                         right6 != down1) {
                                                                         //print("right6:\(start[right6])")

                                                                         let cluster = ClusterMakerModel(
                                                                             wordsHorizontal: [left1, right2, left3, right4, left5, right6],
                                                                             wordsVertical: [down1, up2],
                                                                             patternHorizontal: [.leading, .trailing, .leading, .trailing, .leading, .trailing],
                                                                             patternVertical: [.trailing, .leading],
                                                                             start: start,
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
    
    static func C2x6_LRLRLR_UD(start: [String], end: [String], len:[Int], wordCount: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterMakerModel] {

         let interlockWidth = 2
         let interlockHeight = 6
         var result: [ClusterMakerModel] = []

         for up1 in 0..<wordCount {

             if (len[up1] >= interlockHeight) {
                 //print("up1:\(start[up1])")

                 for left1 in 0..<wordCount {

                     if (len[left1] >= interlockWidth &&
                         end[left1][1] == end[up1][5] &&
                         left1 != up1) {
                         //print("left1:\(start[left1])")

                         for down2 in 0..<wordCount {

                             if (len[down2] >= interlockHeight &&
                                 start[down2][0] == end[left1][0] &&
                                 down2 != left1 &&
                                 down2 != up1) {
                                 //print("down2:\(start[down2])")

                                 for right2 in 0..<wordCount {

                                     if (len[right2] >= interlockWidth &&
                                         start[right2][0] == end[up1][4] &&
                                         start[right2][1] == start[down2][1] &&
                                         right2 != down2 &&
                                         right2 != left1 &&
                                         right2 != up1) {
                                         //print("right2:\(start[right2])")

                                         for left3 in 0..<wordCount {

                                             if (len[left3] >= interlockWidth &&
                                                 end[left3][1] == end[up1][3] &&
                                                 end[left3][0] == start[down2][2] &&
                                                 left3 != right2 &&
                                                 left3 != down2 &&
                                                 left3 != left1 &&
                                                 left3 != up1) {
                                                 //print("left3:\(start[left3])")

                                                 for right4 in 0..<wordCount {

                                                     if (len[right4] >= interlockWidth &&
                                                         start[right4][0] == end[up1][2] &&
                                                         start[right4][1] == start[down2][3] &&
                                                         right4 != left3 &&
                                                         right4 != right2 &&
                                                         right4 != down2 &&
                                                         right4 != left1 &&
                                                         right4 != up1) {
                                                         //print("right4:\(start[right4])")

                                                         for left5 in 0..<wordCount {

                                                             if (len[left5] >= interlockWidth &&
                                                                 end[left5][1] == end[up1][1] &&
                                                                 end[left5][0] == start[down2][4] &&
                                                                 left5 != right4 &&
                                                                 left5 != left3 &&
                                                                 left5 != right2 &&
                                                                 left5 != down2 &&
                                                                 left5 != left1 &&
                                                                 left5 != up1) {
                                                                 //print("left5:\(start[left5])")

                                                                 for right6 in 0..<wordCount {

                                                                     if (len[right6] >= interlockWidth &&
                                                                         start[right6][0] == end[up1][0] &&
                                                                         start[right6][1] == start[down2][5] &&
                                                                         right6 != left5 &&
                                                                         right6 != right4 &&
                                                                         right6 != left3 &&
                                                                         right6 != right2 &&
                                                                         right6 != down2 &&
                                                                         right6 != left1 &&
                                                                         right6 != up1) {
                                                                         //print("right6:\(start[right6])")

                                                                         let cluster = ClusterMakerModel(
                                                                             wordsHorizontal: [left1, right2, left3, right4, left5, right6],
                                                                             wordsVertical: [up1, down2],
                                                                             patternHorizontal: [.leading, .trailing, .leading, .trailing, .leading, .trailing],
                                                                             patternVertical: [.leading, .trailing],
                                                                             start: start,
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
    
    
    static func C2x6_RLRLRL_DU(start: [String], end: [String], len:[Int], wordCount: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterMakerModel] {

         let interlockWidth = 2
         let interlockHeight = 6
         var result: [ClusterMakerModel] = []

         for down1 in 0..<wordCount {

             if (len[down1] >= interlockHeight) {
                 //print("down1:\(start[down1])")

                 for right1 in 0..<wordCount {

                     if (len[right1] >= interlockWidth &&
                         start[right1][0] == start[down1][0] &&
                         right1 != down1) {
                         //print("right1:\(start[right1])")

                         for up2 in 0..<wordCount {

                             if (len[up2] >= interlockHeight &&
                                 end[up2][5] == start[right1][1] &&
                                 up2 != right1 &&
                                 up2 != down1) {
                                 //print("up2:\(start[up2])")

                                 for left2 in 0..<wordCount {

                                     if (len[left2] >= interlockWidth &&
                                         end[left2][1] == start[down1][1] &&
                                         end[left2][0] == end[up2][4] &&
                                         left2 != up2 &&
                                         left2 != right1 &&
                                         left2 != down1) {
                                         //print("left2:\(start[left2])")

                                         for right3 in 0..<wordCount {

                                             if (len[right3] >= interlockWidth &&
                                                 start[right3][0] == start[down1][2] &&
                                                 start[right3][1] == end[up2][3] &&
                                                 right3 != left2 &&
                                                 right3 != up2 &&
                                                 right3 != right1 &&
                                                 right3 != down1) {
                                                 //print("right3:\(start[right3])")

                                                 for left4 in 0..<wordCount {

                                                     if (len[left4] >= interlockWidth &&
                                                         end[left4][1] == start[down1][3] &&
                                                         end[left4][0] == end[up2][2] &&
                                                         left4 != right3 &&
                                                         left4 != left2 &&
                                                         left4 != up2 &&
                                                         left4 != right1 &&
                                                         left4 != down1) {
                                                         //print("left4:\(start[left4])")

                                                         for right5 in 0..<wordCount {

                                                             if (len[right5] >= interlockWidth &&
                                                                 start[right5][0] == start[down1][4] &&
                                                                 start[right5][1] == end[up2][1] &&
                                                                 right5 != left4 &&
                                                                 right5 != right3 &&
                                                                 right5 != left2 &&
                                                                 right5 != up2 &&
                                                                 right5 != right1 &&
                                                                 right5 != down1) {
                                                                 //print("right5:\(start[right5])")

                                                                 for left6 in 0..<wordCount {

                                                                     if (len[left6] >= interlockWidth &&
                                                                         end[left6][1] == start[down1][5] &&
                                                                         end[left6][0] == end[up2][0] &&
                                                                         left6 != right5 &&
                                                                         left6 != left4 &&
                                                                         left6 != right3 &&
                                                                         left6 != left2 &&
                                                                         left6 != up2 &&
                                                                         left6 != right1 &&
                                                                         left6 != down1) {
                                                                         //print("left6:\(start[left6])")

                                                                         let cluster = ClusterMakerModel(
                                                                             wordsHorizontal: [right1, left2, right3, left4, right5, left6],
                                                                             wordsVertical: [down1, up2],
                                                                             patternHorizontal: [.trailing, .leading, .trailing, .leading, .trailing, .leading],
                                                                             patternVertical: [.trailing, .leading],
                                                                             start: start,
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
    
    static func C2x6_RLRLRL_UD(start: [String], end: [String], len:[Int], wordCount: Int, scoreMin: Int, widthMax: Int, heightMax: Int) -> [ClusterMakerModel] {

         let interlockWidth = 2
         let interlockHeight = 6
         var result: [ClusterMakerModel] = []

         for up1 in 0..<wordCount {

             if (len[up1] >= interlockHeight) {
                 //print("up1:\(start[up1])")

                 for right1 in 0..<wordCount {

                     if (len[right1] >= interlockWidth &&
                         start[right1][0] == end[up1][5] &&
                         right1 != up1) {
                         //print("right1:\(start[right1])")

                         for down2 in 0..<wordCount {

                             if (len[down2] >= interlockHeight &&
                                 start[down2][0] == start[right1][1] &&
                                 down2 != right1 &&
                                 down2 != up1) {
                                 //print("down2:\(start[down2])")

                                 for left2 in 0..<wordCount {

                                     if (len[left2] >= interlockWidth &&
                                         end[left2][1] == end[up1][4] &&
                                         end[left2][0] == start[down2][1] &&
                                         left2 != down2 &&
                                         left2 != right1 &&
                                         left2 != up1) {
                                         //print("left2:\(start[left2])")

                                         for right3 in 0..<wordCount {

                                             if (len[right3] >= interlockWidth &&
                                                 start[right3][0] == end[up1][3] &&
                                                 start[right3][1] == start[down2][2] &&
                                                 right3 != left2 &&
                                                 right3 != down2 &&
                                                 right3 != right1 &&
                                                 right3 != up1) {
                                                 //print("right3:\(start[right3])")

                                                 for left4 in 0..<wordCount {

                                                     if (len[left4] >= interlockWidth &&
                                                         end[left4][1] == end[up1][2] &&
                                                         end[left4][0] == start[down2][3] &&
                                                         left4 != right3 &&
                                                         left4 != left2 &&
                                                         left4 != down2 &&
                                                         left4 != right1 &&
                                                         left4 != up1) {
                                                         //print("left4:\(start[left4])")

                                                         for right5 in 0..<wordCount {

                                                             if (len[right5] >= interlockWidth &&
                                                                 start[right5][0] == end[up1][1] &&
                                                                 start[right5][1] == start[down2][4] &&
                                                                 right5 != left4 &&
                                                                 right5 != right3 &&
                                                                 right5 != left2 &&
                                                                 right5 != down2 &&
                                                                 right5 != right1 &&
                                                                 right5 != up1) {
                                                                 //print("right5:\(start[right5])")

                                                                 for left6 in 0..<wordCount {

                                                                     if (len[left6] >= interlockWidth &&
                                                                         end[left6][1] == end[up1][0] &&
                                                                         end[left6][0] == start[down2][5] &&
                                                                         left6 != right5 &&
                                                                         left6 != left4 &&
                                                                         left6 != right3 &&
                                                                         left6 != left2 &&
                                                                         left6 != down2 &&
                                                                         left6 != right1 &&
                                                                         left6 != up1) {
                                                                         //print("left6:\(start[left6])")

                                                                         let cluster = ClusterMakerModel(
                                                                             wordsHorizontal: [right1, left2, right3, left4, right5, left6],
                                                                             wordsVertical: [up1, down2],
                                                                             patternHorizontal: [.trailing, .leading, .trailing, .leading, .trailing, .leading],
                                                                             patternVertical: [.leading, .trailing],
                                                                             start: start,
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
