//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 9/6/2023.
//

import Foundation
public class StrategyCalculator {
    public static func Shapes_8612() async {
        
        let widthMax = 17
        let heightMax = 12
        
        
        let gameList = GameList()
        
        guard let game = gameList.getGame(gameId: 8612) else {
            return
        }
        
        let words = game.winningWords
        let len = WordCalculator.lengths(words: words)
        
        let hazelnut_merry_list = ShapesFromMergesCalculator.Ladder2x2x2(
            words: words,
            scoreMin: 104,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let hazelnut_merry_words = ["HAZELNUT", "MERRY", "HYMN", "NAZARETH", "JELLY"]
        let hazelnut_merry_filtered = ShapeCalculator.filterInclude(
            shapes: hazelnut_merry_list,
            containing: hazelnut_merry_words,
            fromWordList: words)
        
        let hazelnut_merry = hazelnut_merry_filtered[0]
        
        print(hazelnut_merry.ToString(words: words))
        
        let nazareth_sing_list = ShapesFromMergesCalculator.Execute2x3And2x2(words: words, scoreMin: 52, widthMax: 17, heightMax: 12)
        
        
        let nazareth_sing_words = ["NUTS","ZION","EVE","NAZARETH","SING","BELLS"]
        let nazareth_sing_filtered = ShapeCalculator.filterInclude(
            shapes: nazareth_sing_list,
            containing: nazareth_sing_words,
            fromWordList: words)
        let nazareth_sing = ShapeCalculator.Flip(shape:nazareth_sing_filtered[0])
        
        print(nazareth_sing.ToString(words: words))
        
        let toys_tree_rectangles = RectangleCalculator.Rectangle(interlockWidth:3, interlockHeight:4,
                                                           words: words, lengths:len, scoreMin:48,
                                                           widthMax: widthMax, heightMax:heightMax)
        let toys_tree_list = ShapeCalculator.toShapes(rectangles: toys_tree_rectangles)
        
        let toys_tree_words = ["TOYS","TREE","TOAST","SAUCE"]
        let toys_tree_filtered = ShapeCalculator.filterInclude(
            shapes: toys_tree_list,
            containing: toys_tree_words,
            fromWordList: words)
        
        let toys_tree = toys_tree_filtered[0]
        
        print(toys_tree.ToString(words: words))
        
        
        /// Next we put in these core structures that we can derive ourselves and put it into our thing
        let scoresMin:[Int] = Array(repeating: 20, count: 40)
        
        let constraints = ConstraintsModel(scoresMin: scoresMin, wordsMax: words.count, wordsToUse: .all, queueLengthMax: 1000, priorityFunction: .density_score)
        
        var queue = QueueList(game: game, constraints: constraints)
        
        // We have added the seed shapes
        queue.add(shapes: [toys_tree])
        queue.add(shapes: [nazareth_sing])
        queue.add(shapes: [hazelnut_merry])
        
        // now lets see if the merge with edges will work
        let edges = EdgeCalculator.Execute(words: words, scoreMin: 0, widthMax: widthMax, heightMax: heightMax)
        
        let edgeShapes = ShapeCalculator.toShapes(edges: edges)
        
        queue.add(shapes: edgeShapes)
        for _ in 0..<40 {
            // Do this 40 times
            for i in 3..<40 {
                if queue.queues[i].shapes.count > 0 {
                    await queue.mergeTwoAsync(mergeIndex: 2, withIndex: i)
                    queue.printBestScoreDeep()
                }
            }
        }
        
    }
    

}
