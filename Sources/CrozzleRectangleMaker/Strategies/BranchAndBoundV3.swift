//
//  BranchAndBoundStrategyV2.swift
//
//
//  Created by Michael Geurtjens on 1/9/2023.
//

import Foundation
public class BranchAndBoundV3 {
    
    // called by BranchAndBoundRunner.executeGameAllWords and BranchAndBoundRunner.executeGameWinningWords
    public static func Execute(
        gameId: Int,
        words: [String],
        lookaheadDepth: Int,
        beamWidth: Int,
        maxDepth: Int,
        rootShape: Int,
        rootWidth: Int,
        winningScore: Int,
        useGuidedScores: Bool) async -> ShapeModel?
    {
        /// rootTreeNodes will have the children already populated
        let (_, wordsInt, searchShapes, wordIndex, rootTreeNodes, scoresMin, widthMax, heightMax) = await GetStartingData.Execute(
            gameId: gameId,
            words: words,
            rootShape: rootShape,
            rootWidth: rootWidth,
            useGuidedScores: useGuidedScores)
       
        print("{\"game\": \(gameId), \"lookaheadDepth\": \(lookaheadDepth), \"beamWidth\": \(beamWidth), \"rootShape\": \(rootShape), \"wordCount\": \(words.count), \"searchShapes\": \(searchShapes.count), \"rootTreeNodes\": \(rootTreeNodes.count), \"cycles\": [")
        
        if rootTreeNodes.count == 0 {
            return nil
        }
        
        let bestShapes = await executeCycles(
            gameId: gameId,
            words: words,
            lookaheadDepth: lookaheadDepth,
            beamWidth: beamWidth,
            maxDepth: maxDepth,
            winningScore: winningScore,
            wordsInt: wordsInt,
            searchShapes: searchShapes,
            wordIndex: wordIndex,
            widthMax: widthMax,
            heightMax: heightMax,
            scoresMin: scoresMin,
            rootTreeNodes: rootTreeNodes)
        
        var bestShape = bestShapes[0]
        
        if bestShapes[0].score == winningScore {
            return bestShapes[0]
        }
     
        // If we havent got best score then lets keep going but now dont use the leaf heuristic
        
        for shape in bestShapes {
            
            let shapes = await SiblingMergeCalculator.getAllMatchingShapes(
                wordIndex: wordIndex,
                sourceShape: shape,
                searchShapes: searchShapes,
                words: words,
                wordsInt: wordsInt,
                scoresMin: scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            for shape in shapes {
                //print(shape.ToJson(words: words))
                
                if shape.score > bestShape.score {
                    bestShape = shape
                }
            }
        }
        if bestShape.score >= winningScore {
            print("HUMAN SCORE \(gameId) Calculated at end")
            
        }
        return bestShape
    }
    
    
    // called by executeGame
    public static func executeCycles(
        gameId: Int,
        words: [String],
        lookaheadDepth: Int,
        beamWidth: Int,
        maxDepth: Int,
        winningScore: Int,
        wordsInt: [[Int]],
        searchShapes: [ShapeModel],
        wordIndex: WordIndexModelV2,
        widthMax: Int,
        heightMax: Int,
        scoresMin: [Int],
        rootTreeNodes: [TreeNodeModel]) async -> [ShapeModel]
    {
        let startTime = DateTimeCalculator.now()
        
        var bestShape: ShapeModel = rootTreeNodes[0].parentShape
        
        /// We have to find the child nodes of the first tree node and send them
        var shapesCreatedCount = 0
        var shapesCreated = 0
        
        var treeNodes = rootTreeNodes
        
        var previousNodes = treeNodes
        
        for cycleId in 1..<maxDepth {
            
            // Within each cycle we first get the tree nodes
            treeNodes = await executeTreeNodes(
                treeNodes: treeNodes,
                searchShapes: searchShapes,
                words: words,
                wordsInt: wordsInt,
                widthMax: widthMax,
                heightMax: heightMax,
                wordIndex: wordIndex,
                scoresMin: scoresMin)
            
            shapesCreatedCount = treeNodes.count
            
            for treeNode in treeNodes {
                shapesCreatedCount += treeNode.childShapes.count
            }
            
            
            // Then we do the lookahead and beam thing
            (treeNodes, shapesCreated) = await executeLookaheadAndBeam(
                lookaheadDepth: lookaheadDepth,
                beamWidth: beamWidth,
                treeNodes: treeNodes,
                searchShapes: searchShapes,
                words: words,
                wordsInt: wordsInt,
                widthMax: widthMax,
                heightMax: heightMax,
                wordIndex: wordIndex,
                scoresMin: scoresMin)
                
            shapesCreatedCount += shapesCreated
            
            /// We get to the end of processing but we do not have any answers so maybe we need a previous list and if the list is empty then we go to previous
            if treeNodes.count > 0 {
                previousNodes = treeNodes
            } else {
                /// Now we should get all the children together, remove duplicates and then do the beam restriction thing
                
                var childShapes: [ShapeModel] = []
                for treeNode in previousNodes {
                    for childShape in treeNode.childShapes {
                        childShapes.append(childShape)
                    }
                }
                
                ShapeCalculator.Sort(shapes: &childShapes)
                
                (childShapes, _) = RemoveDuplicatesCalculator.execute(shapes: childShapes)
                
                var bestShapes: [ShapeModel] = []
                var bestScores: [UInt16] = []
                for childShapeId in 0..<childShapes.count {
                    if bestShapes.count < beamWidth {
                        bestShapes.append(childShapes[childShapeId])
                        bestScores.append(childShapes[childShapeId].score)
                    }
                }
                
                
                if bestShape.score < bestShapes[0].score {
                    bestShape = bestShapes[0]
                }
                if FeatureFlags.showGameText {
                    print(bestShape.ToJson(words: words))
                }
                
                if FeatureFlags.showCyclesText {
                    let siblingMerges = TreeNodeCalculator.identifySiblingMerges(
                        treeNodes: treeNodes,
                        minCommonShapes: 1,
                        maxCommonShapes: 2)
                
                    print("{\"cycle\": \(cycleId), \"shapesCreated\": \(shapesCreatedCount), \"bestScores\": \(bestScores), \"merges\": \(siblingMerges)}")
                }
                
                if bestShape.score >= winningScore {
                    print("HUMAN SCORE \(gameId)")
                    print(DateTimeCalculator.duration(start: startTime))
                    return bestShapes
                    
                } else {
                    var bestScoreToday = 0
                    if bestScores.count > 0 {
                        bestScoreToday = Int(bestScores[0])
                    }
                    
                    print("failed: \(gameId), expected: \(winningScore), actualScore: \(bestScoreToday), duration: \(DateTimeCalculator.duration(start: startTime))")
                    
                    return bestShapes
                }
            }
            
            if FeatureFlags.showGameText {
                print(bestShape.ToJson(words: words))
            }
            
            if treeNodes.count > 0 {
                var bestShapes: [ShapeModel] = []
                var bestScores: [UInt16] = []
                for treeNodeId in 0..<treeNodes.count {
                    bestShapes.append(treeNodes[treeNodeId].parentShape)
                }
                (bestShapes, _) = RemoveDuplicatesCalculator.execute(shapes: bestShapes)
                
                for bestShape in bestShapes {
                    bestScores.append(bestShape.score)
                }

                if bestShape.score < bestShapes[0].score {
                    bestShape = bestShapes[0]
                }
                if FeatureFlags.showCyclesText {
                    print("{\"cycle\": \(cycleId), \"shapesCreated\": \(shapesCreatedCount), \"bestScores\": \(bestScores),")
                }
            }
        }
        return []
    }
    
    
    // called by executeLeaf
    public static func executeTreeNodes(
        treeNodes: [TreeNodeModel],
        searchShapes: [ShapeModel],
        words: [String],
        wordsInt: [[Int]],
        widthMax: Int,
        heightMax: Int,
        wordIndex: WordIndexModelV2,
        scoresMin: [Int]) async -> [TreeNodeModel]
    {
        var result: [TreeNodeModel] = []
        
        for treeNode in treeNodes {
            
            let values = await executeTreeNode(
                treeNode: treeNode,
                searchShapes: searchShapes,
                words: words,
                wordsInt: wordsInt,
                widthMax: widthMax,
                heightMax: heightMax,
                wordIndex: wordIndex,
                scoresMin: scoresMin)
            
            result += values
        }
        // We have child decendant that is the winner but when we run this we have no children so it fails
        // So we should somehow check for winner in another way
        TreeNodeCalculator.sortByBestDescendant(treeNodes: &result)
        
        return result
    }
    
    public static func executeTreeNode(
        treeNode: TreeNodeModel,
        searchShapes: [ShapeModel],
        words: [String],
        wordsInt: [[Int]],
        widthMax: Int,
        heightMax: Int,
        wordIndex: WordIndexModelV2,
        scoresMin: [Int]) async -> [TreeNodeModel]
    {
        var result: [TreeNodeModel] = []
    
        // These are the shapes that all the siblings have added to become unique siblings
        let leafShapesAddedToBecomeSiblings = ShapeCalculator.getLastMergeHistoryShapeId(
            shapes: treeNode.childShapes)
        
        // These are the extra words that the siblings have added
        let wordDifferenceBetweenParentAndSibling = ShapeCalculator.getWordDifferences(
            parentShape: treeNode.parentShape,
            childShapes: treeNode.childShapes)
        
        // So now we can add the siblings to each other and see if they merge
        // We can check the added words are not the same
        
        var processedQueue: Set<String> = []
        for siblingId in 0..<leafShapesAddedToBecomeSiblings.count {
            
            var resultForShape: [ShapeModel] = []
            
            let sourceShape = treeNode.childShapes[siblingId]
            let sourceShapeId = leafShapesAddedToBecomeSiblings[siblingId]
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
                        heightMax: heightMax,
                        wordsInt: wordsInt)
                    {
                        resultForShape.append(mergedShape)
                    }
                }
            }
            
