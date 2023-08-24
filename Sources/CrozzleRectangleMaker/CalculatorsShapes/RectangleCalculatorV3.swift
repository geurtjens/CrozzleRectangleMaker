//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 22/8/2023.
//

import Foundation
public class RectangleCalculatorV3 {
    
    public static func ExecuteAllSerial(scoreMin: Int) -> Int  {
        
        let gameList = GameList()
        
        let startTime = DateTimeCalculator.now()
        var count = 0
        
        for game in gameList.games {

            var result = ExecuteSerial(
                words: game.words,
                scoreMin: scoreMin,
                widthMax: game.maxWidth,
                heightMax: game.maxHeight)
            
            print("RectangleCalculatorV1.ExecuteSerial: \(game.gameId), count: \(result.count)")
            
            count += result.count
        }
        let finishTime = DateTimeCalculator.now()
        let duration = DateTimeCalculator.duration(start: startTime, finish: finishTime)
        
        print("\(count) records found in \(duration)")
        return count
        
    }
    
    
    public static func ExecuteAllGamesInParallel(scoreMin: Int) async {
       
        let startTime = DateTimeCalculator.now()
        var count = 0
        /// We want to calculate new to see how long it takes and then compare with old
        let gameList = GameList()
        for game in gameList.games {
            
            let newResults = await Execute(words: game.words, scoreMin: scoreMin, widthMax: game.maxWidth, heightMax: game.maxHeight)
            
            print("RectangleCalculatorV3.ExecuteParallel: \(game.gameId), count: \(newResults.count)")
            
            count += newResults.count
        }
        let finishTime = DateTimeCalculator.now()
        let duration = DateTimeCalculator.duration(start: startTime, finish: finishTime)
        
        print("\(count) records found in \(duration)")
    }
    
