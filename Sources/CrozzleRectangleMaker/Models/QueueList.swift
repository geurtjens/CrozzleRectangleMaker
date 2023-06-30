//
//  QueueList.swift
//  
//
//  Created by Michael Geurtjens on 27/5/2023.
//

import Foundation
/// contains all shape queues and so is a central repository of all known shapes
public struct QueueList {
    
    public let game: GameModel
    public let constraints: ConstraintsModel
    
    /// all possible queue sizes that a game can handle, max of `maxQueues`
    public var queues: [QueueModel] = []
        
    
    public func status() -> (ShapeModel?, Int) {
        var maxShape: ShapeModel? = nil
        var maxScore: UInt16 = 0
        var count = 0
        for i in 0..<self.constraints.maxQueues {
            if queues[i].shapes.count > 0 {
                
                print("\(queues[i].shapes.count) shapes with \(i) words and max score of \(queues[i].shapes[0].score)")
                count += queues[i].shapes.count
                
                for item in queues[i].shapes {
                    if item.score > maxScore {
                        maxScore = item.score
                        maxShape = item
                    }
                }
            }
        }
        print("\(count) total")
        if let maxShape = maxShape {
            print("Max Score = \(maxShape.score)")
            print(maxShape.ToStringExtended(words: game.winningWords, gameId: game.gameId, winningScore: game.winningScore))
        }
        return (maxShape, count)
    }
    /// Adding shapes that may have any number of words in them.  Here we split them into the different `stride` and add to appropriate queue.
    public mutating func add(shapes: [ShapeModel]) {
        let dictionary = Dictionary(grouping: shapes, by: { $0.placements.count})
        
        for item in dictionary {
            let wordCount = item.key
            let shapes = item.value
            
            self.queues[wordCount].add(newShapes: shapes, constraints: self.constraints, words: game.words)
        }
    }
    
    
    
    
    
    
//    public mutating func mergeWithItselfAsync(
//        wordCount: Int,
//        words: [String],
//        scoresMin:[Int],
//        widthMax: Int,
//        heightMax: Int) async {
//
//            let shapes = await ExecuteMergeCalculator.ExecuteSameShapeAsync(
//                shapes: self.queues[wordCount].gpuShapes,
//                words: self.game.words,
//                scoresMin: scoresMin,
//                widthMax: widthMax,
//                heightMax: heightMax)
//        if shapes.count > 0 {
//            add(shapes: shapes)
//        }
//    }
    
    public func mergeWithItselfAsync(index wordCount: Int, searchMax: Int) async -> [ShapeModel] {
            
        let shapes = await ExecuteMergeCalculator.ExecuteSameShapeAsync(
                shapes: self.queues[wordCount].gpuShapes,
                wordIndex: self.queues[wordCount].wordIndex,
                searchMax: searchMax,
                words: self.game.words,
                scoresMin: self.constraints.scoresMin,
                widthMax: self.game.maxWidth,
                heightMax: self.game.maxHeight)
        
        return shapes
    }
    
    
    public mutating func mergeWithItselfAll() async {
        for i in 0..<self.queues.count {
            if self.queues[i].shapes.count > 0 {
                
                let startNano = DateTimeCalculator.now()
                
                //print(self.queues[i].shapes[0].ToString(words:self.game.words))
                DateTimeCalculator.printDate("mergeWithItselfAsync(index: \(i)) started at")
                
                let searchMax = self.queues[i].mergeFrom_LastPosition
                let shapes = await mergeWithItselfAsync(index:i, searchMax: searchMax)
                if shapes.count > 0 {
                    add(shapes: shapes)
                }

                
                let finishNano = DateTimeCalculator.now()
                let duration = DateTimeCalculator.duration(start: startNano, finish: finishNano)
                
                DateTimeCalculator.printDate("mergeWithItselfAsync(index: \(i)) created \(shapes.count) shapes, took \(duration) and finished at")
                let (_, _) = self.status()
            }
        }
    }
    
    public mutating func mergeEverythingBelowWith(index: Int) async {
        
        for i in 0..<index {
            if self.queues[i].shapes.count > 0 {
                
                let startNano = DateTimeCalculator.now()
                
                let shapes = await mergeTwoAsync(mergeIndex: i, withIndex: index)
                
                let currentCount = shapes.count
                
                if shapes.count > 0 {
                    add(shapes: shapes)
                }
                let finishNano = DateTimeCalculator.now()
                
                let duration = DateTimeCalculator.duration(start: startNano, finish: finishNano)
                DateTimeCalculator.printDate("mergeTwoAsync(mergeIndex: \(i), withIndex: \(index)) produced \(shapes.count) shapes took \(duration) and finished at")
            }
        }
    }
    
    public func size() -> Int {
        var count = 0
        for queue in queues {
            count += queue.shapes.count
        }
        return count
    }
    
    
    public func printBest() {
        for i in 0..<self.queues.count {
            if self.queues[i].shapes.count > 0 {
                let shape = self.queues[i].shapes[0]
                print(shape.ToString(words: self.game.words))
            }
        }
    }
    
    public func getBestShape() -> ShapeModel? {
        var bestShapes: [ShapeModel] = []
        for i in 0..<self.queues.count {
            if self.queues[i].shapes.count > 0 {
                let shape = self.queues[i].shapes[0]
                bestShapes.append(shape)
            }
        }
        bestShapes.sort() { $0.score > $1.score }
        if bestShapes.count > 0 {
            //print(bestShapes[0].ToString(words: self.game.words))
        }
        if bestShapes.count == 0 {
            return nil
        } else {
            return bestShapes[0]
        }
    }
    
