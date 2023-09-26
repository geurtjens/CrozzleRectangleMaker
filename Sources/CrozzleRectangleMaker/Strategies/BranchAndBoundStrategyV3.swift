//
//  BranchAndBoundStrategyV2.swift
//
//
//  Created by Michael Geurtjens on 1/9/2023.
//

import Foundation
public class BranchAndBoundStrategyV3 {
    
    
    public static func optimizeBeamWidth(games: [Int], lookaheadDepth: Int, maximumDepth: Int, minimumBeamWidth: Int, maximumBeamWidth: Int) async -> [[Int]] {
        
        var lowerWidth = 0
        var upperWidth = 0
        var currentWidth = 0

        var result: [[Int]] = []
        for _ in 0..<maximumBeamWidth+1 {
            result.append([])
        }
        var failures: [Int] = []


        for game in games {
            
            lowerWidth = minimumBeamWidth
            upperWidth = maximumBeamWidth
            
            let lowerWidthShouldFail = await BranchAndBoundStrategyV3.executeGames(
                games: [game],
                depth: lookaheadDepth,
                width: lowerWidth,
                maxDepth: maximumDepth)
            
            let upperWidthShouldSucceed = await BranchAndBoundStrategyV3.executeGames(
                games: [game],
                depth: lookaheadDepth,
                width: upperWidth,
                maxDepth: maximumDepth)
            
            if upperWidthShouldSucceed.count > 0 && lowerWidthShouldFail.count == 0  {
                
                while lowerWidth != upperWidth {
                    
                    currentWidth = Int((Double(lowerWidth) + Double(upperWidth) + 0.5) / 2.0)
                    print ("CURRENT WIDTH: \(currentWidth)")
                    
                    let winnersForCurrent = await BranchAndBoundStrategyV3.executeGames(
                        games: [game],
                        depth: lookaheadDepth,
                        width: currentWidth,
                        maxDepth: maximumDepth)
                    
                    if winnersForCurrent.count == 0 {
                        if lowerWidth == currentWidth {
                            lowerWidth += 1
                            currentWidth = lowerWidth
                        } else {
                            lowerWidth = currentWidth
                        }
                        
                    } else {
                        upperWidth = currentWidth
                    }
                }
                print("FINAL SIZE for : \(game) is \(currentWidth)")
                result[currentWidth].append(game)
            } else {
                failures.append(game)
                print("CANNOT FIND RANGE VALUE FOR \(game) as upperWidthShouldSucceed: \(upperWidthShouldSucceed), lowerWidthShouldFail: \(lowerWidthShouldFail)")
            }
            
        }
        print("Failures because they started out of range: \(failures)")

        for beamWidth in 0..<maximumBeamWidth+1 {
            if result[beamWidth].count > 0 {
                print("branchAndBoundV3_Depth\(lookaheadDepth)_Width\(beamWidth) = \(result[beamWidth])")
            }
        }
        return result
    }
    
    public static func executeGames(games: [Int], depth: Int, width: Int, maxDepth: Int) async -> [Int] {
        
        let startTime = DateTimeCalculator.now()
        
        let gameList = GameList()
        
        var successfulGames: [Int] = []
        print("depth: \(depth), width: \(width), maxDepth: \(maxDepth), games to process: \(games.count)")
        print(games)
        for game in gameList.games {
            if games.contains(game.gameId) {
                
                let bestShape = await execute(
                    gameId: game.gameId,
                    words: game.winningWords,
                    lookaheadDepth: depth,
                    beamWidth: width,
                    repeatTimes: maxDepth,
                    winningScore: game.winningScore)
                
                if bestShape.score >= game.winningScore {
                    successfulGames.append(game.gameId)
                }
            }
        }
        //print(successfulGames)
        print("depth: \(depth), width: \(width), games successful: \(successfulGames.count), time: \(DateTimeCalculator.duration(start: startTime))")
        if successfulGames.count == games.count {
            print("ALL GAMES SUCCEEDED")
            print("FOUND \(successfulGames)")
        } else {
            let missing = Array(Set(games).subtracting(Set(successfulGames))).sorted()
            print("MISSING \(missing)")
            print("FOUND \(successfulGames)")
        }
        return successfulGames
    }
    
