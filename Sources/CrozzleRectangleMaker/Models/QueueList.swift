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
            
            
            //2744 true  4,5,9,0,8,6,3,0,1
            //*********************
            //2745 true  4,5,9,0,8,6,3,0,1
            //*********************
            //2746 true  4,5,9,0,8,6,3,0,1
            //*********************
            //2747 true  4,5,9,0,8,6,3,0,1
            //*********************
            //2748 true  4,7,11,0,6,8,5,1,0

            self.queues[wordCount].add(newShapes: shapes, constraints: self.constraints, words: game.words)

//            let filteredShapes = shapes.filter { $0.score >= self.queues[wordCount].scoreMin }
//
//            self.queues[wordCount].shapes += filteredShapes
//
//            ShapeCalculator.SortWithWordSequence(shapes: &self.queues[wordCount].shapes)
//
//            // it should find 203 duplicates but found only 142 duplicates
//            let duplicates = RemoveDuplicatesCalculator.findDuplicates(shapes: &self.queues[wordCount].shapes)
//
//            //RemoveDuplicatesCalculator.printDuplicateSpread(shapes: self.queues[wordCount].shapes)
//            if duplicates > 0 {
//                //let duplicateList = self.queues[wordCount].shapes.filter { $0.isValid == false}
//                //for duplicate in duplicateList {
//                    //print(ShapeCalculator.ToText(shape:duplicate, words: self.game.words).1)
//                    //print(ShapeCalculator.ToText(shape:duplicate, words: self.game.words).0)
//                //}
//                self.queues[wordCount].shapes = self.queues[wordCount].shapes.filter { $0.isValid}
//            }
//
//            switch (self.constraints.priorityFunction) {
//            case .score_area:
//                ShapeCalculator.SortByScoreThenArea(shapes: &self.queues[wordCount].shapes)
//            case .density_score:
//                ShapeCalculator.SortByDensityThenScore(shapes: &self.queues[wordCount].shapes)
//            }
//
//            if self.queues[wordCount].shapes.count > constraints.queueLengthMax {
//                self.queues[wordCount].shapes.removeSubrange(constraints.queueLengthMax..<self.queues[wordCount].shapes.count)
//            }
//
//            self.queues[wordCount].gpuShapes = GpuShapeModel(
//                        shapes:self.queues[wordCount].shapes,
//                        totalWords: self.queues[wordCount].totalWords,
//                        stride: self.queues[wordCount].stride)
//
//            self.queues[wordCount].wordIndex = WordIndexCalculator.createWordIndex(
//                totalWords: self.queues[wordCount].totalWords,
//                stride: self.queues[wordCount].stride,
//                shapeCount: self.queues[wordCount].gpuShapes.count,
//                words: self.queues[wordCount].gpuShapes.wordId)
//
//            if self.recalculateStatisticsWhenAddingToQueue == true {
//                self.queues[wordCount].statistics = StatisticsCalculator.Execute(scores: self.queues[wordCount].gpuShapes.scores)
//            }
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
    
    public mutating func mergeWithItselfAsync(index wordCount: Int) async {
            
        let shapes = await ExecuteMergeCalculator.ExecuteSameShapeAsync(
                shapes: self.queues[wordCount].gpuShapes,
                wordIndex: self.queues[wordCount].wordIndex,
                words: self.game.words,
                scoresMin: self.constraints.scoresMin,
                widthMax: self.game.maxWidth,
                heightMax: self.game.maxHeight)
        
        if shapes.count > 0 {
            add(shapes: shapes)
        }
    }
    
    
    public mutating func mergeWithItselfAll() async {
        for i in 0..<self.queues.count {
            if self.queues[i].shapes.count > 0 {
                
                let startNano = DispatchTime.now()
                
                //print(self.queues[i].shapes[0].ToString(words:self.game.words))
                StrategyCalculator.printDate("mergeWithItselfAsync(index: \(i)) started at")
                await mergeWithItselfAsync(index:i)
                let finishNano = DispatchTime.now()
                
                let durationNano = finishNano.uptimeNanoseconds - startNano.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
                let durationSeconds = Double(durationNano) / 1_000_000_000
                StrategyCalculator.printDate("mergeWithItselfAsync(index: \(i)) took \(durationSeconds) seconds and finished at")
                let (_, _) = self.status()
            }
        }
    }
    
    public mutating func mergeEverythingBelowWith(index: Int) async {
        
        for i in 0..<index {
            if self.queues[i].shapes.count > 0 {
                //print(self.queues[i].shapes[0].ToString(words:self.game.words))
                
                await mergeTwoAsync(mergeIndex: i, withIndex: index)
                //let bestShape = getBestShape()
                //print(bestShape)
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
    
    public mutating func mergeWithItselfAsync(index wordCount: Int, notTheseWordCounts:[Int]) async {
            
        let shapes = await ExecuteMergeCalculator.ExecuteSameShapeAsync(
                shapes: self.queues[wordCount].gpuShapes,
                wordIndex: self.queues[wordCount].wordIndex,
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
            
            add(shapes: shapes)
        }
    }
    
    /// Perform the merge on yourself but do not let the `notTheseWordCounts` count of words to be included.  So merge 3 words with 3 words and ignore the 4 word, only include the 5 word shapes
    public mutating func mergeWithItselfAsync(
        wordCount: Int,
        words: [String],
        scoresMin:[Int],
        widthMax: Int,
        heightMax: Int,
        notTheseWordCounts:[Int]) async {
            
        let shapes = await ExecuteMergeCalculator.ExecuteSameShapeAsync(
            shapes: self.queues[wordCount].gpuShapes,
            wordIndex: self.queues[wordCount].wordIndex,
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
    
    public mutating func mergeTwoAsync(
        mergeIndex: Int,
        withIndex mergeIndex2: Int) async {
        let shapes = await ExecuteMergeCalculator.ExecuteDifferentShapesAsync(
            source: self.queues[mergeIndex].gpuShapes,
            search: self.queues[mergeIndex2].gpuShapes,
            searchWordIndex: self.queues[mergeIndex2].wordIndex,
            words: self.game.words,
            scoresMin: self.constraints.scoresMin,
            widthMax: self.game.maxWidth,
            heightMax: self.game.maxHeight)

        if shapes.count > 0 {
            add(shapes: shapes)
        }
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
