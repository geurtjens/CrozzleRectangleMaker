//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 14/8/2023.
//

import Foundation
public class Rectangle2Calculator {
    
    public static func CalculateWidth(topLength: Int, bottomLength: Int, topLetterPos: Int, bottomLetterPos: Int) -> Int {
        let before = max(topLetterPos,bottomLetterPos)
        
        let topRemaining = topLength - topLetterPos
        let bottomRemaining = bottomLength - bottomLetterPos
        
        let after = max(topRemaining, bottomRemaining)
        
        let width = before + after
        
        return width + 2 // We add +2 for the blocking characters
    }
    
    
    
    public static func Rectangle(letterIndex: LetterIndexModel, words: [String], interlockWidth: Int, interlockHeight: Int, lengths: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [RectangleModel] {

        var result: [RectangleModel] = [];

        if (interlockHeight <= interlockWidth) {
            return result;
        }
        
        let wordCount = (wordsMax == 0) ? words.count : wordsMax
       
        
        
        for _top in 0..<wordCount {
        
            let wordTop = words[_top]
            if (lengths[_top] >= interlockWidth) {
                
                for _topLetterPos in 0..<(lengths[_top] - interlockWidth) {
                    
                    let leftWords = letterIndex.find(letter: words[_top][_topLetterPos])
                
                    for left in leftWords {
                    
                        let wordLeft = words[left.wordId]
                        if left.fromEndPos >= interlockHeight
                            && left.wordId != _top {
                        
                            let bottomWords = letterIndex.find(letter: words[left.wordId][left.fromStartPos + interlockHeight])
                            
                            for bottom in bottomWords {
                                let wordBottom = words[bottom.wordId]
                                if bottom.fromEndPos >= interlockWidth &&
                                    bottom.wordId != left.wordId &&
                                    bottom.wordId != _top {
                                            
                                    
                                    let rightWords = letterIndex.find(letter: words[_top][_topLetterPos + interlockWidth])
                                    
                                    for right in rightWords {
                                                 
                                        let wordRight = words[right.wordId]
                                        if right.fromEndPos >= interlockHeight &&
                                            right.wordId != bottom.wordId &&
                                            right.wordId != left.wordId &&
                                            right.wordId != _top {
                                                            
                                                            
                                                                
                                            if (words[bottom.wordId][bottom.fromStartPos + interlockWidth] == words[right.wordId][right.fromStartPos + interlockHeight]
                                            ) {
                                                                    
                                                let score = ScoreCalculator.rectangle(
                                                    topLeft: words[_top][_topLetterPos],
                                                    topRight: words[_top][_topLetterPos + interlockWidth],
                                                    bottomLeft: words[bottom.wordId][bottom.fromStartPos],
                                                    bottomRight: words[bottom.wordId][bottom.fromStartPos + interlockWidth])

                                                if (score >= scoreMin) {

                                                    let width = CalculateWidth(
                                                        topLength: lengths[_top],
                                                        bottomLength: lengths[bottom.wordId],
                                                        topLetterPos: _topLetterPos,
                                                        bottomLetterPos: bottom.fromStartPos)
                                                    
                                                    let height = CalculateWidth(
                                                        topLength: lengths[left.wordId],
                                                        bottomLength: lengths[right.wordId],
                                                        topLetterPos: left.fromStartPos,
                                                        bottomLetterPos: right.fromStartPos);
                                                    
                                                    if (width <= widthMax && height <= heightMax) ||
                                                        (width <= heightMax && height <= widthMax) {
                                                        
                                                        let donut = RectangleModel(
                                                            score: score,
                                                            width: width,
                                                            height: height,
                                                            top: _top,
                                                            topLetterPos: _topLetterPos,
                                                            topLength: lengths[_top],
                                                            bottom: bottom.wordId,
                                                            bottomLetterPos: bottom.fromStartPos,
                                                            bottomLength: lengths[bottom.wordId],
                                                            left: left.wordId,
                                                            leftLetterPos: left.fromStartPos,
                                                            leftLength: lengths[left.wordId],
                                                            right: right.wordId,
                                                            rightLetterPos: right.fromStartPos,
                                                            rightLength: lengths[right.wordId],
                                                            interlockWidth: interlockWidth,
                                                            interlockHeight: interlockHeight,
                                                            type: .rectangle)
                                                        
                                                        //print(donut.ToShape().ToTextDebug(words: words))
                                                        
                                                        result.append(donut)
                                                    }
                                                }
                                            }
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
}