    public static func getStartingData(gameId: Int, words: [String]) async -> (Int,[[Int]],[ShapeModel], WordIndexModelV2, TreeNodeModel, [Int], Int, Int, [Int]){
        let game = GameList().getGame(gameId: gameId)!
        
        
        let widthMax = game.maxWidth
        let heightMax = game.maxHeight
        
        let winningScore = game.winningScore
        
        let wordsInt = WordCalculator.WordsToInt(words: words)
        
        let searchShapes = getShapes(gameId: gameId, words: words)
        
        
        var (winningShapes, _, _, _) = WinningShapesCalculatorV1.getShapes(gameId: gameId)
        ShapeCalculator.SortByScoreThenArea(shapes: &winningShapes)
        
        let winningShapeIds = getWinningShapesShapeIds(winningShapes: winningShapes, searchShapes: searchShapes)

        let bestShapePos = winningShapeIds[0]

        
//
//
//
//        if bestShapePos == -1 {
//            searchShapes = [bestShapeExample] + searchShapes
//            bestShapePos = 0
//        }
        
        let startingShape = searchShapes[bestShapePos]
        
        let wordIndex = WordIndexModelV2(shapes: searchShapes, wordCount: words.count)
        
        
        
        
        let scoresMin = StrategyCalculator.GetScoreMins(gameId: gameId)
        
        let sourceShapes = [startingShape]
        
        let childShapes = await MergeCalculatorV2.ExecuteDifferentShapesAsync(
            sourceShapes: sourceShapes,
            searchShapes: searchShapes,
            searchWordIndex: wordIndex,
            sourceMax: sourceShapes.count,
            searchMax: searchShapes.count,
            words: words,
            wordsInt: wordsInt,
            scoresMin: scoresMin,
            widthMax: widthMax,
            heightMax: heightMax)
        
        let (noDuplicates, _) = RemoveDuplicatesCalculator.execute(shapes: childShapes)
        
        let treeNode = TreeNodeModel(
            parentShape: startingShape,
            childShapes: noDuplicates,
            bestDescendant: childShapes[0],
            siblingCount: 0)
        
        
        
        return (winningScore, wordsInt, searchShapes, wordIndex, treeNode, scoresMin, game.maxWidth, game.maxHeight, winningShapeIds)
    }
    
