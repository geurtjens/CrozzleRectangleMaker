//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 17/5/2023.
//

import Foundation
public struct RectangleCalculator {
    
    public static func Execute(words: [String], widthMax: Int, heightMax: Int, scoreMin: Int) -> SquareResult {
            
        let lengths = RectangleCalculator.WordListToLengths(words: words)
            
        let d3x3 = Square(
            interlockWidth: 2,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        let d3x4 = Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        let d3x5 = RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        let d3x6 = RectangleCalculator.Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        let d4x4 = RectangleCalculator.Square(
            interlockWidth: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        let d4x5 = RectangleCalculator.Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        let d4x6 = RectangleCalculator.Rectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        let d5x5 = RectangleCalculator.Square(
            interlockWidth: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        let d5x6 = RectangleCalculator.Rectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        let d6x6 = RectangleCalculator.Square(
            interlockWidth: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        let o3x3_TopLeft = RectangleCalculator.TopLeftSquare(
            interlockWidth: 2,
            interlockHeight: 2,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
          
        let o3x3_TopRight = RectangleCalculator.TopRightSquare(
            interlockWidth: 2,
            interlockHeight: 2,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        let o3x3_BottomRight = RectangleCalculator.BottomRightSquare(
            interlockWidth: 2,
            interlockHeight: 2,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
                     
        let o3x4_TopLeft = RectangleCalculator.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        let o3x4_TopRight = RectangleCalculator.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        let o3x4_BottomRight = RectangleCalculator.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        let o3x5_TopLeft = RectangleCalculator.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
                       
        let o3x5_TopRight = RectangleCalculator.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        let o3x5_BottomRight = RectangleCalculator.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        let o3x6_TopLeft = RectangleCalculator.TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        let o3x6_TopRight = RectangleCalculator.TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        let o3x6_BottomRight = RectangleCalculator.BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        let o4x4_TopLeft = RectangleCalculator.TopLeftSquare(
            interlockWidth: 3,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        let o4x4_TopRight = RectangleCalculator.TopRightSquare(
            interlockWidth: 3,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        let o4x4_BottomRight = RectangleCalculator.BottomRightSquare(
            interlockWidth: 3,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        let o4x5_TopLeft = RectangleCalculator.TopLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        let o4x5_TopRight = RectangleCalculator.TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        let o4x5_BottomRight = RectangleCalculator.BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        let o4x6_TopLeft = RectangleCalculator.TopLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        let o4x6_TopRight = RectangleCalculator.TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        let o4x6_BottomRight = RectangleCalculator.BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        let o5x5_TopLeft = RectangleCalculator.TopLeftSquare(
            interlockWidth: 4,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        let o5x5_TopRight = RectangleCalculator.TopRightSquare(
            interlockWidth: 4,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        let o5x5_BottomRight = RectangleCalculator.BottomRightSquare(
            interlockWidth: 4,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        let o5x6_TopLeft = RectangleCalculator.TopLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        let o5x6_TopRight = RectangleCalculator.TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        let o5x6_BottomRight = RectangleCalculator.BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        let o6x6_TopLeft = RectangleCalculator.TopLeftSquare(
            interlockWidth: 5,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        let o6x6_TopRight = RectangleCalculator.TopRightSquare(
            interlockWidth: 5,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        let o6x6_BottomRight = RectangleCalculator.BottomRightSquare(
            interlockWidth: 5,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        let result = SquareResult(
            d3x3: d3x3,
            d3x4: d3x4,
            d3x5: d3x5,
            d3x6: d3x6,
            d4x4: d4x4,
            d4x5: d4x5,
            d4x6: d4x6,
            d5x5: d5x5,
            d5x6: d5x6,
            d6x6: d6x6,
            o3x3_TopLeft: o3x3_TopLeft,
            o3x3_TopRight: o3x3_TopRight,
            o3x3_BottomRight: o3x3_BottomRight,
            o3x4_TopLeft: o3x4_TopLeft,
            o3x4_TopRight: o3x4_TopRight,
            o3x4_BottomRight: o3x4_BottomRight,
            o3x5_TopLeft: o3x5_TopLeft,
            o3x5_TopRight: o3x5_TopRight,
            o3x5_BottomRight: o3x5_BottomRight,
            o3x6_TopLeft: o3x6_TopLeft,
            o3x6_TopRight: o3x6_TopRight,
            o3x6_BottomRight: o3x6_BottomRight,
            o4x4_TopLeft: o4x4_TopLeft,
            o4x4_TopRight: o4x4_TopRight,
            o4x4_BottomRight: o4x4_BottomRight,
            o4x5_TopLeft: o4x5_TopLeft,
            o4x5_TopRight: o4x5_TopRight,
            o4x5_BottomRight: o4x5_BottomRight,
            o4x6_TopLeft: o4x6_TopLeft,
            o4x6_TopRight: o4x6_TopRight,
            o4x6_BottomRight: o4x6_BottomRight,
            o5x5_TopLeft: o5x5_TopLeft,
            o5x5_TopRight: o5x5_TopRight,
            o5x5_BottomRight: o5x5_BottomRight,
            o5x6_TopLeft: o5x6_TopLeft,
            o5x6_TopRight: o5x6_TopRight,
            o5x6_BottomRight: o5x6_BottomRight,
            o6x6_TopLeft: o6x6_TopLeft,
            o6x6_TopRight: o6x6_TopRight,
            o6x6_BottomRight: o6x6_BottomRight)
        
        return result
    }
    
    public static func CalculateWidthOrHeight(topLength: Int, bottomLength: Int, topLetterPos: Int, bottomLetterPos: Int, interlockWidth: Int) -> Int {
        var width = topLength;
        if (topLetterPos < bottomLetterPos) {
            width += bottomLetterPos - topLetterPos;
        }

        let topEnd = topLength - (topLetterPos + interlockWidth);
        let bottomEnd = bottomLength - (bottomLetterPos + interlockWidth);
        if (topEnd < bottomEnd) {
            width += bottomEnd - topEnd;
        }
        return width
    }

    public static func WordListToLengths(words: [String]) -> [Int] {
        var result: [Int] = []
        for word in words {
            result.append(word.count)
        }
        return result;
    }
    public static func Square(interlockWidth: Int, words: [String], lengths: [Int],  widthMax: Int, heightMax: Int, scoreMin: Int) -> [TopLeftBottomRightModel] {

        var result: [TopLeftBottomRightModel] = [];

        let wordCount = words.count;

        for _top in 0..<wordCount {
            
            if (lengths[_top] >= interlockWidth) {
                
                for _topLetterPos in 0..<(lengths[_top] - interlockWidth) {
                    
                    for _left in (_top + 1)..<wordCount {
                        
                        if lengths[_left] >= interlockWidth &&
                            _left != _top {
                            
                            for _leftLetterPos in 0..<(lengths[_left] - interlockWidth) {
                                
                                if words[_top][_topLetterPos] == words[_left][_leftLetterPos] {
                                    
                                    for _bottom in 0..<wordCount {
                                        
                                        if lengths[_bottom] >= interlockWidth && _bottom != _left && _bottom != _top {
                                            
                                            for _bottomLetterPos in 0..<(lengths[_bottom] - interlockWidth) {
                                               
                                                if words[_left][_leftLetterPos + interlockWidth] == words[_bottom][_bottomLetterPos] {
                                                
                                                    for _right in 0..<wordCount {
                                                        
                                                        if lengths[_right] >= interlockWidth && _right != _bottom && _right != _left && _right != _top {
                                                        
                                                            for _rightLetterPos in 0..<(lengths[_right] - interlockWidth) {
                                                                
                                                                if (words[_top][_topLetterPos + interlockWidth] == words[_right][_rightLetterPos] &&
                                                                    words[_bottom][_bottomLetterPos + interlockWidth] == words[_right][_rightLetterPos + interlockWidth])
                                                                {
                                                                   

                                                                    let score = ScoreCalculator.square(
                                                                        topLeft: words[_top][_topLetterPos],
                                                                        topRight: words[_top][_topLetterPos + interlockWidth],
                                                                        bottomLeft: words[_bottom][_bottomLetterPos],
                                                                        bottomRight: words[_bottom][_bottomLetterPos + interlockWidth])

                                                                    if (score >= scoreMin) {

                                                                        let width = CalculateWidthOrHeight(
                                                                            topLength: lengths[_top],
                                                                            bottomLength: lengths[_bottom],
                                                                            topLetterPos: _topLetterPos,
                                                                            bottomLetterPos: _bottomLetterPos,
                                                                            interlockWidth:interlockWidth)
                                                                        
                                                                        let height = CalculateWidthOrHeight(
                                                                            topLength: lengths[_left],
                                                                            bottomLength: lengths[_right],
                                                                            topLetterPos: _leftLetterPos,
                                                                            bottomLetterPos: _rightLetterPos,
                                                                            interlockWidth: interlockWidth);
                                                                        
                                                                        if (width <= widthMax && height <= heightMax) ||
                                                                            (width <= heightMax && height <= widthMax) {
                                                                            
                                                                            let donut = TopLeftBottomRightModel(
                                                                                score:score,
                                                                                width:width,
                                                                                height:height,
                                                                                top:_top,
                                                                                topLetterPos:_topLetterPos,
                                                                                bottom:_bottom,
                                                                                bottomLetterPos:_bottomLetterPos,
                                                                                left:_left,
                                                                                leftLetterPos:_leftLetterPos,
                                                                                right:_right,
                                                                                rightLetterPos:_rightLetterPos)

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
                        }
                    }
                }
            }
        }
        result.sort { $0.score > $1.score }
        
        return result;
    }
    public static func Rectangle(interlockWidth: Int, interlockHeight: Int, words: [String], lengths: [Int], widthMax: Int, heightMax: Int, scoreMin: Int) -> [TopLeftBottomRightModel] {

        var result: [TopLeftBottomRightModel] = [];

        if (interlockHeight <= interlockWidth) {
            return result;
        }
        
        let wordCount = words.count;
       
        for _top in 0..<wordCount {
        
            if (lengths[_top] >= interlockWidth) {
                
                for _topLetterPos in 0..<(lengths[_top] - interlockWidth) {
                
                    for _left in 0..<wordCount {
                    
                        if lengths[_left] >= interlockHeight && _left != _top {
                        
                            for _leftLetterPos in 0..<(lengths[_left] - interlockHeight) {
                                
                                if (words[_top][_topLetterPos] == words[_left][_leftLetterPos]) {
                                    
                                    for _bottom in 0..<wordCount {
                                        
                                        if lengths[_bottom] >= interlockWidth && _bottom != _left && _bottom != _top {
                                            
                                            for _bottomLetterPos in 0..<(lengths[_bottom] - interlockWidth) {
                                                
                                                if (words[_left][_leftLetterPos + interlockHeight] == words[_bottom][_bottomLetterPos])
                                                {
                                                    for _right in 0..<wordCount {
                                                        
                                                        if lengths[_right] >= interlockHeight && _right != _bottom && _right != _left && _right != _top {
                                                            
                                                            for _rightLetterPos in 0..<(lengths[_right] - interlockHeight) {
                                                                
                                                                if (words[_top][_topLetterPos + interlockWidth] == words[_right][_rightLetterPos] &&
                                                                    words[_bottom][_bottomLetterPos + interlockWidth] == words[_right][_rightLetterPos + interlockHeight])
                                                                {
                                                                   

                                                                    let score = ScoreCalculator.square(
                                                                        topLeft: words[_top][_topLetterPos],
                                                                        topRight: words[_top][_topLetterPos + interlockWidth],
                                                                        bottomLeft: words[_bottom][_bottomLetterPos],
                                                                        bottomRight: words[_bottom][_bottomLetterPos + interlockWidth])

                                                                    if (score >= scoreMin) {

                                                                        let width = CalculateWidthOrHeight(
                                                                            topLength: lengths[_top],
                                                                            bottomLength: lengths[_bottom],
                                                                            topLetterPos: _topLetterPos,
                                                                            bottomLetterPos: _bottomLetterPos,
                                                                            interlockWidth:interlockWidth)
                                                                        
                                                                        let height = CalculateWidthOrHeight(
                                                                            topLength: lengths[_left],
                                                                            bottomLength: lengths[_right],
                                                                            topLetterPos: _leftLetterPos,
                                                                            bottomLetterPos: _rightLetterPos,
                                                                            interlockWidth: interlockWidth);
                                                                        
                                                                        if (width <= widthMax && height <= heightMax) ||
                                                                            (width <= heightMax && height <= widthMax) {
                                                                            
                                                                            let donut = TopLeftBottomRightModel(
                                                                                score:score,
                                                                                width:width,
                                                                                height:height,
                                                                                top:_top,
                                                                                topLetterPos:_topLetterPos,
                                                                                bottom:_bottom,
                                                                                bottomLetterPos:_bottomLetterPos,
                                                                                left:_left,
                                                                                leftLetterPos:_leftLetterPos,
                                                                                right:_right,
                                                                                rightLetterPos:_rightLetterPos)

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
                        }
                    }
                }
            }
        }
        result.sort { $0.score > $1.score }
        
        return result;
    }
    
    public static func TopLeftRectangle(interlockWidth: Int, interlockHeight: Int, words: [String], lengths: [Int], widthMax: Int, heightMax: Int, scoreMin: Int) -> [TopLeftBottomRightModel] {
    
        /*
              .AZURE
              S I
        DECORATIONS
              A N
              R
    */

        

        var result: [TopLeftBottomRightModel] = [];

        if (interlockHeight <= interlockWidth) {
            return result;
        }
        
        let wordCount = words.count
        
        for _left in 0..<wordCount {
        
            if (lengths[_left] >= interlockHeight)
            {
                let _leftLetterPos = interlockHeight - 1

                for _bottom in 0..<wordCount {
                
                    if lengths[_bottom] >= interlockWidth && _bottom != _left {

                        for _bottomLetterPos in 0..<(lengths[_bottom] - interlockWidth) {
                            
                            if words[_left][_leftLetterPos] == words[_bottom][_bottomLetterPos] {
                            
                                for _right in 0..<wordCount {
                                    
                                    if lengths[_right] >= interlockHeight && _right != _bottom && _right != _left {
                                    
                                        for _rightLetterPos in 0..<(lengths[_right] - interlockHeight) {
                                            
                                            if words[_bottom][_bottomLetterPos + interlockWidth] == words[_right][_rightLetterPos + interlockHeight] {
                                            
                                                for _top in 0..<wordCount {
                                                    
                                                    if lengths[_top] >= interlockWidth - 1 && _top != _bottom && _top != _left && _top != _right {
                                                    
                                                        let _topLetterPos = interlockWidth - 1

                                                        if (words[_top][_topLetterPos] == words[_right][_rightLetterPos])
                                                        {
                                                            let score = ScoreCalculator.openTopLeft(
                                                                topRight: words[_top][_topLetterPos],
                                                                bottomLeft: words[_bottom][_bottomLetterPos],
                                                                bottomRight: words[_bottom][_bottomLetterPos + interlockWidth])
                                                            
                                                            if score >= scoreMin {

                                                                var width = lengths[_bottom];
                                                                let _topRight = lengths[_top] - (_topLetterPos + interlockWidth - 1);
                                                                let _bottomRight = lengths[_bottom] - (_bottomLetterPos + interlockWidth + 1);
                                                                if (_topRight > _bottomRight) {
                                                                    width += _topRight - _bottomRight;
                                                                }

                                                                var height = lengths[_right]
                                                                let _leftBottom = lengths[_left] - _leftLetterPos - 1;
                                                                let _rightBottom = lengths[_right] - (_rightLetterPos + interlockWidth) - 1;
                                                                if (_leftBottom > _rightBottom) {
                                                                    height += _leftBottom - _rightBottom;
                                                                }

                                                                if (width <= widthMax && height <= heightMax) ||
                                                                    (width <= heightMax && height <= widthMax) {
                                                                    
                                                                    let donut = TopLeftBottomRightModel(
                                                                        score:score,
                                                                        width:width,
                                                                        height:height,
                                                                        top:_top,
                                                                        topLetterPos:_topLetterPos,
                                                                        bottom:_bottom,
                                                                        bottomLetterPos:_bottomLetterPos,
                                                                        left:_left,
                                                                        leftLetterPos:_leftLetterPos,
                                                                        right:_right,
                                                                        rightLetterPos:_rightLetterPos)

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
                }
            }
        }

        result.sort { $0.score > $1.score }
        
        return result;
    }
    
    public static func TopLeftSquare(interlockWidth: Int, interlockHeight: Int, words: [String], lengths: [Int], widthMax: Int, heightMax: Int, scoreMin: Int) -> [TopLeftBottomRightModel] {
    
        /*
              .AZURE
              S I
        DECORATIONS
              A N
              R
    */

        

        var result: [TopLeftBottomRightModel] = [];

        if (interlockHeight != interlockWidth) {
            return result;
        }
        
        let wordCount = words.count
        
        for _left in 0..<wordCount {
        
            if (lengths[_left] >= interlockHeight)
            {
                let _leftLetterPos = interlockHeight - 1

                for _bottom in 0..<wordCount {
                
                    if lengths[_bottom] >= interlockWidth && _bottom != _left {

                        for _bottomLetterPos in 0..<(lengths[_bottom] - interlockWidth) {
                            
                            if words[_left][_leftLetterPos] == words[_bottom][_bottomLetterPos] {
                            
                                for _right in 0..<wordCount {
                                    
                                    if lengths[_right] >= interlockHeight && _right != _bottom && _right != _left {
                                    
                                        for _rightLetterPos in 0..<(lengths[_right] - interlockHeight) {
                                            
                                            if words[_bottom][_bottomLetterPos + interlockWidth] == words[_right][_rightLetterPos + interlockHeight] {
                                            
                                                for _top in (_left+1)..<wordCount {
                                                    
                                                    if lengths[_top] >= interlockWidth && _top != _bottom && _top != _left && _top != _right {
                                                    
                                                        let _topLetterPos = interlockWidth - 1

                                                        if (words[_top][_topLetterPos] == words[_right][_rightLetterPos])
                                                        {
                                                            let score = ScoreCalculator.openTopLeft(
                                                                
                                                                topRight: words[_top][_topLetterPos],
                                                                bottomLeft: words[_bottom][_bottomLetterPos],
                                                                bottomRight: words[_bottom][_bottomLetterPos + interlockWidth])
                                                            
                                                            if (score >= scoreMin)
                                                            {

                                                                var width = lengths[_bottom];
                                                                let _topRight = lengths[_top] - (_topLetterPos + interlockWidth - 1);
                                                                let _bottomRight = lengths[_bottom] - (_bottomLetterPos + interlockWidth + 1);
                                                                if (_topRight > _bottomRight) {
                                                                    width += _topRight - _bottomRight;
                                                                }

                                                                var height = lengths[_right]
                                                                let _leftBottom = lengths[_left] - _leftLetterPos - 1;
                                                                let _rightBottom = lengths[_right] - (_rightLetterPos + interlockWidth) - 1;
                                                                if (_leftBottom > _rightBottom) {
                                                                    height += _leftBottom - _rightBottom;
                                                                }

                                                                if (width <= widthMax && height <= heightMax) ||
                                                                    (width <= heightMax && height <= widthMax) {
                                                                    
                                                                    let donut = TopLeftBottomRightModel(
                                                                        score:score,
                                                                        width:width,
                                                                        height:height,
                                                                        top:_top,
                                                                        topLetterPos:_topLetterPos,
                                                                        bottom:_bottom,
                                                                        bottomLetterPos:_bottomLetterPos,
                                                                        left:_left,
                                                                        leftLetterPos:_leftLetterPos,
                                                                        right:_right,
                                                                        rightLetterPos:_rightLetterPos)

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
                }
            }
        }

        result.sort { $0.score > $1.score }
        
        return result;
    }
    
    public static func TopRightRectangle(interlockWidth: Int, interlockHeight: Int, words: [String], lengths: [Int], widthMax: Int, heightMax: Int, scoreMin: Int) -> [TopLeftBottomRightModel] {
    

        /*
           H
         TOYS.
           M A
           NAZARETH
             U
             R
             E
        */
        var result: [TopLeftBottomRightModel] = [];

        if (interlockHeight <= interlockWidth) {
            return result;
        }
        
        let wordCount = words.count

        for _top in 0..<wordCount {
        
            // Top word includes a . and so can be 1 character shorter than the interlock width
            if lengths[_top] >= interlockWidth{
            
                let _topLetterPos = lengths[_top] - interlockWidth

                for _left in 0..<wordCount {
                    
                    if lengths[_left] >= interlockHeight && _left != _top {
                    
                        for _leftLetterPos in 0..<(lengths[_left] - interlockHeight) {
                        
                            if words[_top][_topLetterPos] == words[_left][_leftLetterPos] {
                            
                                for _bottom in 0..<wordCount {
                                
                                    if lengths[_bottom] >= interlockWidth && _bottom != _left && _bottom != _top {
                                    
                                        for _bottomLetterPos in 0..<(lengths[_bottom] - interlockWidth) {
                                        
                                            if (words[_left][_leftLetterPos + interlockHeight] == words[_bottom][_bottomLetterPos])
                                            {
                                                for _right in 0..<wordCount {
                                                    
                                                    if lengths[_right] >= interlockHeight && _right != _bottom && _right != _left && _right != _top {
                                                    
                                                        let _rightLetterPos = interlockHeight - 1;

                                                        if (words[_bottom][_bottomLetterPos + interlockWidth] == words[_right][_rightLetterPos])
                                                        {
                                                            let score = ScoreCalculator.openTopRight(
                                                                topLeft: words[_top][_topLetterPos],
                                                                bottomLeft: words[_bottom][_bottomLetterPos],
                                                                bottomRight: words[_bottom][_bottomLetterPos + interlockWidth])

                                                            if score >= scoreMin {

                                                                var width = lengths[_bottom]
                                                                if (_topLetterPos > _bottomLetterPos) {
                                                                    width += _topLetterPos - _bottomLetterPos
                                                                }

                                                                var height = lengths[_left];
                                                                let _leftBottom = lengths[_left] - (_leftLetterPos + interlockWidth) - 1
                                                                let _rightBottom = lengths[_right] - _rightLetterPos - 1
                                                                if (_rightBottom > _leftBottom) {
                                                                    height += _rightBottom - _leftBottom
                                                                }

                                                                if (width <= widthMax && height <= heightMax) ||
                                                                    (width <= heightMax && height <= widthMax) {
                                                                    
                                                                    let donut = TopLeftBottomRightModel(
                                                                        score:score,
                                                                        width:width,
                                                                        height:height,
                                                                        top:_top,
                                                                        topLetterPos:_topLetterPos,
                                                                        bottom:_bottom,
                                                                        bottomLetterPos:_bottomLetterPos,
                                                                        left:_left,
                                                                        leftLetterPos:_leftLetterPos,
                                                                        right:_right,
                                                                        rightLetterPos:_rightLetterPos)

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
                }
            }
        }

        // sort by score
        result.sort { $0.score > $1.score }
        
        return result;
    }
    
    public static func TopRightSquare(interlockWidth: Int, interlockHeight: Int, words: [String], lengths: [Int], widthMax: Int, heightMax: Int, scoreMin: Int) -> [TopLeftBottomRightModel] {
    

        /*
           H
         TOYS.
           M A
           NAZARETH
             U
             R
             E
        */
        var result: [TopLeftBottomRightModel] = [];

        if (interlockHeight != interlockWidth) {
            return result;
        }
        
        let wordCount = words.count

        for _top in 0..<wordCount {
        
            // Top word includes a . and so can be 1 character shorter than the interlock width
            if lengths[_top] >= interlockWidth{
            
                let _topLetterPos = lengths[_top] - interlockWidth

                for _left in (_top+1)..<wordCount {
                    
                    if lengths[_left] >= interlockHeight && _left != _top {
                    
                        for _leftLetterPos in 0..<(lengths[_left] - interlockHeight) {
                        
                            if words[_top][_topLetterPos] == words[_left][_leftLetterPos] {
                            
                                for _bottom in 0..<wordCount {
                                
                                    if lengths[_bottom] >= interlockWidth && _bottom != _left && _bottom != _top {
                                    
                                        for _bottomLetterPos in 0..<(lengths[_bottom] - interlockWidth) {
                                        
                                            if (words[_left][_leftLetterPos + interlockHeight] == words[_bottom][_bottomLetterPos])
                                            {
                                                for _right in 0..<wordCount {
                                                    
                                                    if lengths[_right] >= interlockHeight && _right != _bottom && _right != _left && _right != _top {
                                                    
                                                        let _rightLetterPos = interlockHeight - 1;

                                                        if (words[_bottom][_bottomLetterPos + interlockWidth] == words[_right][_rightLetterPos])
                                                        {
                                                            let score = ScoreCalculator.openTopRight(
                                                                topLeft: words[_top][_topLetterPos],
                                                                bottomLeft: words[_bottom][_bottomLetterPos],
                                                                bottomRight: words[_bottom][_bottomLetterPos + interlockWidth])

                                                            if score >= scoreMin {

                                                                var width = lengths[_bottom]
                                                                if (_topLetterPos > _bottomLetterPos) {
                                                                    width += _topLetterPos - _bottomLetterPos
                                                                }

                                                                var height = lengths[_left];
                                                                let _leftBottom = lengths[_left] - (_leftLetterPos + interlockWidth) - 1
                                                                let _rightBottom = lengths[_right] - _rightLetterPos - 1
                                                                if (_rightBottom > _leftBottom) {
                                                                    height += _rightBottom - _leftBottom
                                                                }

                                                                if (width <= widthMax && height <= heightMax) ||
                                                                    (width <= heightMax && height <= widthMax) {
                                                                    
                                                                    let donut = TopLeftBottomRightModel(
                                                                        score:score,
                                                                        width:width,
                                                                        height:height,
                                                                        top:_top,
                                                                        topLetterPos:_topLetterPos,
                                                                        bottom:_bottom,
                                                                        bottomLetterPos:_bottomLetterPos,
                                                                        left:_left,
                                                                        leftLetterPos:_leftLetterPos,
                                                                        right:_right,
                                                                        rightLetterPos:_rightLetterPos)

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
                }
            }
        }

        // sort by score
        result.sort { $0.score > $1.score }
        
        return result;
    }
    
    public static func BottomRightRectangle(interlockWidth: Int, interlockHeight: Int, words: [String], lengths: [Int], widthMax: Int, heightMax: Int, scoreMin: Int) -> [TopLeftBottomRightModel] {

        /*
            T
          Z R
        WHITE
          O E
         INN.
    */

        var result: [TopLeftBottomRightModel] = [];

        if (interlockHeight <= interlockWidth) {
            return result;
        }
        
        let wordCount = words.count

        for _right in 0..<wordCount {
            
            if lengths[_right] >= interlockHeight {
            
                let _rightLetterPos = lengths[_right] - interlockHeight;

                for _top in 0..<wordCount {
                
                    if lengths[_top] >= interlockWidth && _top != _right {
                    
                        for _topLetterPos in 0..<(lengths[_top] - interlockWidth) {
                        
                            if words[_top][_topLetterPos + interlockWidth] == words[_right][_rightLetterPos] {
                            
                                for _left in 0..<wordCount {
                                    
                                    if lengths[_left] >= interlockHeight && _left != _top && _left != _right {
                                        
                                        for _leftLetterPos in 0..<(lengths[_left] - interlockHeight) {
                                        
                                            if words[_top][_topLetterPos] == words[_left][_leftLetterPos] {
                                            
                                                for _bottom in 0..<wordCount {
                                                    
                                                    if lengths[_bottom] >= interlockWidth && _bottom != _left && _bottom != _top && _bottom != _right
                                                    {
                                                        let _bottomLetterPos = lengths[_bottom] - interlockWidth
                                                        
                                                        if words[_left][_leftLetterPos + interlockWidth] == words[_bottom][_bottomLetterPos] {
                                                        
                                                            let score = ScoreCalculator.openBottomRight(
                                                                topLeft: words[_top][_topLetterPos],
                                                                topRight: words[_top][_topLetterPos + interlockWidth],
                                                                bottomLeft: words[_bottom][_bottomLetterPos])

                                                            if score >= scoreMin {

                                                                var width = lengths[_top];
                                                                if (_bottomLetterPos > _topLetterPos) {
                                                                    width += _bottomLetterPos - _topLetterPos;
                                                                }

                                                                var height = lengths[_left];
                                                                if (_rightLetterPos > _leftLetterPos) {
                                                                    height += _rightLetterPos - _leftLetterPos;
                                                                }

                                                                if (width <= widthMax && height <= heightMax) ||
                                                                    (width <= heightMax && height <= widthMax) {
                                                                    
                                                                    let donut = TopLeftBottomRightModel(
                                                                        score:score,
                                                                        width:width,
                                                                        height:height,
                                                                        top:_top,
                                                                        topLetterPos:_topLetterPos,
                                                                        bottom:_bottom,
                                                                        bottomLetterPos:_bottomLetterPos,
                                                                        left:_left,
                                                                        leftLetterPos:_leftLetterPos,
                                                                        right:_right,
                                                                        rightLetterPos:_rightLetterPos)

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
                }
            }
        }

        result.sort { $0.score > $1.score }
       
        return result;
    }
    
    public static func BottomRightSquare(interlockWidth: Int, interlockHeight: Int, words: [String], lengths: [Int], widthMax: Int, heightMax: Int, scoreMin: Int) -> [TopLeftBottomRightModel] {

        /*
            T
          Z R
        WHITE
          O E
         INN.
    */

        var result: [TopLeftBottomRightModel] = [];

        if (interlockHeight != interlockWidth) {
            return result;
        }
        
        let wordCount = words.count

        for _right in 0..<wordCount {
            
            if lengths[_right] >= interlockHeight {
            
                let _rightLetterPos = lengths[_right] - interlockHeight;

                for _top in 0..<wordCount {
                
                    if lengths[_top] >= interlockWidth && _top != _right {
                    
                        for _topLetterPos in 0..<(lengths[_top] - interlockWidth) {
                        
                            if words[_top][_topLetterPos + interlockWidth] == words[_right][_rightLetterPos] {
                            
                                for _left in (_top + 1)..<wordCount { // This one line is what makes a rectangle become a square so as to remove duplicates actually
                                    
                                    if lengths[_left] >= interlockHeight && _left != _top && _left != _right {
                                        
                                        for _leftLetterPos in 0..<(lengths[_left] - interlockHeight) {
                                        
                                            if words[_top][_topLetterPos] == words[_left][_leftLetterPos] {
                                            
                                                for _bottom in 0..<wordCount {
                                                    
                                                    if lengths[_bottom] >= interlockWidth && _bottom != _left && _bottom != _top && _bottom != _right
                                                    {
                                                        let _bottomLetterPos = lengths[_bottom] - interlockWidth
                                                        
                                                        if words[_left][_leftLetterPos + interlockWidth] == words[_bottom][_bottomLetterPos] {
                                                        
                                                            let score = ScoreCalculator.openBottomRight(
                                                                topLeft: words[_top][_topLetterPos],
                                                                topRight: words[_top][_topLetterPos + interlockWidth],
                                                                bottomLeft: words[_bottom][_bottomLetterPos])

                                                            if score >= scoreMin {

                                                                var width = lengths[_top];
                                                                if (_bottomLetterPos > _topLetterPos) {
                                                                    width += _bottomLetterPos - _topLetterPos;
                                                                }

                                                                var height = lengths[_left];
                                                                if (_rightLetterPos > _leftLetterPos) {
                                                                    height += _rightLetterPos - _leftLetterPos;
                                                                }

                                                                if (width <= widthMax && height <= heightMax) ||
                                                                    (width <= heightMax && height <= widthMax) {
                                                                    
                                                                    let donut = TopLeftBottomRightModel(
                                                                        score:score,
                                                                        width:width,
                                                                        height:height,
                                                                        top:_top,
                                                                        topLetterPos:_topLetterPos,
                                                                        bottom:_bottom,
                                                                        bottomLetterPos:_bottomLetterPos,
                                                                        left:_left,
                                                                        leftLetterPos:_leftLetterPos,
                                                                        right:_right,
                                                                        rightLetterPos:_rightLetterPos)

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
                }
            }
        }

        result.sort { $0.score > $1.score }
       
        return result;
    }
    
}
