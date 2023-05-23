//
//  RectangleCalculator.swift
//  
//
//  Created by Michael Geurtjens on 17/5/2023.
//

import Foundation
public struct RectangleCalculator {
    
    public static func ExecuteAndSortByScoreAndArea(words: [String], widthMax: Int, heightMax: Int, scoreMin: Int) async -> [RectangleModel]  {
        
        var shapes = await Execute(words: words, widthMax: widthMax, heightMax: heightMax, scoreMin: scoreMin)
        
        shapes.sort {
            if $0.score == $1.score {
                return $0.width * $0.height > $1.width * $1.height
            } else {
                return $0.score > $1.score
            }
        }
        return shapes
    }
    
    public static func Execute(words: [String], widthMax: Int, heightMax: Int, scoreMin: Int) async -> [RectangleModel] {
            
        let lengths = WordCalculator.lengths(words: words)
            
        async let d3x3 = Square(
            interlockWidth: 2,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        async let d3x4 = Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        async let d3x5 = Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        async let d3x6 = Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        async let d4x4 = Square(
            interlockWidth: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        async let d4x5 = Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        async let d4x6 = Rectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        async let d5x5 = Square(
            interlockWidth: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        async let d5x6 = Rectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        async let d6x6 = Square(
            interlockWidth: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        async let o3x3_BottomRight = BottomRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        async let o3x3_TopLeft = TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
              
        async let o3x3_TopRight = TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        async let o3x4_BottomLeft = BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        async let o3x4_BottomRight = BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
                     
        async let o3x4_TopLeft = TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        async let o3x4_TopRight = TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        async let o3x5_BottomLeft = BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        async let o3x5_BottomRight = BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        async let o3x5_TopLeft = TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
                       
        async let o3x5_TopRight = TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        async let o3x6_BottomLeft = BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        async let o3x6_BottomRight = BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        async let o3x6_TopLeft = TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        async let o3x6_TopRight = TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        async let o4x4_BottomRight = BottomRightSquare(
            interlockWidth: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        async let o4x4_TopLeft = TopLeftSquare(
            interlockWidth: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        async let o4x4_TopRight = TopRightSquare(
            interlockWidth: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        async let o4x5_BottomLeft = BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        async let o4x5_BottomRight = BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        async let o4x5_TopLeft = TopLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        async let o4x5_TopRight = TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        async let o4x6_BottomLeft = BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        async let o4x6_BottomRight = BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        async let o4x6_TopLeft = TopLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        async let o4x6_TopRight = TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        async let o5x5_BottomRight = BottomRightSquare(
            interlockWidth: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        async let o5x5_TopLeft = TopLeftSquare(
            interlockWidth: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        async let o5x5_TopRight = TopRightSquare(
            interlockWidth: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        async let o5x6_BottomLeft = BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        async let o5x6_BottomRight = RectangleCalculator.BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        async let o5x6_TopLeft = RectangleCalculator.TopLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        async let o5x6_TopRight = RectangleCalculator.TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        async let o6x6_BottomRight = RectangleCalculator.BottomRightSquare(
            interlockWidth: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        async let o6x6_TopLeft = RectangleCalculator.TopLeftSquare(
            interlockWidth: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        async let o6x6_TopRight = RectangleCalculator.TopRightSquare(
            interlockWidth: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
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
    
    
    public static func ExecuteSerial(words: [String], widthMax: Int, heightMax: Int, scoreMin: Int) -> [RectangleModel] {
            
        let lengths = WordCalculator.lengths(words: words)
            
        let d3x3 = Square(
            interlockWidth: 2,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("d3x3 \(d3x3.count)")
            
        let d3x4 = Rectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        print("d3x4 \(d3x4.count)")
        
        let d3x5 = Rectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        print("d3x5 \(d3x5.count)")
        
        let d3x6 = Rectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("d3x6 \(d3x6.count)")
        
        let d4x4 = Square(
            interlockWidth: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        print("d4x4 \(d4x4.count)")
        
        let d4x5 = Rectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        print("d4x5 \(d4x5.count)")
        
        let d4x6 = Rectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("d4x6 \(d4x6.count)")
        
        let d5x5 = Square(
            interlockWidth: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        print("d5x5 \(d5x5.count)")
        
        let d5x6 = Rectangle(
            interlockWidth: 4,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("d5x6 \(d5x6.count)")
        
        let d6x6 = Square(
            interlockWidth: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        print("d6x6 \(d6x6.count)")
        
        let o3x3_BottomRight = BottomRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("o3x3_BottomRight \(o3x3_BottomRight.count)")
        
        let o3x3_TopLeft = TopLeftSquare(
            interlockWidth: 2,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("o3x3_TopLeft \(o3x3_TopLeft.count)")
        
        let o3x3_TopRight = TopRightSquare(
            interlockWidth: 2,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        print("o3x3_TopRight \(o3x3_TopRight.count)")
        
        let o3x4_BottomLeft = BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("o3x4_BottomLeft \(o3x4_BottomLeft.count)")
        
        let o3x4_BottomRight = BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
                     
        print("o3x4_BottomRight \(o3x4_BottomRight.count)")
        
        let o3x4_TopLeft = TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        print("o3x4_TopLeft \(o3x4_TopLeft.count)")
        
        let o3x4_TopRight = TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        print("o3x4_TopRight \(o3x4_TopRight.count)")
        
        let o3x5_BottomLeft = BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        print("o3x5_BottomLeft \(o3x5_BottomLeft.count)")
        
        let o3x5_BottomRight = BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("o3x5_BottomRight \(o3x5_BottomRight.count)")
        
        let o3x5_TopLeft = TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
                       
        print("o3x5_TopLeft \(o3x5_TopLeft.count)")
        
        let o3x5_TopRight = TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        print("o3x5_TopRight \(o3x5_TopRight.count)")
        
        let o3x6_BottomLeft = BottomLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("o3x6_BottomLeft \(o3x6_BottomLeft.count)")
        
        let o3x6_BottomRight = BottomRightRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("o3x6_BottomRight \(o3x6_BottomRight.count)")

        let o3x6_TopLeft = TopLeftRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
            
        print("o3x6_TopLeft \(o3x6_TopLeft.count)")
        
        let o3x6_TopRight = TopRightRectangle(
            interlockWidth: 2,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("o3x6_TopRight \(o3x6_TopRight.count)")
        
        let o4x4_BottomRight = BottomRightSquare(
            interlockWidth: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("o4x4_BottomRight \(o4x4_BottomRight.count)")
        
        let o4x4_TopLeft = TopLeftSquare(
            interlockWidth: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("o4x4_TopLeft \(o4x4_TopLeft.count)")
        
        let o4x4_TopRight = TopRightSquare(
            interlockWidth: 3,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("o4x4_TopRight \(o4x4_TopRight.count)")
        
        let o4x5_BottomLeft = BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("o4x5_BottomLeft \(o4x5_BottomLeft.count)")
        
        let o4x5_BottomRight = BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("o4x5_BottomRight \(o4x5_BottomRight.count)")
        
        let o4x5_TopLeft = TopLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        print("o4x5_TopLeft \(o4x5_TopLeft.count)")
        
        let o4x5_TopRight = TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        print("o4x5_TopRight \(o4x5_TopRight.count)")
        
        let o4x6_BottomLeft = BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("o4x6_BottomLeft \(o4x6_BottomLeft.count)")
        
        let o4x6_BottomRight = BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)

        print("o4x6_BottomRight \(o4x6_BottomRight.count)")
        
        let o4x6_TopLeft = TopLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("o4x6_TopLeft \(o4x6_TopLeft.count)")
        
        let o4x6_TopRight = TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("o4x6_TopRight \(o4x6_TopRight.count)")
        
        let o5x5_BottomRight = BottomRightSquare(
            interlockWidth: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("o5x5_BottomRight \(o5x5_BottomRight.count)")
        
        let o5x5_TopLeft = TopLeftSquare(
            interlockWidth: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("o5x5_TopLeft \(o5x5_TopLeft.count)")
        
        let o5x5_TopRight = TopRightSquare(
            interlockWidth: 4,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("o5x5_TopRight \(o5x5_TopRight.count)")
        
        let o5x6_BottomLeft = BottomLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("o5x6_BottomLeft \(o5x6_BottomLeft.count)")
        
        let o5x6_BottomRight = RectangleCalculator.BottomRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("o5x6_BottomRight \(o5x6_BottomRight.count)")
        
        let o5x6_TopLeft = RectangleCalculator.TopLeftRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("o5x6_TopLeft \(o5x6_TopLeft.count)")
        
        let o5x6_TopRight = RectangleCalculator.TopRightRectangle(
            interlockWidth: 3,
            interlockHeight: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("o5x6_TopRight \(o5x6_TopRight.count)")
        
        let o6x6_BottomRight = RectangleCalculator.BottomRightSquare(
            interlockWidth: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("o6x6_BottomRight \(o6x6_BottomRight.count)")
        
        let o6x6_TopLeft = RectangleCalculator.TopLeftSquare(
            interlockWidth: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
        print("o6x6_TopLeft \(o6x6_TopLeft.count)")
        
        let o6x6_TopRight = RectangleCalculator.TopRightSquare(
            interlockWidth: 5,
            words: words,
            lengths: lengths,
            widthMax: widthMax,
            heightMax: heightMax,
            scoreMin: scoreMin)
        
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
    
    
    
    public static func Square(interlockWidth: Int, words: [String], lengths: [Int],  widthMax: Int, heightMax: Int, scoreMin: Int) -> [RectangleModel] {

        var result: [RectangleModel] = [];

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

                                                                        let width = CalculateWidth(
                                                                            topLength: lengths[_top],
                                                                            bottomLength: lengths[_bottom],
                                                                            topLetterPos: _topLetterPos,
                                                                            bottomLetterPos: _bottomLetterPos)
                                                                        
                                                                        let height = CalculateWidth(
                                                                            topLength: lengths[_left],
                                                                            bottomLength: lengths[_right],
                                                                            topLetterPos: _leftLetterPos,
                                                                            bottomLetterPos: _rightLetterPos)

                                                                        if (width <= widthMax && height <= heightMax) ||
                                                                            (width <= heightMax && height <= widthMax) {
                                                                            
                                                                            let donut = RectangleModel(
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
                                                                                rightLetterPos:_rightLetterPos,
                                                                                interlockWidth: interlockWidth,
                                                                                interlockHeight: interlockWidth,
                                                                                type: .rectangle
                                                                            )
#if DEBUG
                                                                            if _left == _right || _left == _top || _left == _bottom || _top == _right || _top == _bottom || _right == _bottom {
                                                                                print("error occurred as words are matching")
                                                                                return []
                                                                            }
                                                                            let text = donut.ToText(words: words)
                                                                            
                                                                            if text.contains("#") {
                                                                                print("error # detected in \n\(text)")
                                                                                return []
                                                                            }
#endif
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
        return result;
    }
    
    public static func Rectangle(interlockWidth: Int, interlockHeight: Int, words: [String], lengths: [Int], widthMax: Int, heightMax: Int, scoreMin: Int) -> [RectangleModel] {

        var result: [RectangleModel] = [];

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

                                                                        let width = CalculateWidth(
                                                                            topLength: lengths[_top],
                                                                            bottomLength: lengths[_bottom],
                                                                            topLetterPos: _topLetterPos,
                                                                            bottomLetterPos: _bottomLetterPos)
                                                                        
                                                                        let height = CalculateWidth(
                                                                            topLength: lengths[_left],
                                                                            bottomLength: lengths[_right],
                                                                            topLetterPos: _leftLetterPos,
                                                                            bottomLetterPos: _rightLetterPos);
                                                                        
                                                                        if (width <= widthMax && height <= heightMax) ||
                                                                            (width <= heightMax && height <= widthMax) {
                                                                            
                                                                            let donut = RectangleModel(
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
                                                                                rightLetterPos:_rightLetterPos,
                                                                                interlockWidth: interlockWidth,
                                                                                interlockHeight: interlockHeight,
                                                                                type: .rectangle)
#if DEBUG
                                                                            if _left == _right || _left == _top || _left == _bottom || _top == _right || _top == _bottom || _right == _bottom {
                                                                                print("error occurred as words are matching")
                                                                                return []
                                                                            }
                                                                            let text = donut.ToText(words: words)
                                                                            
                                                                            if text.contains("#") {
                                                                                print("error # detected in \n\(text)")
                                                                                return []
                                                                            }
#endif
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
        return result;
    }
    
    public static func TopLeftRectangle(interlockWidth: Int, interlockHeight: Int, words: [String], lengths: [Int], widthMax: Int, heightMax: Int, scoreMin: Int) -> [RectangleModel] {
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
        
            if (lengths[_left] >= interlockHeight) // We experimented by adding plus 1 but it crashed
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
                                                    
                                                    if lengths[_top] >= interlockWidth // -1 here causes crash so dont
                                                        && _top != _bottom && _top != _left && _top != _right {
                                                    
                                                        let _topLetterPos = interlockWidth - 1

                                                        if (words[_top][_topLetterPos] == words[_right][_rightLetterPos])
                                                        {
                                                            let score = ScoreCalculator.openTopLeft(
                                                                topRight: words[_top][_topLetterPos],
                                                                bottomLeft: words[_bottom][_bottomLetterPos],
                                                                bottomRight: words[_bottom][_bottomLetterPos + interlockWidth])
                                                            
                                                            if score >= scoreMin {

                                                                let width = CalculateWidthIndented(
                                                                    letterPos: _bottomLetterPos,
                                                                    wordLength: lengths[_bottom],
                                                                    indentedWordLength: lengths[_top])
                                                                
                                                                let height = CalculateWidthIndented(
                                                                    letterPos: _rightLetterPos,
                                                                    wordLength: lengths[_right],
                                                                    indentedWordLength: lengths[_left])

                                                                if (width <= widthMax && height <= heightMax) ||
                                                                    (width <= heightMax && height <= widthMax) {
                                                                    
                                                                    let donut = RectangleModel(
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
                                                                        rightLetterPos:_rightLetterPos,
                                                                        interlockWidth: interlockWidth,
                                                                        interlockHeight: interlockHeight,
                                                                        type: .topLeft)
#if DEBUG
                                                                    if _left == _right || _left == _top || _left == _bottom || _top == _right || _top == _bottom || _right == _bottom {
                                                                        print("error occurred as words are matching")
                                                                        return []
                                                                    }
                                                                    let text = donut.ToText(words: words)
                                                                    
                                                                    if text.contains("#") {
                                                                        print("error # detected in \n\(text)")
                                                                        return []
                                                                    }
#endif
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
        return result;
    }
    
    public static func TopLeftSquare(interlockWidth: Int, words: [String], lengths: [Int], widthMax: Int, heightMax: Int, scoreMin: Int) -> [RectangleModel] {
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
        
            if (lengths[_left] >= interlockWidth)
            {
                let _leftLetterPos = interlockWidth - 1

                for _bottom in 0..<wordCount {
                
                    if lengths[_bottom] >= interlockWidth && _bottom != _left {

                        for _bottomLetterPos in 0..<(lengths[_bottom] - interlockWidth) {
                            
                            if words[_left][_leftLetterPos] == words[_bottom][_bottomLetterPos] {
                            
                                for _right in 0..<wordCount {
                                    
                                    if lengths[_right] >= interlockWidth && _right != _bottom && _right != _left {
                                    
                                        for _rightLetterPos in 0..<(lengths[_right] - interlockWidth) {
                                            
                                            if words[_bottom][_bottomLetterPos + interlockWidth] == words[_right][_rightLetterPos + interlockWidth] {
                                            
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
/*
                                                                   .STAR
                                                                   Z O
                                                                FAMILY
                                                                   O S
                                                                   N
*/
                                                                let width = CalculateWidthIndented(
                                                                    letterPos: _bottomLetterPos,
                                                                    wordLength: lengths[_bottom],
                                                                    indentedWordLength: lengths[_top])
                                                                
                                                                let height = CalculateWidthIndented(
                                                                    letterPos: _rightLetterPos,
                                                                    wordLength: lengths[_right],
                                                                    indentedWordLength: lengths[_left])
                                                                
                                                                if (width <= widthMax && height <= heightMax) ||
                                                                    (width <= heightMax && height <= widthMax) {
                                                                    
                                                                    let donut = RectangleModel(
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
                                                                        rightLetterPos:_rightLetterPos,
                                                                        interlockWidth: interlockWidth,
                                                                        interlockHeight: interlockWidth,
                                                                        type:.topLeft)
#if DEBUG
                                                                    if _left == _right || _left == _top || _left == _bottom || _top == _right || _top == _bottom || _right == _bottom {
                                                                        print("error occurred as words are matching")
                                                                        return []
                                                                    }
                                                                    let text = donut.ToText(words: words)
                                                                    
                                                                    if text.contains("#") {
                                                                        print("error # detected in \n\(text)")
                                                                        return []
                                                                    }
#endif
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
        return result;
    }
    
    public static func TopRightRectangle(interlockWidth: Int, interlockHeight: Int, words: [String], lengths: [Int], widthMax: Int, heightMax: Int, scoreMin: Int) -> [RectangleModel] {
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

        if (interlockHeight <= interlockWidth) {
            return result;
        }
        
        let wordCount = words.count

        for _top in 0..<wordCount {
        
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
                                                    
                                                        let _rightLetterPos = interlockHeight - 1

                                                        if (words[_bottom][_bottomLetterPos + interlockWidth] == words[_right][_rightLetterPos])
                                                        {
                                                            let score = ScoreCalculator.openTopRight(
                                                                topLeft: words[_top][_topLetterPos],
                                                                bottomLeft: words[_bottom][_bottomLetterPos],
                                                                bottomRight: words[_bottom][_bottomLetterPos + interlockWidth])

                                                            if score >= scoreMin {

                                                                let width = CalculateWidth(
                                                                    topLength: lengths[_top],
                                                                    bottomLength: lengths[_bottom],
                                                                    topLetterPos: _topLetterPos,
                                                                    bottomLetterPos: _bottomLetterPos)
                                                                
                                                                let height = CalculateWidthIndented(
                                                                    letterPos: _leftLetterPos,
                                                                    wordLength: lengths[_left],
                                                                    indentedWordLength: lengths[_right])

                                                                if (width <= widthMax && height <= heightMax) ||
                                                                    (width <= heightMax && height <= widthMax) {
                                                                    
                                                                    let donut = RectangleModel(
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
                                                                        rightLetterPos:_rightLetterPos,
                                                                        interlockWidth: interlockWidth,
                                                                        interlockHeight: interlockHeight,
                                                                        type:.topRight)
#if DEBUG
                                                                    if _left == _right || _left == _top || _left == _bottom || _top == _right || _top == _bottom || _right == _bottom {
                                                                        print("error occurred as words are matching")
                                                                        return []
                                                                    }
                                                                    let text = donut.ToText(words: words)
                                                                    
                                                                    if text.contains("#") {
                                                                        print("error # detected in \n\(text)")
                                                                        return []
                                                                    }
#endif
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
        return result;
    }
    
    public static func TopRightSquare(interlockWidth: Int, words: [String], lengths: [Int], widthMax: Int, heightMax: Int, scoreMin: Int) -> [RectangleModel] {
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
        
        let wordCount = words.count

        for _top in 0..<wordCount {

            if lengths[_top] >= interlockWidth {
            
                let _topLetterPos = lengths[_top] - interlockWidth

                for _left in 0..<wordCount {
                    
                    if lengths[_left] >= interlockWidth && _left != _top {
                    
                        for _leftLetterPos in 0..<(lengths[_left] - interlockWidth) {
                        
                            if words[_top][_topLetterPos] == words[_left][_leftLetterPos] {
                            
                                for _bottom in 0..<wordCount {
                                
                                    if lengths[_bottom] >= interlockWidth && _bottom != _left && _bottom != _top {
                                    
                                        for _bottomLetterPos in 0..<(lengths[_bottom] - interlockWidth) {
                                        
                                            if (words[_left][_leftLetterPos + interlockWidth] == words[_bottom][_bottomLetterPos])
                                            {
                                                for _right in 0..<wordCount {
                                                    
                                                    if lengths[_right] >= interlockWidth && _right != _bottom && _right != _left && _right != _top {
                                                    
                                                        let _rightLetterPos = interlockWidth - 1

                                                        if (words[_bottom][_bottomLetterPos + interlockWidth] == words[_right][_rightLetterPos]) {
                                                            
                                                            let score = ScoreCalculator.openTopRight(
                                                                topLeft: words[_top][_topLetterPos],
                                                                bottomLeft: words[_bottom][_bottomLetterPos],
                                                                bottomRight: words[_bottom][_bottomLetterPos + interlockWidth])

                                                            if score >= scoreMin {
                                                                
                                                                let width = CalculateWidth(
                                                                    topLength: lengths[_top],
                                                                    bottomLength: lengths[_bottom],
                                                                    topLetterPos: _topLetterPos,
                                                                    bottomLetterPos: _bottomLetterPos)
                                                                
                                                                let height = CalculateWidthIndented(
                                                                    letterPos: _leftLetterPos,
                                                                    wordLength: lengths[_left],
                                                                    indentedWordLength: lengths[_right])

                                                                if (width <= widthMax && height <= heightMax) ||
                                                                    (width <= heightMax && height <= widthMax) {
                                                                    
                                                                    let donut = RectangleModel(
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
                                                                        rightLetterPos:_rightLetterPos,
                                                                        interlockWidth: interlockWidth,
                                                                        interlockHeight: interlockWidth,
                                                                        type: .topRight)
#if DEBUG
                                                                    if _left == _right || _left == _top || _left == _bottom || _top == _right || _top == _bottom || _right == _bottom {
                                                                        print("error occurred as words are matching")
                                                                        return []
                                                                    }
                                                                    let text = donut.ToText(words: words)
                                                                    
                                                                    if text.contains("#") {
                                                                        print("error # detected in \n\(text)")
                                                                        return []
                                                                    }
#endif
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
        return result;
    }
    
    public static func BottomRightRectangle(interlockWidth: Int, interlockHeight: Int, words: [String], lengths: [Int], widthMax: Int, heightMax: Int, scoreMin: Int) -> [RectangleModel] {
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
                                                        
                                                        if words[_left][_leftLetterPos + interlockHeight] == words[_bottom][_bottomLetterPos] {
                                                        
                                                            let score = ScoreCalculator.openBottomRight(
                                                                topLeft: words[_top][_topLetterPos],
                                                                topRight: words[_top][_topLetterPos + interlockWidth],
                                                                bottomLeft: words[_bottom][_bottomLetterPos])

                                                            if score >= scoreMin {

                                                                let width = CalculateWidth(
                                                                    topLength: lengths[_top],
                                                                    bottomLength: lengths[_bottom],
                                                                    topLetterPos: _topLetterPos,
                                                                    bottomLetterPos: _bottomLetterPos)
                                                                
                                                                let height = CalculateWidth(
                                                                    topLength: lengths[_left],
                                                                    bottomLength: lengths[_right],
                                                                    topLetterPos: _leftLetterPos,
                                                                    bottomLetterPos: _rightLetterPos)

                                                                if (width <= widthMax && height <= heightMax) ||
                                                                    (width <= heightMax && height <= widthMax) {
                                                                    
                                                                    let donut = RectangleModel(
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
                                                                        rightLetterPos:_rightLetterPos,
                                                                        interlockWidth: interlockWidth,
                                                                        interlockHeight: interlockHeight,
                                                                        type: .bottomRight)
//#if DEBUG
//                                                                    if _left == _right || _left == _top || _left == _bottom || _top == _right || _top == _bottom || _right == _bottom {
//                                                                        print("error occurred as words are matching")
//                                                                        return []
//                                                                    }
//                                                                    let text = donut.ToText(words: words)
//
//                                                                    if text.contains("#") {
//                                                                        print("error # detected in \n\(text)")
//                                                                        return []
//                                                                    }
//#endif
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
        return result;
    }
    
    public static func BottomRightSquare(interlockWidth: Int, words: [String], lengths: [Int], widthMax: Int, heightMax: Int, scoreMin: Int) -> [RectangleModel] {
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

                for _top in 0..<wordCount {
                
                    if lengths[_top] >= interlockWidth && _top != _right {
                    
                        for _topLetterPos in 0..<(lengths[_top] - interlockWidth) {
                        
                            if words[_top][_topLetterPos + interlockWidth] == words[_right][_rightLetterPos] {
                            
                                for _left in (_top + 1)..<wordCount { // This one line is what makes a rectangle become a square so as to remove duplicates actually
                                    
                                    if lengths[_left] >= interlockWidth && _left != _top && _left != _right {
                                        
                                        for _leftLetterPos in 0..<(lengths[_left] - interlockWidth) {
                                        
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

                                                                let width = CalculateWidth(
                                                                    topLength: lengths[_top],
                                                                    bottomLength: lengths[_bottom],
                                                                    topLetterPos: _topLetterPos,
                                                                    bottomLetterPos: _bottomLetterPos)
                                                                
                                                                let height = CalculateWidth(
                                                                    topLength: lengths[_left],
                                                                    bottomLength: lengths[_right],
                                                                    topLetterPos: _leftLetterPos,
                                                                    bottomLetterPos: _rightLetterPos)
                                                                
                                                                if (width <= widthMax && height <= heightMax) || (width <= heightMax && height <= widthMax) {
                                                                    
                                                                    let donut = RectangleModel(
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
                                                                        rightLetterPos:_rightLetterPos,
                                                                        interlockWidth: interlockWidth,
                                                                        interlockHeight: interlockWidth,
                                                                        type: .bottomRight)
#if DEBUG
                                                                    if _left == _right || _left == _top || _left == _bottom || _top == _right || _top == _bottom || _right == _bottom {
                                                                        print("error occurred as words are matching")
                                                                        return []
                                                                    }
                                                                    let text = donut.ToText(words: words)
                                                                    
                                                                    if text.contains("#") {
                                                                        print("error # detected in \n\(text)")
                                                                        return []
                                                                    }
#endif
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
        return result;
    }
    
    public static func BottomLeftRectangle(interlockWidth: Int, interlockHeight: Int, words: [String], lengths: [Int], widthMax: Int, heightMax: Int, scoreMin: Int) -> [RectangleModel] {
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
        
                for _right in 0..<wordCount {
            
                    if lengths[_right] >= interlockHeight && _right != _bottom {
            
                        for _rightLetterPos in 0..<(lengths[_right] - interlockHeight) {
                                    
                            if words[_bottom][_bottomLetterPos] == words[_right][_rightLetterPos + interlockHeight] {
                            
                                for _top in 0..<wordCount {
                
                                    if lengths[_top] >= interlockWidth && _top != _right && _top != _bottom {
                    
                                        for _topLetterPos in 0..<(lengths[_top] - interlockWidth) {
                        
                                            if words[_top][_topLetterPos + interlockWidth] == words[_right][_rightLetterPos] {
                            
                                                for _left in 0..<wordCount {
                                    
                                                    if lengths[_left] >= interlockHeight && _left != _top && _left != _right && _left != _bottom {
                                                        
                                                        let _leftLetterPos = lengths[_left] - interlockHeight
                                        
                                                        if words[_top][_topLetterPos] == words[_left][_leftLetterPos] {
                                                        
                                                            let score = ScoreCalculator.openBottomRight(
                                                                topLeft: words[_top][_topLetterPos],
                                                                topRight: words[_top][_topLetterPos + interlockWidth],
                                                                bottomLeft: words[_bottom][_bottomLetterPos])

                                                            if score >= scoreMin {
                                                                
                                                                let width = CalculateWidthIndented(
                                                                    letterPos: _topLetterPos,
                                                                    wordLength: lengths[_top],
                                                                    indentedWordLength: lengths[_bottom])
                                                                
                                                                let height = CalculateWidth(
                                                                    topLength: lengths[_left],
                                                                    bottomLength: lengths[_right],
                                                                    topLetterPos: _leftLetterPos,
                                                                    bottomLetterPos: _rightLetterPos)
                                                                
                                                                
                                                                if (width <= widthMax && height <= heightMax) || (width <= heightMax && height <= widthMax) {
                                                                    
                                                                    let donut = RectangleModel(
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
                                                                        rightLetterPos:_rightLetterPos,
                                                                        interlockWidth: interlockWidth,
                                                                        interlockHeight: interlockHeight,
                                                                        type: .bottomLeft)
#if DEBUG
                                                                    if _left == _right || _left == _top || _left == _bottom || _top == _right || _top == _bottom || _right == _bottom {
                                                                        print("error occurred as words are matching")
                                                                        return []
                                                                    }
                                                                    let text = donut.ToText(words: words)
                                                                    
                                                                    if text.contains("#") {
                                                                        print("error # detected in \n\(text)")
                                                                        return []
                                                                    }
#endif
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
        return result;
    }
}
