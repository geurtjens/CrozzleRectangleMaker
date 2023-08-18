//
//  QueueListCalculator.swift
//  
//
//  Created by Michael Geurtjens on 29/5/2023.
//

import Foundation

/// A way of populating all standard shapes and placing them into the `QueueList`.  There is no merges in here rather just getting shapes we can make from the raw single words of the words list.
public class QueueListCalculator {
    
    
    
    /// provides all known shapes as a starting point to our calculations.  The scoresMin array tells what the min score is no matter what the number of words and its indexed such that 4 word shapes will be found in scoresMin[4] just to keep it simple.
    public static func Execute(game: GameModel, constraints: ConstraintsModel) async -> QueueList {

        var result = QueueList(game: game, constraints: constraints)
        
        let words = game.words
        let widthMax = game.maxWidth
        let heightMax = game.maxHeight
        
        
        
        let words2 = QueueListCalculator.get_2_word_shapes(
            words: words,
            scoreMin: constraints.scoresMin[2],
            widthMax: widthMax,
            heightMax: heightMax)
        
        result.add(shapes: words2)
        
        result.add(shapes: await result.mergeWithItselfAsync(index:2))
        
        
        let words4 = await QueueListCalculator.get_4_word_shapes(
            words: words,
            scoreMin: constraints.scoresMin[4],
            widthMax: widthMax,
            heightMax: heightMax)
        
        result.add(shapes: words4)
        
        let words5 = QueueListCalculator.get_5_word_shapes(
            words: words,
            scoreMin: constraints.scoresMin[5],
            widthMax: widthMax,
            heightMax: heightMax)
        
        result.add(shapes: words5)
        
        let words6 = QueueListCalculator.get_6_word_shapes(
            words: words,
            scoreMin: constraints.scoresMin[6],
            widthMax: widthMax,
            heightMax: heightMax)
        
        result.add(shapes: words6)
        
        let words7 = QueueListCalculator.get_7_word_shapes(
            words: words,
            scoreMin: constraints.scoresMin[7],
            widthMax: widthMax,
            heightMax: heightMax)
        
        result.add(shapes: words7)
        
        let words8 = QueueListCalculator.get_8_word_shapes(
            words: words,
            scoreMin: constraints.scoresMin[8],
            widthMax: widthMax,
            heightMax: heightMax)
        
        result.add(shapes: words8)
        
        
        return result
    }
    
    
    /// get 2 word shapes which is really only edges of which there are 10,000 or so
    public static func get_2_word_shapes(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ShapeModel] {
        
        let edges = EdgeCalculator.Execute(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let shapes = ShapeCalculator.toShapesSorted(edges: edges)
        
        return shapes
    }
    
    
    /// get all four word shapes which includes 2x2 and all rectangle shapes.  Concerning rectangle shapes there are many of these, millions of these
    public static func get_4_word_shapes(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) async -> [ShapeModel] {
        let rectangles = await RectangleCalculator.Execute(
            words: words,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        let c2x2 = ClusterCalculator.C2x2(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
                                            
        let rectangleShapes = ShapeCalculator.toShapes(rectangles: rectangles)
        
        let clusterShapes = ShapeCalculator.toShapes(clusters: c2x2)
       
        var shapes = rectangleShapes + clusterShapes
        
        ShapeCalculator.Sort(shapes: &shapes)
        
        return shapes
    }
    
    
    /// get all 5 word shapes which is basically all 2x3 clusters
    public static func get_5_word_shapes(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ShapeModel] {
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        let c2x3 = ClusterCalculator.C2x3(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let shapes = ShapeCalculator.toShapesSorted(clusters: c2x3)
 
        return shapes
    }
    
    
    /// gets the 6 word shapes which are the 2x4 and 3x3 clusters
    public static func get_6_word_shapes(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ShapeModel] {
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        let c2x4 = ClusterCalculator.C2x4(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let c3x3 = ClusterCalculator.C3x3(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let pacman3x3_bottomRight = PacmanCalculator.BottomRight(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let pacman3x3_topLeft = PacmanCalculator.TopLeft(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let pacman3x3_topRight = PacmanCalculator.TopRight(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let clusterList = c2x4 + c3x3
        
        let clusterShapes = ShapeCalculator.toShapesSorted(clusters: clusterList)
        
        let pacmanList = pacman3x3_bottomRight + pacman3x3_topLeft + pacman3x3_topRight
        
        let pacmanShapes = ShapeCalculator.toShapesSorted(pacmans: pacmanList)
        
        let shapes = pacmanShapes + clusterShapes
        
        return shapes
    }
    
    
    /// gets shapes with 7 words in them which is the 2x5 and 3x4 clusters
    public static func get_7_word_shapes(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ShapeModel] {
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        let c2x5 = ClusterCalculator.C2x5(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let c3x4 = ClusterCalculator.C3x4(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let clusterList = c2x5 + c3x4
        
        let shapes = ShapeCalculator.toShapesSorted(clusters: clusterList)
        
        return shapes
    }
    
    
    /// gets 8 word shapes which are the 2x6 and 3x5 clusters
    public static func get_8_word_shapes(words: [String], scoreMin: Int, widthMax: Int, heightMax: Int, wordsMax: Int = 0) -> [ShapeModel] {
        
        let end = WordCalculator.reverse(words: words)
        let len = WordCalculator.lengths(words: words)
        
        let c2x6 = ClusterCalculator.C2x6(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let c3x5 = ClusterCalculator.C3x5(
            words: words,
            end: end,
            len: len,
            scoreMin: scoreMin,
            widthMax: widthMax,
            heightMax: heightMax,
            wordsMax: wordsMax)
        
        let clusterList = c2x6 + c3x5
        
        let shapes = ShapeCalculator.toShapesSorted(clusters: clusterList)
        
        return shapes
    }
}