    public static func ExecuteAllGamesInSerial(scoreMin: Int) {
       
        let startTime = DateTimeCalculator.now()
        var count = 0
        /// We want to calculate new to see how long it takes and then compare with old
        let gameList = GameList()
        for game in gameList.games {
            
            let newResults = ExecuteSerial(words: game.words, scoreMin: scoreMin, widthMax: game.maxWidth, heightMax: game.maxHeight)
            
            print("RectangleCalculatorV3.ExecuteSerial: \(game.gameId), count: \(newResults.count)")
            
            count += newResults.count
        }
        let finishTime = DateTimeCalculator.now()
        let duration = DateTimeCalculator.duration(start: startTime, finish: finishTime)
        
        print("\(count) records found in \(duration)")
    }
    
    
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
    
    
    public static func Square(interlockWidth: Int, letterIndex: LetterIndexModel, words: [[Int]], words2: [String], lengths: [Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [RectangleModel] {

        var result: [RectangleModel] = [];

        let wordCount = words.count
       
        for _top in 0..<wordCount {
        
            if (lengths[_top] >= interlockWidth) {
                
                for _topLetterPos in 0..<(lengths[_top] - interlockWidth) {
                    
                    let leftWords = letterIndex.find3(words[_top][_topLetterPos])
                
                    for left in leftWords {
                    
                        if (left.end >= interlockWidth
                            && left.id > _top) {
                        
                            let bottomWords = letterIndex.find3(words[left.id][left.start + interlockWidth])
                            
                            for bottom in bottomWords {

                                if (bottom.end >= interlockWidth &&
                                    bottom.id != left.id &&
                                    bottom.id != _top) {
                                            
                                    let rightWords = letterIndex.find3(words[_top][_topLetterPos + interlockWidth])
                                    
                                    for right in rightWords {
                                                 
                                        if (right.end >= interlockWidth &&
                                            right.id != bottom.id &&
                                            right.id != left.id &&
                                            right.id != _top) {
                                                            
                                            if (words[bottom.id][bottom.start + interlockWidth] == words[right.id][right.start + interlockWidth]
                                            ) {
                                                                    
                                                let score = ScoreCalculator.rectangle(
                                                    topLeft: words2[_top][_topLetterPos],
                                                    topRight: words2[_top][_topLetterPos + interlockWidth],
                                                    bottomLeft: words2[bottom.id][bottom.start],
                                                    bottomRight: words2[bottom.id][bottom.start + interlockWidth])

                                                if (score >= scoreMin) {

                                                    let width = CalculateWidth(
                                                        topLength: lengths[_top],
                                                        bottomLength: lengths[bottom.id],
                                                        topLetterPos: _topLetterPos,
                                                        bottomLetterPos: bottom.start)
                                                    
                                                    let height = CalculateWidth(
                                                        topLength: lengths[left.id],
                                                        bottomLength: lengths[right.id],
                                                        topLetterPos: left.start,
                                                        bottomLetterPos: right.start);
                                                    
                                                    if (width <= widthMax && height <= heightMax) ||
                                                        (width <= heightMax && height <= widthMax) {
                                                        
                                                        let donut = RectangleModel(
                                                            score: score,
                                                            width: width,
                                                            height: height,
                                                            top: _top,
                                                            topLetterPos: _topLetterPos,
                                                            topLength: lengths[_top],
                                                            bottom: bottom.id,
                                                            bottomLetterPos: bottom.start,
                                                            bottomLength: lengths[bottom.id],
                                                            left: left.id,
                                                            leftLetterPos: left.start,
                                                            leftLength: lengths[left.id],
                                                            right: right.id,
                                                            rightLetterPos: right.start,
                                                            rightLength: lengths[right.id],
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
    
    
    public static func Rectangle(interlockWidth: Int, interlockHeight: Int, letterIndex: LetterIndexModel, words: [[Int]], words2: [String], lengths: [Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [RectangleModel] {

        var result: [RectangleModel] = [];

        if (interlockHeight <= interlockWidth) {
            return result;
        }
        
        let wordCount = words.count
       
        for _top in 0..<wordCount {
        
            if (lengths[_top] >= interlockWidth) {
                
                for _topLetterPos in 0..<(lengths[_top] - interlockWidth) {
                    
                    let leftWords = letterIndex.find3(words[_top][_topLetterPos])
                
                    for left in leftWords {
                    
                        if left.end >= interlockHeight
                            && left.id != _top {
                        
                            let bottomWords = letterIndex.find3(words[left.id][left.start + interlockHeight])
                            
                            for bottom in bottomWords {

                                if bottom.end >= interlockWidth &&
                                    bottom.id != left.id &&
                                    bottom.id != _top {
                                            
                                    let rightWords = letterIndex.find3(words[_top][_topLetterPos + interlockWidth])
                                    
                                    for right in rightWords {
                                                 
                                        if (right.end >= interlockHeight &&
                                            right.id != bottom.id &&
                                            right.id != left.id &&
                                            right.id != _top) {
                                                                          
                                            if (words[bottom.id][bottom.start + interlockWidth] == words[right.id][right.start + interlockHeight]
                                            ) {
                                                                    
                                                let score = ScoreCalculator.rectangle(
                                                    topLeft: words2[_top][_topLetterPos],
                                                    topRight: words2[_top][_topLetterPos + interlockWidth],
                                                    bottomLeft: words2[bottom.id][bottom.start],
                                                    bottomRight: words2[bottom.id][bottom.start + interlockWidth])

                                                if (score >= scoreMin) {

                                                    let width = CalculateWidth(
                                                        topLength: lengths[_top],
                                                        bottomLength: lengths[bottom.id],
                                                        topLetterPos: _topLetterPos,
                                                        bottomLetterPos: bottom.start)
                                                    
                                                    let height = CalculateWidth(
                                                        topLength: lengths[left.id],
                                                        bottomLength: lengths[right.id],
                                                        topLetterPos: left.start,
                                                        bottomLetterPos: right.start);
                                                    
                                                    if (width <= widthMax && height <= heightMax) ||
                                                        (width <= heightMax && height <= widthMax) {
                                                        
                                                        let donut = RectangleModel(
                                                            score: score,
                                                            width: width,
                                                            height: height,
                                                            top: _top,
                                                            topLetterPos: _topLetterPos,
                                                            topLength: lengths[_top],
                                                            bottom: bottom.id,
                                                            bottomLetterPos: bottom.start,
                                                            bottomLength: lengths[bottom.id],
                                                            left: left.id,
                                                            leftLetterPos: left.start,
                                                            leftLength: lengths[left.id],
                                                            right: right.id,
                                                            rightLetterPos: right.start,
                                                            rightLength: lengths[right.id],
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
    
    public static func TopLeftRectangle(interlockWidth: Int, interlockHeight: Int, letterIndex: LetterIndexModel, words: [[Int]], words2: [String], lengths: [Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [RectangleModel] {
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
                
                let bottomWords = letterIndex.find3(words[_left][_leftLetterPos])
                
                for bottom in bottomWords {
                
                    if (bottom.end >= interlockWidth &&
                        bottom.id != _left) {
                        
//                        let bottomInterlock = words[bottom.wordId][bottom.fromStartPos + interlockWidth]
//                        print("Bottom word:\(words[bottom.wordId]), interlock:\(bottomInterlock)")
                        
                        let rightWords = letterIndex.find3(words[bottom.id][bottom.start + interlockWidth])

                        for right in rightWords {

                            if (right.start >= interlockHeight &&
                                right.id != bottom.id &&
                                right.id != _left) {
                                
//                                let rightInterlock = words[right.wordId][right.fromStartPos - interlockHeight]
//                                print("right word:\(words[right.wordId]), interlock:\(rightInterlock)")
                                
                                let topWords = letterIndex.find3(words[right.id][right.start - interlockHeight])

                                for top in topWords {
                                    
                                    if (top.start == interlockWidth - 1 &&
                                        top.id != right.id &&
                                        top.id != bottom.id &&
                                        top.id != _left) {
                                        
                                        //print("top word:\(words[top.wordId])")
                                        
                                        let score = ScoreCalculator.topLeft(
                                            topRight: words2[top.id][top.start],
                                            bottomLeft: words2[bottom.id][bottom.start],
                                            bottomRight: words2[bottom.id][bottom.start + interlockWidth])
                                        
                                        if score >= scoreMin {

                                            let width = CalculateWidthIndented(
                                                letterPos: bottom.start,
                                                wordLength: lengths[bottom.id],
                                                indentedWordLength: lengths[top.id])
                                            
                                            let height = CalculateWidthIndented(
                                                letterPos: right.start - interlockHeight,
                                                wordLength: lengths[right.id],
                                                indentedWordLength: lengths[_left])

                                            if (width <= widthMax && height <= heightMax) ||
                                                (width <= heightMax && height <= widthMax) {
                                                
                                                let donut = RectangleModel(
                                                    score: score,
                                                    width: width,
                                                    height: height,
                                                    top: top.id,
                                                    topLetterPos: top.start,
                                                    topLength: lengths[top.id],
                                                    bottom: bottom.id,
                                                    bottomLetterPos: bottom.start,
                                                    bottomLength: lengths[bottom.id],
                                                    left: _left,
                                                    leftLetterPos: _leftLetterPos,
                                                    leftLength: lengths[_left],
                                                    right: right.id,
                                                    rightLetterPos: right.start - interlockHeight,
                                                    rightLength: lengths[right.id],
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

    
    public static func TopLeftSquare(interlockWidth: Int, letterIndex: LetterIndexModel, words: [[Int]], words2: [String], lengths: [Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [RectangleModel] {
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
                
                let bottomWords = letterIndex.find3(words[_left][_leftLetterPos])
                
                for bottom in bottomWords {
                
                    if (bottom.end >= interlockWidth &&
                        bottom.id != _left) {
                        
//                        let bottomInterlock = words[bottom.wordId][bottom.fromStartPos + interlockWidth]
//                        print("Bottom word:\(words[bottom.wordId]), interlock:\(bottomInterlock)")
                        
                        let rightWords = letterIndex.find3(words[bottom.id][bottom.start + interlockWidth])

                        for right in rightWords {

                            if (right.start >= interlockWidth &&
                                right.id != bottom.id &&
                                right.id != _left) {
                                
//                                let rightInterlock = words[right.wordId][right.fromStartPos - interlockHeight]
//                                print("right word:\(words[right.wordId]), interlock:\(rightInterlock)")
                                
                                let topWords = letterIndex.find3(words[right.id][right.start - interlockWidth])

                                for top in topWords {
                                    
                                    if (top.start == interlockWidth - 1 &&
                                        top.id != right.id &&
                                        top.id != bottom.id &&
                                        top.id > _left // This is the phrase that stops duplicates on a square
                                    ) {
                                        
                                        //print("top word:\(words[top.wordId])")
                                        
                                        let score = ScoreCalculator.topLeft(
                                            topRight: words2[top.id][top.start],
                                            bottomLeft: words2[bottom.id][bottom.start],
                                            bottomRight: words2[bottom.id][bottom.start + interlockWidth])
                                        
                                        if score >= scoreMin {

                                            let width = CalculateWidthIndented(
                                                letterPos: bottom.start,
                                                wordLength: lengths[bottom.id],
                                                indentedWordLength: lengths[top.id])
                                            
                                            let height = CalculateWidthIndented(
                                                letterPos: right.start - interlockWidth,
                                                wordLength: lengths[right.id],
                                                indentedWordLength: lengths[_left])

                                            if (width <= widthMax && height <= heightMax) ||
                                                (width <= heightMax && height <= widthMax) {
                                                
                                                let donut = RectangleModel(
                                                    score: score,
                                                    width: width,
                                                    height: height,
                                                    top: top.id,
                                                    topLetterPos: top.start,
                                                    topLength: lengths[top.id],
                                                    bottom: bottom.id,
                                                    bottomLetterPos: bottom.start,
                                                    bottomLength: lengths[bottom.id],
                                                    left: _left,
                                                    leftLetterPos: _leftLetterPos,
                                                    leftLength: lengths[_left],
                                                    right: right.id,
                                                    rightLetterPos: right.start - interlockWidth,
                                                    rightLength: lengths[right.id],
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
    
    public static func TopRightSquare(interlockWidth: Int, letterIndex: LetterIndexModel, words: [[Int]], words2: [String], lengths: [Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [RectangleModel] {
        
        /// The square is exactly same as rectangle because when it is flipped it becomes another shape?
        return TopRightRectangle(interlockWidth: interlockWidth, interlockHeight: interlockWidth, letterIndex: letterIndex, words: words, words2: words2, lengths: lengths, scoreMin: scoreMin, widthMax: widthMax, heightMax: heightMax)
    }
    
    public static func TopRightRectangle(interlockWidth: Int, interlockHeight: Int, letterIndex: LetterIndexModel, words: [[Int]], words2: [String], lengths: [Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [RectangleModel] {
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

                
                let leftWords = letterIndex.find3(words[_top][_topLetterPos])
                
                for left in leftWords {
                    
                    if (left.end >= interlockHeight &&
                        left.id != _top) {
                        
//                        let leftInterlock = words[left.wordId][left.fromStartPos + interlockHeight]
//                        print("left word:\(words[left.wordId]), interlock:\(leftInterlock)")
                    
                        let bottomWords = letterIndex.find3(words[left.id][left.start + interlockHeight])
                        
                        for bottom in bottomWords {
                        
                            if (bottom.end >= interlockWidth &&
                                bottom.id != left.id &&
                                bottom.id != _top) {
                                
//                                let bottomInterlock = words[bottom.wordId][bottom.fromStartPos + interlockWidth]
//                                print("Bottom word:\(words[bottom.wordId]), interlock:\(bottomInterlock)")
                        
                                let rightWords = letterIndex.find3(words[bottom.id][bottom.start + interlockWidth])

                                for right in rightWords {

                                    if (right.start == interlockHeight - 1 &&
                                        right.id != bottom.id &&
                                        right.id != left.id &&
                                        right.id != _top) {
                                        
                                        //print("right word: \(words[right.wordId])")
                                      
                                        let score = ScoreCalculator.topRight(
                                                topLeft: words2[_top][_topLetterPos],
                                                bottomLeft: words2[bottom.id][bottom.start],
                                                bottomRight: words2[bottom.id][bottom.start + interlockWidth])

                                        if score >= scoreMin {

                                            let width = CalculateWidth(
                                                topLength: lengths[_top],
                                                bottomLength: lengths[bottom.id],
                                                topLetterPos: _topLetterPos,
                                                bottomLetterPos: bottom.start)
                                            
                                            let height = CalculateWidthIndented(
                                                letterPos: left.start,
                                                wordLength: lengths[left.id],
                                                indentedWordLength: lengths[right.id])

                                            if (width <= widthMax && height <= heightMax) ||
                                                (width <= heightMax && height <= widthMax) {
                                                
                                                let donut = RectangleModel(
                                                    score: score,
                                                    width: width,
                                                    height: height,
                                                    top: _top,
                                                    topLetterPos: _topLetterPos,
                                                    topLength: lengths[_top],
                                                    bottom: bottom.id,
                                                    bottomLetterPos: bottom.start,
                                                    bottomLength: lengths[bottom.id],
                                                    left: left.id,
                                                    leftLetterPos: left.start,
                                                    leftLength: lengths[left.id],
                                                    right: right.id,
                                                    rightLetterPos: right.start,
                                                    rightLength: lengths[right.id],
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
    
    
    public static func BottomRightRectangle(interlockWidth: Int, interlockHeight: Int, letterIndex: LetterIndexModel, words: [[Int]], words2: [String], lengths: [Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [RectangleModel] {
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
                 
                let topWords = letterIndex.find3(words[_right][_rightLetterPos])
                
                for top in topWords {
//                    print("top word: \(words[top.wordId])")
                    if (top.start >= interlockWidth &&
                        top.id != _right) {
                        
//                        let topInterlock = words[top.wordId][top.fromStartPos - interlockWidth]
//                        print("top word: \(words[top.wordId]), interlock:\(topInterlock)")

                        let leftWords = letterIndex.find3(words[top.id][top.start - interlockWidth])
                        
                        for left in leftWords {
//                            print("left word: \(words[left.wordId])")
                            if (left.end >= interlockHeight &&
                                left.id != top.id &&
                                left.id != _right) {
                                
//                                let leftInterlock = words[left.wordId][left.fromStartPos + interlockHeight]
//                                print("left word:\(words[left.wordId]), interlock:\(leftInterlock)")

                            
                                let bottomWords = letterIndex.find3(words[left.id][left.start + interlockHeight])
                                
                                for bottom in bottomWords {
                                    
//                                    print("bottom word:\(words[bottom.wordId])")
                                    if (bottom.end == interlockWidth - 1 &&
                                        bottom.id != left.id &&
                                        bottom.id != top.id &&
                                        bottom.id != _right) {
                                    
                                        let score = ScoreCalculator.bottomRight(
                                            topLeft: words2[left.id][left.start],
                                            topRight: words2[top.id][top.start],
                                            bottomLeft: words2[bottom.id][bottom.start])

                                        if score >= scoreMin {

                                            let width = CalculateWidth(
                                                topLength: lengths[top.id],
                                                bottomLength: lengths[bottom.id],
                                                topLetterPos: top.start - interlockWidth,
                                                bottomLetterPos: bottom.start)
                                            
                                            let height = CalculateWidth(
                                                topLength: lengths[left.id],
                                                bottomLength: lengths[_right],
                                                topLetterPos: left.start,
                                                bottomLetterPos: _rightLetterPos)

                                            if (width <= widthMax && height <= heightMax) ||
                                                (width <= heightMax && height <= widthMax) {
                                                
                                                let donut = RectangleModel(
                                                    score: score,
                                                    width: width,
                                                    height: height,
                                                    top: top.id,
                                                    topLetterPos: top.start - interlockWidth,
                                                    topLength: lengths[top.id],
                                                    bottom: bottom.id,
                                                    bottomLetterPos: bottom.start,
                                                    bottomLength: lengths[bottom.id],
                                                    left: left.id,
                                                    leftLetterPos: left.start,
                                                    leftLength: lengths[left.id],
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
    
    public static func BottomRightSquare(interlockWidth: Int, letterIndex: LetterIndexModel, words: [[Int]], words2: [String], lengths: [Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [RectangleModel] {
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
                 
                let topWords = letterIndex.find3(words[_right][_rightLetterPos])
                
                for top in topWords {
//                    print("top word: \(words[top.wordId])")
                    if (top.start >= interlockWidth &&
                        top.id != _right) {
                        
//                        let topInterlock = words[top.wordId][top.fromStartPos - interlockWidth]
//                        print("top word: \(words[top.wordId]), interlock:\(topInterlock)")

                        let leftWords = letterIndex.find3(words[top.id][top.start - interlockWidth])
                        
                        for left in leftWords {
//                            print("left word: \(words[left.wordId])")
                            if (left.end >= interlockWidth &&
                                left.id > top.id &&
                                left.id != _right
                            ) {
                                
//                                let leftInterlock = words[left.wordId][left.fromStartPos + interlockHeight]
//                                print("left word:\(words[left.wordId]), interlock:\(leftInterlock)")

                            
                                let bottomWords = letterIndex.find3(words[left.id][left.start + interlockWidth])
                                
                                for bottom in bottomWords {
                                    
//                                    print("bottom word:\(words[bottom.wordId])")
                                    if (bottom.end == interlockWidth - 1 &&
                                        bottom.id != left.id &&
                                        bottom.id != top.id &&
                                        bottom.id != _right) {
                                    
                                        let score = ScoreCalculator.bottomRight(
                                            topLeft: words2[left.id][left.start],
                                            topRight: words2[top.id][top.start],
                                            bottomLeft: words2[bottom.id][bottom.start])

                                        if score >= scoreMin {

                                            let width = CalculateWidth(
                                                topLength: lengths[top.id],
                                                bottomLength: lengths[bottom.id],
                                                topLetterPos: top.start - interlockWidth,
                                                bottomLetterPos: bottom.start)
                                            
                                            let height = CalculateWidth(
                                                topLength: lengths[left.id],
                                                bottomLength: lengths[_right],
                                                topLetterPos: left.start,
                                                bottomLetterPos: _rightLetterPos)

                                            if (width <= widthMax && height <= heightMax) ||
                                                (width <= heightMax && height <= widthMax) {
                                                
                                                let donut = RectangleModel(
                                                    score: score,
                                                    width: width,
                                                    height: height,
                                                    top: top.id,
                                                    topLetterPos: top.start - interlockWidth,
                                                    topLength: lengths[top.id],
                                                    bottom: bottom.id,
                                                    bottomLetterPos: bottom.start,
                                                    bottomLength: lengths[bottom.id],
                                                    left: left.id,
                                                    leftLetterPos: left.start,
                                                    leftLength: lengths[left.id],
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
    
    
    public static func BottomLeftRectangle(interlockWidth: Int, interlockHeight: Int, letterIndex: LetterIndexModel, words: [[Int]], words2: [String], lengths: [Int], scoreMin: Int, widthMax: Int, heightMax: Int) -> [RectangleModel] {
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

        if (interlockHeight <= interlockWidth) {
            return result;
        }
        
        let wordCount = words.count

        for _bottom in 0..<wordCount {
            
            if lengths[_bottom] >= interlockWidth {
                
                let _bottomLetterPos = interlockWidth - 1
        
                //print("bottom word:\(words[_bottom]), interlock:\(words[_bottom][_bottomLetterPos])")
                
                let rightWords = letterIndex.find3(words[_bottom][_bottomLetterPos])
                
                for right in rightWords {
            
                    if (right.start >= interlockHeight &&
                        right.id != _bottom) {
            
                        //print("right word:\(words[right.id]), interlock:\(words[right.id][right.start - interlockHeight])")

                        let topWords = letterIndex.find3(words[right.id][right.start - interlockHeight])
                        
                        for top in topWords {
                            
                            if (top.start >= interlockWidth &&
                                top.id != right.id &&
                                top.id != _bottom) {
                                
                                //print("top word:\(words[top.id]), interlock:\(words[top.id][top.start - interlockWidth])")

                                let leftWords = letterIndex.find3(words[top.id][top.start - interlockWidth])
                                
                                for left in leftWords {
                                    
                                    if (left.end == interlockHeight - 1 &&
                                        left.id != top.id &&
                                        left.id != right.id &&
                                        left.id != _bottom) {
                                        
                                        //print("left word:\(words[left.id])")

                                        let score = ScoreCalculator.bottomRight(
                                            topLeft: words2[top.id][top.start - interlockWidth],
                                            topRight: words2[top.id][top.start],
                                            bottomLeft: words2[_bottom][_bottomLetterPos])

                                        if score >= scoreMin {
                                            
                                            let width = CalculateWidthIndented(
                                                letterPos: top.start - interlockWidth,
                                                wordLength: lengths[top.id],
                                                indentedWordLength: lengths[_bottom])
                                            
                                            let height = CalculateWidth(
                                                topLength: lengths[left.id],
                                                bottomLength: lengths[right.id],
                                                topLetterPos: left.start,
                                                bottomLetterPos: right.start - interlockHeight)
                                            
                                            
                                            if (width <= widthMax && height <= heightMax) || (width <= heightMax && height <= widthMax) {
                                                
                                                let donut = RectangleModel(
                                                    score: score,
                                                    width: width,
                                                    height: height,
                                                    top: top.id,
                                                    topLetterPos: top.start - interlockWidth,
                                                    topLength: lengths[top.id],
                                                    bottom: _bottom,
                                                    bottomLetterPos: _bottomLetterPos,
                                                    bottomLength: lengths[_bottom],
                                                    left: left.id,
                                                    leftLetterPos: left.start,
                                                    leftLength: lengths[left.id],
                                                    right: right.id,
                                                    rightLetterPos: right.start - interlockHeight,
                                                    rightLength: lengths[right.id],
                                                    interlockWidth: interlockWidth,
                                                    interlockHeight: interlockHeight,
                                                    type: .bottomLeft)
                                                
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
    
    
    public static func Execute(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int) async -> [RectangleModel] {
            
        let lengths = WordCalculator.lengths(words: words)
        
        let letterIndex = LetterIndexModel(words: words)
        
        let wordsInt = WordCalculator.WordsToInt(words: words)
            
        async let d3x3 = Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        async let d3x4 = Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        async let d3x5 = Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        async let d3x6 = Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let d4x4 = Square(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        async let d4x5 = Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        async let d4x6 = Rectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let d5x5 = Square(
            interlockWidth: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        async let d5x6 = Rectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let d6x6 = Square(
            interlockWidth: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        async let o3x3_BottomRight = BottomRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o3x3_TopLeft = TopLeftSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
              
        async let o3x3_TopRight = TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        async let o3x4_BottomLeft = BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o3x4_BottomRight = BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
                     
        async let o3x4_TopLeft = TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        async let o3x4_TopRight = TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)

        async let o3x5_BottomLeft = BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        async let o3x5_BottomRight = BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o3x5_TopLeft = TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
                       
        async let o3x5_TopRight = TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)

        async let o3x6_BottomLeft = BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o3x6_BottomRight = BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)

        async let o3x6_TopLeft = TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        async let o3x6_TopRight = TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o4x4_BottomRight = BottomRightSquare(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o4x4_TopLeft = TopLeftSquare(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o4x4_TopRight = TopRightSquare(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o4x5_BottomLeft = BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o4x5_BottomRight = BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o4x5_TopLeft = TopLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)

        async let o4x5_TopRight = TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)

        async let o4x6_BottomLeft = BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o4x6_BottomRight = BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)

        async let o4x6_TopLeft = TopLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o4x6_TopRight = TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o5x5_BottomRight = BottomRightSquare(
            interlockWidth: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o5x5_TopLeft = TopLeftSquare(
            interlockWidth: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o5x5_TopRight = TopRightSquare(
            interlockWidth: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o5x6_BottomLeft = BottomLeftRectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o5x6_BottomRight = BottomRightRectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o5x6_TopLeft = TopLeftRectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o5x6_TopRight = TopRightRectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o6x6_BottomRight = BottomRightSquare(
            interlockWidth: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o6x6_TopLeft = TopLeftSquare(
            interlockWidth: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        async let o6x6_TopRight = TopRightSquare(
            interlockWidth: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
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
        
        let wordsInt = WordCalculator.WordsToInt(words: words)
        
        let d3x3 = Square(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("d3x3 \(d3x3.count)")
            
        let d3x4 = Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        print("d3x4 \(d3x4.count)")
        
        let d3x5 = Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        print("d3x5 \(d3x5.count)")
        
        let d3x6 = Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("d3x6 \(d3x6.count)")
        
        let d4x4 = Square(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        print("d4x4 \(d4x4.count)")
        
        let d4x5 = Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        print("d4x5 \(d4x5.count)")
        
        let d4x6 = Rectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("d4x6 \(d4x6.count)")
        
        let d5x5 = Square(
            interlockWidth: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        print("d5x5 \(d5x5.count)")
        
        let d5x6 = Rectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("d5x6 \(d5x6.count)")
        
        let d6x6 = Square(
            interlockWidth: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        print("d6x6 \(d6x6.count)")
        
        let o3x3_BottomRight = BottomRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o3x3_BottomRight \(o3x3_BottomRight.count)")
        
        let o3x3_TopLeft = TopLeftSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o3x3_TopLeft \(o3x3_TopLeft.count)")
        
        let o3x3_TopRight = TopRightSquare(
            interlockWidth: 2,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        print("o3x3_TopRight \(o3x3_TopRight.count)")
        
        let o3x4_BottomLeft = BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o3x4_BottomLeft \(o3x4_BottomLeft.count)")
        
        let o3x4_BottomRight = BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
                     
        print("o3x4_BottomRight \(o3x4_BottomRight.count)")
        
        let o3x4_TopLeft = TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        print("o3x4_TopLeft \(o3x4_TopLeft.count)")
        
        let o3x4_TopRight = TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)

        print("o3x4_TopRight \(o3x4_TopRight.count)")
        
        let o3x5_BottomLeft = BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        print("o3x5_BottomLeft \(o3x5_BottomLeft.count)")
        
        let o3x5_BottomRight = BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o3x5_BottomRight \(o3x5_BottomRight.count)")
        
        let o3x5_TopLeft = TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
                       
        print("o3x5_TopLeft \(o3x5_TopLeft.count)")
        
        let o3x5_TopRight = TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)

        print("o3x5_TopRight \(o3x5_TopRight.count)")
        
        let o3x6_BottomLeft = BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o3x6_BottomLeft \(o3x6_BottomLeft.count)")
        
        let o3x6_BottomRight = BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o3x6_BottomRight \(o3x6_BottomRight.count)")

        let o3x6_TopLeft = TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
        print("o3x6_TopLeft \(o3x6_TopLeft.count)")
        
        let o3x6_TopRight = TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o3x6_TopRight \(o3x6_TopRight.count)")
        
        let o4x4_BottomRight = BottomRightSquare(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o4x4_BottomRight \(o4x4_BottomRight.count)")
        
        let o4x4_TopLeft = TopLeftSquare(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o4x4_TopLeft \(o4x4_TopLeft.count)")
        
        let o4x4_TopRight = TopRightSquare(
            interlockWidth: 3,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o4x4_TopRight \(o4x4_TopRight.count)")
        
        let o4x5_BottomLeft = BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o4x5_BottomLeft \(o4x5_BottomLeft.count)")
        
        let o4x5_BottomRight = BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o4x5_BottomRight \(o4x5_BottomRight.count)")
        
        let o4x5_TopLeft = TopLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)

        print("o4x5_TopLeft \(o4x5_TopLeft.count)")
        
        let o4x5_TopRight = TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)

        print("o4x5_TopRight \(o4x5_TopRight.count)")
        
        let o4x6_BottomLeft = BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o4x6_BottomLeft \(o4x6_BottomLeft.count)")
        
        let o4x6_BottomRight = BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)

        print("o4x6_BottomRight \(o4x6_BottomRight.count)")
        
        let o4x6_TopLeft = TopLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o4x6_TopLeft \(o4x6_TopLeft.count)")
        
        let o4x6_TopRight = TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o4x6_TopRight \(o4x6_TopRight.count)")
        
        let o5x5_BottomRight = BottomRightSquare(
            interlockWidth: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o5x5_BottomRight \(o5x5_BottomRight.count)")
        
        let o5x5_TopLeft = TopLeftSquare(
            interlockWidth: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o5x5_TopLeft \(o5x5_TopLeft.count)")
        
        let o5x5_TopRight = TopRightSquare(
            interlockWidth: 4,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o5x5_TopRight \(o5x5_TopRight.count)")
        
        let o5x6_BottomLeft = BottomLeftRectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o5x6_BottomLeft \(o5x6_BottomLeft.count)")
        
        let o5x6_BottomRight = BottomRightRectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o5x6_BottomRight \(o5x6_BottomRight.count)")
        
        let o5x6_TopLeft = TopLeftRectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o5x6_TopLeft \(o5x6_TopLeft.count)")
        
        let o5x6_TopRight = TopRightRectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o5x6_TopRight \(o5x6_TopRight.count)")
        
        let o6x6_BottomRight = BottomRightSquare(
            interlockWidth: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o6x6_BottomRight \(o6x6_BottomRight.count)")
        
        let o6x6_TopLeft = TopLeftSquare(
            interlockWidth: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
            lengths: lengths,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        print("o6x6_TopLeft \(o6x6_TopLeft.count)")
        
        let o6x6_TopRight = TopRightSquare(
            interlockWidth: 5,
            letterIndex: letterIndex,
            words: wordsInt,
            words2: words,
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
