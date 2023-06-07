//
//  PacmanCalculator.swift
//  
//
//  Created by Michael Geurtjens on 6/6/2023.
//

import Foundation
class PacmanCalculator {
    
    
    
    // flips to bottom left so does not need to worry about duplicates.  Visually inspected
    
    static func topRight(start: [String], end: [String], len: [Int],
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
        let wordCount = start.count

        for _left1 in 0..<wordCount {

            if len[_left1] >= interlockWidth {

                for _down1 in 0..<wordCount {
                
                    if (len[_down1] >= interlockHeight &&
                        _down1 != _left1 &&
                        start[_down1][0] == end[_left1][1]) {

                        for _up2 in 0..<wordCount {
                            
                            if (len[_up2] >= interlockHeight &&
                                _up2 != _down1 && _up2 != _left1 &&
                                end[_up2][2] == end[_left1][0]) {
                                 
                                for _right2 in 0..<wordCount {
                                       
                                    if (len[_right2] >= interlockWidth &&
                                        _right2 != _down1 && _right2 != _up2 && _right2 != _left1 &&
                                        start[_right2][0] == start[_down1][1] &&
                                        start[_right2][1] == end[_up2][1]) {
                                            
                                        for _down3 in 0..<wordCount {
                                                    
                                            if (len[_down3] >= interlockHeight &&
                                                _down3 != _down1 && _down3 != _up2 && _down1 != _left1 && _right2 != _down3 &&
                                                start[_down3][0] == start[_right2][2]) {

                                                for _left3 in 0..<wordCount {
                                                                
                                                    if (len[_left3] >= interlockWidth &&
                                                        _left3 != _down1 && _left3 != _up2 && _left3 != _down3 && _left3 != _left1 && _left3 != _right2 &&
                                                        end[_left3][2] == start[_down1][2] &&
                                                        end[_left3][1] == end[_up2][0] &&
                                                        end[_left3][0] == start[_down3][1]) {
                                                                   
                                                        
                                                        
                                                        let pacman = PacmanModel(
                                                            pacmanType: .topRight,
                                                            wordsHorizontal: [_left1, _right2, _left3],
                                                            wordsVertical: [_down1, _up2, _down3],
                                                            patternHorizontal: [.leading, .trailing, .leading],
                                                            patternVertical: [.trailing, .leading, .trailing],
                                                            start: start,
                                                            end: end,
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

    static func bottomRight(start: [String], end: [String], len: [Int],
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
        let wordCount = start.count

        for _left1 in 0..<wordCount {
            
            if len[_left1] >= interlockWidth {

                for _up1 in (_left1 + 1)..<wordCount {

                    if (len[_up1] >= interlockHeight &&
                        _up1 != _left1 &&
                        end[_up1][2] == end[_left1][2]) {

                        for _down2 in 0..<wordCount {
                            
                            if (len[_down2] >= interlockHeight &&
                                _down2 != _up1 && _down2 != _left1 &&
                                start[_down2][0] == end[_left1][1]) {
                                
                                for _right2 in 0..<wordCount {
                                        
                                    if (len[_right2] >= interlockWidth &&
                                        _right2 != _up1 && _right2 != _down2 && _right2 != _left1 &&
                                        start[_right2][0] == end[_up1][1] &&
                                        start[_right2][1] == start[_down2][1]) {
                                            
                                        for _up3 in 0..<wordCount {

                                            if (len[_up3] >= interlockHeight &&
                                                _up3 != _up1 && _up3 != _down2 && _up3 != _left1 && _right2 != _up3 &&
                                                end[_up3][1] == end[_left1][0] &&
                                                start[_right2][2] == end[_up3][0]) {
                                                   
                                                for _left3 in 0..<wordCount {
                                                                
                                                    if (len[_left3] >= interlockWidth &&
                                                        _left3 != _up1 && _left3 != _down2 && _left3 != _up3 && _left3 != _right2 && _left3 != _left1 &&
                                                        end[_left3][1] == end[_up1][0] &&
                                                        end[_left3][0] == start[_down2][2]) {
                                                                       
                                                        let pacman = PacmanModel(
                                                            pacmanType: .bottomRight,
                                                            wordsHorizontal: [_left1, _right2, _left3],
                                                            wordsVertical: [_up1, _down2, _up3],
                                                            patternHorizontal: [.leading, .trailing, .leading],
                                                            patternVertical: [.leading, .trailing, .leading],
                                                            start: start,
                                                            end: end,
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
    static func topLeft(start: [String], end: [String], len: [Int],
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
        let wordCount = start.count
        var result: [PacmanModel] = []
        
        for _right1 in 0..<wordCount {
            
            if len[_right1] >= interlockWidth {

                for _up2 in 0..<wordCount {
                
                    if (len[_up2] >= interlockHeight &&
                        _up2 != _right1 &&
                        end[_up2][2] == start[_right1][0]) {
                        
                        for _left2 in 0..<wordCount {
                            
                            if (len[_left2] >= interlockWidth &&
                                _left2 != _up2 && _left2 != _right1 &&
                                end[_left2][1] == end[_up2][1]) {
                                    
                                for _down3 in 0..<wordCount {
                                        
                                    if (len[_down3] >= interlockHeight &&
                                        _down3 != _up2 && _down3 != _right1 && _down3 != _left2 &&
                                        start[_down3][0] == start[_right1][1] &&
                                        end[_left2][0] == start[_down3][1]) {
                                                
                                        for _right3 in 0..<wordCount {

                                            if (len[_right3] >= interlockWidth &&
                                                _right3 != _down3 && _right3 != _left2 && _right3 != _up2 && _right3 != _right1 &&
                                                end[_up2][0] == start[_right3][1] &&
                                                start[_down3][2] == start[_right3][2]) {
            
                                                for _down1 in (_right1+1)..<wordCount {
                
                                                    if (len[_down1] >= interlockHeight &&
                                                        _down1 != _right3 && _down1 != _down3 && _down1 != _left2 && _down1 != _up2 && _down1 != _right1 &&
                                                        start[_down1][0] == end[_left2][2] && start[_down1][1] == start[_right3][0]) {

                                                        let pacman = PacmanModel(
                                                            pacmanType: .topLeft,
                                                            wordsHorizontal: [_right1, _left2, _right3],
                                                            wordsVertical: [_down1, _up2, _down3],
                                                            patternHorizontal: [.trailing, .leading, .trailing],
                                                            patternVertical: [.trailing, .leading, .trailing],
                                                            start: start,
                                                            end: end,
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
