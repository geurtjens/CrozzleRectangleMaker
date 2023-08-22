//
//  ClusterCalculator.swift
//  
//
//  Created by Michael Geurtjens on 21/5/2023.
//

import Foundation

/// calculates all clusters which are shapes that have a block of interlocks in the middle of the structure
public class ClusterCalculator {
    
    public static func ExecuteAllSerial(scoreMin: Int) {
        let startTime = DateTimeCalculator.now()
        var count = 0
        /// We want to calculate new to see how long it takes and then compare with old
        let gameList = GameList()
        for game in gameList.games {
            
            let clusters = Execute(words: game.words, scoreMin: scoreMin, widthMax: game.maxWidth, heightMax: game.maxHeight)
            
            print("ClusterCalculator.Execute: \(game.gameId), count: \(clusters.count)")
            
            count += clusters.count
        }
        let finishTime = DateTimeCalculator.now()
        let duration = DateTimeCalculator.duration(start: startTime, finish: finishTime)
        
        print("\(count) records found in \(duration)")
    }
    
    
    public static func Execute(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        let c2x2 = C2x2(words:words,end:end,len:len,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax,wordsMax:wordsMax)
        let c2x3 = C2x3(words:words,end:end,len:len,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax,wordsMax:wordsMax)
        let c2x4 = C2x4(words:words,end:end,len:len,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax,wordsMax:wordsMax)
        let c2x5 = C2x5(words:words,end:end,len:len,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax,wordsMax:wordsMax)
        let c2x6 = C2x6(words:words,end:end,len:len,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax,wordsMax:wordsMax)
        
        let c3x3 = C3x3(words:words,end:end,len:len,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax,wordsMax:wordsMax)
        let c3x4 = C3x4(words:words,end:end,len:len,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax,wordsMax:wordsMax)
        let c3x5 = C3x5(words:words,end:end,len:len,scoreMin:scoreMin,widthMax:widthMax,heightMax:heightMax,wordsMax:wordsMax)
        
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
    
    public static func C2x2(words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {
        let C2x2_LR_UD = C2x2_LR_UD(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let C2x2_RL_DU = C2x2_RL_DU(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let C2x2_RL_UD = C2x2_RL_UD(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let result = C2x2_LR_UD + C2x2_RL_DU + C2x2_RL_UD
        
        return result
    }
    public static func C2x3(words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {
        let C2x3_LRL_DU = C2x3_LRL_DU(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let C2x3_LRL_UD = C2x3_LRL_UD(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let C2x3_RLR_DU = C2x3_RLR_DU(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let C2x3_RLR_UD = C2x3_RLR_UD(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let result = C2x3_LRL_DU + C2x3_LRL_UD + C2x3_RLR_DU + C2x3_RLR_UD
        
        return result
    }
    public static func C2x4(words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {
        
        let C2x4_LRLR_DU = C2x4_LRLR_DU(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let C2x4_LRLR_UD = C2x4_LRLR_UD(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let C2x4_RLRL_DU = C2x4_RLRL_DU(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let C2x4_RLRL_UD = C2x4_RLRL_UD(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let result = C2x4_LRLR_DU + C2x4_LRLR_UD + C2x4_RLRL_DU + C2x4_RLRL_UD
        
        return result
    }
    
    public static func C2x5(words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {
        
        let C2x5_LRLRL_DU = C2x5_LRLRL_DU(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let C2x5_LRLRL_UD = C2x5_LRLRL_UD(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let C2x5_RLRLR_DU = C2x5_RLRLR_DU(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let C2x5_RLRLR_UD = C2x5_RLRLR_UD(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let result = C2x5_LRLRL_DU + C2x5_LRLRL_UD + C2x5_RLRLR_DU + C2x5_RLRLR_UD
        
        return result
    }
    
    public static func C2x6(words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {
        
        let C2x6_LRLRLR_DU = C2x6_LRLRLR_DU(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let C2x6_LRLRLR_UD = C2x6_LRLRLR_UD(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let C2x6_RLRLRL_DU = C2x6_RLRLRL_DU(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let C2x6_RLRLRL_UD = C2x6_RLRLRL_UD(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let result = C2x6_LRLRLR_DU + C2x6_LRLRLR_UD + C2x6_RLRLRL_DU + C2x6_RLRLRL_UD
        
        return result
    }
    
    public static func C3x3(words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {
        let C3x3_LRL_UDU = C3x3_LRL_UDU(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let C3x3_RLR_DUD = C3x3_RLR_DUD(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let C3x3_RLR_UDU = C3x3_RLR_UDU(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let result = C3x3_LRL_UDU + C3x3_RLR_DUD + C3x3_RLR_UDU
        
        return result
    }
    
    public static func C3x4(words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {
        
        let C3x4_LRLR_DUD = C3x4_LRLR_DUD(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let C3x4_LRLR_UDU = C3x4_LRLR_UDU(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let C3x4_RLRL_DUD = C3x4_RLRL_DUD(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let C3x4_RLRL_UDU = C3x4_RLRL_UDU(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let result = C3x4_LRLR_DUD + C3x4_LRLR_UDU + C3x4_RLRL_DUD + C3x4_RLRL_UDU
        
        return result
    }
    
    public static func C3x5(words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {
        
        let C3x5_LRLRL_DUD = C3x5_LRLRL_DUD(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let C3x5_LRLRL_UDU = C3x5_LRLRL_UDU(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let C3x5_RLRLR_DUD = C3x5_RLRLR_DUD(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let C3x5_RLRLR_UDU = C3x5_RLRLR_UDU(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let result = C3x5_LRLRL_DUD + C3x5_LRLRL_UDU + C3x5_RLRLR_DUD + C3x5_RLRLR_UDU
        
        return result
    }
    
    public static func C2x2_LR_UD(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {
        
        let wordCount = (wordsMax == 0) ? words.count : wordsMax
        let interlockWidth = 2
        let interlockHeight = 2
        var result: [ClusterModel] = []
        
        //var textList: [String] = []
        
        for up1 in 0..<wordCount {
            
            if (len[up1] >= interlockHeight) {
                //print("up1:\(W.words[up1])")
                
                for left1 in (up1+1)..<wordCount {
                    
                    if (len[left1] >= interlockWidth &&
                        end[left1][1] == end[up1][1] &&
                        left1 != up1) {
                        //print("left1:\(W.words[left1])")
                        
                        for down2 in 0..<wordCount {
                            
                            if (len[down2] >= interlockHeight &&
                                words[down2][0] == end[left1][0] &&
                                down2 != left1 &&
                                down2 != up1) {
                                //print("down2:\(W.words[down2])")
                                
                                for right2 in 0..<wordCount {
                                    
                                    if (len[right2] >= interlockWidth &&
                                        words[right2][0] == end[up1][0] &&
                                        words[right2][1] == words[down2][1] &&
                                        right2 != down2 &&
                                        right2 != left1 &&
                                        right2 != up1) {
                                        //print("right2:\(W.words[right2])")
                                        
                                        let cluster = ClusterModel(
                                            wordsHorizontal: [left1, right2], // We could put id here if needed
                                            wordsVertical: [up1, down2],
                                            patternHorizontal: [.leading, .trailing],
                                            patternVertical: [.leading, .trailing],
                                            words: words,
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
    
    
    public static func C2x2_RL_DU(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {
        
        let wordCount = (wordsMax == 0) ? words.count : wordsMax
        let interlockWidth = 2
        let interlockHeight = 2
        var result: [ClusterModel] = []
        
        for down1 in 0..<wordCount {
            
            if (len[down1] >= interlockHeight) {
                //print("down1:\(W.words[down1])")
                
                for right1 in 0..<wordCount {
                    
                    if (len[right1] >= interlockWidth &&
                        words[right1][0] == words[down1][0] &&
                        right1 != down1) {
                        //print("right1:\(W.words[right1])")
                        
                        for up2 in 0..<wordCount {
                            
                            if (len[up2] >= interlockHeight &&
                                end[up2][1] == words[right1][1] &&
                                up2 != right1 &&
                                up2 != down1) {
                                //print("up2:\(W.words[up2])")
                                
                                // This is where I put the (up2+1)
                                for left2 in (up2+1)..<wordCount {
                                    
                                    if (len[left2] >= interlockWidth &&
                                        end[left2][1] == words[down1][1] &&
                                        end[left2][0] == end[up2][0] &&
                                        left2 != up2 &&
                                        left2 != right1 &&
                                        left2 != down1) {
                                        //print("left2:\(W.words[left2])")
                                        
                                        let cluster = ClusterModel(
                                            wordsHorizontal: [right1, left2], // We could put id here if needed
                                            wordsVertical: [down1, up2],
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
    public static func C2x2_RL_UD(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {
        
        let wordCount = (wordsMax == 0) ? words.count : wordsMax
        let interlockWidth = 2
        let interlockHeight = 2
        var result: [ClusterModel] = []
        
        //var textList: [String] = []
        
        for up1 in 0..<wordCount {
            
            if (len[up1] >= interlockHeight) {
                //print("up1:\(W.words[up1])")
                
                for right1 in 0..<wordCount {
                    
                    if (len[right1] >= interlockWidth &&
                        words[right1][0] == end[up1][1] &&
                        right1 != up1) {
                        //print("right1:\(W.words[right1])")
                        
                        for down2 in 0..<wordCount {
                            
                            if (len[down2] >= interlockHeight &&
                                words[down2][0] == words[right1][1] &&
                                down2 != right1 &&
                                down2 != up1) {
                                //print("down2:\(W.words[down2])")
                                
                                for left2 in 0..<wordCount {
                                    
                                    if (len[left2] >= interlockWidth &&
                                        end[left2][1] == end[up1][0] &&
                                        end[left2][0] == words[down2][1] &&
                                        left2 != down2 &&
                                        left2 != right1 &&
                                        left2 != up1) {
                                        //print("left2:\(W.words[left2])")
                                        
                                        let cluster = ClusterModel(
                                            wordsHorizontal: [right1, left2], // We could put id here if needed
                                            wordsVertical: [up1, down2],
                                            patternHorizontal: [.trailing, .leading],
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
        return result
    }
    
    
    
    public static func C2x3_LRL_DU(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {
        
        let wordCount = (wordsMax == 0) ? words.count : wordsMax
        let interlockWidth = 2
        let interlockHeight = 3
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
                                end[up2][2] == end[left1][0] &&
                                up2 != left1 &&
                                up2 != down1) {
                                //print("up2:\(words[up2])")
                                
                                for right2 in 0..<wordCount {
                                    
                                    if (len[right2] >= interlockWidth &&
                                        words[right2][0] == words[down1][1] &&
                                        words[right2][1] == end[up2][1] &&
                                        right2 != up2 &&
                                        right2 != left1 &&
                                        right2 != down1) {
                                        //print("right2:\(words[right2])")
                                        
                                        for left3 in 0..<wordCount {
                                            
                                            if (len[left3] >= interlockWidth &&
                                                end[left3][1] == words[down1][2] &&
                                                end[left3][0] == end[up2][0] &&
                                                left3 != right2 &&
                                                left3 != up2 &&
                                                left3 != left1 &&
                                                left3 != down1) {
                                                //print("left3:\(words[left3])")
                                                
                                                let cluster = ClusterModel(
                                                    wordsHorizontal: [left1, right2, left3],
                                                    wordsVertical: [down1, up2],
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
    
    public static func C2x3_LRL_UD(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

        let wordCount = (wordsMax == 0) ? words.count : wordsMax
        let interlockWidth = 2
        let interlockHeight = 3
        var result: [ClusterModel] = []

        for up1 in 0..<wordCount {
            
            if (len[up1] >= interlockHeight) {
                //print("up1:\(words[up1])")
                
                for left1 in 0..<wordCount {
                    
                    if (len[left1] >= interlockWidth &&
                        end[left1][1] == end[up1][2] &&
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
                                        words[right2][0] == end[up1][1] &&
                                        words[right2][1] == words[down2][1] &&
                                        right2 != down2 &&
                                        right2 != left1 &&
                                        right2 != up1) {
                                        //print("right2:\(words[right2])")
                                        
                                        for left3 in 0..<wordCount {
                                            
                                            if (len[left3] >= interlockWidth &&
                                                end[left3][1] == end[up1][0] &&
                                                end[left3][0] == words[down2][2] &&
                                                left3 != right2 &&
                                                left3 != down2 &&
                                                left3 != left1 &&
                                                left3 != up1) {
                                                //print("left3:\(words[left3])")
                                                
                                                let cluster = ClusterModel(
                                                    wordsHorizontal: [left1, right2, left3],
                                                    wordsVertical: [up1, down2],
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
    
    public static func C2x3_RLR_DU(words: [String], end: [String], len: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

        let wordCount = (wordsMax == 0) ? words.count : wordsMax
        let interlockWidth = 2
        let interlockHeight = 3
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
                                 end[up2][2] == words[right1][1] &&
                                 up2 != right1 &&
                                 up2 != down1) {
                                 //print("up2:\(words[up2])")

                                 for left2 in 0..<wordCount {

                                     if (len[left2] >= interlockWidth &&
                                         end[left2][1] == words[down1][1] &&
                                         end[left2][0] == end[up2][1] &&
                                         left2 != up2 &&
                                         left2 != right1 &&
                                         left2 != down1) {
                                         //print("left2:\(words[left2])")

                                         for right3 in 0..<wordCount {

                                             if (len[right3] >= interlockWidth &&
                                                 words[right3][0] == words[down1][2] &&
                                                 words[right3][1] == end[up2][0] &&
                                                 right3 != left2 &&
                                                 right3 != up2 &&
                                                 right3 != right1 &&
                                                 right3 != down1) {
                                                 //print("right3:\(words[right3])")

                                                 let cluster = ClusterModel(
                                                     wordsHorizontal: [right1, left2, right3],
                                                     wordsVertical: [down1, up2],
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
    
    public static func C2x3_RLR_UD(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = (wordsMax == 0) ? words.count : wordsMax
         let interlockWidth = 2
         let interlockHeight = 3
         var result: [ClusterModel] = []

         for up1 in 0..<wordCount {

             if (len[up1] >= interlockHeight) {
                 //print("up1:\(words[up1])")

                 for right1 in 0..<wordCount {

                     if (len[right1] >= interlockWidth &&
                         words[right1][0] == end[up1][2] &&
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
                                         end[left2][1] == end[up1][1] &&
                                         end[left2][0] == words[down2][1] &&
                                         left2 != down2 &&
                                         left2 != right1 &&
                                         left2 != up1) {
                                         //print("left2:\(words[left2])")

                                         for right3 in 0..<wordCount {

                                             if (len[right3] >= interlockWidth &&
                                                 words[right3][0] == end[up1][0] &&
                                                 words[right3][1] == words[down2][2] &&
                                                 right3 != left2 &&
                                                 right3 != down2 &&
                                                 right3 != right1 &&
                                                 right3 != up1) {
                                                 //print("right3:\(words[right3])")

                                                 let cluster = ClusterModel(
                                                     wordsHorizontal: [right1, left2, right3],
                                                     wordsVertical: [up1, down2],
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

         let wordCount = (wordsMax == 0) ? words.count : wordsMax
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

    public static func C2x4_RLRL_DU(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = (wordsMax == 0) ? words.count : wordsMax
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
    
    
    public static func C2x4_RLRL_UD(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = (wordsMax == 0) ? words.count : wordsMax
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
    
    
    public static func C2x5_LRLRL_DU(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = (wordsMax == 0) ? words.count : wordsMax
         let interlockWidth = 2
         let interlockHeight = 5
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
                                 end[up2][4] == end[left1][0] &&
                                 up2 != left1 &&
                                 up2 != down1) {
                                 //print("up2:\(words[up2])")

                                 for right2 in 0..<wordCount {

                                     if (len[right2] >= interlockWidth &&
                                         words[right2][0] == words[down1][1] &&
                                         words[right2][1] == end[up2][3] &&
                                         right2 != up2 &&
                                         right2 != left1 &&
                                         right2 != down1) {
                                         //print("right2:\(words[right2])")

                                         for left3 in 0..<wordCount {

                                             if (len[left3] >= interlockWidth &&
                                                 end[left3][1] == words[down1][2] &&
                                                 end[left3][0] == end[up2][2] &&
                                                 left3 != right2 &&
                                                 left3 != up2 &&
                                                 left3 != left1 &&
                                                 left3 != down1) {
                                                 //print("left3:\(words[left3])")

                                                 for right4 in 0..<wordCount {

                                                     if (len[right4] >= interlockWidth &&
                                                         words[right4][0] == words[down1][3] &&
                                                         words[right4][1] == end[up2][1] &&
                                                         right4 != left3 &&
                                                         right4 != right2 &&
                                                         right4 != up2 &&
                                                         right4 != left1 &&
                                                         right4 != down1) {
                                                         //print("right4:\(words[right4])")

                                                         for left5 in 0..<wordCount {

                                                             if (len[left5] >= interlockWidth &&
                                                                 end[left5][1] == words[down1][4] &&
                                                                 end[left5][0] == end[up2][0] &&
                                                                 left5 != right4 &&
                                                                 left5 != left3 &&
                                                                 left5 != right2 &&
                                                                 left5 != up2 &&
                                                                 left5 != left1 &&
                                                                 left5 != down1) {
                                                                 //print("left5:\(words[left5])")

                                                                 let cluster = ClusterModel(
                                                                     wordsHorizontal: [left1, right2, left3, right4, left5],
                                                                     wordsVertical: [down1, up2],
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
    
    
    public static func C2x5_LRLRL_UD(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = (wordsMax == 0) ? words.count : wordsMax
         let interlockWidth = 2
         let interlockHeight = 5
         var result: [ClusterModel] = []

         for up1 in 0..<wordCount {

             if (len[up1] >= interlockHeight) {
                 //print("up1:\(words[up1])")

                 for left1 in 0..<wordCount {

                     if (len[left1] >= interlockWidth &&
                         end[left1][1] == end[up1][4] &&
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
                                         words[right2][0] == end[up1][3] &&
                                         words[right2][1] == words[down2][1] &&
                                         right2 != down2 &&
                                         right2 != left1 &&
                                         right2 != up1) {
                                         //print("right2:\(words[right2])")

                                         for left3 in 0..<wordCount {

                                             if (len[left3] >= interlockWidth &&
                                                 end[left3][1] == end[up1][2] &&
                                                 end[left3][0] == words[down2][2] &&
                                                 left3 != right2 &&
                                                 left3 != down2 &&
                                                 left3 != left1 &&
                                                 left3 != up1) {
                                                 //print("left3:\(words[left3])")

                                                 for right4 in 0..<wordCount {

                                                     if (len[right4] >= interlockWidth &&
                                                         words[right4][0] == end[up1][1] &&
                                                         words[right4][1] == words[down2][3] &&
                                                         right4 != left3 &&
                                                         right4 != right2 &&
                                                         right4 != down2 &&
                                                         right4 != left1 &&
                                                         right4 != up1) {
                                                         //print("right4:\(words[right4])")

                                                         for left5 in 0..<wordCount {

                                                             if (len[left5] >= interlockWidth &&
                                                                 end[left5][1] == end[up1][0] &&
                                                                 end[left5][0] == words[down2][4] &&
                                                                 left5 != right4 &&
                                                                 left5 != left3 &&
                                                                 left5 != right2 &&
                                                                 left5 != down2 &&
                                                                 left5 != left1 &&
                                                                 left5 != up1) {
                                                                 //print("left5:\(words[left5])")

                                                                 let cluster = ClusterModel(
                                                                     wordsHorizontal: [left1, right2, left3, right4, left5],
                                                                     wordsVertical: [up1, down2],
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
    
    public static func C2x5_RLRLR_DU(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = (wordsMax == 0) ? words.count : wordsMax
         let interlockWidth = 2
         let interlockHeight = 5
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
                                 end[up2][4] == words[right1][1] &&
                                 up2 != right1 &&
                                 up2 != down1) {
                                 //print("up2:\(words[up2])")

                                 for left2 in 0..<wordCount {

                                     if (len[left2] >= interlockWidth &&
                                         end[left2][1] == words[down1][1] &&
                                         end[left2][0] == end[up2][3] &&
                                         left2 != up2 &&
                                         left2 != right1 &&
                                         left2 != down1) {
                                         //print("left2:\(words[left2])")

                                         for right3 in 0..<wordCount {

                                             if (len[right3] >= interlockWidth &&
                                                 words[right3][0] == words[down1][2] &&
                                                 words[right3][1] == end[up2][2] &&
                                                 right3 != left2 &&
                                                 right3 != up2 &&
                                                 right3 != right1 &&
                                                 right3 != down1) {
                                                 //print("right3:\(words[right3])")

                                                 for left4 in 0..<wordCount {

                                                     if (len[left4] >= interlockWidth &&
                                                         end[left4][1] == words[down1][3] &&
                                                         end[left4][0] == end[up2][1] &&
                                                         left4 != right3 &&
                                                         left4 != left2 &&
                                                         left4 != up2 &&
                                                         left4 != right1 &&
                                                         left4 != down1) {
                                                         //print("left4:\(words[left4])")

                                                         for right5 in 0..<wordCount {

                                                             if (len[right5] >= interlockWidth &&
                                                                 words[right5][0] == words[down1][4] &&
                                                                 words[right5][1] == end[up2][0] &&
                                                                 right5 != left4 &&
                                                                 right5 != right3 &&
                                                                 right5 != left2 &&
                                                                 right5 != up2 &&
                                                                 right5 != right1 &&
                                                                 right5 != down1) {
                                                                 //print("right5:\(words[right5])")

                                                                 let cluster = ClusterModel(
                                                                     wordsHorizontal: [right1, left2, right3, left4, right5],
                                                                     wordsVertical: [down1, up2],
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
    
    
    public static func C2x5_RLRLR_UD(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = (wordsMax == 0) ? words.count : wordsMax
         let interlockWidth = 2
         let interlockHeight = 5
         var result: [ClusterModel] = []

         for up1 in 0..<wordCount {

             if (len[up1] >= interlockHeight) {
                 //print("up1:\(words[up1])")

                 for right1 in 0..<wordCount {

                     if (len[right1] >= interlockWidth &&
                         words[right1][0] == end[up1][4] &&
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
                                         end[left2][1] == end[up1][3] &&
                                         end[left2][0] == words[down2][1] &&
                                         left2 != down2 &&
                                         left2 != right1 &&
                                         left2 != up1) {
                                         //print("left2:\(words[left2])")

                                         for right3 in 0..<wordCount {

                                             if (len[right3] >= interlockWidth &&
                                                 words[right3][0] == end[up1][2] &&
                                                 words[right3][1] == words[down2][2] &&
                                                 right3 != left2 &&
                                                 right3 != down2 &&
                                                 right3 != right1 &&
                                                 right3 != up1) {
                                                 //print("right3:\(words[right3])")

                                                 for left4 in 0..<wordCount {

                                                     if (len[left4] >= interlockWidth &&
                                                         end[left4][1] == end[up1][1] &&
                                                         end[left4][0] == words[down2][3] &&
                                                         left4 != right3 &&
                                                         left4 != left2 &&
                                                         left4 != down2 &&
                                                         left4 != right1 &&
                                                         left4 != up1) {
                                                         //print("left4:\(words[left4])")

                                                         for right5 in 0..<wordCount {

                                                             if (len[right5] >= interlockWidth &&
                                                                 words[right5][0] == end[up1][0] &&
                                                                 words[right5][1] == words[down2][4] &&
                                                                 right5 != left4 &&
                                                                 right5 != right3 &&
                                                                 right5 != left2 &&
                                                                 right5 != down2 &&
                                                                 right5 != right1 &&
                                                                 right5 != up1) {
                                                                 //print("right5:\(words[right5])")

                                                                 let cluster = ClusterModel(
                                                                     wordsHorizontal: [right1, left2, right3, left4, right5],
                                                                     wordsVertical: [up1, down2],
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
    
    
    public static func C2x6_LRLRLR_DU(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = (wordsMax == 0) ? words.count : wordsMax
         let interlockWidth = 2
         let interlockHeight = 6
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
                                 end[up2][5] == end[left1][0] &&
                                 up2 != left1 &&
                                 up2 != down1) {
                                 //print("up2:\(words[up2])")

                                 for right2 in 0..<wordCount {

                                     if (len[right2] >= interlockWidth &&
                                         words[right2][0] == words[down1][1] &&
                                         words[right2][1] == end[up2][4] &&
                                         right2 != up2 &&
                                         right2 != left1 &&
                                         right2 != down1) {
                                         //print("right2:\(words[right2])")

                                         for left3 in 0..<wordCount {

                                             if (len[left3] >= interlockWidth &&
                                                 end[left3][1] == words[down1][2] &&
                                                 end[left3][0] == end[up2][3] &&
                                                 left3 != right2 &&
                                                 left3 != up2 &&
                                                 left3 != left1 &&
                                                 left3 != down1) {
                                                 //print("left3:\(words[left3])")

                                                 for right4 in 0..<wordCount {

                                                     if (len[right4] >= interlockWidth &&
                                                         words[right4][0] == words[down1][3] &&
                                                         words[right4][1] == end[up2][2] &&
                                                         right4 != left3 &&
                                                         right4 != right2 &&
                                                         right4 != up2 &&
                                                         right4 != left1 &&
                                                         right4 != down1) {
                                                         //print("right4:\(words[right4])")

                                                         for left5 in 0..<wordCount {

                                                             if (len[left5] >= interlockWidth &&
                                                                 end[left5][1] == words[down1][4] &&
                                                                 end[left5][0] == end[up2][1] &&
                                                                 left5 != right4 &&
                                                                 left5 != left3 &&
                                                                 left5 != right2 &&
                                                                 left5 != up2 &&
                                                                 left5 != left1 &&
                                                                 left5 != down1) {
                                                                 //print("left5:\(words[left5])")

                                                                 for right6 in 0..<wordCount {

                                                                     if (len[right6] >= interlockWidth &&
                                                                         words[right6][0] == words[down1][5] &&
                                                                         words[right6][1] == end[up2][0] &&
                                                                         right6 != left5 &&
                                                                         right6 != right4 &&
                                                                         right6 != left3 &&
                                                                         right6 != right2 &&
                                                                         right6 != up2 &&
                                                                         right6 != left1 &&
                                                                         right6 != down1) {
                                                                         //print("right6:\(words[right6])")

                                                                         let cluster = ClusterModel(
                                                                             wordsHorizontal: [left1, right2, left3, right4, left5, right6],
                                                                             wordsVertical: [down1, up2],
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
    
    public static func C2x6_LRLRLR_UD(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = (wordsMax == 0) ? words.count : wordsMax
         let interlockWidth = 2
         let interlockHeight = 6
         var result: [ClusterModel] = []

         for up1 in 0..<wordCount {

             if (len[up1] >= interlockHeight) {
                 //print("up1:\(words[up1])")

                 for left1 in 0..<wordCount {

                     if (len[left1] >= interlockWidth &&
                         end[left1][1] == end[up1][5] &&
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
                                         words[right2][0] == end[up1][4] &&
                                         words[right2][1] == words[down2][1] &&
                                         right2 != down2 &&
                                         right2 != left1 &&
                                         right2 != up1) {
                                         //print("right2:\(words[right2])")

                                         for left3 in 0..<wordCount {

                                             if (len[left3] >= interlockWidth &&
                                                 end[left3][1] == end[up1][3] &&
                                                 end[left3][0] == words[down2][2] &&
                                                 left3 != right2 &&
                                                 left3 != down2 &&
                                                 left3 != left1 &&
                                                 left3 != up1) {
                                                 //print("left3:\(words[left3])")

                                                 for right4 in 0..<wordCount {

                                                     if (len[right4] >= interlockWidth &&
                                                         words[right4][0] == end[up1][2] &&
                                                         words[right4][1] == words[down2][3] &&
                                                         right4 != left3 &&
                                                         right4 != right2 &&
                                                         right4 != down2 &&
                                                         right4 != left1 &&
                                                         right4 != up1) {
                                                         //print("right4:\(words[right4])")

                                                         for left5 in 0..<wordCount {

                                                             if (len[left5] >= interlockWidth &&
                                                                 end[left5][1] == end[up1][1] &&
                                                                 end[left5][0] == words[down2][4] &&
                                                                 left5 != right4 &&
                                                                 left5 != left3 &&
                                                                 left5 != right2 &&
                                                                 left5 != down2 &&
                                                                 left5 != left1 &&
                                                                 left5 != up1) {
                                                                 //print("left5:\(words[left5])")

                                                                 for right6 in 0..<wordCount {

                                                                     if (len[right6] >= interlockWidth &&
                                                                         words[right6][0] == end[up1][0] &&
                                                                         words[right6][1] == words[down2][5] &&
                                                                         right6 != left5 &&
                                                                         right6 != right4 &&
                                                                         right6 != left3 &&
                                                                         right6 != right2 &&
                                                                         right6 != down2 &&
                                                                         right6 != left1 &&
                                                                         right6 != up1) {
                                                                         //print("right6:\(words[right6])")

                                                                         let cluster = ClusterModel(
                                                                             wordsHorizontal: [left1, right2, left3, right4, left5, right6],
                                                                             wordsVertical: [up1, down2],
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
    
    
    public static func C2x6_RLRLRL_DU(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = (wordsMax == 0) ? words.count : wordsMax
         let interlockWidth = 2
         let interlockHeight = 6
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
                                 end[up2][5] == words[right1][1] &&
                                 up2 != right1 &&
                                 up2 != down1) {
                                 //print("up2:\(words[up2])")

                                 for left2 in 0..<wordCount {

                                     if (len[left2] >= interlockWidth &&
                                         end[left2][1] == words[down1][1] &&
                                         end[left2][0] == end[up2][4] &&
                                         left2 != up2 &&
                                         left2 != right1 &&
                                         left2 != down1) {
                                         //print("left2:\(words[left2])")

                                         for right3 in 0..<wordCount {

                                             if (len[right3] >= interlockWidth &&
                                                 words[right3][0] == words[down1][2] &&
                                                 words[right3][1] == end[up2][3] &&
                                                 right3 != left2 &&
                                                 right3 != up2 &&
                                                 right3 != right1 &&
                                                 right3 != down1) {
                                                 //print("right3:\(words[right3])")

                                                 for left4 in 0..<wordCount {

                                                     if (len[left4] >= interlockWidth &&
                                                         end[left4][1] == words[down1][3] &&
                                                         end[left4][0] == end[up2][2] &&
                                                         left4 != right3 &&
                                                         left4 != left2 &&
                                                         left4 != up2 &&
                                                         left4 != right1 &&
                                                         left4 != down1) {
                                                         //print("left4:\(words[left4])")

                                                         for right5 in 0..<wordCount {

                                                             if (len[right5] >= interlockWidth &&
                                                                 words[right5][0] == words[down1][4] &&
                                                                 words[right5][1] == end[up2][1] &&
                                                                 right5 != left4 &&
                                                                 right5 != right3 &&
                                                                 right5 != left2 &&
                                                                 right5 != up2 &&
                                                                 right5 != right1 &&
                                                                 right5 != down1) {
                                                                 //print("right5:\(words[right5])")

                                                                 for left6 in 0..<wordCount {

                                                                     if (len[left6] >= interlockWidth &&
                                                                         end[left6][1] == words[down1][5] &&
                                                                         end[left6][0] == end[up2][0] &&
                                                                         left6 != right5 &&
                                                                         left6 != left4 &&
                                                                         left6 != right3 &&
                                                                         left6 != left2 &&
                                                                         left6 != up2 &&
                                                                         left6 != right1 &&
                                                                         left6 != down1) {
                                                                         //print("left6:\(words[left6])")

                                                                         let cluster = ClusterModel(
                                                                             wordsHorizontal: [right1, left2, right3, left4, right5, left6],
                                                                             wordsVertical: [down1, up2],
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
    
    public static func C2x6_RLRLRL_UD(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = (wordsMax == 0) ? words.count : wordsMax
         let interlockWidth = 2
         let interlockHeight = 6
         var result: [ClusterModel] = []

         for up1 in 0..<wordCount {

             if (len[up1] >= interlockHeight) {
                 //print("up1:\(words[up1])")

                 for right1 in 0..<wordCount {

                     if (len[right1] >= interlockWidth &&
                         words[right1][0] == end[up1][5] &&
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
                                         end[left2][1] == end[up1][4] &&
                                         end[left2][0] == words[down2][1] &&
                                         left2 != down2 &&
                                         left2 != right1 &&
                                         left2 != up1) {
                                         //print("left2:\(words[left2])")

                                         for right3 in 0..<wordCount {

                                             if (len[right3] >= interlockWidth &&
                                                 words[right3][0] == end[up1][3] &&
                                                 words[right3][1] == words[down2][2] &&
                                                 right3 != left2 &&
                                                 right3 != down2 &&
                                                 right3 != right1 &&
                                                 right3 != up1) {
                                                 //print("right3:\(words[right3])")

                                                 for left4 in 0..<wordCount {

                                                     if (len[left4] >= interlockWidth &&
                                                         end[left4][1] == end[up1][2] &&
                                                         end[left4][0] == words[down2][3] &&
                                                         left4 != right3 &&
                                                         left4 != left2 &&
                                                         left4 != down2 &&
                                                         left4 != right1 &&
                                                         left4 != up1) {
                                                         //print("left4:\(words[left4])")

                                                         for right5 in 0..<wordCount {

                                                             if (len[right5] >= interlockWidth &&
                                                                 words[right5][0] == end[up1][1] &&
                                                                 words[right5][1] == words[down2][4] &&
                                                                 right5 != left4 &&
                                                                 right5 != right3 &&
                                                                 right5 != left2 &&
                                                                 right5 != down2 &&
                                                                 right5 != right1 &&
                                                                 right5 != up1) {
                                                                 //print("right5:\(words[right5])")

                                                                 for left6 in 0..<wordCount {

                                                                     if (len[left6] >= interlockWidth &&
                                                                         end[left6][1] == end[up1][0] &&
                                                                         end[left6][0] == words[down2][5] &&
                                                                         left6 != right5 &&
                                                                         left6 != left4 &&
                                                                         left6 != right3 &&
                                                                         left6 != left2 &&
                                                                         left6 != down2 &&
                                                                         left6 != right1 &&
                                                                         left6 != up1) {
                                                                         //print("left6:\(words[left6])")

                                                                         let cluster = ClusterModel(
                                                                             wordsHorizontal: [right1, left2, right3, left4, right5, left6],
                                                                             wordsVertical: [up1, down2],
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
    
    
    
    
    public static func C3x3_LRL_UDU(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = (wordsMax == 0) ? words.count : wordsMax
         let interlockWidth = 3
         let interlockHeight = 3
         var result: [ClusterModel] = []

         for up1 in 0..<wordCount {

             if (len[up1] >= interlockHeight) {
                 //print("up1:\(words[up1])")

                 for left1 in (up1+1)..<wordCount {

                     if (len[left1] >= interlockWidth &&
                         end[left1][2] == end[up1][2] &&
                         left1 != up1) {
                         //print("left1:\(words[left1])")

                         for down2 in 0..<wordCount {

                             if (len[down2] >= interlockHeight &&
                                 words[down2][0] == end[left1][1] &&
                                 down2 != left1 &&
                                 down2 != up1) {
                                 //print("down2:\(words[down2])")

                                 for right2 in 0..<wordCount {

                                     if (len[right2] >= interlockWidth &&
                                         words[right2][0] == end[up1][1] &&
                                         words[right2][1] == words[down2][1] &&
                                         right2 != down2 &&
                                         right2 != left1 &&
                                         right2 != up1) {
                                         //print("right2:\(words[right2])")

                                         for up3 in 0..<wordCount {

                                             if (len[up3] >= interlockHeight &&
                                                 end[up3][2] == end[left1][0] &&
                                                 end[up3][1] == words[right2][2] &&
                                                 up3 != right2 &&
                                                 up3 != down2 &&
                                                 up3 != left1 &&
                                                 up3 != up1) {
                                                 //print("up3:\(words[up3])")

                                                 for left3 in 0..<wordCount {

                                                     if (len[left3] >= interlockWidth &&
                                                         end[left3][2] == end[up1][0] &&
                                                         end[left3][1] == words[down2][2] &&
                                                         end[left3][0] == end[up3][0] &&
                                                         left3 != up3 &&
                                                         left3 != right2 &&
                                                         left3 != down2 &&
                                                         left3 != left1 &&
                                                         left3 != up1) {
                                                         //print("left3:\(words[left3])")

                                                         let cluster = ClusterModel(
                                                             wordsHorizontal: [left1, right2, left3],
                                                             wordsVertical: [up1, down2, up3],
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
    
    public static func C3x3_RLR_DUD(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = (wordsMax == 0) ? words.count : wordsMax
         let interlockWidth = 3
         let interlockHeight = 3
         var result: [ClusterModel] = []

         for down1 in 0..<wordCount {

             if (len[down1] >= interlockHeight) {
                 //print("down1:\(words[down1])")

                 // I did this and it should work
                 for right1 in (down1+1)..<wordCount {

                     if (len[right1] >= interlockWidth &&
                         words[right1][0] == words[down1][0] &&
                         right1 != down1) {
                         //print("right1:\(words[right1])")

                         for up2 in 0..<wordCount {

                             if (len[up2] >= interlockHeight &&
                                 end[up2][2] == words[right1][1] &&
                                 up2 != right1 &&
                                 up2 != down1) {
                                 //print("up2:\(words[up2])")

                                 for left2 in 0..<wordCount {

                                     if (len[left2] >= interlockWidth &&
                                         end[left2][2] == words[down1][1] &&
                                         end[left2][1] == end[up2][1] &&
                                         left2 != up2 &&
                                         left2 != right1 &&
                                         left2 != down1) {
                                         //print("left2:\(words[left2])")

                                         for down3 in 0..<wordCount {

                                             if (len[down3] >= interlockHeight &&
                                                 words[down3][0] == words[right1][2] &&
                                                 words[down3][1] == end[left2][0] &&
                                                 down3 != left2 &&
                                                 down3 != up2 &&
                                                 down3 != right1 &&
                                                 down3 != down1) {
                                                 //print("down3:\(words[down3])")

                                                 for right3 in 0..<wordCount {

                                                     if (len[right3] >= interlockWidth &&
                                                         words[right3][0] == words[down1][2] &&
                                                         words[right3][1] == end[up2][0] &&
                                                         words[right3][2] == words[down3][2] &&
                                                         right3 != down3 &&
                                                         right3 != left2 &&
                                                         right3 != up2 &&
                                                         right3 != right1 &&
                                                         right3 != down1) {
                                                         //print("right3:\(words[right3])")

                                                         let cluster = ClusterModel(
                                                             wordsHorizontal: [right1, left2, right3],
                                                             wordsVertical: [down1, up2, down3],
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
    public static func C3x3_RLR_UDU(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = (wordsMax == 0) ? words.count : wordsMax
         let interlockWidth = 3
         let interlockHeight = 3
         var result: [ClusterModel] = []

         for up1 in 0..<wordCount {

             if (len[up1] >= interlockHeight) {
                 //print("up1:\(words[up1])")

                 for right1 in 0..<wordCount {

                     if (len[right1] >= interlockWidth &&
                         words[right1][0] == end[up1][2] &&
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
                                         end[left2][2] == end[up1][1] &&
                                         end[left2][1] == words[down2][1] &&
                                         left2 != down2 &&
                                         left2 != right1 &&
                                         left2 != up1) {
                                         //print("left2:\(words[left2])")

                                         for up3 in 0..<wordCount {

                                             if (len[up3] >= interlockHeight &&
                                                 end[up3][2] == words[right1][2] &&
                                                 end[up3][1] == end[left2][0] &&
                                                 up3 != left2 &&
                                                 up3 != down2 &&
                                                 up3 != right1 &&
                                                 up3 != up1) {
                                                 //print("up3:\(words[up3])")

                                                 for right3 in 0..<wordCount {

                                                     if (len[right3] >= interlockWidth &&
                                                         words[right3][0] == end[up1][0] &&
                                                         words[right3][1] == words[down2][2] &&
                                                         words[right3][2] == end[up3][0] &&
                                                         right3 != up3 &&
                                                         right3 != left2 &&
                                                         right3 != down2 &&
                                                         right3 != right1 &&
                                                         right3 != up1) {
                                                         //print("right3:\(words[right3])")

                                                         let cluster = ClusterModel(
                                                             wordsHorizontal: [right1, left2, right3],
                                                             wordsVertical: [up1, down2, up3],
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
    
    
    
    public static func C3x4_LRLR_DUD(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = (wordsMax == 0) ? words.count : wordsMax
         let interlockWidth = 3
         let interlockHeight = 4
         var result: [ClusterModel] = []

         for down1 in 0..<wordCount {

             if (len[down1] >= interlockHeight) {
                 //print("down1:\(words[down1])")

                 for left1 in 0..<wordCount {

                     if (len[left1] >= interlockWidth &&
                         end[left1][2] == words[down1][0] &&
                         left1 != down1) {
                         //print("left1:\(words[left1])")

                         for up2 in 0..<wordCount {

                             if (len[up2] >= interlockHeight &&
                                 end[up2][3] == end[left1][1] &&
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

                                         for down3 in 0..<wordCount {

                                             if (len[down3] >= interlockHeight &&
                                                 words[down3][0] == end[left1][0] &&
                                                 words[down3][1] == words[right2][2] &&
                                                 down3 != right2 &&
                                                 down3 != up2 &&
                                                 down3 != left1 &&
                                                 down3 != down1) {
                                                 //print("down3:\(words[down3])")

                                                 for left3 in 0..<wordCount {

                                                     if (len[left3] >= interlockWidth &&
                                                         end[left3][2] == words[down1][2] &&
                                                         end[left3][1] == end[up2][1] &&
                                                         end[left3][0] == words[down3][2] &&
                                                         left3 != down3 &&
                                                         left3 != right2 &&
                                                         left3 != up2 &&
                                                         left3 != left1 &&
                                                         left3 != down1) {
                                                         //print("left3:\(words[left3])")

                                                         for right4 in 0..<wordCount {

                                                             if (len[right4] >= interlockWidth &&
                                                                 words[right4][0] == words[down1][3] &&
                                                                 words[right4][1] == end[up2][0] &&
                                                                 words[right4][2] == words[down3][3] &&
                                                                 right4 != left3 &&
                                                                 right4 != down3 &&
                                                                 right4 != right2 &&
                                                                 right4 != up2 &&
                                                                 right4 != left1 &&
                                                                 right4 != down1) {
                                                                 //print("right4:\(words[right4])")

                                                                 let cluster = ClusterModel(
                                                                     wordsHorizontal: [left1, right2, left3, right4],
                                                                     wordsVertical: [down1, up2, down3],
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
    
    public static func C3x4_RLRL_DUD(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = (wordsMax == 0) ? words.count : wordsMax
         let interlockWidth = 3
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
                                         end[left2][2] == words[down1][1] &&
                                         end[left2][1] == end[up2][2] &&
                                         left2 != up2 &&
                                         left2 != right1 &&
                                         left2 != down1) {
                                         //print("left2:\(words[left2])")

                                         for down3 in 0..<wordCount {

                                             if (len[down3] >= interlockHeight &&
                                                 words[down3][0] == words[right1][2] &&
                                                 words[down3][1] == end[left2][0] &&
                                                 down3 != left2 &&
                                                 down3 != up2 &&
                                                 down3 != right1 &&
                                                 down3 != down1) {
                                                 //print("down3:\(words[down3])")

                                                 for right3 in 0..<wordCount {

                                                     if (len[right3] >= interlockWidth &&
                                                         words[right3][0] == words[down1][2] &&
                                                         words[right3][1] == end[up2][1] &&
                                                         words[right3][2] == words[down3][2] &&
                                                         right3 != down3 &&
                                                         right3 != left2 &&
                                                         right3 != up2 &&
                                                         right3 != right1 &&
                                                         right3 != down1) {
                                                         //print("right3:\(words[right3])")

                                                         for left4 in 0..<wordCount {

                                                             if (len[left4] >= interlockWidth &&
                                                                 end[left4][2] == words[down1][3] &&
                                                                 end[left4][1] == end[up2][0] &&
                                                                 end[left4][0] == words[down3][3] &&
                                                                 left4 != right3 &&
                                                                 left4 != down3 &&
                                                                 left4 != left2 &&
                                                                 left4 != up2 &&
                                                                 left4 != right1 &&
                                                                 left4 != down1) {
                                                                 //print("left4:\(words[left4])")

                                                                 let cluster = ClusterModel(
                                                                     wordsHorizontal: [right1, left2, right3, left4],
                                                                     wordsVertical: [down1, up2, down3],
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
    
    public static func C3x4_LRLR_UDU(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = (wordsMax == 0) ? words.count : wordsMax
         let interlockWidth = 3
         let interlockHeight = 4
         var result: [ClusterModel] = []

         for up1 in 0..<wordCount {

             if (len[up1] >= interlockHeight) {
                 //print("up1:\(words[up1])")

                 for left1 in 0..<wordCount {

                     if (len[left1] >= interlockWidth &&
                         end[left1][2] == end[up1][3] &&
                         left1 != up1) {
                         //print("left1:\(words[left1])")

                         for down2 in 0..<wordCount {

                             if (len[down2] >= interlockHeight &&
                                 words[down2][0] == end[left1][1] &&
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

                                         for up3 in 0..<wordCount {

                                             if (len[up3] >= interlockHeight &&
                                                 end[up3][3] == end[left1][0] &&
                                                 end[up3][2] == words[right2][2] &&
                                                 up3 != right2 &&
                                                 up3 != down2 &&
                                                 up3 != left1 &&
                                                 up3 != up1) {
                                                 //print("up3:\(words[up3])")

                                                 for left3 in 0..<wordCount {

                                                     if (len[left3] >= interlockWidth &&
                                                         end[left3][2] == end[up1][1] &&
                                                         end[left3][1] == words[down2][2] &&
                                                         end[left3][0] == end[up3][1] &&
                                                         left3 != up3 &&
                                                         left3 != right2 &&
                                                         left3 != down2 &&
                                                         left3 != left1 &&
                                                         left3 != up1) {
                                                         //print("left3:\(words[left3])")

                                                         for right4 in 0..<wordCount {

                                                             if (len[right4] >= interlockWidth &&
                                                                 words[right4][0] == end[up1][0] &&
                                                                 words[right4][1] == words[down2][3] &&
                                                                 words[right4][2] == end[up3][0] &&
                                                                 right4 != left3 &&
                                                                 right4 != up3 &&
                                                                 right4 != right2 &&
                                                                 right4 != down2 &&
                                                                 right4 != left1 &&
                                                                 right4 != up1) {
                                                                 //print("right4:\(words[right4])")

                                                                 let cluster = ClusterModel(
                                                                     wordsHorizontal: [left1, right2, left3, right4],
                                                                     wordsVertical: [up1, down2, up3],
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
    
    public static func C3x4_RLRL_UDU(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = (wordsMax == 0) ? words.count : wordsMax
         let interlockWidth = 3
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
                                         end[left2][2] == end[up1][2] &&
                                         end[left2][1] == words[down2][1] &&
                                         left2 != down2 &&
                                         left2 != right1 &&
                                         left2 != up1) {
                                         //print("left2:\(words[left2])")

                                         for up3 in 0..<wordCount {

                                             if (len[up3] >= interlockHeight &&
                                                 end[up3][3] == words[right1][2] &&
                                                 end[up3][2] == end[left2][0] &&
                                                 up3 != left2 &&
                                                 up3 != down2 &&
                                                 up3 != right1 &&
                                                 up3 != up1) {
                                                 //print("up3:\(words[up3])")

                                                 for right3 in 0..<wordCount {

                                                     if (len[right3] >= interlockWidth &&
                                                         words[right3][0] == end[up1][1] &&
                                                         words[right3][1] == words[down2][2] &&
                                                         words[right3][2] == end[up3][1] &&
                                                         right3 != up3 &&
                                                         right3 != left2 &&
                                                         right3 != down2 &&
                                                         right3 != right1 &&
                                                         right3 != up1) {
                                                         //print("right3:\(words[right3])")

                                                         for left4 in 0..<wordCount {

                                                             if (len[left4] >= interlockWidth &&
                                                                 end[left4][2] == end[up1][0] &&
                                                                 end[left4][1] == words[down2][3] &&
                                                                 end[left4][0] == end[up3][0] &&
                                                                 left4 != right3 &&
                                                                 left4 != up3 &&
                                                                 left4 != left2 &&
                                                                 left4 != down2 &&
                                                                 left4 != right1 &&
                                                                 left4 != up1) {
                                                                 //print("left4:\(words[left4])")

                                                                 let cluster = ClusterModel(
                                                                     wordsHorizontal: [right1, left2, right3, left4],
                                                                     wordsVertical: [up1, down2, up3],
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
    
    public static func C3x5_LRLRL_DUD(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = (wordsMax == 0) ? words.count : wordsMax
         let interlockWidth = 3
         let interlockHeight = 5
         var result: [ClusterModel] = []

         for down1 in 0..<wordCount {

             if (len[down1] >= interlockHeight) {
                 //print("down1:\(words[down1])")

                 for left1 in 0..<wordCount {

                     if (len[left1] >= interlockWidth &&
                         end[left1][2] == words[down1][0] &&
                         left1 != down1) {
                         //print("left1:\(words[left1])")

                         for up2 in 0..<wordCount {

                             if (len[up2] >= interlockHeight &&
                                 end[up2][4] == end[left1][1] &&
                                 up2 != left1 &&
                                 up2 != down1) {
                                 //print("up2:\(words[up2])")

                                 for right2 in 0..<wordCount {

                                     if (len[right2] >= interlockWidth &&
                                         words[right2][0] == words[down1][1] &&
                                         words[right2][1] == end[up2][3] &&
                                         right2 != up2 &&
                                         right2 != left1 &&
                                         right2 != down1) {
                                         //print("right2:\(words[right2])")

                                         for down3 in 0..<wordCount {

                                             if (len[down3] >= interlockHeight &&
                                                 words[down3][0] == end[left1][0] &&
                                                 words[down3][1] == words[right2][2] &&
                                                 down3 != right2 &&
                                                 down3 != up2 &&
                                                 down3 != left1 &&
                                                 down3 != down1) {
                                                 //print("down3:\(words[down3])")

                                                 for left3 in 0..<wordCount {

                                                     if (len[left3] >= interlockWidth &&
                                                         end[left3][2] == words[down1][2] &&
                                                         end[left3][1] == end[up2][2] &&
                                                         end[left3][0] == words[down3][2] &&
                                                         left3 != down3 &&
                                                         left3 != right2 &&
                                                         left3 != up2 &&
                                                         left3 != left1 &&
                                                         left3 != down1) {
                                                         //print("left3:\(words[left3])")

                                                         for right4 in 0..<wordCount {

                                                             if (len[right4] >= interlockWidth &&
                                                                 words[right4][0] == words[down1][3] &&
                                                                 words[right4][1] == end[up2][1] &&
                                                                 words[right4][2] == words[down3][3] &&
                                                                 right4 != left3 &&
                                                                 right4 != down3 &&
                                                                 right4 != right2 &&
                                                                 right4 != up2 &&
                                                                 right4 != left1 &&
                                                                 right4 != down1) {
                                                                 //print("right4:\(words[right4])")

                                                                 for left5 in 0..<wordCount {

                                                                     if (len[left5] >= interlockWidth &&
                                                                         end[left5][2] == words[down1][4] &&
                                                                         end[left5][1] == end[up2][0] &&
                                                                         end[left5][0] == words[down3][4] &&
                                                                         left5 != right4 &&
                                                                         left5 != left3 &&
                                                                         left5 != down3 &&
                                                                         left5 != right2 &&
                                                                         left5 != up2 &&
                                                                         left5 != left1 &&
                                                                         left5 != down1) {
                                                                         //print("left5:\(words[left5])")

                                                                         let cluster = ClusterModel(
                                                                             wordsHorizontal: [left1, right2, left3, right4, left5],
                                                                             wordsVertical: [down1, up2, down3],
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
    
    public static func C3x5_LRLRL_UDU(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = (wordsMax == 0) ? words.count : wordsMax
         let interlockWidth = 3
         let interlockHeight = 5
         var result: [ClusterModel] = []

         for up1 in 0..<wordCount {

             if (len[up1] >= interlockHeight) {
                 //print("up1:\(words[up1])")

                 for left1 in 0..<wordCount {

                     if (len[left1] >= interlockWidth &&
                         end[left1][2] == end[up1][4] &&
                         left1 != up1) {
                         //print("left1:\(words[left1])")

                         for down2 in 0..<wordCount {

                             if (len[down2] >= interlockHeight &&
                                 words[down2][0] == end[left1][1] &&
                                 down2 != left1 &&
                                 down2 != up1) {
                                 //print("down2:\(words[down2])")

                                 for right2 in 0..<wordCount {

                                     if (len[right2] >= interlockWidth &&
                                         words[right2][0] == end[up1][3] &&
                                         words[right2][1] == words[down2][1] &&
                                         right2 != down2 &&
                                         right2 != left1 &&
                                         right2 != up1) {
                                         //print("right2:\(words[right2])")

                                         for up3 in 0..<wordCount {

                                             if (len[up3] >= interlockHeight &&
                                                 end[up3][4] == end[left1][0] &&
                                                 end[up3][3] == words[right2][2] &&
                                                 up3 != right2 &&
                                                 up3 != down2 &&
                                                 up3 != left1 &&
                                                 up3 != up1) {
                                                 //print("up3:\(words[up3])")

                                                 for left3 in 0..<wordCount {

                                                     if (len[left3] >= interlockWidth &&
                                                         end[left3][2] == end[up1][2] &&
                                                         end[left3][1] == words[down2][2] &&
                                                         end[left3][0] == end[up3][2] &&
                                                         left3 != up3 &&
                                                         left3 != right2 &&
                                                         left3 != down2 &&
                                                         left3 != left1 &&
                                                         left3 != up1) {
                                                         //print("left3:\(words[left3])")

                                                         for right4 in 0..<wordCount {

                                                             if (len[right4] >= interlockWidth &&
                                                                 words[right4][0] == end[up1][1] &&
                                                                 words[right4][1] == words[down2][3] &&
                                                                 words[right4][2] == end[up3][1] &&
                                                                 right4 != left3 &&
                                                                 right4 != up3 &&
                                                                 right4 != right2 &&
                                                                 right4 != down2 &&
                                                                 right4 != left1 &&
                                                                 right4 != up1) {
                                                                 //print("right4:\(words[right4])")

                                                                 for left5 in 0..<wordCount {

                                                                     if (len[left5] >= interlockWidth &&
                                                                         end[left5][2] == end[up1][0] &&
                                                                         end[left5][1] == words[down2][4] &&
                                                                         end[left5][0] == end[up3][0] &&
                                                                         left5 != right4 &&
                                                                         left5 != left3 &&
                                                                         left5 != up3 &&
                                                                         left5 != right2 &&
                                                                         left5 != down2 &&
                                                                         left5 != left1 &&
                                                                         left5 != up1) {
                                                                         //print("left5:\(words[left5])")

                                                                         let cluster = ClusterModel(
                                                                             wordsHorizontal: [left1, right2, left3, right4, left5],
                                                                             wordsVertical: [up1, down2, up3],
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
    
    public static func C3x5_RLRLR_DUD(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = (wordsMax == 0) ? words.count : wordsMax
         let interlockWidth = 3
         let interlockHeight = 5
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
                                 end[up2][4] == words[right1][1] &&
                                 up2 != right1 &&
                                 up2 != down1) {
                                 //print("up2:\(words[up2])")

                                 for left2 in 0..<wordCount {

                                     if (len[left2] >= interlockWidth &&
                                         end[left2][2] == words[down1][1] &&
                                         end[left2][1] == end[up2][3] &&
                                         left2 != up2 &&
                                         left2 != right1 &&
                                         left2 != down1) {
                                         //print("left2:\(words[left2])")

                                         for down3 in 0..<wordCount {

                                             if (len[down3] >= interlockHeight &&
                                                 words[down3][0] == words[right1][2] &&
                                                 words[down3][1] == end[left2][0] &&
                                                 down3 != left2 &&
                                                 down3 != up2 &&
                                                 down3 != right1 &&
                                                 down3 != down1) {
                                                 //print("down3:\(words[down3])")

                                                 for right3 in 0..<wordCount {

                                                     if (len[right3] >= interlockWidth &&
                                                         words[right3][0] == words[down1][2] &&
                                                         words[right3][1] == end[up2][2] &&
                                                         words[right3][2] == words[down3][2] &&
                                                         right3 != down3 &&
                                                         right3 != left2 &&
                                                         right3 != up2 &&
                                                         right3 != right1 &&
                                                         right3 != down1) {
                                                         //print("right3:\(words[right3])")

                                                         for left4 in 0..<wordCount {

                                                             if (len[left4] >= interlockWidth &&
                                                                 end[left4][2] == words[down1][3] &&
                                                                 end[left4][1] == end[up2][1] &&
                                                                 end[left4][0] == words[down3][3] &&
                                                                 left4 != right3 &&
                                                                 left4 != down3 &&
                                                                 left4 != left2 &&
                                                                 left4 != up2 &&
                                                                 left4 != right1 &&
                                                                 left4 != down1) {
                                                                 //print("left4:\(words[left4])")

                                                                 for right5 in 0..<wordCount {

                                                                     if (len[right5] >= interlockWidth &&
                                                                         words[right5][0] == words[down1][4] &&
                                                                         words[right5][1] == end[up2][0] &&
                                                                         words[right5][2] == words[down3][4] &&
                                                                         right5 != left4 &&
                                                                         right5 != right3 &&
                                                                         right5 != down3 &&
                                                                         right5 != left2 &&
                                                                         right5 != up2 &&
                                                                         right5 != right1 &&
                                                                         right5 != down1) {
                                                                         //print("right5:\(words[right5])")

                                                                         let cluster = ClusterModel(
                                                                             wordsHorizontal: [right1, left2, right3, left4, right5],
                                                                             wordsVertical: [down1, up2, down3],
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
    
    public static func C3x5_RLRLR_UDU(words: [String], end: [String], len:[Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ClusterModel] {

         let wordCount = (wordsMax == 0) ? words.count : wordsMax
         let interlockWidth = 3
         let interlockHeight = 5
         var result: [ClusterModel] = []

         for up1 in 0..<wordCount {

             if (len[up1] >= interlockHeight) {
                 //print("up1:\(words[up1])")

                 for right1 in 0..<wordCount {

                     if (len[right1] >= interlockWidth &&
                         words[right1][0] == end[up1][4] &&
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
                                         end[left2][2] == end[up1][3] &&
                                         end[left2][1] == words[down2][1] &&
                                         left2 != down2 &&
                                         left2 != right1 &&
                                         left2 != up1) {
                                         //print("left2:\(words[left2])")

                                         for up3 in 0..<wordCount {

                                             if (len[up3] >= interlockHeight &&
                                                 end[up3][4] == words[right1][2] &&
                                                 end[up3][3] == end[left2][0] &&
                                                 up3 != left2 &&
                                                 up3 != down2 &&
                                                 up3 != right1 &&
                                                 up3 != up1) {
                                                 //print("up3:\(words[up3])")

                                                 for right3 in 0..<wordCount {

                                                     if (len[right3] >= interlockWidth &&
                                                         words[right3][0] == end[up1][2] &&
                                                         words[right3][1] == words[down2][2] &&
                                                         words[right3][2] == end[up3][2] &&
                                                         right3 != up3 &&
                                                         right3 != left2 &&
                                                         right3 != down2 &&
                                                         right3 != right1 &&
                                                         right3 != up1) {
                                                         //print("right3:\(words[right3])")

                                                         for left4 in 0..<wordCount {

                                                             if (len[left4] >= interlockWidth &&
                                                                 end[left4][2] == end[up1][1] &&
                                                                 end[left4][1] == words[down2][3] &&
                                                                 end[left4][0] == end[up3][1] &&
                                                                 left4 != right3 &&
                                                                 left4 != up3 &&
                                                                 left4 != left2 &&
                                                                 left4 != down2 &&
                                                                 left4 != right1 &&
                                                                 left4 != up1) {
                                                                 //print("left4:\(words[left4])")

                                                                 for right5 in 0..<wordCount {

                                                                     if (len[right5] >= interlockWidth &&
                                                                         words[right5][0] == end[up1][0] &&
                                                                         words[right5][1] == words[down2][4] &&
                                                                         words[right5][2] == end[up3][0] &&
                                                                         right5 != left4 &&
                                                                         right5 != right3 &&
                                                                         right5 != up3 &&
                                                                         right5 != left2 &&
                                                                         right5 != down2 &&
                                                                         right5 != right1 &&
                                                                         right5 != up1) {
                                                                         //print("right5:\(words[right5])")

                                                                         let cluster = ClusterModel(
                                                                             wordsHorizontal: [right1, left2, right3, left4, right5],
                                                                             wordsVertical: [up1, down2, up3],
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
