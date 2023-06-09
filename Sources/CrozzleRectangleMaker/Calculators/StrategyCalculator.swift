//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 9/6/2023.
//

import Foundation
public class StrategyCalculator {
    
    
    
    static let widthMax = 17
    static let heightMax = 12
    
    
    
    
    public static func Create_Fork(edgeShapes: [ShapeModel], words: [String]) -> ShapeModel {
        let white_family = ShapeCalculator.filterInclude(shapes: edgeShapes, containing: ["WHITE","FAMILY"], fromWordList: words)
        
        let white_snow = ShapeCalculator.filterInclude(shapes: edgeShapes, containing: ["WHITE","SNOW"], fromWordList: words)
        
        let white_cake = ShapeCalculator.filterInclude(shapes: edgeShapes, containing: ["WHITE","CAKE"], fromWordList: words)
        
        
        let fork = white_snow + white_family + white_cake
        
        let gpuFork = GpuShapeModel(shapes: fork, totalWords: words.count, stride: 2)
        
        let mergeFork = ExecuteMergeCalculator.ExecuteSameShape(shapes: gpuFork, words: words, scoresMin: [0,0,0,0,0,0,0,0,0,0], widthMax: widthMax, heightMax: heightMax)
        
//        for item in mergeFork {
//            print(item.ToString(words: words))
//        }
        
        let gpuFork2 = GpuShapeModel(shapes: mergeFork, totalWords: words.count, stride:3)
        
        var mergeFork2 = ExecuteMergeCalculator.ExecuteSameShape(shapes: gpuFork2, words: words, scoresMin: [0,0,0,0,0,0,0,0,0,0], widthMax: widthMax, heightMax: heightMax)
        
        ShapeCalculator.SortWithWordSequence(shapes: &mergeFork2)
        
        let _ = RemoveDuplicatesCalculator.findDuplicates(shapes: &mergeFork2)
        
        
        let withoutDuplicates = RemoveDuplicatesCalculator.removeDuplicates(shapes: mergeFork2)
            
        
        
//        for item in withoutDuplicates {
//            print(item.ToString(words: words))
//        }
        
        return withoutDuplicates[0]
    }
    
    public static func Create_Toys_Tree(words: [String]) -> ShapeModel {
        
        let len = WordCalculator.lengths(words: words)
        
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
        
        
        return toys_tree
    }
    
    public static func Create_Nazareth_Sing(words: [String]) -> ShapeModel {
        let nazareth_sing_list = ShapesFromMergesCalculator.Execute2x3And2x2(words: words, scoreMin: 52, widthMax: 17, heightMax: 12)
        
        
        let nazareth_sing_words = ["NUTS","ZION","EVE","NAZARETH","SING","BELLS"]
        let nazareth_sing_filtered = ShapeCalculator.filterInclude(
            shapes: nazareth_sing_list,
            containing: nazareth_sing_words,
            fromWordList: words)
        let nazareth_sing = ShapeCalculator.Flip(shape:nazareth_sing_filtered[0])
        
        
        return nazareth_sing
    }
    