    public static func execute(
        gameId: Int,
        words: [String],
        lookaheadDepth: Int,
        beamWidth: Int,
        repeatTimes: Int,
        winningScore: Int
    ) async -> ShapeModel {
        
        let bestShapes = await executeLeaf(
            gameId: gameId,
            words: words,
            lookaheadDepth: lookaheadDepth,
            beamWidth: beamWidth,
            repeatTimes: repeatTimes,
            winningScore: winningScore)
        
        var bestShape = bestShapes[0]
        if bestShapes[0].score == winningScore {
            return bestShapes[0]
            
        }
     
        let (winningScore, wordsInt, searchShapes, wordIndex, _, scoresMin, widthMax, heightMax, _) = await getStartingData(gameId: gameId, words: words)
        
        // If we havent got best score then lets keep going but now dont use the leaf heuristic
        
        for shape in bestShapes {
            
            let shapes = await SiblingMergeCalculator.getAllMatchingShapes(
                wordIndex: wordIndex,
                sourceShape: shape,
                sourceShapeId: 0,
                searchShapes: searchShapes,
                words: words,
                wordsInt: wordsInt,
                scoresMin: scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            for shape in shapes {
                print(shape.ToString(words: words))
                
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
    
    public static func executeLeaf(
        gameId: Int,
        words: [String],
        lookaheadDepth: Int,
        beamWidth: Int,
        repeatTimes: Int,
        winningScore: Int
    ) async -> [ShapeModel] {
        
        let startTime = DateTimeCalculator.now()
        
        let (winningScore, wordsInt, searchShapes, wordIndex, treeNode, scoresMin, widthMax, heightMax, winningShapeIds) = await getStartingData(gameId: gameId, words: words)
        
        
        var bestShape = treeNode.parentShape
        print(treeNode.parentShape.ToStringExtended(words: words, gameId: gameId, winningScore: winningScore))
        //print(bestShape.mergeHistory)
        
        let requiredShapes = Set(winningShapeIds)
        
        /// We have to find the child nodes of the first tree node and send them
        
        var requiredBeam = 0
        
        var treeNodes = [treeNode]
        var previousNodes = treeNodes
        print("game: \(gameId), lookahead depth: \(lookaheadDepth), beam width: \(beamWidth)")
        for cycleId in 0..<repeatTimes {
            
            treeNodes = SiblingMergeCalculator.executeAll(
                treeNodes: treeNodes,
                searchShapes: searchShapes,
                words: words,
                wordsInt: wordsInt,
                widthMax: widthMax,
                heightMax: heightMax,
                wordIndex: wordIndex,
                scoresMin: scoresMin)
            
            treeNodes = await SiblingMergeCalculator.executeLookaheadAndBeam(
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
                
            /// We get to the end of processing but we do not have any answers so maybe we need a previous list and if the list is empty then we go to previous
            if treeNodes.count > 0 {
                previousNodes = treeNodes
            } else {
                /// We have reached the end so we need to look at the previous nodes children
                
                let firstWinningChildNode = findFirstValidTreeNodeFromChildren(requiredShapes: requiredShapes, treeNodes: previousNodes)
                
                if requiredBeam < firstWinningChildNode {
                    requiredBeam = firstWinningChildNode
                }
                
                
                // Now we should get all the children together, remove duplicates and then do the beam restriction thing
                
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
                
                
                print("cycle: \(cycleId), bestScores: \(bestScores)")
                
                var beamText = "Required beam = \(requiredBeam + 1), actual beam = \(beamWidth)"
                if requiredBeam + 1 < beamWidth {
                    beamText += ", Beam can be improved"
                }
                
                if bestShape.score >= winningScore {
                    if requiredBeam + 1 != -1 && requiredBeam < beamWidth {
                        print(beamText)
                    }
                    print("HUMAN SCORE \(gameId)")
                    print(DateTimeCalculator.duration(start: startTime))
                    return bestShapes
                    
                } else {
                    if requiredBeam + 1 != -1 && requiredBeam < beamWidth {
                        print(beamText)
                    }
                    print("FAILED \(gameId)")
                    print(DateTimeCalculator.duration(start: startTime))
                    return bestShapes
                }
            }
            
            
            /// Find tree node that contains all winning shapes and nothing else.  You can comment this out if you dont need to know
            let firstValidTreeNode = findFirstValidTreeNodeParent(
                requiredShapes: requiredShapes,
                treeNodes: treeNodes)
            
            if firstValidTreeNode == -1 {
                print("No more valid treeNodes")
            } else {
                print(treeNodes[firstValidTreeNode].parentShape.Flip().ToString(words: words))
            }
            
            if requiredBeam < firstValidTreeNode {
                requiredBeam = firstValidTreeNode
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
                var bestShapesWithinBeam: [ShapeModel] = []
                if bestShape.score < bestShapes[0].score {
                    bestShape = bestShapes[0]
                }
                
                
                print("cycle: \(cycleId), winningWidth: \(requiredBeam), bestScores: \(bestScores)")
                
            }
//            let parentTreeNodeBestScore = getBestParentNodeScore(treeNodes: treeNodes)
//            
//            var beamText = "Required beam: \(requiredBeam + 1), actual beam: \(beamWidth)"
//            if requiredBeam + 1 < beamWidth {
//                beamText += ", Beam can be improved"
//            }
//            if requiredBeam == -1 {
//                beamText = "Actual beam: \(beamWidth) cannot calculate winning game"
//            }
//            
//            
//            if parentTreeNodeBestScore >= winningScore {
//                if requiredBeam + 1 != -1 && requiredBeam < beamWidth {
//                    print(beamText)
//                }
//                print("HUMAN SCORE \(gameId)")
//                print(DateTimeCalculator.duration(start: startTime))
//                return bestShapes
//                
//            } else if treeNodes.count == 0 {
//                if requiredBeam + 1 != -1 && requiredBeam < beamWidth {
//                    print(beamText)
//                }
//                print("FAILED \(gameId)")
//                print(DateTimeCalculator.duration(start: startTime))
//                return bestShape
//            }
        }
            
            // Not sure if this is correct, just want it to compile
        return []
    }
    
    public static func getBestParentNodeScore(treeNodes: [TreeNodeModel]) -> UInt16 {
        var result: UInt16 = 0
        for treeNode in treeNodes {
            if treeNode.parentShape.score > result {
                result = treeNode.parentShape.score
            }
        }
        return result
    }
    
    public static func findFirstValidTreeNode(requiredShapes: Set<Int>, treeNodes: [TreeNodeModel]) -> Int
    {
        for i in 0..<treeNodes.count {
            let treeNodeMergeHistory = Set(treeNodes[i].bestDescendant.mergeHistory)
            
            let unrequiredShapes = treeNodeMergeHistory.subtracting(requiredShapes)
            
            if unrequiredShapes.count == 0 {
                return i
            }
        }
        return -1
    }
    
    public static func findFirstValidTreeNodeParent(requiredShapes: Set<Int>, treeNodes: [TreeNodeModel]) -> Int
    {
        for i in 0..<treeNodes.count {
            let treeNodeMergeHistory = Set(treeNodes[i].parentShape.mergeHistory)
            
            let unrequiredShapes = treeNodeMergeHistory.subtracting(requiredShapes)
            
            if unrequiredShapes.count == 0 {
                return i
            }
        }
        return -1
    }
    
    public static func findFirstValidTreeNodeFromChildren(requiredShapes: Set<Int>, treeNodes: [TreeNodeModel]) -> Int
    {
        var result = 9999
        for treeNodeId in 0..<treeNodes.count {
            let treeNode = treeNodes[treeNodeId]
            
            for treeNodeChildId in 0..<treeNode.childShapes.count {
                
                let treeNodeMergeHistory = Set(treeNode.childShapes[treeNodeChildId].mergeHistory)
                
                let unrequiredShapes = treeNodeMergeHistory.subtracting(requiredShapes)
                
                if unrequiredShapes.count == 0 {
                    if result > treeNodeChildId {
                        result = treeNodeChildId
                    }
                }
            }
        }
        
        /// We havent found any so return that there are none here
        if result == 9999 {
            result = -1
        }
        
        return result
    }
            
    public static func getShapes(gameId: Int, words: [String]) -> [ShapeModel] {
        var shapes = WinningShapesAllCalculatorV3.execute(gameId: gameId, words: words)
        ShapeCalculator.SortByScoreThenArea(shapes: &shapes)
        ShapeCalculator.SetMergeHistory(shapes: &shapes)
        return shapes
    }
    public static func getWinningShapesShapeIds(winningShapes: [ShapeModel], searchShapes: [ShapeModel]) -> [Int] {
        
        
        
//        for shape in shapes {
//            print(shape.ToText(words: words))
//        }
        
        
        
        
        var mergeHistory: [Int] = []
        
        for i in 0..<winningShapes.count {
            let shapePos = getShapeBySequence(shapes: searchShapes, sequence: winningShapes[i].wordSequence)
            if shapePos == -1 {
                print("Something wrong, winning shapes are not in searchShapes")
            } else {
                mergeHistory += searchShapes[shapePos].mergeHistory
            }
            
        }
        
        // The mergeHistory is sorted by score and so its not the actual sequence of words.  So order doesnt matter except for choosing the first word
        
        return mergeHistory
    }
    
    public static func getShapeBySequence(shapes: [ShapeModel], sequence: String) -> Int {
        for shapeId in 0..<shapes.count {
            if shapes[shapeId].wordSequence == sequence {
                return shapeId
            }
        }
        return -1
    }
}
