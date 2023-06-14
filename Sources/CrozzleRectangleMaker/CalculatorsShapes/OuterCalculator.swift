//
//  OuterCalculator.swift
//  
//
//  Created by Michael Geurtjens on 14/6/2023.
//

import Foundation
public class OuterCalculator {
    
    public static func C2x3_LRL_MO(start: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [OuterModel] {
        
        let wordCount = (wordsMax == 0) ? start.count : wordsMax
        let interlockWidth = 2
        let interlockHeight = 3
        var result: [OuterModel] = []
        
        for middle1 in 0..<wordCount {
            
            if (len[middle1] == interlockHeight) {
                print("middle1:\(start[middle1])")
                                
                for left1 in 0..<wordCount {
                    
                    if (len[left1] >= interlockWidth &&
                        end[left1][1] == start[middle1][0] &&
                        left1 != middle1) {
                        print("left1:\(start[left1])")
                        
                        for outer2 in 0..<wordCount {
                            
                            if (len[outer2] >= interlockHeight+2 &&
                                
                                outer2 != left1 &&
                                outer2 != middle1) {
                                
                                
                                for outerPos2 in 1..<(len[outer2]-2) {
                                    
                                    print("outer2:\(start[outer2])[\(outerPos2)]")
                                    if start[outer2][outerPos2 + 0] == end[left1][0] {
                                
                                        for right2 in 0..<wordCount {
                                    
                                            if (len[right2] >= interlockWidth &&
                                                start[right2][0] == start[middle1][1] &&
                                                start[right2][1] == start[outer2][outerPos2 + 1] &&
                                                right2 != outer2 &&
                                                right2 != left1 &&
                                                right2 != middle1) {
                                                print("right2:\(start[right2])")
                                        
                                                for left3 in 0..<wordCount {
                                                    
                                                    if (len[left3] >= interlockWidth &&
                                                        end[left3][1] == start[middle1][2] &&
                                                        end[left3][0] == start[outer2][outerPos2 + 2] &&
                                                        left3 != right2 &&
                                                        left3 != outer2 &&
                                                        left3 != left1 &&
                                                        left3 != middle1) {
                                                        print("left3:\(start[left3])")
                                                        
                                                        let cluster = OuterModel(
                                                            wordsHorizontal: [left1, right2, left3],
                                                            wordsVertical: [middle1, outer2],
                                                            patternHorizontal: [.leading, .trailing, .leading],
                                                            patternVertical: [.trailing, .leading],
                                                            start: start,
                                                            end: end,
                                                            len: len,
                                                            outerPos: [-1, outerPos2])
                                                        
                                                        result.append(cluster)
                                                        
                                                        //                                                if cluster.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
                                                        //                                                    let text = cluster.ToText(words:start)
                                                        //                                                    if text.contains("#") == false {
                                                        //                                                        result.append(cluster)
                                                        //                                                    }
                                                        //                                                }
                                                    }
                                                }
                                            }
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
    
    public static func C2x3_LRL_OM(start: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [OuterModel] {
        
        let wordCount = (wordsMax == 0) ? start.count : wordsMax
        let interlockWidth = 2
        let interlockHeight = 3
        var result: [OuterModel] = []
        
        for outer1 in 0..<wordCount {
            
            if (len[outer1] >= interlockHeight + 2) {
                print("outer1:\(start[outer1])")
                                
                for outerPos1 in 1..<(len[outer1] - 2) {
                    
                    for left1 in 0..<wordCount {
                    
                        if (len[left1] >= interlockWidth &&
                            end[left1][1] == start[outer1][outerPos1 + 0] &&
                            left1 != outer1) {
                            
                            print("left1:\(start[left1])")
                        
                        for middle2 in 0..<wordCount {
                            
                            if (len[middle2] == interlockHeight &&
                                start[middle2][0] == end[left1][0] &&
                                middle2 != left1 &&
                                middle2 != outer1) {
                                    
                                print("middle2:\(start[middle2])")
                                   
                                        
                                for right2 in 0..<wordCount {
                                            
                                    if (len[right2] >= interlockWidth &&
                                        start[right2][0] == start[outer1][outerPos1 + 1] &&
                                        start[right2][1] == start[middle2][1] &&
                                        right2 != middle2 &&
                                        right2 != left1 &&
                                        right2 != outer1) {
                                        print("right2:\(start[right2])")
                                                
                                        for left3 in 0..<wordCount {
                                                    
                                            if (len[left3] >= interlockWidth &&
                                                end[left3][1] == start[outer1][outerPos1 + 2] &&
                                                end[left3][0] == start[middle2][2] &&
                                                left3 != right2 &&
                                                left3 != middle2 &&
                                                left3 != left1 &&
                                                left3 != outer1) {
                                                
                                                print("left3:\(start[left3])")
                                                        
                                                let cluster = OuterModel(
                                                    wordsHorizontal: [left1, right2, left3],
                                                    wordsVertical: [outer1, middle2],
                                                    patternHorizontal: [.leading, .trailing, .leading],
                                                    patternVertical: [.trailing, .leading],
                                                    start: start,
                                                    end: end,
                                                    len: len,
                                                    outerPos: [outerPos1, -1])
                                                        
                                                    result.append(cluster)
                                                        
                                                        //                                                if cluster.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
                                                        //                                                    let text = cluster.ToText(words:start)
                                                        //                                                    if text.contains("#") == false {
                                                        //                                                        result.append(cluster)
                                                        //                                                    }
                                                        //                                                }
                                                    
                                                }
                                            }
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
    
    
    public static func C2x3_RLR_OM(start: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [OuterModel] {

        let wordCount = (wordsMax == 0) ? start.count : wordsMax
        let interlockWidth = 2
        let interlockHeight = 3
        var result: [OuterModel] = []

        for outer1 in 0..<wordCount {

             if (len[outer1] >= interlockHeight + 2) {
                 //print("down1:\(start[down1])")

                 for outerPos1 in 1..<(len[outer1]-2) {
                     
                     for right1 in 0..<wordCount {
                         
                         if (len[right1] >= interlockWidth &&
                             start[right1][0] == start[outer1][outerPos1 + 0] &&
                             right1 != outer1) {
                             //print("right1:\(start[right1])")
                             
                             for middle2 in 0..<wordCount {
                                 
                                 if (len[middle2] == interlockHeight &&
                                     start[middle2][0] == start[right1][1] &&
                                     middle2 != right1 &&
                                     middle2 != outer1) {
                                     //print("up2:\(start[up2])")
                                     
                                     for left2 in 0..<wordCount {
                                         
                                         if (len[left2] >= interlockWidth &&
                                             end[left2][1] == start[outer1][outerPos1 + 1] &&
                                             end[left2][0] == start[middle2][1] &&
                                             left2 != middle2 &&
                                             left2 != right1 &&
                                             left2 != outer1) {
                                             //print("left2:\(start[left2])")
                                             
                                             for right3 in 0..<wordCount {
                                                 
                                                 if (len[right3] >= interlockWidth &&
                                                     start[right3][0] == start[outer1][outerPos1 + 2] &&
                                                     start[right3][1] == start[middle2][2] &&
                                                     right3 != left2 &&
                                                     right3 != middle2 &&
                                                     right3 != right1 &&
                                                     right3 != outer1) {
                                                     //print("right3:\(start[right3])")
                                                     
                                                     let cluster = OuterModel(
                                                        
                                                        wordsHorizontal: [right1, left2, right3],
                                                        wordsVertical: [outer1, middle2],
                                                        patternHorizontal: [.trailing, .leading, .trailing],
                                                        patternVertical: [.trailing, .leading],
                                                        start: start,
                                                        end: end,
                                                        len: len,
                                                        outerPos: [outerPos1, -1])
                                                     
                                                     result.append(cluster)
//                                                     if cluster.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
//                                                         let text = cluster.ToText(words:start)
//                                                         if text.contains("#") == false {
//                                                             result.append(cluster)
//                                                         }
//                                                     }
                                                 }
                                             }
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
    
    public static func C2x3_RLR_MO(start: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [OuterModel] {

        let wordCount = (wordsMax == 0) ? start.count : wordsMax
        let interlockWidth = 2
        let interlockHeight = 3
        var result: [OuterModel] = []

        for middle1 in 0..<wordCount {

             if (len[middle1] == interlockHeight) {
                 //print("middle1:\(start[middle1])")
       
                 for right1 in 0..<wordCount {
                         
                     if (len[right1] >= interlockWidth &&
                         start[right1][0] == start[middle1][0] &&
                         right1 != middle1) {
                         //print("right1:\(start[right1])")
                             
                         for outer2 in 0..<wordCount {
                                 
                             if (len[outer2] >= interlockHeight + 2 &&
                                 outer2 != right1 &&
                                 outer2 != middle1) {
                                 //print("up2:\(start[up2])")
                                     
                                 for outerPos2 in 1..<(len[outer2] - 2) {
                                     
                                     if start[outer2][outerPos2 + 0] == start[right1][1] {
                                     
                                         for left2 in 0..<wordCount {
                                         
                                             if (len[left2] >= interlockWidth &&
                                             end[left2][1] == start[middle1][1] &&
                                             end[left2][0] == start[outer2][outerPos2 + 1] &&
                                             left2 != outer2 &&
                                             left2 != right1 &&
                                             left2 != middle1) {
                                             //print("left2:\(start[left2])")
                                             
                                             for right3 in 0..<wordCount {
                                                 
                                                 if (len[right3] >= interlockWidth &&
                                                     start[right3][0] == start[middle1][2] &&
                                                     start[right3][1] == start[outer2][outerPos2 + 2] &&
                                                     right3 != left2 &&
                                                     right3 != outer2 &&
                                                     right3 != right1 &&
                                                     right3 != middle1) {
                                                     //print("right3:\(start[right3])")
                                                     
                                                     let cluster = OuterModel(
                                                        
                                                        wordsHorizontal: [right1, left2, right3],
                                                        wordsVertical: [middle1, outer2],
                                                        patternHorizontal: [.trailing, .leading, .trailing],
                                                        patternVertical: [.trailing, .leading],
                                                        start: start,
                                                        end: end,
                                                        len: len,
                                                        outerPos: [-1, outerPos2])
                                                     
                                                     result.append(cluster)
//                                                     if cluster.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
//                                                         let text = cluster.ToText(words:start)
//                                                         if text.contains("#") == false {
//                                                             result.append(cluster)
//                                                         }
                                                     }
                                                 }
                                             }
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
    
    
    public static func C2x4_RLRL_MO(start: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [OuterModel] {

        let wordCount = (wordsMax == 0) ? start.count : wordsMax
        let interlockWidth = 2
        let interlockHeight = 4
        var result: [OuterModel] = []

        for middle1 in 0..<wordCount {

             if (len[middle1] == interlockHeight) {
                 //print("middle1:\(start[middle1])")
       
                 for right1 in 0..<wordCount {
                         
                     if (len[right1] >= interlockWidth &&
                         start[right1][0] == start[middle1][0] &&
                         right1 != middle1) {
                         //print("right1:\(start[right1])")
                             
                         for outer2 in 0..<wordCount {
                                 
                             if (len[outer2] >= interlockHeight + 2 &&
                                 outer2 != right1 &&
                                 outer2 != middle1) {
                                 
                                 for outerPos2 in 1..<(len[outer2] - 2) {
                                     
                                     if start[outer2][outerPos2 + 0] == start[right1][1] {
                                         //print("outer2:\(start[outer2])[\(outerPos2)]")
                                         
                                         for left2 in 0..<wordCount {
                                         
                                             if (len[left2] >= interlockWidth &&
                                                 end[left2][1] == start[middle1][1] &&
                                                 end[left2][0] == start[outer2][outerPos2 + 1] &&
                                                 left2 != outer2 &&
                                                 left2 != right1 &&
                                                 left2 != middle1) {
                                                 //print("left2:\(start[left2])")
                                             
                                                 for right3 in 0..<wordCount {
                                                 
                                                     if (len[right3] >= interlockWidth &&
                                                         start[right3][0] == start[middle1][2] &&
                                                         start[right3][1] == start[outer2][outerPos2 + 2] &&
                                                         right3 != left2 &&
                                                         right3 != outer2 &&
                                                         right3 != right1 &&
                                                         right3 != middle1) {
                                                         //print("right3:\(start[right3])")
                                                     
                                                         for left4 in 0..<wordCount {
                                                             
                                                             if (len[left4] >= interlockWidth &&
                                                                 end[left4][1] == start[middle1][3] &&
                                                                 end[left4][0] == start[outer2][outerPos2 + 3] &&
                                                                 left4 != right3 &&
                                                                 left4 != left2 &&
                                                                 left4 != outer2 &&
                                                                 left4 != right1 &&
                                                                 left4 != middle1) {
                                                                 //print("left4:\(start[left4])")
                                                                 
                                                                 let cluster = OuterModel(
                                                                    
                                                                    wordsHorizontal: [right1, left2, right3, left4],
                                                                    wordsVertical: [middle1, outer2],
                                                                    patternHorizontal: [.trailing, .leading, .trailing, .leading],
                                                                    patternVertical: [.trailing, .leading],
                                                                    start: start,
                                                                    end: end,
                                                                    len: len,
                                                                    outerPos: [-1, outerPos2])
                                                                 
                                                                 result.append(cluster)
                                                             //                                                     if cluster.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
                                                             //                                                         let text = cluster.ToText(words:start)
                                                             //                                                         if text.contains("#") == false {
                                                             //                                                             result.append(cluster)
                                                             //                                                         }
                                                             }
                                                         }
                                                     }
                                                 }
                                             }
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
    
    
    public static func C2x4_RLRL_OM(start: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [OuterModel] {

        let wordCount = (wordsMax == 0) ? start.count : wordsMax
        let interlockWidth = 2
        let interlockHeight = 4
        var result: [OuterModel] = []

        for outer1 in 0..<wordCount {

             if (len[outer1] >= interlockHeight + 2) {

                 for outerPos1 in 1..<(len[outer1] - 2) {
                     //print("outer1:\(start[outer1])\(outerPos1)")
                 
                     for right1 in 0..<wordCount {
                         
                         if (len[right1] >= interlockWidth &&
                             start[right1][0] == start[outer1][outerPos1 + 0] &&
                             right1 != outer1) {
                             //print("right1:\(start[right1])")
                             
                             for middle2 in 0..<wordCount {
                                 
                                 if (len[middle2] == interlockHeight &&
                                     start[middle2][0] == start[right1][1] &&
                                     middle2 != right1 &&
                                     middle2 != outer1) {
                                 
                                    //print("middle2:\(start[middle2])")
                                         
                                    for left2 in 0..<wordCount {
                                         
                                         if (len[left2] >= interlockWidth &&
                                             end[left2][1] == start[outer1][outerPos1 + 1] &&
                                             end[left2][0] == start[middle2][1] &&
                                             left2 != middle2 &&
                                             left2 != right1 &&
                                             left2 != outer1) {
                                             //print("left2:\(start[left2])")
                                         
                                             for right3 in 0..<wordCount {
                                             
                                                 if (len[right3] >= interlockWidth &&
                                                     start[right3][0] == start[outer1][outerPos1 + 2] &&
                                                     start[right3][1] == start[middle2][2] &&
                                                     right3 != left2 &&
                                                     right3 != middle2 &&
                                                     right3 != right1 &&
                                                     right3 != outer1) {
                                                     //print("right3:\(start[right3])")
                                                 
                                                     for left4 in 0..<wordCount {
                                                         
                                                         if (len[left4] >= interlockWidth &&
                                                             end[left4][1] == start[outer1][outerPos1 + 3] &&
                                                             end[left4][0] == start[middle2][3] &&
                                                             left4 != right3 &&
                                                             left4 != left2 &&
                                                             left4 != middle2 &&
                                                             left4 != right1 &&
                                                             left4 != outer1) {
                                                             //print("left4:\(start[left4])")
                                                             
                                                             let cluster = OuterModel(
                                                                
                                                                wordsHorizontal: [right1, left2, right3, left4],
                                                                wordsVertical: [outer1, middle2],
                                                                patternHorizontal: [.trailing, .leading, .trailing, .leading],
                                                                patternVertical: [.trailing, .leading],
                                                                start: start,
                                                                end: end,
                                                                len: len,
                                                                outerPos: [outerPos1, -1])
                                                             
                                                             result.append(cluster)
                                                         //                                                     if cluster.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
                                                             //                                                         let text = cluster.ToText(words:start)
                                                             //                                                         if text.contains("#") == false {
                                                             //                                                             result.append(cluster)
                                                             //                                                         }
                                                             
                                                         }
                                                     }
                                                 }
                                             }
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
    
    public static func C2x4_LRLR_OM(start: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [OuterModel] {
        
        let wordCount = (wordsMax == 0) ? start.count : wordsMax
        let interlockWidth = 2
        let interlockHeight = 4
        var result: [OuterModel] = []
        
        for outer1 in 0..<wordCount {
            
            if (len[outer1] >= interlockHeight + 2) {
                //print("outer1:\(start[outer1])")
                                
                for outerPos1 in 1..<(len[outer1] - 2) {
                    
                    for left1 in 0..<wordCount {
                    
                        if (len[left1] >= interlockWidth &&
                            end[left1][1] == start[outer1][outerPos1 + 0] &&
                            left1 != outer1) {
                            
                            //print("left1:\(start[left1])")
                        
                            for middle2 in 0..<wordCount {
                            
                                if (len[middle2] == interlockHeight &&
                                    start[middle2][0] == end[left1][0] &&
                                    middle2 != left1 &&
                                    middle2 != outer1) {
                                        
                                    //print("middle2:\(start[middle2])")
                                       
                                            
                                    for right2 in 0..<wordCount {
                                                
                                        if (len[right2] >= interlockWidth &&
                                            start[right2][0] == start[outer1][outerPos1 + 1] &&
                                            start[right2][1] == start[middle2][1] &&
                                            right2 != middle2 &&
                                            right2 != left1 &&
                                            right2 != outer1) {
                                            //print("right2:\(start[right2])")
                                                    
                                            for left3 in 0..<wordCount {
                                                        
                                                if (len[left3] >= interlockWidth &&
                                                    end[left3][1] == start[outer1][outerPos1 + 2] &&
                                                    end[left3][0] == start[middle2][2] &&
                                                    left3 != right2 &&
                                                    left3 != middle2 &&
                                                    left3 != left1 &&
                                                    left3 != outer1) {
                                                    
                                                    //print("left3:\(start[left3])")
                                                          
                                                    for right4 in 0..<wordCount {
                                                        
                                                        if (len[right4] >= interlockWidth &&
                                                            start[right4][0] == start[outer1][outerPos1 + 3] &&
                                                            start[right4][1] == start[middle2][3] &&
                                                            right4 != left3 &&
                                                            right4 != right2 &&
                                                            right4 != middle2 &&
                                                            right4 != left1 &&
                                                            right4 != outer1) {
                                                            
                                                            //print("right4:\(start[right4])")
                                                            
                                                            
                                                            let cluster = OuterModel(
                                                                wordsHorizontal: [left1, right2, left3],
                                                                wordsVertical: [outer1, middle2],
                                                                patternHorizontal: [.leading, .trailing, .leading],
                                                                patternVertical: [.trailing, .leading],
                                                                start: start,
                                                                end: end,
                                                                len: len,
                                                                outerPos: [outerPos1, -1])
                                                            
                                                            result.append(cluster)
                                                            
                                                        //                                                if cluster.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
                                                        //                                                    let text = cluster.ToText(words:start)
                                                        //                                                    if text.contains("#") == false {
                                                        //                                                        result.append(cluster)
                                                        //                                                    }
                                                        //                                                }
                                                        }
                                                    }
                                                }
                                            }
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
    
    
    
    
    public static func C2x4_LRLR_MO(start: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [OuterModel] {
        
        let wordCount = (wordsMax == 0) ? start.count : wordsMax
        let interlockWidth = 2
        let interlockHeight = 4
        var result: [OuterModel] = []
        
        for middle1 in 0..<wordCount {
            
            if (len[middle1] == interlockHeight) {
                //print("middle1:\(start[middle1])")
                    
                for left1 in 0..<wordCount {
                
                    if (len[left1] >= interlockWidth &&
                        end[left1][1] == start[middle1][0] &&
                        left1 != middle1) {
                            
                        //print("left1:\(start[left1])")
                        
                            for outer2 in 0..<wordCount {
                            
                                if (len[outer2] >= interlockHeight + 2 &&
                                    
                                    outer2 != left1 &&
                                    outer2 != middle1) {
                                        
                                    //print("middle2:\(start[middle2])")
                                       
                                    for outerPos2 in 1..<(len[outer2] - 2) {
                                        if (start[outer2][outerPos2 + 0] == end[left1][0]) {
                                            
                                        for right2 in 0..<wordCount {
                                                    
                                            if (len[right2] >= interlockWidth &&
                                                start[right2][0] == start[middle1][1] &&
                                                start[right2][1] == start[outer2][outerPos2 + 1] &&
                                                right2 != outer2 &&
                                                right2 != left1 &&
                                                right2 != middle1) {
                                                //print("right2:\(start[right2])")
                                                
                                                for left3 in 0..<wordCount {
                                                    
                                                    if (len[left3] >= interlockWidth &&
                                                        end[left3][1] == start[middle1][2] &&
                                                        end[left3][0] == start[outer2][outerPos2 + 2] &&
                                                        left3 != right2 &&
                                                        left3 != outer2 &&
                                                        left3 != left1 &&
                                                        left3 != middle1) {
                                                        
                                                        //print("left3:\(start[left3])")
                                                        
                                                        for right4 in 0..<wordCount {
                                                            
                                                            if (len[right4] >= interlockWidth &&
                                                                start[right4][0] == start[middle1][3] &&
                                                                start[right4][1] == start[outer2][outerPos2 + 3] &&
                                                                right4 != left3 &&
                                                                right4 != right2 &&
                                                                right4 != outer2 &&
                                                                right4 != left1 &&
                                                                right4 != middle1) {
                                                                
                                                                //print("right4:\(start[right4])")
                                                                
                                                                
                                                                let cluster = OuterModel(
                                                                    wordsHorizontal: [left1, right2, left3],
                                                                    wordsVertical: [middle1, outer2],
                                                                    patternHorizontal: [.leading, .trailing, .leading],
                                                                    patternVertical: [.trailing, .leading],
                                                                    start: start,
                                                                    end: end,
                                                                    len: len,
                                                                    outerPos: [-1,outerPos2])
                                                                
                                                                result.append(cluster)
                                                                
                                                                //                                                if cluster.isValid(scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax) {
                                                                //                                                    let text = cluster.ToText(words:start)
                                                                //                                                    if text.contains("#") == false {
                                                                //                                                        result.append(cluster)
                                                                //                                                    }
                                                                //                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
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
