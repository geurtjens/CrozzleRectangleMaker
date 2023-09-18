//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 16/9/2023.
//

/// We have `expanded a shape` to get a lot of new shapes.  All these shapes come from the same `parent shape` and so are `sibling shapes`.
/// We know that they all can expand the parent and in fact are `different choices for expanding the parent`.
/// So can these different choices also `expand the sibling`
/// Now if `sibling A can expand sibling B` then it follows that `sibling B will expand sibling A` and create a duplicate


import Foundation
public class SiblingMergeCalculator {
    
    
    public static func GetStartingData(gameId: Int) -> (ShapeModel, [ShapeModel], [ShapeModel], [Int], [String], Int, Int, Int, WordIndexModelV2,[[Int]]) {
        let (winningShapes, words, widthMax, heightMax, winningScore, startingShapeId) = StandardSearchAlgorithms.winningsMore(gameId: gameId)
        
        let wordsInt = WordCalculator.WordsToInt(words: words)
        
        let searchShapes = winningShapes
        
        
        let wordIndex = WordIndexModelV2(shapes: searchShapes, wordCount: words.count)
        
        let parentShape = searchShapes[startingShapeId]
        
        
        let scoresMin = StrategyCalculator.GetScoreMins(gameId: gameId)
        
        var childShapes = MergeCalculatorV2.ExecuteDifferentShapesSync(
            sourceShapes: [parentShape],
            searchShapes: searchShapes,
            searchWordIndex: wordIndex,
            sourceMax: 1,
            searchMax: searchShapes.count,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax, heightMax: heightMax)
        
        childShapes.sort { $0.score > $1.score }
        
        
        return (parentShape, childShapes, searchShapes, scoresMin, words, widthMax, heightMax, winningScore, wordIndex, wordsInt)
    }
    
    
    public static func BreadthFirstSearch(gameId: Int, maxLevels: Int = 20, useCalculatedScoresMin: Bool = true, exitWhenHumanScoreFound: Bool = true, maxAllowableSize: Int = 1_500_000) async {
        
        
        
        let startTime = DateTimeCalculator.now()
        
        let (parentShape, childShapes, searchShapes, scoresMin, words, widthMax, heightMax, winningScore, wordIndex, wordsInt) = GetStartingData(gameId: gameId)
        
        var totalNodes = 1 + childShapes.count
        
        var scoresMin2 = scoresMin
        if useCalculatedScoresMin == false {
            scoresMin2 = Array(repeating: 0, count: 40)
        }
        
        let treeNode = TreeNodeModel(parentShape: parentShape, childShapes: childShapes, scoreMax: Int(childShapes[0].score), siblingCount: 0)
        
        print("\nBreadth First Search, gameId: \(gameId), search shapes: \(searchShapes.count), winning score: \(winningScore)")
        print("level: 0, score: \(treeNode.parentShape.score), size: 1")
        print("level: 1, score: \(treeNode.scoreMax), size: \(treeNode.childShapes.count)")
        var previous = [treeNode]
        for i in 2..<maxLevels {
//            let treeNodes = executeAll(treeNodes: previous, searchShapes: searchShapes, words: words, wordsInt: wordsInt, widthMax: widthMax, heightMax: heightMax, wordIndex: wordIndex, scoresMin: scoresMin2)
            var treeNodes = await executeAllParallel(treeNodes: previous, searchShapes: searchShapes, words: words, wordsInt: wordsInt, widthMax: widthMax, heightMax: heightMax, wordIndex: wordIndex, scoresMin: scoresMin2)
            
            treeNodes.sort { $0.scoreMax > $1.scoreMax}
            
            let (treeNodesWithoutDuplicates, duplicateCount) = RemoveDuplicatesCalculator.execute(treeNodes: treeNodes)
            
            totalNodes += treeNodesWithoutDuplicates.count
            
            let size = countLeafs(treeNodes: treeNodesWithoutDuplicates)
            let score = getScoreMax(treeNodes: treeNodesWithoutDuplicates)
            
            previous = treeNodesWithoutDuplicates
            
            if score >= winningScore {
                print("level: \(i), score: \(score), size: \(size), duplicates removed: \(duplicateCount), HUMAN SCORE REACHED for \(gameId)")
                
                if exitWhenHumanScoreFound {
                    let finishTime = DateTimeCalculator.now()
                    print("\(totalNodes) nodes traversed in: \(DateTimeCalculator.duration(start: startTime, finish: finishTime))")
                    return
                }
            }
            print("level: \(i), score: \(score), size: \(size), duplicates removed: \(duplicateCount)")
            
            if size > maxAllowableSize {
                print("size is greater than max size of \(maxAllowableSize) so exiting")
                let finishTime = DateTimeCalculator.now()
                print("\(totalNodes) nodes traversed in: \(DateTimeCalculator.duration(start: startTime, finish: finishTime))")
                return
            }
            
            if size == 0 {
                let finishTime = DateTimeCalculator.now()
                print("\(totalNodes) nodes traversed in: \(DateTimeCalculator.duration(start: startTime, finish: finishTime))")
                return
            }
        }
        let finishTime = DateTimeCalculator.now()
        print("\(totalNodes) nodes traversed in: \(DateTimeCalculator.duration(start: startTime, finish: finishTime))")
    }
    
    
    