    public func createScoresMin() -> [UInt16] {
        var result:[UInt16]=[]
        
        for queue in queues {
            result.append(queue.minScore())
        }
        return result
    }
    
    public func createScoresMin(winningShape: ShapeModel) -> [UInt16] {
        var result:[UInt16]=[]
        
        for queue in queues {
            result.append(queue.minScore(winningShape: winningShape, words: self.game.words))
        }
        return result
    }
    
    public func printAllShapes(words: [String]) {
        for queue in queues {
            if queue.shapes.count > 0 {
                queue.printAllShapes(words: words)
            }
        }
    }
    
    /// This words on shape lists that are not already sorted by score
    public func printBestScoreDeep() {
        var bestShapes: [ShapeModel] = []
        for i in 0..<self.queues.count {
            if self.queues[i].shapes.count > 0 {
                
                let sorted = ShapeCalculator.SortWithoutUpdate(shapes: self.queues[i].shapes)
                
                let shape = sorted[0]
                bestShapes.append(shape)
            }
        }
        bestShapes.sort() { $0.score > $1.score }
        if bestShapes.count > 0 {
            print(bestShapes[0].ToString(words: self.game.words))
        }
    }
    
    public func getBestShapeByScore() -> ShapeModel? {
        var bestShapes: [ShapeModel] = []
        for i in 0..<self.queues.count {
            if self.queues[i].shapes.count > 0 {
                let shape = self.queues[i].shapes[0]
                bestShapes.append(shape)
            }
        }
        bestShapes.sort() { $0.score > $1.score }
        if bestShapes.count > 0 {
            return bestShapes[0]
        } else {
            return nil
        }
    }
    
    public func mergeWithItselfAsync(index wordCount: Int, searchMax: Int, notTheseWordCounts:[Int]) async -> [ShapeModel] {
            
        let shapes = await ExecuteMergeCalculator.ExecuteSameShapeAsync(
                shapes: self.queues[wordCount].gpuShapes,
                wordIndex: self.queues[wordCount].wordIndex,
                searchMax: searchMax,
                words: self.game.words,
                scoresMin: self.constraints.scoresMin,
                widthMax: self.game.maxWidth,
                heightMax: self.game.maxHeight)
        
        if shapes.count > 0 {
            var filteredShapes: [ShapeModel] = []
            let dictionary = Dictionary(grouping: shapes, by: { $0.placements.count})
            for item in dictionary {
                if notTheseWordCounts.contains(item.key) == false {
                    filteredShapes += item.value
                }
            }
        
            return filteredShapes
            //add(shapes: shapes)
        }
        return []
    }
    
    /// Perform the merge on yourself but do not let the `notTheseWordCounts` count of words to be included.  So merge 3 words with 3 words and ignore the 4 word, only include the 5 word shapes
    public mutating func mergeWithItselfAsync(
        wordCount: Int,
        searchMax: Int,
        words: [String],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int,
        notTheseWordCounts:[Int]) async {
            
        let shapes = await ExecuteMergeCalculator.ExecuteSameShapeAsync(
            shapes: self.queues[wordCount].gpuShapes,
            wordIndex: self.queues[wordCount].wordIndex,
            searchMax: self.queues[wordCount].mergeFrom_LastPosition,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
            
            
        if shapes.count > 0 {
            var filteredShapes: [ShapeModel] = []
            let dictionary = Dictionary(grouping: shapes, by: { $0.placements.count})
            for item in dictionary {
                if notTheseWordCounts.contains(item.key) == false {
                    filteredShapes += item.value
                }
            }
            
            add(shapes: filteredShapes)
        }
    }
    
    public func mergeTwoAsync(
        mergeIndex: Int,
        withIndex mergeIndex2: Int) async -> [ShapeModel] {
        let shapes = await ExecuteMergeCalculator.ExecuteDifferentShapesAsync(
            source: self.queues[mergeIndex].gpuShapes,
            search: self.queues[mergeIndex2].gpuShapes,
            searchWordIndex: self.queues[mergeIndex2].wordIndex,
            words: self.game.words,
            scoresMin: self.constraints.scoresMin,
            widthMax: self.game.maxWidth,
            heightMax: self.game.maxHeight)

        
            
        return shapes
        
    }
    
    public mutating func mergeTwoAsync(
        mergeIndex: Int,
        withIndex mergeIndex2: Int,
        words: [String],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int,
        notTheseWordCounts:[Int]) async {
        let shapes = await ExecuteMergeCalculator.ExecuteDifferentShapesAsync(
            source: self.queues[mergeIndex].gpuShapes,
            search:self.queues[mergeIndex2].gpuShapes,
            searchWordIndex: self.queues[mergeIndex2].wordIndex,
            words: words,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)

        if shapes.count > 0 {
            
            var filteredShapes: [ShapeModel] = []
            let dictionary = Dictionary(grouping: shapes, by: { $0.placements.count})
            for item in dictionary {
                if notTheseWordCounts.contains(item.key) == false {
                    filteredShapes += item.value
                }
            }
            
            add(shapes: filteredShapes)
        }
    }
    
    
    /// create a bunch of these queues and create the entire strucutre
    public init(game: GameModel, constraints: ConstraintsModel) {
        let wordCount = game.wordCount
        
        self.game = game
        self.constraints = constraints
        
        for i in 0..<constraints.maxQueues {
            queues.append(QueueModel(shapes:[], stride:i, scoreMin: constraints.scoresMin[i], totalWords: wordCount))
        }
    }
}
