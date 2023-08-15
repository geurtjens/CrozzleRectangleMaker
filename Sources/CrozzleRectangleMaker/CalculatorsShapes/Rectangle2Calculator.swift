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
    
    public static func CalculateWidthIndented(letterPos: Int, wordLength: Int, indentedWordLength: Int) -> Int {
        let bottomLeft = letterPos
        let bottomRight = wordLength - letterPos
        let topRight = indentedWordLength + 1
        let width = bottomLeft + max(topRight, bottomRight)
        return width + 2
    }
    
    
    public static func Square(interlockWidth: Int, letterIndex: LetterIndexModel, words: [String], lengths: [Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [RectangleModel] {

        var result: [RectangleModel] = [];

        let wordCount = words.count
       
        for _top in 0..<wordCount {
        
            if (lengths[_top] >= interlockWidth) {
                
                for _topLetterPos in 0..<(lengths[_top] - interlockWidth) {
                    
                    let leftWords = letterIndex.find(letter: words[_top][_topLetterPos])
                
                    for left in leftWords {
                    
                        if (left.fromEndPos >= interlockWidth
                            && left.wordId > _top) {
                        
                            let bottomWords = letterIndex.find(letter: words[left.wordId][left.fromStartPos + interlockWidth])
                            
                            for bottom in bottomWords {

                                if (bottom.fromEndPos >= interlockWidth &&
                                    bottom.wordId != left.wordId &&
                                    bottom.wordId != _top) {
                                            
                                    let rightWords = letterIndex.find(letter: words[_top][_topLetterPos + interlockWidth])
                                    
                                    for right in rightWords {
                                                 
                                        if (right.fromEndPos >= interlockWidth &&
                                            right.wordId != bottom.wordId &&
                                            right.wordId != left.wordId &&
                                            right.wordId != _top) {
                                                            
                                            if (words[bottom.wordId][bottom.fromStartPos + interlockWidth] == words[right.wordId][right.fromStartPos + interlockWidth]
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
                                                            interlockHeight: interlockWidth,
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
    
    
    public static func Rectangle(interlockWidth: Int, interlockHeight: Int, letterIndex: LetterIndexModel, words: [String], lengths: [Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [RectangleModel] {

        var result: [RectangleModel] = [];

        if (interlockHeight <= interlockWidth) {
            return result;
        }
        
        let wordCount = words.count
       
        for _top in 0..<wordCount {
        
            if (lengths[_top] >= interlockWidth) {
                
                for _topLetterPos in 0..<(lengths[_top] - interlockWidth) {
                    
                    let leftWords = letterIndex.find(letter: words[_top][_topLetterPos])
                
                    for left in leftWords {
                    
                        if left.fromEndPos >= interlockHeight
                            && left.wordId != _top {
                        
                            let bottomWords = letterIndex.find(letter: words[left.wordId][left.fromStartPos + interlockHeight])
                            
                            for bottom in bottomWords {

                                if bottom.fromEndPos >= interlockWidth &&
                                    bottom.wordId != left.wordId &&
                                    bottom.wordId != _top {
                                            
                                    let rightWords = letterIndex.find(letter: words[_top][_topLetterPos + interlockWidth])
                                    
                                    for right in rightWords {
                                                 
                                        if (right.fromEndPos >= interlockHeight &&
                                            right.wordId != bottom.wordId &&
                                            right.wordId != left.wordId &&
                                            right.wordId != _top) {
                                                                          
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
    
    public static func TopLeftRectangle(interlockWidth: Int, interlockHeight: Int, letterIndex: LetterIndexModel, words: [String], lengths: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [RectangleModel] {
        /*
              .AZURE
              S I
        DECORATIONS
              A N
              R
        */
        var result: [RectangleModel] = [];

        if (interlockHeight <= interlockWidth) {
            return result;
        }
        
        let wordCount = words.count
        
        for _left in 0..<wordCount {
        
            if (lengths[_left] >= interlockHeight) {
                
                let _leftLetterPos = interlockHeight - 1

//                let leftInterlock = words[_left][_leftLetterPos]
//                print("Left word:\(words[_left]), interlock:\(leftInterlock)")
                
                let bottomWords = letterIndex.find(letter: words[_left][_leftLetterPos])
                
                for bottom in bottomWords {
                
                    if (bottom.fromEndPos >= interlockWidth &&
                        bottom.wordId != _left) {
                        
//                        let bottomInterlock = words[bottom.wordId][bottom.fromStartPos + interlockWidth]
//                        print("Bottom word:\(words[bottom.wordId]), interlock:\(bottomInterlock)")
                        
                        let rightWords = letterIndex.find(letter: words[bottom.wordId][bottom.fromStartPos + interlockWidth])

                        for right in rightWords {

                            if (right.fromStartPos >= interlockHeight &&
                                right.wordId != bottom.wordId &&
                                right.wordId != _left) {
                                
//                                let rightInterlock = words[right.wordId][right.fromStartPos - interlockHeight]
//                                print("right word:\(words[right.wordId]), interlock:\(rightInterlock)")
                                
                                let topWords = letterIndex.find(letter: words[right.wordId][right.fromStartPos - interlockHeight])

                                for top in topWords {
                                    
                                    if (top.fromStartPos == interlockWidth - 1 &&
                                        top.wordId != right.wordId &&
                                        top.wordId != bottom.wordId &&
                                        top.wordId != _left) {
                                        
                                        //print("top word:\(words[top.wordId])")
                                        
                                        let score = ScoreCalculator.topLeft(
                                            topRight: words[top.wordId][top.fromStartPos],
                                            bottomLeft: words[bottom.wordId][bottom.fromStartPos],
                                            bottomRight: words[bottom.wordId][bottom.fromStartPos + interlockWidth])
                                        
                                        if score >= scoreMin {

                                            let width = CalculateWidthIndented(
                                                letterPos: bottom.fromStartPos,
                                                wordLength: lengths[bottom.wordId],
                                                indentedWordLength: lengths[top.wordId])
                                            
                                            let height = CalculateWidthIndented(
                                                letterPos: right.fromStartPos - interlockHeight,
                                                wordLength: lengths[right.wordId],
                                                indentedWordLength: lengths[_left])

                                            if (width <= widthMax && height <= heightMax) ||
                                                (width <= heightMax && height <= widthMax) {
                                                
                                                let donut = RectangleModel(
                                                    score: score,
                                                    width: width,
                                                    height: height,
                                                    top: top.wordId,
                                                    topLetterPos: top.fromStartPos,
                                                    topLength: lengths[top.wordId],
                                                    bottom: bottom.wordId,
                                                    bottomLetterPos: bottom.fromStartPos,
                                                    bottomLength: lengths[bottom.wordId],
                                                    left: _left,
                                                    leftLetterPos: _leftLetterPos,
                                                    leftLength: lengths[_left],
                                                    right: right.wordId,
                                                    rightLetterPos: right.fromStartPos - interlockHeight,
                                                    rightLength: lengths[right.wordId],
                                                    interlockWidth: interlockWidth,
                                                    interlockHeight: interlockHeight,
                                                    type: .topLeft)
                                                
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
        return result;
    }

    
    public static func TopLeftSquare(interlockWidth: Int, letterIndex: LetterIndexModel, words: [String], lengths: [Int], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [RectangleModel] {
        /*
              .AZURE
              S I
        DECORATIONS
              A N
              R
        */
        var result: [RectangleModel] = [];
        
        let wordCount = words.count
        
        for _left in 0..<wordCount {
        
            if (lengths[_left] >= interlockWidth) {
                
                let _leftLetterPos = interlockWidth - 1

//                let leftInterlock = words[_left][_leftLetterPos]
//                print("Left word:\(words[_left]), interlock:\(leftInterlock)")
                
                let bottomWords = letterIndex.find(letter: words[_left][_leftLetterPos])
                
                for bottom in bottomWords {
                
                    if (bottom.fromEndPos >= interlockWidth &&
                        bottom.wordId != _left) {
                        
//                        let bottomInterlock = words[bottom.wordId][bottom.fromStartPos + interlockWidth]
//                        print("Bottom word:\(words[bottom.wordId]), interlock:\(bottomInterlock)")
                        
                        let rightWords = letterIndex.find(letter: words[bottom.wordId][bottom.fromStartPos + interlockWidth])

                        for right in rightWords {

                            if (right.fromStartPos >= interlockWidth &&
                                right.wordId != bottom.wordId &&
                                right.wordId != _left) {
                                
//                                let rightInterlock = words[right.wordId][right.fromStartPos - interlockHeight]
//                                print("right word:\(words[right.wordId]), interlock:\(rightInterlock)")
                                
                                let topWords = letterIndex.find(letter: words[right.wordId][right.fromStartPos - interlockWidth])

                                for top in topWords {
                                    
                                    if (top.fromStartPos == interlockWidth - 1 &&
                                        top.wordId != right.wordId &&
                                        top.wordId != bottom.wordId &&
                                        top.wordId != _left &&
                                        top.wordId > _left // This is the phrase that stops duplicates on a square
                                    ) {
                                        
                                        //print("top word:\(words[top.wordId])")
                                        
                                        let score = ScoreCalculator.topLeft(
                                            topRight: words[top.wordId][top.fromStartPos],
                                            bottomLeft: words[bottom.wordId][bottom.fromStartPos],
                                            bottomRight: words[bottom.wordId][bottom.fromStartPos + interlockWidth])
                                        
                                        if score >= scoreMin {

                                            let width = CalculateWidthIndented(
                                                letterPos: bottom.fromStartPos,
                                                wordLength: lengths[bottom.wordId],
                                                indentedWordLength: lengths[top.wordId])
                                            
                                            let height = CalculateWidthIndented(
                                                letterPos: right.fromStartPos - interlockWidth,
                                                wordLength: lengths[right.wordId],
                                                indentedWordLength: lengths[_left])

                                            if (width <= widthMax && height <= heightMax) ||
                                                (width <= heightMax && height <= widthMax) {
                                                
                                                let donut = RectangleModel(
                                                    score: score,
                                                    width: width,
                                                    height: height,
                                                    top: top.wordId,
                                                    topLetterPos: top.fromStartPos,
                                                    topLength: lengths[top.wordId],
                                                    bottom: bottom.wordId,
                                                    bottomLetterPos: bottom.fromStartPos,
                                                    bottomLength: lengths[bottom.wordId],
                                                    left: _left,
                                                    leftLetterPos: _leftLetterPos,
                                                    leftLength: lengths[_left],
                                                    right: right.wordId,
                                                    rightLetterPos: right.fromStartPos - interlockWidth,
                                                    rightLength: lengths[right.wordId],
                                                    interlockWidth: interlockWidth,
                                                    interlockHeight: interlockWidth,
                                                    type: .topLeft)
                                                
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
        return result;
    }
    
    public static func TopRightSquare(interlockWidth: Int, letterIndex: LetterIndexModel, words: [String], lengths: [Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [RectangleModel] {
        
        /// The square is exactly same as rectangle because when it is flipped it becomes another shape?
        return TopRightRectangle(interlockWidth: interlockWidth, interlockHeight: interlockWidth, letterIndex: letterIndex, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
    }
    
    public static func TopRightRectangle(interlockWidth: Int, interlockHeight: Int, letterIndex: LetterIndexModel, words: [String], lengths: [Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [RectangleModel] {
        /*
           H
         TOYS.
           M A
           NAZARETH
             U
             R
             E
        */
        var result: [RectangleModel] = [];

//        if (interlockHeight < interlockWidth) {
//            return result;
//        }
        
        let wordCount = words.count

        for _top in 0..<wordCount {
        
            if lengths[_top] >= interlockWidth{
            
                let _topLetterPos = lengths[_top] - interlockWidth

//                let topInterlock = words[_top][_topLetterPos]
//                print("top word:\(words[_top]), interlock:\(topInterlock)")

                
                let leftWords = letterIndex.find(letter: words[_top][_topLetterPos])
                
                for left in leftWords {
                    
                    if (left.fromEndPos >= interlockHeight &&
                        left.wordId != _top) {
                        
//                        let leftInterlock = words[left.wordId][left.fromStartPos + interlockHeight]
//                        print("left word:\(words[left.wordId]), interlock:\(leftInterlock)")
                    
                        let bottomWords = letterIndex.find(letter: words[left.wordId][left.fromStartPos + interlockHeight])
                        
                        for bottom in bottomWords {
                        
                            if (bottom.fromEndPos >= interlockWidth &&
                                bottom.wordId != left.wordId &&
                                bottom.wordId != _top) {
                                
//                                let bottomInterlock = words[bottom.wordId][bottom.fromStartPos + interlockWidth]
//                                print("Bottom word:\(words[bottom.wordId]), interlock:\(bottomInterlock)")
                        
                                let rightWords = letterIndex.find(letter: words[bottom.wordId][bottom.fromStartPos + interlockWidth])

                                for right in rightWords {

                                    if (right.fromStartPos == interlockHeight - 1 &&
                                        right.wordId != bottom.wordId &&
                                        right.wordId != left.wordId &&
                                        right.wordId != _top) {
                                        
                                        //print("right word: \(words[right.wordId])")
                                      
                                        let score = ScoreCalculator.topRight(
                                                topLeft: words[_top][_topLetterPos],
                                                bottomLeft: words[bottom.wordId][bottom.fromStartPos],
                                                bottomRight: words[bottom.wordId][bottom.fromStartPos + interlockWidth])

                                        if score >= scoreMin {

                                            let width = CalculateWidth(
                                                topLength: lengths[_top],
                                                bottomLength: lengths[bottom.wordId],
                                                topLetterPos: _topLetterPos,
                                                bottomLetterPos: bottom.fromStartPos)
                                            
                                            let height = CalculateWidthIndented(
                                                letterPos: left.fromStartPos,
                                                wordLength: lengths[left.wordId],
                                                indentedWordLength: lengths[right.wordId])

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
                                                    type:.topRight)

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
        return result;
    }
    
    
    public static func BottomRightRectangle(interlockWidth: Int, interlockHeight: Int, letterIndex: LetterIndexModel, words: [String], lengths: [Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [RectangleModel] {
        /*
            T
          Z R
        WHITE
          O E
         INN.
        */
        var result: [RectangleModel] = [];

        if (interlockHeight <= interlockWidth) {
            return result;
        }
        
        let wordCount = words.count

        for _right in 0..<wordCount {
            
            if lengths[_right] >= interlockHeight {
            
                let _rightLetterPos = lengths[_right] - interlockHeight;

//                let rightInterlock = words[_right][_rightLetterPos]
//                print("right word:\(words[_right]), interlock:\(rightInterlock)")
                 
                let topWords = letterIndex.find(letter: words[_right][_rightLetterPos])
                
                for top in topWords {
//                    print("top word: \(words[top.wordId])")
                    if (top.fromStartPos >= interlockWidth &&
                        top.wordId != _right) {
                        
//                        let topInterlock = words[top.wordId][top.fromStartPos - interlockWidth]
//                        print("top word: \(words[top.wordId]), interlock:\(topInterlock)")

                        let leftWords = letterIndex.find(letter: words[top.wordId][top.fromStartPos - interlockWidth])
                        
                        for left in leftWords {
//                            print("left word: \(words[left.wordId])")
                            if (left.fromEndPos >= interlockHeight &&
                                left.wordId != top.wordId &&
                                left.wordId != _right) {
                                
//                                let leftInterlock = words[left.wordId][left.fromStartPos + interlockHeight]
//                                print("left word:\(words[left.wordId]), interlock:\(leftInterlock)")

                            
                                let bottomWords = letterIndex.find(letter: words[left.wordId][left.fromStartPos + interlockHeight])
                                
                                for bottom in bottomWords {
                                    
//                                    print("bottom word:\(words[bottom.wordId])")
                                    if (bottom.fromEndPos == interlockWidth - 1 &&
                                        bottom.wordId != left.wordId &&
                                        bottom.wordId != top.wordId &&
                                        bottom.wordId != _right) {
                                    
                                        let score = ScoreCalculator.bottomRight(
                                            topLeft: words[left.wordId][left.fromStartPos],
                                            topRight: words[top.wordId][top.fromStartPos],
                                            bottomLeft: words[bottom.wordId][bottom.fromStartPos])

                                        if score >= scoreMin {

                                            let width = CalculateWidth(
                                                topLength: lengths[top.wordId],
                                                bottomLength: lengths[bottom.wordId],
                                                topLetterPos: top.fromStartPos - interlockWidth,
                                                bottomLetterPos: bottom.fromStartPos)
                                            
                                            let height = CalculateWidth(
                                                topLength: lengths[left.wordId],
                                                bottomLength: lengths[_right],
                                                topLetterPos: left.fromStartPos,
                                                bottomLetterPos: _rightLetterPos)

                                            if (width <= widthMax && height <= heightMax) ||
                                                (width <= heightMax && height <= widthMax) {
                                                
                                                let donut = RectangleModel(
                                                    score: score,
                                                    width: width,
                                                    height: height,
                                                    top: top.wordId,
                                                    topLetterPos: top.fromStartPos - interlockWidth,
                                                    topLength: lengths[top.wordId],
                                                    bottom: bottom.wordId,
                                                    bottomLetterPos: bottom.fromStartPos,
                                                    bottomLength: lengths[bottom.wordId],
                                                    left: left.wordId,
                                                    leftLetterPos: left.fromStartPos,
                                                    leftLength: lengths[left.wordId],
                                                    right: _right,
                                                    rightLetterPos: _rightLetterPos,
                                                    rightLength: lengths[_right],
                                                    interlockWidth: interlockWidth,
                                                    interlockHeight: interlockHeight,
                                                    type: .bottomRight)
                                                
                                                //print( donut.ToShape().ToTextDebug(words: words))
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
        return result;
    }
    
    public static func BottomRightSquare(interlockWidth: Int, letterIndex: LetterIndexModel, words: [String], lengths: [Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [RectangleModel] {
        /*
            T
          Z R
        WHITE
          O E
         INN.
        */
        var result: [RectangleModel] = [];
        
        let wordCount = words.count

        for _right in 0..<wordCount {
            
            if lengths[_right] >= interlockWidth {
            
                let _rightLetterPos = lengths[_right] - interlockWidth;

//                let rightInterlock = words[_right][_rightLetterPos]
//                print("right word:\(words[_right]), interlock:\(rightInterlock)")
                 
                let topWords = letterIndex.find(letter: words[_right][_rightLetterPos])
                
                for top in topWords {
//                    print("top word: \(words[top.wordId])")
                    if (top.fromStartPos >= interlockWidth &&
                        top.wordId != _right) {
                        
//                        let topInterlock = words[top.wordId][top.fromStartPos - interlockWidth]
//                        print("top word: \(words[top.wordId]), interlock:\(topInterlock)")

                        let leftWords = letterIndex.find(letter: words[top.wordId][top.fromStartPos - interlockWidth])
                        
                        for left in leftWords {
//                            print("left word: \(words[left.wordId])")
                            if (left.fromEndPos >= interlockWidth &&
                                left.wordId != top.wordId &&
                                left.wordId != _right &&
                                left.wordId > top.wordId
                            ) {
                                
//                                let leftInterlock = words[left.wordId][left.fromStartPos + interlockHeight]
//                                print("left word:\(words[left.wordId]), interlock:\(leftInterlock)")

                            
                                let bottomWords = letterIndex.find(letter: words[left.wordId][left.fromStartPos + interlockWidth])
                                
                                for bottom in bottomWords {
                                    
//                                    print("bottom word:\(words[bottom.wordId])")
                                    if (bottom.fromEndPos == interlockWidth - 1 &&
                                        bottom.wordId != left.wordId &&
                                        bottom.wordId != top.wordId &&
                                        bottom.wordId != _right) {
                                    
                                        let score = ScoreCalculator.bottomRight(
                                            topLeft: words[left.wordId][left.fromStartPos],
                                            topRight: words[top.wordId][top.fromStartPos],
                                            bottomLeft: words[bottom.wordId][bottom.fromStartPos])

                                        if score >= scoreMin {

                                            let width = CalculateWidth(
                                                topLength: lengths[top.wordId],
                                                bottomLength: lengths[bottom.wordId],
                                                topLetterPos: top.fromStartPos - interlockWidth,
                                                bottomLetterPos: bottom.fromStartPos)
                                            
                                            let height = CalculateWidth(
                                                topLength: lengths[left.wordId],
                                                bottomLength: lengths[_right],
                                                topLetterPos: left.fromStartPos,
                                                bottomLetterPos: _rightLetterPos)

                                            if (width <= widthMax && height <= heightMax) ||
                                                (width <= heightMax && height <= widthMax) {
                                                
                                                let donut = RectangleModel(
                                                    score: score,
                                                    width: width,
                                                    height: height,
                                                    top: top.wordId,
                                                    topLetterPos: top.fromStartPos - interlockWidth,
                                                    topLength: lengths[top.wordId],
                                                    bottom: bottom.wordId,
                                                    bottomLetterPos: bottom.fromStartPos,
                                                    bottomLength: lengths[bottom.wordId],
                                                    left: left.wordId,
                                                    leftLetterPos: left.fromStartPos,
                                                    leftLength: lengths[left.wordId],
                                                    right: _right,
                                                    rightLetterPos: _rightLetterPos,
                                                    rightLength: lengths[_right],
                                                    interlockWidth: interlockWidth,
                                                    interlockHeight: interlockWidth,
                                                    type: .bottomRight)
                                                
                                                //print( donut.ToShape().ToTextDebug(words: words))
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
        return result;
    }
    
    
    public static func BottomLeftRectangle(interlockWidth: Int, interlockHeight: Int, letterIndex: LetterIndexModel, words: [String], lengths: [Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [RectangleModel] {
        
        return TopRightRectangle(interlockWidth: interlockHeight, interlockHeight: interlockWidth, letterIndex: letterIndex, words: words, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
        
        /*
            .
            H
          . O
       .HAZELNUT.
          I I
          O D
          N A
          .HYMN.
            .
        */
        var result: [RectangleModel] = [];

//        if (interlockHeight <= interlockWidth) {
//            return result;
//        }
//
//        let wordCount = (wordsMax == 0) ? words.count : wordsMax
//
//        for _bottom in 0..<wordCount {
//
//            if lengths[_bottom] >= interlockWidth {
//
//                let _bottomLetterPos = interlockWidth - 1
//
//                for _right in 0..<wordCount {
//
//                    if lengths[_right] >= interlockHeight && _right != _bottom {
//
//                        for _rightLetterPos in 0..<(lengths[_right] - interlockHeight) {
//
//                            if words[_bottom][_bottomLetterPos] == words[_right][_rightLetterPos + interlockHeight] {
//
//                                for _top in 0..<wordCount {
//
//                                    if lengths[_top] >= interlockWidth && _top != _right && _top != _bottom {
//
//                                        for _topLetterPos in 0..<(lengths[_top] - interlockWidth) {
//
//                                            if words[_top][_topLetterPos + interlockWidth] == words[_right][_rightLetterPos] {
//
//                                                for _left in 0..<wordCount {
//
//                                                    if lengths[_left] >= interlockHeight && _left != _top && _left != _right && _left != _bottom {
//
//                                                        let _leftLetterPos = lengths[_left] - interlockHeight
//
//                                                        if words[_top][_topLetterPos] == words[_left][_leftLetterPos] {
//
//                                                            let score = ScoreCalculator.bottomRight(
//                                                                topLeft: words[_top][_topLetterPos],
//                                                                topRight: words[_top][_topLetterPos + interlockWidth],
//                                                                bottomLeft: words[_bottom][_bottomLetterPos])
//
//                                                            if score >= scoreMin {
//
//                                                                let width = CalculateWidthIndented(
//                                                                    letterPos: _topLetterPos,
//                                                                    wordLength: lengths[_top],
//                                                                    indentedWordLength: lengths[_bottom])
//
//                                                                let height = CalculateWidth(
//                                                                    topLength: lengths[_left],
//                                                                    bottomLength: lengths[_right],
//                                                                    topLetterPos: _leftLetterPos,
//                                                                    bottomLetterPos: _rightLetterPos)
//
//
//                                                                if (width <= widthMax && height <= heightMax) || (width <= heightMax && height <= widthMax) {
//
//                                                                    let donut = RectangleModel(
//                                                                        score: score,
//                                                                        width: width,
//                                                                        height: height,
//                                                                        top: _top,
//                                                                        topLetterPos: _topLetterPos,
//                                                                        topLength: lengths[_top],
//                                                                        bottom: _bottom,
//                                                                        bottomLetterPos: _bottomLetterPos,
//                                                                        bottomLength: lengths[_bottom],
//                                                                        left: _left,
//                                                                        leftLetterPos: _leftLetterPos,
//                                                                        leftLength: lengths[_left],
//                                                                        right: _right,
//                                                                        rightLetterPos: _rightLetterPos,
//                                                                        rightLength: lengths[_right],
//                                                                        interlockWidth: interlockWidth,
//                                                                        interlockHeight: interlockHeight,
//                                                                        type: .bottomLeft)
////#if DEBUG
////                                                                    if _left == _right || _left == _top || _left == _bottom || _top == _right || _top == _bottom || _right == _bottom {
////                                                                        print("error occurred as words are matching")
////                                                                        return []
////                                                                    }
////                                                                    let text = donut.ToText(words: words)
////
////                                                                    if text.contains("#") {
////                                                                        print("error # detected in \n\(text)")
////                                                                        return []
////                                                                    }
////#endif
//                                                                    result.append(donut)
//                                                                }
//                                                            }
//                                                        }
//                                                    }
//                                                }
//                                            }
//                                        }
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
        return result;
    }
    
    
    
    
    public static func Execute(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) async -> [RectangleModel] {
            
        let lengths = WordCalculator.lengths(words: words)
        
        let letterIndex = LetterIndexModel(words: words)
            
        async let d3x3 = Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        async let d3x4 = Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        async let d3x5 = Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        async let d3x6 = Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let d4x4 = Square(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        async let d4x5 = Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        async let d4x6 = Rectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let d5x5 = Square(
            interlockWidth: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        async let d5x6 = Rectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let d6x6 = Square(
            interlockWidth: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        async let o3x3_BottomRight = BottomRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o3x3_TopLeft = TopLeftSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
              
        async let o3x3_TopRight = TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        async let o3x4_BottomLeft = BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o3x4_BottomRight = BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
                     
        async let o3x4_TopLeft = TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        async let o3x4_TopRight = TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)

        async let o3x5_BottomLeft = BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        async let o3x5_BottomRight = BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o3x5_TopLeft = TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
                       
        async let o3x5_TopRight = TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)

        async let o3x6_BottomLeft = BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o3x6_BottomRight = BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)

        async let o3x6_TopLeft = TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        async let o3x6_TopRight = TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o4x4_BottomRight = BottomRightSquare(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o4x4_TopLeft = TopLeftSquare(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o4x4_TopRight = TopRightSquare(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o4x5_BottomLeft = BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o4x5_BottomRight = BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o4x5_TopLeft = TopLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)

        async let o4x5_TopRight = TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)

        async let o4x6_BottomLeft = BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o4x6_BottomRight = BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)

        async let o4x6_TopLeft = TopLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o4x6_TopRight = TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o5x5_BottomRight = BottomRightSquare(
            interlockWidth: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o5x5_TopLeft = TopLeftSquare(
            interlockWidth: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o5x5_TopRight = TopRightSquare(
            interlockWidth: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o5x6_BottomLeft = BottomLeftRectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o5x6_BottomRight = BottomRightRectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o5x6_TopLeft = TopLeftRectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o5x6_TopRight = TopRightRectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o6x6_BottomRight = BottomRightSquare(
            interlockWidth: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o6x6_TopLeft = TopLeftSquare(
            interlockWidth: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o6x6_TopRight = TopRightSquare(
            interlockWidth: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let result = await
            d3x3 + o3x3_TopLeft + o3x3_TopRight + o3x3_BottomRight +
            d3x4 + o3x4_TopLeft + o3x4_TopRight + o3x4_BottomRight + o3x4_BottomLeft +
            d3x5 + o3x5_TopLeft + o3x5_TopRight + o3x5_BottomRight + o3x5_BottomLeft +
            d3x6 + o3x6_TopLeft + o3x6_TopRight + o3x6_BottomRight + o3x6_BottomLeft +
            d4x4 + o4x4_TopLeft + o4x4_TopRight + o4x4_BottomRight +
            d4x5 + o4x5_TopLeft + o4x5_TopRight + o4x5_BottomRight + o4x5_BottomLeft +
            d4x6 + o4x6_TopLeft + o4x6_TopRight + o4x6_BottomRight + o4x6_BottomLeft +
            d5x5 + o5x5_TopLeft + o5x5_TopRight + o5x5_BottomRight +
            d5x6 + o5x6_TopLeft + o5x6_TopRight + o5x6_BottomRight + o5x6_BottomLeft +
            d6x6 + o6x6_TopLeft + o6x6_TopRight + o6x6_BottomRight

        return result
    }
    /// Creates all possible rectangles and then sorts them by score and then area
    public static func ExecuteAndSortByScoreAndArea(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) async -> [RectangleModel]  {
        
        var rectangles = await Execute(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        rectangles.sort {
            if $0.score == $1.score {
                return $0.width * $0.height > $1.width * $1.height
            } else {
                return $0.score > $1.score
            }
        }
        return rectangles
    }
    
    public static func ExecuteSerial(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) -> [RectangleModel] {
            
        let lengths = WordCalculator.lengths(words: words)
            
        let letterIndex = LetterIndexModel(words: words)
        
        let d3x3 = Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("d3x3 \(d3x3.count)")
            
        let d3x4 = Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        print("d3x4 \(d3x4.count)")
        
        let d3x5 = Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        print("d3x5 \(d3x5.count)")
        
        let d3x6 = Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("d3x6 \(d3x6.count)")
        
        let d4x4 = Square(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        print("d4x4 \(d4x4.count)")
        
        let d4x5 = Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        print("d4x5 \(d4x5.count)")
        
        let d4x6 = Rectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("d4x6 \(d4x6.count)")
        
        let d5x5 = Square(
            interlockWidth: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        print("d5x5 \(d5x5.count)")
        
        let d5x6 = Rectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("d5x6 \(d5x6.count)")
        
        let d6x6 = Square(
            interlockWidth: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        print("d6x6 \(d6x6.count)")
        
        let o3x3_BottomRight = BottomRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o3x3_BottomRight \(o3x3_BottomRight.count)")
        
        let o3x3_TopLeft = TopLeftSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o3x3_TopLeft \(o3x3_TopLeft.count)")
        
        let o3x3_TopRight = TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        print("o3x3_TopRight \(o3x3_TopRight.count)")
        
        let o3x4_BottomLeft = BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o3x4_BottomLeft \(o3x4_BottomLeft.count)")
        
        let o3x4_BottomRight = BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
                     
        print("o3x4_BottomRight \(o3x4_BottomRight.count)")
        
        let o3x4_TopLeft = TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        print("o3x4_TopLeft \(o3x4_TopLeft.count)")
        
        let o3x4_TopRight = TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)

        print("o3x4_TopRight \(o3x4_TopRight.count)")
        
        let o3x5_BottomLeft = BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        print("o3x5_BottomLeft \(o3x5_BottomLeft.count)")
        
        let o3x5_BottomRight = BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o3x5_BottomRight \(o3x5_BottomRight.count)")
        
        let o3x5_TopLeft = TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
                       
        print("o3x5_TopLeft \(o3x5_TopLeft.count)")
        
        let o3x5_TopRight = TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)

        print("o3x5_TopRight \(o3x5_TopRight.count)")
        
        let o3x6_BottomLeft = BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o3x6_BottomLeft \(o3x6_BottomLeft.count)")
        
        let o3x6_BottomRight = BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o3x6_BottomRight \(o3x6_BottomRight.count)")

        let o3x6_TopLeft = TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        print("o3x6_TopLeft \(o3x6_TopLeft.count)")
        
        let o3x6_TopRight = TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o3x6_TopRight \(o3x6_TopRight.count)")
        
        let o4x4_BottomRight = BottomRightSquare(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o4x4_BottomRight \(o4x4_BottomRight.count)")
        
        let o4x4_TopLeft = TopLeftSquare(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o4x4_TopLeft \(o4x4_TopLeft.count)")
        
        let o4x4_TopRight = TopRightSquare(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o4x4_TopRight \(o4x4_TopRight.count)")
        
        let o4x5_BottomLeft = BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o4x5_BottomLeft \(o4x5_BottomLeft.count)")
        
        let o4x5_BottomRight = BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o4x5_BottomRight \(o4x5_BottomRight.count)")
        
        let o4x5_TopLeft = TopLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)

        print("o4x5_TopLeft \(o4x5_TopLeft.count)")
        
        let o4x5_TopRight = TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)

        print("o4x5_TopRight \(o4x5_TopRight.count)")
        
        let o4x6_BottomLeft = BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o4x6_BottomLeft \(o4x6_BottomLeft.count)")
        
        let o4x6_BottomRight = BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)

        print("o4x6_BottomRight \(o4x6_BottomRight.count)")
        
        let o4x6_TopLeft = TopLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o4x6_TopLeft \(o4x6_TopLeft.count)")
        
        let o4x6_TopRight = TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o4x6_TopRight \(o4x6_TopRight.count)")
        
        let o5x5_BottomRight = BottomRightSquare(
            interlockWidth: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o5x5_BottomRight \(o5x5_BottomRight.count)")
        
        let o5x5_TopLeft = TopLeftSquare(
            interlockWidth: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o5x5_TopLeft \(o5x5_TopLeft.count)")
        
        let o5x5_TopRight = TopRightSquare(
            interlockWidth: 4,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o5x5_TopRight \(o5x5_TopRight.count)")
        
        let o5x6_BottomLeft = BottomLeftRectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o5x6_BottomLeft \(o5x6_BottomLeft.count)")
        
        let o5x6_BottomRight = BottomRightRectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o5x6_BottomRight \(o5x6_BottomRight.count)")
        
        let o5x6_TopLeft = TopLeftRectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o5x6_TopLeft \(o5x6_TopLeft.count)")
        
        let o5x6_TopRight = TopRightRectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o5x6_TopRight \(o5x6_TopRight.count)")
        
        let o6x6_BottomRight = BottomRightSquare(
            interlockWidth: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o6x6_BottomRight \(o6x6_BottomRight.count)")
        
        let o6x6_TopLeft = TopLeftSquare(
            interlockWidth: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o6x6_TopLeft \(o6x6_TopLeft.count)")
        
        let o6x6_TopRight = TopRightSquare(
            interlockWidth: 5,
            letterIndex: letterIndex,
            words: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o6x6_TopRight \(o6x6_TopRight.count)")
        
        
         let result =

            d3x3 + o3x3_TopLeft + o3x3_TopRight + o3x3_BottomRight +
            d3x4 + o3x4_TopLeft + o3x4_TopRight + o3x4_BottomRight + o3x4_BottomLeft +
            d3x5 + o3x5_TopLeft + o3x5_TopRight + o3x5_BottomRight + o3x5_BottomLeft +
            d3x6 + o3x6_TopLeft + o3x6_TopRight + o3x6_BottomRight + o3x6_BottomLeft +
            d4x4 + o4x4_TopLeft + o4x4_TopRight + o4x4_BottomRight +
            d4x5 + o4x5_TopLeft + o4x5_TopRight + o4x5_BottomRight + o4x5_BottomLeft +
            d4x6 + o4x6_TopLeft + o4x6_TopRight + o4x6_BottomRight + o4x6_BottomLeft +
            d5x5 + o5x5_TopLeft + o5x5_TopRight + o5x5_BottomRight +
            d5x6 + o5x6_TopLeft + o5x6_TopRight + o5x6_BottomRight + o5x6_BottomLeft +
            d6x6 + o6x6_TopLeft + o6x6_TopRight + o6x6_BottomRight
        
            
        return result
    }
}