            let siblingCount = resultForShape.count
            
            // We might be ignoring the words added by the sibling but is this at the same level I wonder
            
            
            // We are getting the shapes that connect only to the last words that where added to the grid
            let extraShapes = getLeafShapesForLastWordsAddedToCurrentShape(
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
        
        return result
    }
    
    
    // called by executeTreeNode
    public static func getLeafShapesForLastWordsAddedToCurrentShape(
        wordIndex: WordIndexModelV2,
        siblingWords: [Int],
        shapesToExclude: [Int],
        sourceShape: ShapeModel,
        sourceShapeId: Int,
        searchShapes: [ShapeModel],
        words: [String],
        wordsInt: [[Int]],
        scoresMin: [Int],
        widthMax: Int,
        heightMax: Int) -> [ShapeModel]
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
    
    
    /// Takes a list of tree nodes and expands them repeatedly to the lookahead depth
    /// Then using beamWidth returns the top scoring treeNodeModels as calculated at the lookahead depth
    /// called by executeLeaf
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
        scoresMin: [Int]) async -> ([TreeNodeModel],Int)
    {
        var shapesCreatedCount = 0
        
        var treeNodes = treeNodes
        
        for treeNodeId in 0..<treeNodes.count {
            
            let treeNode = treeNodes[treeNodeId]
            
            let (bestShape, shapesCreated) = await getNodesAccordingToLookaheadDepth(
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
        
       TreeNodeCalculator.sortByBestDescendant(treeNodes: &treeNodes)
        
        // The beam width tells us we only want to keep the first Nth elements of the array
        let result = Array(treeNodes.prefix(beamWidth))
        
        return (result, shapesCreatedCount)
    }
    
    
    // Called from executeLookaheadAndBeam
    public static func getNodesAccordingToLookaheadDepth(
        lookaheadDepth: Int,
        treeNode: TreeNodeModel,
        searchShapes: [ShapeModel],
        words: [String],
        wordsInt: [[Int]],
        widthMax: Int,
        heightMax: Int,
        wordIndex: WordIndexModelV2,
        scoresMin: [Int]) async -> (ShapeModel?, Int)
    {
        var treeNodes = [treeNode]
        
        var bestShape: ShapeModel = treeNode.parentShape
            
        let shapesCreated = 0
        
        for _ in 1..<lookaheadDepth {
            
            // repeats this for each lookahead depth
            treeNodes = await executeLevelInParallel(
                treeNodes: treeNodes,
                searchShapes: searchShapes,
                words: words,
                wordsInt: wordsInt,
                widthMax: widthMax,
                heightMax: heightMax,
                wordIndex: wordIndex,
                scoresMin: scoresMin)
            
            //shapesCreated += TreeNodeCalculator.countShapesCreated(treeNodes: treeNodes)
            
            if let currentBestShape = TreeNodeCalculator.getBestShape(treeNodes: treeNodes) {
                if currentBestShape.score > bestShape.score {
                    bestShape = currentBestShape
                }
            }
        }
        // Ok so we have now done our tree nodes to a certain depth
        
        // How big is this max scoring shape?  Do it later
        return (bestShape, shapesCreated)
    }
    
    
    // called by getMaxScoreOfTreeNode
    public static func executeLevelInParallel(
        treeNodes: [TreeNodeModel],
        searchShapes: [ShapeModel],
        words: [String],
        wordsInt: [[Int]],
        widthMax: Int,
        heightMax: Int,
        wordIndex: WordIndexModelV2,
        scoresMin: [Int]) async -> [TreeNodeModel]
    {
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
    
    
    // called from executeLevelInParallel
    public static func executeAsync(
        zeroToNine: Int,
        treeNodes: [TreeNodeModel],
        searchShapes: [ShapeModel],
        words: [String],
        wordsInt: [[Int]],
        widthMax: Int,
        heightMax: Int,
        wordIndex: WordIndexModelV2,
        scoresMin: [Int]) async -> [TreeNodeModel]
    {
        var result: [TreeNodeModel] = []
        
        // The difference is that each cpu works on 0,10,20 .. or 1, 11, 21 and so we divide the task
        for treeNodeId in stride(from: zeroToNine, to:treeNodes.count, by: 10) {
            
            let treeNodes = await executeTreeNode(
                treeNode: treeNodes[treeNodeId],
                searchShapes: searchShapes,
                words: words,
                wordsInt: wordsInt,
                widthMax: widthMax,
                heightMax: heightMax,
                wordIndex: wordIndex,
                scoresMin: scoresMin)
            
            result += treeNodes
        }
        return result
    }
 }
