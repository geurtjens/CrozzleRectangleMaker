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
    
    
    
    
    
    
    public static func countLeafs(treeNodes: [TreeNodeModel]) -> Int {
        var count = 0
        for item in treeNodes {
            count += item.childShapes.count
        }
        return count
    }
    
    public static func getBestShape(treeNodes: [TreeNodeModel]) -> ShapeModel? {
        
        if treeNodes.count == 0 {
            return nil
        } else {
            return treeNodes[0].bestDescendant
        }
    }
    
    public static func getBestScore(treeNodes: [TreeNodeModel]) -> Int {
        
        if treeNodes.count == 0 {
            return 0
        } else {
            return Int(treeNodes[0].bestDescendant.score)
        }
    }
    
    public static func executeAll(treeNodes: [TreeNodeModel], searchShapes: [ShapeModel], words: [String], wordsInt: [[Int]], widthMax: Int, heightMax: Int, wordIndex: WordIndexModelV2, scoresMin: [Int]) -> [TreeNodeModel] {
        
        var result: [TreeNodeModel] = []
        
        for treeNode in treeNodes {
            let values = execute(treeNode: treeNode, searchShapes: searchShapes, words: words, wordsInt: wordsInt, widthMax: widthMax, heightMax: heightMax, wordIndex: wordIndex, scoresMin: scoresMin)
            result += values
        }
        // We have child decendant that is the winner but when we run this we have no children so it fails
        // So we should somehow check for winner in another way
        TreeNodeCalculator.sortByBestDescendant(treeNodes: &result)
        
        return result
    }
    
    /// Takes a list of tree nodes and expands them repeatedly to the lookahead depth
    /// Then using beamWidth returns the top scoring treeNodeModels as calculated at the lookahead depth
    public static func executeLookaheadAndBeam(
        lookaheadDepth: Int,
        beamWidth: Int,
        treeNodes: [TreeNodeModel],
        searchShapes: [ShapeModel],
        words: [String],
        wordsInt: [[Int]],
        widthMax: Int,
        heightMax: Int,
        wordIndex: WordIndexModelV2,
        scoresMin: [Int]
    ) async -> ([TreeNodeModel],Int) {
        
        var shapesCreatedCount = 0
        
        var treeNodes = treeNodes
        
        for treeNodeId in 0..<treeNodes.count {
            
            let treeNode = treeNodes[treeNodeId]
            
            let (bestShape, shapesCreated) = await getMaxScoreOfTreeNode(
                lookaheadDepth: lookaheadDepth,
                treeNode: treeNode,
                searchShapes: searchShapes,
                words: words,
                wordsInt: wordsInt,
                widthMax: widthMax,
                heightMax: heightMax,
                wordIndex: wordIndex,
                scoresMin: scoresMin)
            
            
            if bestShape != nil {
                treeNodes[treeNodeId].bestDescendant = bestShape!
            }
            shapesCreatedCount += shapesCreated

        }
        
        // We remove tree nodes if their descendants do not have a greater score than them
//        treeNodes = treeNodes.filter { $0.bestDescendant.score != $0.parentShape.score}
//
        TreeNodeCalculator.sortByBestDescendant(treeNodes: &treeNodes)
        

        
        let result = applyBeamWidth(treeNodes: treeNodes, beamWidth: beamWidth)
        return (result, shapesCreatedCount)
    }
    
    
    public static func applyBeamWidth(treeNodes: [TreeNodeModel], beamWidth: Int) -> [TreeNodeModel] {
        var result: [TreeNodeModel] = []
        for treeNodeId in 0..<beamWidth {
            if treeNodeId < treeNodes.count {
                result.append(treeNodes[treeNodeId])
            }
        }
        return result
    }
    
    
    public static func getMaxScoreOfTreeNode(
        lookaheadDepth: Int,
        treeNode: TreeNodeModel,
        searchShapes: [ShapeModel],
        words: [String],
        wordsInt: [[Int]],
        widthMax: Int,
        heightMax: Int,
        wordIndex: WordIndexModelV2,
        scoresMin: [Int]
    ) async -> (ShapeModel?, Int) {
            
        var treeNodes = [treeNode]
        
        var bestShape: ShapeModel = treeNode.parentShape
            
        var shapesCreated = 0
        
        for _ in 1..<lookaheadDepth {
            //print("Looked ahead: \(i)")
                
            
            
            treeNodes = await executeLevelInParallel(
                treeNodes: treeNodes,
                searchShapes: searchShapes,
                words: words,
                wordsInt: wordsInt,
                widthMax: widthMax,
                heightMax: heightMax,
                wordIndex: wordIndex,
                scoresMin: scoresMin)
            
            shapesCreated += treeNodes.count
            for treeNode in treeNodes {
                shapesCreated += treeNode.childShapes.count
            }
            
            if let currentBestShape = getBestShape(treeNodes: treeNodes) {
                if currentBestShape.score > bestShape.score {
                    bestShape = currentBestShape
                }
            }
        }
        // Ok so we have now done our tree nodes to a certain depth
        
        // How big is this max scoring shape?  Do it later
        return (bestShape, shapesCreated)
    }
    
    public static func executeAsync(
        zeroToNine: Int,
        treeNodes: [TreeNodeModel],
        searchShapes: [ShapeModel],
        words: [String],
        wordsInt: [[Int]],
        widthMax: Int,
        heightMax: Int,
        wordIndex: WordIndexModelV2,
        scoresMin: [Int]
    ) -> [TreeNodeModel] {
        
        var result:[TreeNodeModel] = []
        
        // The difference is that each cpu works on 0,10,20 .. or 1, 11, 21 and so we divide the task
        for treeNodeId in stride(from: zeroToNine, to:treeNodes.count, by: 10) {
            
            let treeNodes = SiblingMergeCalculator.execute(treeNode: treeNodes[treeNodeId], searchShapes: searchShapes, words: words, wordsInt: wordsInt, widthMax: widthMax, heightMax: heightMax, wordIndex: wordIndex, scoresMin: scoresMin)
            result += treeNodes
            
        }
        return result
    }
    
    public static func executeLevelInParallel(
        treeNodes: [TreeNodeModel],
        searchShapes: [ShapeModel],
        words: [String],
        wordsInt: [[Int]],
        widthMax: Int,
        heightMax: Int,
        wordIndex: WordIndexModelV2,
        scoresMin: [Int]) async -> [TreeNodeModel] {
        
        async let a0 = executeAsync(
            zeroToNine: 0,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a1 = executeAsync(
            zeroToNine: 1,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a2 = executeAsync(
            zeroToNine: 2,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a3 = executeAsync(
            zeroToNine: 3,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a4 = executeAsync(
            zeroToNine: 4,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a5 = executeAsync(
            zeroToNine: 5,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a6 = executeAsync(
            zeroToNine: 6,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a7 = executeAsync(
            zeroToNine: 7,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a8 = executeAsync(
            zeroToNine: 8,
            treeNodes: treeNodes,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            widthMax: widthMax,
            heightMax: heightMax,
            wordIndex: wordIndex,
            scoresMin: scoresMin)
        
        async let a9 = executeAsync(
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
    
    public static func execute(
        treeNode: TreeNodeModel,
        searchShapes: [ShapeModel],
        words: [String],
        wordsInt: [[Int]],
        widthMax: Int,
        heightMax: Int,
        wordIndex: WordIndexModelV2,
        scoresMin: [Int]) -> [TreeNodeModel]
    {
        
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
                
                let subsetA = siblingWords.isStrictSubset(of: wordsInMatchingSibling)
                let subsetB = wordsInMatchingSibling.isStrictSubset(of: siblingWords)
                
                if (matchingSiblingId != siblingId &&
                    subsetA == false && subsetB == false &&
                    processedQueue.contains(searchForDuplicates) == false
                    )
                {
                    processedQueue.insert("\(sourceShapeId),\(searchShapeId)")
                        
                    // This means that they have different words and so a merge is possible
                    if let mergedShape = MergeCalculatorV2.mergeTwoShapes(
                        sourceShape: sourceShape,
                        searchShape: searchShapes[searchShapeId],
                        words: words,
                        widthMax: widthMax,
                        heightMax: heightMax)
                    {
                        resultForShape.append(mergedShape)
                    }
                }
            }
            
            let siblingCount = resultForShape.count
            
            // We might be ignoring the words added by the sibling but is this at the same level I wonder
            
            
            // We are getting the shapes that connect only to the last words that where added to the grid
            let extraShapes = getLeafShapes(
                wordIndex: wordIndex,
                siblingWords: Array(siblingWords),
                shapesToExclude: leafShapesAddedToBecomeSiblings,
                sourceShape: sourceShape,
                sourceShapeId: sourceShapeId,
                searchShapes: searchShapes,
                words: words,
                wordsInt: wordsInt,
                scoresMin: scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
                
            resultForShape += extraShapes
            
//            var newShapesWithDuplicates = await getAllMatchingShapes(
//                    wordIndex: wordIndex,
//                    siblingWords: Array(siblingWords),
//                    shapesToExclude: leafShapesAddedToBecomeSiblings,
//                    sourceShape: sourceShape,
//                    sourceShapeId: sourceShapeId,
//                    searchShapes: searchShapes,
//                    words: words,
//                    wordsInt: wordsInt,
//                    scoresMin: scoresMin,
//                    widthMax: widthMax,
//                    heightMax: heightMax)
//            resultForShape += newShapesWithDuplicates
//            (resultForShape, _) = RemoveDuplicatesCalculator.execute(shapes: resultForShape)

            
            
            
            
            
            if resultForShape.count > 0 {
                
                resultForShape.sort {
                    if $0.score == $1.score {
                        return $0.area < $1.area
                    } else {
                        return $0.score > $1.score
                    }
                }
                
                result.append(TreeNodeModel(
                    parentShape: sourceShape,
                    childShapes: resultForShape,
                    bestDescendant: resultForShape[0],
                    siblingCount: siblingCount)
                )
            }
        }
        
        TreeNodeCalculator.sortByBestDescendant(treeNodes: &result)
// Given we are going down to the end now we want any descendants of the tree, doesnt have to be max depth anymore
        
        return result
    }
    
    
    public static func getAllMatchingShapes(
        wordIndex: WordIndexModelV2,
        sourceShape: ShapeModel,
        sourceShapeId: Int,
        searchShapes: [ShapeModel],
        words: [String],
        wordsInt: [[Int]],
        scoresMin: [Int],
        widthMax: Int,
        heightMax: Int) async -> [ShapeModel]
    {
        var bestShape = sourceShape
        let newShapes = await MergeCalculatorV2.ExecuteDifferentShapesAsync(
            sourceShapes: [sourceShape],
            searchShapes: searchShapes,
            searchWordIndex: wordIndex,
            sourceMax: 1,
            searchMax: searchShapes.count,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        for newShape in newShapes {
            if bestShape.score < newShape.score {
                bestShape = newShape
            }
        }
        
        
        return newShapes
    }
    
    public static func getLeafShapes(wordIndex: WordIndexModelV2, siblingWords: [Int], shapesToExclude: [Int], sourceShape: ShapeModel, sourceShapeId: Int, searchShapes: [ShapeModel], words: [String], wordsInt: [[Int]], scoresMin: [Int], widthMax: Int, heightMax: Int) -> [ShapeModel]
    {
        // Find matches that only link to the new words that this has added
        let instructions = wordIndex.findMatches(
            containingWords: siblingWords,
            shapesToExclude: shapesToExclude,
            sourceShape: sourceShape,
            sourceShapeId: sourceShapeId,
            searchShapes: searchShapes)
        
        // ScoresMin is flawed if we want to merge larger shapes together eventually
        // it is the score starting from the beginning not score inbetween or increments to score
        
        
        let leafShapes = MergeCalculatorV2.GetShapesFromInstructions(
            instructions: instructions,
            sourceShape: sourceShape,
            searchShapes: searchShapes,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        return leafShapes
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