    public static func countLeafs(treeNodes: [TreeNodeModel]) -> Int {
        var count = 0
        for item in treeNodes {
            count += item.childShapes.count
        }
        return count
    }
    
    public static func getScoreMax(treeNodes: [TreeNodeModel]) -> Int {
        if treeNodes.count == 0 {
            return 0
        } else {
            return treeNodes[0].scoreMax
        }
    }
    
    public static func executeAll(treeNodes: [TreeNodeModel], searchShapes: [ShapeModel], words: [String], wordsInt: [[Int]], widthMax: Int, heightMax: Int, wordIndex: WordIndexModelV2, scoresMin: [Int]) -> [TreeNodeModel] {
        
        var result: [TreeNodeModel] = []
        
        for treeNode in treeNodes {
            let values = execute(treeNode: treeNode, searchShapes: searchShapes, words: words, wordsInt: wordsInt, widthMax: widthMax, heightMax: heightMax, wordIndex: wordIndex, scoresMin: scoresMin)
            result += values
        }
        
        result.sort { $0.scoreMax > $1.scoreMax}
        return result
    }
    
    
    public static func executeAllParallel(
        treeNodes: [TreeNodeModel],
        searchShapes: [ShapeModel],
        words: [String],
        wordsInt: [[Int]],
        widthMax: Int,
        heightMax: Int,
        wordIndex: WordIndexModelV2,
        scoresMin: [Int]) async -> [TreeNodeModel] {
        
        async let a0 = ExecuteSameShapeOneAsync(
            zeroToNine: 0,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a1 = ExecuteSameShapeOneAsync(
            zeroToNine: 1,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a2 = ExecuteSameShapeOneAsync(
            zeroToNine: 2,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a3 = ExecuteSameShapeOneAsync(
            zeroToNine: 3,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a4 = ExecuteSameShapeOneAsync(
            zeroToNine: 4,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a5 = ExecuteSameShapeOneAsync(
            zeroToNine: 5,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a6 = ExecuteSameShapeOneAsync(
            zeroToNine: 6,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a7 = ExecuteSameShapeOneAsync(
            zeroToNine: 7,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a8 = ExecuteSameShapeOneAsync(
            zeroToNine: 8,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a9 = ExecuteSameShapeOneAsync(
            zeroToNine: 9,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
       
        return await a0 + a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9
    }
    
    public static func ExecuteSameShapeOneAsync(zeroToNine: Int,
                                                treeNodes: [TreeNodeModel],
                                                searchShapes: [ShapeModel],
                                                words: [String],
                                                wordsInt: [[Int]],
                                                widthMax: Int,
                                                heightMax: Int,
                                                wordIndex: WordIndexModelV2,
                                                scoresMin: [Int]) -> [TreeNodeModel] {
        var result:[TreeNodeModel] = []
        
        // The difference is that each cpu works on 0,10,20 .. or 1, 11, 21 and so we divide the task
        for treeNodeId in stride(from: zeroToNine, to:treeNodes.count, by: 10) {
            
            let treeNodes = execute(treeNode: treeNodes[treeNodeId], searchShapes: searchShapes, words: words, wordsInt: wordsInt, widthMax: widthMax, heightMax: heightMax, wordIndex: wordIndex, scoresMin: scoresMin)
            result += treeNodes
            
        }
        return result
    }
    
    
    
    public static func execute(treeNode: TreeNodeModel, searchShapes: [ShapeModel], words: [String], wordsInt: [[Int]], widthMax: Int, heightMax: Int, wordIndex: WordIndexModelV2, scoresMin: [Int]) -> [TreeNodeModel] {
        
        var result: [TreeNodeModel] = []
    
        // These are the shapes that all the siblings have added to become unique siblings
        let leafShapesAddedToBecomeSiblings = getSiblingLastShape(siblings: treeNode.childShapes)
        
        // These are the extra words that the siblings have added
        let wordDifferenceBetweenParentAndSibling = getWordDifferences(parent: treeNode.parentShape, siblings: treeNode.childShapes)
        
        
        // So now we can add the siblings to each other and see if they merge
        // We can check the added words are not the same
        
        var processedQueue: Set<String> = []
        for siblingId in 0..<leafShapesAddedToBecomeSiblings.count {
            
            var resultForShape: [ShapeModel] = []
            
            let sourceShapeId = leafShapesAddedToBecomeSiblings[siblingId]
            let sourceShape = treeNode.childShapes[siblingId]
            let siblingWords = wordDifferenceBetweenParentAndSibling[siblingId]
            
            
            
            // We want to find all the siblings that have different words added than this older sibling (closer to top of list)
            
            
            
            for matchingSiblingId in 0..<leafShapesAddedToBecomeSiblings.count {
                
                let searchShapeId = leafShapesAddedToBecomeSiblings[matchingSiblingId]
                let wordsInMatchingSibling = wordDifferenceBetweenParentAndSibling[matchingSiblingId]
                
                let searchForDuplicates = "\(searchShapeId),\(sourceShapeId)"
                
                if searchShapeId == 57 && sourceShapeId == 10 {
                    print("This should work")
                }
                
                //let differentWords = siblingWords.intersection(wordsInMatchingSibling)
                
                let subsetA = siblingWords.isStrictSubset(of: wordsInMatchingSibling)
                let subsetB = wordsInMatchingSibling.isStrictSubset(of: siblingWords)
                
                if (
                    //matchingSiblingId != siblingId &&
                    subsetA == false && subsetB == false &&
                    processedQueue.contains(searchForDuplicates) == false
                    ) {
                    

                    processedQueue.insert("\(sourceShapeId),\(searchShapeId)")
                        
                    // This means that they have different words and so a merge is possible

                        
                    if let mergedShape = MergeCalculatorV2.mergeTwoShapes(sourceShape: sourceShape, searchShape: searchShapes[searchShapeId], words: words, widthMax: widthMax, heightMax: heightMax) {
                        
                        
                        resultForShape.append(mergedShape)
                    }
                   
                }
            }
            
            
            // Find matches that only link to the new words that this has added
            let instructions = wordIndex.findMatches(containingWords: Array(siblingWords),
                                                     shapesToExclude: leafShapesAddedToBecomeSiblings,
                                                     sourceShape: sourceShape,
                                                     sourceShapeId: sourceShapeId,
                                                     searchShapes: searchShapes)
            
            // ScoresMin is flawed if we want to merge larger shapes together eventually
            // it is the score starting from the beginning not score inbetween or increments to score
            
            
            let extraShapes = MergeCalculatorV2.GetShapesFromInstructions(
                instructions: instructions,
                sourceShape: sourceShape,
                searchShapes: searchShapes,
                words: words,
                wordsInt: wordsInt,
                scoresMin: scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            
            let siblingCount = resultForShape.count
            
            //print(extraShapes.ToTextWithMergeHistory(words: words))
            
            resultForShape += extraShapes
            
            if resultForShape.count > 0 {
                
                resultForShape.sort { $0.score > $1.score }
                
                result.append(TreeNodeModel(parentShape: sourceShape, childShapes: resultForShape, scoreMax: Int(resultForShape[0].score), siblingCount: siblingCount))
            }
        }
        
        result.sort { $0.scoreMax > $1.scoreMax}
        
        return result
    }
    
    public static func getSiblingLastShape(siblings: [ShapeModel]) -> [Int] {
        var result: [Int] = []
        for sibling in siblings {
            result.append(sibling.mergeHistory.last!)
        }
        return result
    }
    public static func getWordDifferences(parent: ShapeModel, siblings: [ShapeModel]) -> [Set<Int>] {
        var result: [Set<Int>] = []
        
        let parentWords = getWordsFromShape(shape: parent)
        
        for sibling in siblings {
            let siblingWords = getWordsFromShape(shape: sibling)
            
            let missingWords = findExtraWords(parent: parentWords, sibling: siblingWords)
            result.append(missingWords)
        }
        return result
    }
    
    public static func findExtraWords(parent: Set<Int>, sibling: Set<Int>) -> Set<Int> {
        let missingWords = sibling.subtracting(parent)
        return missingWords
    }
    
    public static func getWordsFromShape(shape: ShapeModel) -> Set<Int> {
        var result: Set<Int> = []
        for placement in shape.placements {
            result.insert(Int(placement.w))
        }
        return result
    }
    
    
}