    public static func Create_Hazelnut_Merry(words: [String]) -> ShapeModel {
        let hazelnut_merry_list = ShapesFromMergesCalculator.Ladder2x2x2(
            words: words,
            scoreMin: 104,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let hazelnut_merry_words = ["HAZELNUT", "MERRY", "HYMN", "AZURE", "JELLY"]
        let hazelnut_merry_filtered = ShapeCalculator.filterInclude(
            shapes: hazelnut_merry_list,
            containing: hazelnut_merry_words,
            fromWordList: words)
        
        let hazelnut_merry_gpu = GpuShapeModel(shapes: hazelnut_merry_filtered, totalWords: words.count, stride: 5)
        
        let hazelnut_merry = hazelnut_merry_filtered[0]
        
        
        
        return hazelnut_merry
    }
    
    public static func Create_Joy_Jelly_Holly(edgeShapes: [ShapeModel], words: [String]) -> ShapeModel {
        let joy_holly = ShapeCalculator.filterInclude(shapes: edgeShapes, containing: ["JOY","HOLLY"], fromWordList: words)
        
        let joy_jelly = ShapeCalculator.filterInclude(shapes: edgeShapes, containing: ["JOY","JELLY"], fromWordList: words)

        let joy_jelly_joy_holly = joy_holly + joy_jelly
        
        let joy_jelly_joy_holly_gpu = GpuShapeModel(shapes: joy_jelly_joy_holly, totalWords: words.count, stride: 2)
        
        let joy_jelly_joy_holly_merged = ExecuteMergeCalculator.ExecuteSameShape(shapes: joy_jelly_joy_holly_gpu, words: words, scoresMin: [0,0,0,0,0,0,0], widthMax: widthMax, heightMax: heightMax)
        
        for item in joy_jelly_joy_holly_merged {
            print(item.ToString(words: words))
        }
        
        return joy_jelly_joy_holly_merged[0]
    }
    
    
    public static func Merge_Two_Shapes(smaller: [ShapeModel], larger: [ShapeModel], words:[String]) -> [ShapeModel] {
        
        var smaller_gpu = GpuShapeModel(shapes:smaller, totalWords: words.count)
        
        var larger_gpu = GpuShapeModel(shapes:larger, totalWords: words.count)
        
        if smaller_gpu.stride > larger_gpu.stride {
            // we are doing a swap of larger with smaller if smaller is bigger than larger
            let old_larger_gpu = larger_gpu
            
            larger_gpu = smaller_gpu
            smaller_gpu = old_larger_gpu
        }
        let scoresMin = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        let result = ExecuteMergeCalculator.ExecuteDifferentShapes(
            source: smaller_gpu,
            search: larger_gpu,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        for item in result {
            print(item.ToString(words: words))
        }
        return result
    }
    
    //public static func
    
    public static func Shapes_8612() {
        
        let widthMax = 17
        let heightMax = 12
        let gameList = GameList()
        
        guard let game = gameList.getGame(gameId: 8612) else {
            return
        }
        
        let words = game.winningWords
      
        let edges = EdgeCalculator.Execute(words: words, scoreMin: 0, widthMax: widthMax, heightMax: heightMax)
        
        let edgeShapes = ShapeCalculator.toShapes(edges: edges)
        
        let hazelnut_merry = Create_Hazelnut_Merry(words: words)
        print(hazelnut_merry.ToString(words: words))
        
        let nazareth_sing = Create_Nazareth_Sing(words: words)
        print(nazareth_sing.ToString(words: words))
        
        let toys_tree = Create_Toys_Tree(words: words)
        print(toys_tree.ToString(words: words))
        
        let joy_jelly_holly = Create_Joy_Jelly_Holly(edgeShapes: edgeShapes, words: words)
        print(joy_jelly_holly.ToString(words: words))
        
        let fork = Create_Fork(edgeShapes: edgeShapes, words: words)
        print(fork.ToString(words: words))
        
        // These are just the edges that are in the winning game
        let turkey_hymn = ShapeCalculator.filterInclude(shapes: edgeShapes, containing: ["TURKEY","HYMN"], fromWordList: words)
        let turkey_sauce = ShapeCalculator.filterInclude(shapes: edgeShapes, containing: ["TURKEY","SAUCE"], fromWordList: words)
        let toys_family = ShapeCalculator.filterInclude(shapes: edgeShapes, containing: ["TOYS","FAMILY"], fromWordList: words)
        let turkey_pork = ShapeCalculator.filterInclude(shapes: edgeShapes, containing: ["TURKEY","PORK"], fromWordList: words)
        let inn_hymn = ShapeCalculator.filterInclude(shapes: edgeShapes, containing: ["INN","HYMN"], fromWordList: words)
        let hazelnut_star = ShapeCalculator.filterInclude(shapes: edgeShapes, containing: ["HAZELNUT","STAR"], fromWordList: words)
        
        let hazelnut_merry_joy = Merge_Two_Shapes(smaller: [joy_jelly_holly], larger: [hazelnut_merry], words: words)
        print(hazelnut_merry_joy[0].ToString(words: words))
        
        let hazelnut_merry_joy_nazareth = Merge_Two_Shapes(smaller: hazelnut_merry_joy, larger: [nazareth_sing], words: words)
        print(hazelnut_merry_joy_nazareth[0].ToString(words: words))
        
        let turkey_sauce_hymn = Merge_Two_Shapes(smaller: turkey_hymn, larger: turkey_sauce, words:words)
        print(turkey_sauce_hymn[0].ToString(words: words))
        
        let turkey_hazelnut_merry_joy_nazareth = Merge_Two_Shapes(smaller: turkey_sauce_hymn, larger: hazelnut_merry_joy_nazareth, words: words)
        print(turkey_hazelnut_merry_joy_nazareth[0].ToString(words: words))
        
        let toys_turkey_hazelnut_merry_joy_nazareth = Merge_Two_Shapes(smaller: [toys_tree], larger: turkey_hazelnut_merry_joy_nazareth, words: words)
        print(toys_turkey_hazelnut_merry_joy_nazareth[0].ToString(words: words))
        
        let family_toys_turkey_hazelnut_merry_joy_nazareth = Merge_Two_Shapes(smaller: toys_family, larger: toys_turkey_hazelnut_merry_joy_nazareth, words: words)
        print(family_toys_turkey_hazelnut_merry_joy_nazareth[0].ToString(words: words))
        
        let fork_family_toys_turkey_hazelnut_merry_joy_nazareth = Merge_Two_Shapes(smaller: [fork], larger: family_toys_turkey_hazelnut_merry_joy_nazareth, words: words)
        print(fork_family_toys_turkey_hazelnut_merry_joy_nazareth[0].ToString(words: words))
        
        let pork_fork_family_toys_turkey_hazelnut_merry_joy_nazareth = Merge_Two_Shapes(smaller: turkey_pork, larger: fork_family_toys_turkey_hazelnut_merry_joy_nazareth, words: words)
        print(pork_fork_family_toys_turkey_hazelnut_merry_joy_nazareth[0].ToString(words: words))
        
        let inn_pork_fork_family_toys_turkey_hazelnut_merry_joy_nazareth = Merge_Two_Shapes(smaller: inn_hymn, larger: pork_fork_family_toys_turkey_hazelnut_merry_joy_nazareth, words: words)
        print(inn_pork_fork_family_toys_turkey_hazelnut_merry_joy_nazareth[0].ToString(words: words))
        
        let star_inn_pork_fork_family_toys_turkey_hazelnut_merry_joy_nazareth = Merge_Two_Shapes(smaller: hazelnut_star, larger: inn_pork_fork_family_toys_turkey_hazelnut_merry_joy_nazareth, words: words)
        print(star_inn_pork_fork_family_toys_turkey_hazelnut_merry_joy_nazareth[0].ToString(words: words))
        
        print("\nWINNING GAME")
        print(ShapeCalculator.Flip(shape:star_inn_pork_fork_family_toys_turkey_hazelnut_merry_joy_nazareth[0]).ToString(words: words))
    }
}
