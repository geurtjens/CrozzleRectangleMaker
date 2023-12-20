//
//  BranchAndBoundStrategyV2.swift
//
//
//  Created by Michael Geurtjens on 1/9/2023.
//

import Foundation
public class BranchAndBoundV3 {
     
    public static func optimizeWithStartingWords(
        gameId: Int,
        lookaheadDepth: Int,
        beamWidth: Int,
        maxDepth: Int) async -> ([Int],[Int])
    {
        var beamWidthResults: [Int] = []
        
        let startingWords = await findValidStartingWords(
            gameId: gameId,
            lookaheadDepth: lookaheadDepth,
            beamWidth: beamWidth,
            maxDepth: maxDepth)
        
        
        for startingWord in startingWords {
            let beamWidthResult = await optimizeBeamWidth(
                gameId: gameId,
                lookaheadDepth: lookaheadDepth,
                maxDepth: maxDepth,
                minimumBeamWidth: 1,
                maximumBeamWidth: beamWidth,
                rootWidth: startingWord * -1,
                useGuidedScores: false)
            beamWidthResults.append(beamWidthResult)
            
        }
        
        for i in 0..<beamWidthResults.count {
            print("starting word \(startingWords[i]) has beam width of \(beamWidthResults[i])")
        }
        
        return (startingWords, beamWidthResults)
 
    }
    
    
    
    
    
    public static func findValidStartingWords(
        gameId: Int,
        lookaheadDepth: Int,
        beamWidth: Int,
        maxDepth: Int) async -> [Int]
    {
        
        let winningShapes = getWinningShapes(gameId: gameId)
        var result: [Int] = []
        for i in 0..<winningShapes.count {
            let startingShape = i * -1

            
            // Using the winning words we find all games that are winning in this case there should be only one
            let winning = await executeGamesWinningWords(
                games: [gameId],
                lookaheadDepth: lookaheadDepth,
                beamWidth: beamWidth,
                maxDepth: maxDepth,
                rootWidth: startingShape,
                useGuidedScores: false)
            
            if winning.count == 1 {
                result.append(startingShape)
            }
        }

        return result
    }
    
    public static func optimizeBeamWidth(
        games: [Int],
        lookaheadDepth: Int,
        maxDepth: Int,
        minimumBeamWidth: Int,
        maximumBeamWidth: Int,
        rootWidth: Int,
        useGuidedScores: Bool) async -> [[Int]]
    {
        
        var lowerWidth = 0
        var upperWidth = 0
        var currentWidth = 0

        var result: [[Int]] = []
        for _ in 0..<maximumBeamWidth+1 {
            result.append([])
        }
        var failures: [Int] = []


        for gameId in games {
            
            lowerWidth = minimumBeamWidth
            upperWidth = maximumBeamWidth
            
            let lowerWidthShouldFail = await executeGamesWinningWords(
                games: [gameId],
                lookaheadDepth: lookaheadDepth,
                beamWidth: lowerWidth,
                maxDepth: maxDepth,
                rootWidth: rootWidth,
                useGuidedScores: useGuidedScores)
            
            if lowerWidthShouldFail.count > 0 {
                failures.append(gameId)
                print("game \(gameId) lower width of \(minimumBeamWidth) should not produce a winning game.  Skipping this game.")
                
                
            } else {
            
                let upperWidthShouldSucceed = await executeGamesWinningWords(
                    games: [gameId],
                    lookaheadDepth: lookaheadDepth,
                    beamWidth: upperWidth,
                    maxDepth: maxDepth,
                    rootWidth: rootWidth,
                    useGuidedScores: useGuidedScores)
            
                if upperWidthShouldSucceed.count == 0  
                {
                    failures.append(gameId)
                    print("game \(gameId) upper width of \(maximumBeamWidth) should produce a winning game.  Skipping this game.")
                } else {
                    while lowerWidth != upperWidth {
                        
                        currentWidth = Int((Double(lowerWidth) + Double(upperWidth) + 0.5) / 2.0)
                        print ("GAME: \(gameId), LOWER: \(lowerWidth), UPPER: \(upperWidth), CURRENT WIDTH: \(currentWidth)")
                        
                        let winnersForCurrent = await executeGamesWinningWords(
                            games: [gameId],
                            lookaheadDepth: lookaheadDepth,
                            beamWidth: currentWidth,
                            maxDepth: maxDepth,
                            rootWidth: rootWidth,
                            useGuidedScores: useGuidedScores)
                        
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
                    print("FINAL SIZE for : \(gameId) is \(currentWidth)")
                    result[currentWidth].append(gameId)
                }
            }
        }
        if failures.count > 0 {
            print("Failures because they started out of range: \(failures)")
        }
        
        for beamWidth in 0..<maximumBeamWidth+1 {
            if result[beamWidth].count > 0 {
                print("depth\(lookaheadDepth)_width\(beamWidth) = \(result[beamWidth])")
            }
        }
        return result
    }
    
    
    public static func optimizeBeamWidthAllWords(
        gameId: Int,
        lookaheadDepth: Int,
        maxDepth: Int,
        minimumBeamWidth: Int,
        maximumBeamWidth: Int,
        rootWidth: Int,
        useGuidedScores: Bool) async -> Int
    {
        
        var lowerWidth = 0
        var upperWidth = 0
        var currentWidth = 0


            
        lowerWidth = minimumBeamWidth
        upperWidth = maximumBeamWidth
        
        let lowerWidthShouldFail = await executeGamesAllWords(
            games: [gameId],
            lookaheadDepth: lookaheadDepth,
            beamWidth: lowerWidth,
            maxDepth: maxDepth,
            rootWidth: rootWidth,
            useGuidedScores: useGuidedScores)
        
        if lowerWidthShouldFail.count > 0 {
            
            print("game \(gameId) lower width of \(minimumBeamWidth) should not produce a winning game.  Skipping this game.")
            return -1
            
        } else {
        
            let upperWidthShouldSucceed = await executeGamesAllWords(
                games: [gameId],
                lookaheadDepth: lookaheadDepth,
                beamWidth: upperWidth,
                maxDepth: maxDepth,
                rootWidth: rootWidth,
                useGuidedScores: useGuidedScores)
        
            if upperWidthShouldSucceed.count == 0
            {
                print("game \(gameId) upper width of \(maximumBeamWidth) should produce a winning game.  Skipping this game.")
                return -1
            } else {
                
                while lowerWidth != upperWidth {
                    
                    currentWidth = Int((Double(lowerWidth) + Double(upperWidth) + 0.5) / 2.0)
                    print ("GAME: \(gameId), LOWER: \(lowerWidth), UPPER: \(upperWidth), CURRENT WIDTH: \(currentWidth)")
                    
                    let winnersForCurrent = await executeGamesAllWords(
                        games: [gameId],
                        lookaheadDepth: lookaheadDepth,
                        beamWidth: currentWidth,
                        maxDepth: maxDepth,
                        rootWidth: rootWidth,
                        useGuidedScores: useGuidedScores)
                    
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
                print("FINAL SIZE for : \(gameId) is \(currentWidth)")
                return currentWidth
            }
        }
    }
    
    
    
    
    
    public static func optimizeBeamWidth(
        gameId: Int,
        lookaheadDepth: Int,
        maxDepth: Int,
        minimumBeamWidth: Int,
        maximumBeamWidth: Int,
        rootWidth: Int,
        useGuidedScores: Bool) async -> Int
    {
        
        var lowerWidth = 0
        var upperWidth = 0
        var currentWidth = 0


            
        lowerWidth = minimumBeamWidth
        upperWidth = maximumBeamWidth
        
        let lowerWidthShouldFail = await executeGamesWinningWords(
            games: [gameId],
            lookaheadDepth: lookaheadDepth,
            beamWidth: lowerWidth,
            maxDepth: maxDepth,
            rootWidth: rootWidth,
            useGuidedScores: useGuidedScores)
        
        if lowerWidthShouldFail.count > 0 {
            
            print("game \(gameId) lower width of \(minimumBeamWidth) should not produce a winning game.  Skipping this game.")
            return -1
            
        } else {
        
            let upperWidthShouldSucceed = await executeGamesWinningWords(
                games: [gameId],
                lookaheadDepth: lookaheadDepth,
                beamWidth: upperWidth,
                maxDepth: maxDepth,
                rootWidth: rootWidth,
                useGuidedScores: useGuidedScores)
        
            if upperWidthShouldSucceed.count == 0
            {
                print("game \(gameId) upper width of \(maximumBeamWidth) should produce a winning game.  Skipping this game.")
                return -1
            } else {
                
                while lowerWidth != upperWidth {
                    
                    currentWidth = Int((Double(lowerWidth) + Double(upperWidth) + 0.5) / 2.0)
                    print ("GAME: \(gameId), LOWER: \(lowerWidth), UPPER: \(upperWidth), CURRENT WIDTH: \(currentWidth)")
                    
                    let winnersForCurrent = await executeGamesWinningWords(
                        games: [gameId],
                        lookaheadDepth: lookaheadDepth,
                        beamWidth: lowerWidth,
                        maxDepth: maxDepth,
                        rootWidth: rootWidth,
                        useGuidedScores: useGuidedScores)
                    
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
                print("FINAL SIZE for : \(gameId) is \(currentWidth)")
                return currentWidth
            }
        }
    }
    
    
    public static func executeGamesAllWords(
        games: [Int],
        lookaheadDepth: Int,
        beamWidth: Int,
        maxDepth: Int,
        rootWidth: Int,
        useGuidedScores: Bool) async -> [Int]
    {
        
        let startTime = DateTimeCalculator.now()
        
        let gameList = GameList()
        
        var successfulGames: [Int] = []
        print("\"lookaheadDepth\": \(lookaheadDepth), \"beamWidth\": \(beamWidth), \"rootWidth\": \(rootWidth), \"maxDepth\": \(maxDepth), \"games\": \(games.count)")
        print(games)
        for game in gameList.games {
            if games.contains(game.gameId) {
                
                let bestShape = await executeGame(
                    gameId: game.gameId,
                    words: game.words,
                    lookaheadDepth: lookaheadDepth,
                    beamWidth: beamWidth,
                    maxDepth: maxDepth,
                    rootWidth: rootWidth,
                    winningScore: game.winningScore,
                    useGuidedScores: useGuidedScores)
                
                if bestShape.score >= game.winningScore {
                    successfulGames.append(game.gameId)
                }
            }
        }
        //print(successfulGames)
        print("\"lookaheadDepth\": \(lookaheadDepth), \"beamWidth\": \(beamWidth), \"successes\": \(successfulGames.count), \"time\": \"\(DateTimeCalculator.duration(start: startTime))\"")
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
    
    
    /// Executes all games according to the parameters give
    /// - Parameters:
    ///   - games: An array of game id's that we want to process with the given parameters
    ///   - lookaheadDepth: How deep we want to go down before deciding if that option is good
    ///   - beamWidth: The top K shapes that we will continue with according to beam search algorithm
    ///   - maxDepth: Maximum number of nodes down from the starting node to the last node visited
    ///   - rootWidth: how many shapes are included when we first begin
    ///   - useGuidedScores: limit the scores to what the human winning score was when it started with the highest scoring shape.  So it has a score for each number of words
    /// - Returns: list of game id's have have been solved, that is that we get human winning score
    public static func executeGamesWinningWords(
        games: [Int],
        lookaheadDepth: Int,
        beamWidth: Int,
        maxDepth: Int,
        rootWidth: Int,
        useGuidedScores: Bool) async -> [Int]
    {
        
        let startTime = DateTimeCalculator.now()
        
        let gameList = GameList()
        
        var successfulGames: [Int] = []
        print("{\"lookaheadDepth\": \(lookaheadDepth), \"beamWidth\": \(beamWidth), \"rootWidth\": \(rootWidth), \"maxDepth\": \(maxDepth), \"games\": \(games.count)")
        print(games)
        for game in gameList.games {
            if games.contains(game.gameId) {
                
                let bestShape = await executeGame(
                    gameId: game.gameId,
                    words: game.winningWords,
                    lookaheadDepth: lookaheadDepth,
                    beamWidth: beamWidth,
                    maxDepth: maxDepth,
                    rootWidth: rootWidth,
                    winningScore: game.winningScore,
                    useGuidedScores: useGuidedScores)
                
                if bestShape.score >= game.winningScore {
                    successfulGames.append(game.gameId)
                }
            }
        }
        //print(successfulGames)
        print("\"lookaheadDepth\": \(lookaheadDepth), \"beamWidth\": \(beamWidth), \"successes\": \(successfulGames.count), \"time\": \"\(DateTimeCalculator.duration(start: startTime))\"")
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
    
    /// Get the starting shapes and parameters for the game
    /// - Parameters:
    ///   - gameId: game identifier which tells us the widthMax and heightMax etc
    ///   - words: words used in the puzzle
    ///   - rootWidth: when a positive number it gets the best `rootWidth` number of winning games.  But if its 0 or -1 then it is repurposed to be an exact winning shape so 0 is the same as rootWidth of 1 but -1 will start with a starting shape of winningShapes[1] for example
    ///   - useGuidedScores: guided scores can be turned off if you dont want to start with the highest scoring winning shape
    /// - Returns: lots of data used by the calculation
    public static func getStartingData(
        gameId: Int,
        words: [String],
        rootWidth: Int,
        useGuidedScores: Bool) async -> (Int,[[Int]],[ShapeModel], WordIndexModelV2, [TreeNodeModel], [Int], Int, Int)
    {
        
        /// Get game parameters of widthMax, heightMax, winningScore
        let game = GameList().getGame(gameId: gameId)!
        
        let widthMax = game.widthMax
        let heightMax = game.heightMax
        let winningScore = game.winningScore
        
        let wordsInt = WordCalculator.WordsToInt(words: words)
        
        /// Returns `searchShapes` which have `mergeHistories`
        let searchShapes = await getSearchShapes(gameId: gameId, words: words)
        
        var winningShapes = getWinningShapes(gameId: gameId)
        
        ShapeCalculator.setMergeHistories(
            shapes: &winningShapes,
            referenceShapes: searchShapes)
        
        //let winningShapeIds = ShapeCalculator.getLastMergeHistoryShapeId(shapes: winningShapes)
        
        var startingShapes: [ShapeModel] = []
        
        if rootWidth > 0 {
            for i in 0..<rootWidth {
                if i < winningShapes.count {
                    startingShapes.append(winningShapes[i])
                }
            }
        } else if rootWidth < 0 {
            let startingShapeIndex = rootWidth * -1
            startingShapes.append(winningShapes[startingShapeIndex])
        } else {
            startingShapes.append(winningShapes[0])
            // and we want to print all starting shapes so we can get the appropriate index
            for i in 0..<winningShapes.count {
                print(i)
                print(winningShapes[i].ToJson(words: words))
            }
        }
        
        let wordIndex = WordIndexModelV2(shapes: searchShapes, wordCount: words.count)
        
        var scoresMin = StrategyCalculator.GetScoreMins(gameId: gameId)
        if useGuidedScores == false {
            scoresMin = Array(repeating: 0, count: 40)
        }
        
        var treeNodes: [TreeNodeModel] = []
        
        for startingShapeId in 0..<startingShapes.count {
            
            let childShapes = await MergeCalculatorV2.ExecuteDifferentShapesAsync(
                sourceShapes: [startingShapes[startingShapeId]],
                searchShapes: searchShapes,
                searchWordIndex: wordIndex,
                sourceMax: 1,
                searchMax: searchShapes.count,
                words: words,
                wordsInt: wordsInt,
                scoresMin: scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            let (noDuplicates, _) = RemoveDuplicatesCalculator.execute(
                shapes: childShapes)
            
            let treeNode = TreeNodeModel(
                parentShape: startingShapes[startingShapeId],
                childShapes: noDuplicates,
                bestDescendant: childShapes[0],
                siblingCount: 0)
            
            treeNodes.append(treeNode)
        }
        
        
        return (winningScore, wordsInt, searchShapes, wordIndex, treeNodes, scoresMin, widthMax, heightMax)
    }
    
    
    public static func executeGame(
        gameId: Int,
        words: [String],
        lookaheadDepth: Int,
        beamWidth: Int,
        maxDepth: Int,
        rootWidth: Int,
        winningScore: Int,
        useGuidedScores: Bool) async -> ShapeModel
    {
        
        let (_, wordsInt, searchShapes, wordIndex, rootTreeNodes, scoresMin, widthMax, heightMax) = await getStartingData(
            gameId: gameId,
            words: words,
            rootWidth: rootWidth,
            useGuidedScores: useGuidedScores)
       
        
        
        
        print("{\"game\": \(gameId), \"wordCount\": \(words.count), \"searchShapes\": \(searchShapes.count), \"lookaheadDepth\": \(lookaheadDepth), \"beamWidth\": \(beamWidth), \"rootWidth\": \(rootWidth), \"maxDepth\": \(maxDepth), \"cycles\": [")
        
        let bestShapes = await executeLeaf(
            gameId: gameId,
            words: words,
            lookaheadDepth: lookaheadDepth,
            beamWidth: beamWidth,
            maxDepth: maxDepth,
            rootWidth: rootWidth,
            winningScore: winningScore,
            useGuidedScores: useGuidedScores,
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
                sourceShapeId: 0,
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
    
    
    public static func executeLeaf(
        gameId: Int,
        words: [String],
        lookaheadDepth: Int,
        beamWidth: Int,
        maxDepth: Int,
        rootWidth: Int,
        winningScore: Int,
        useGuidedScores: Bool,
    
        wordsInt: [[Int]], 
        searchShapes: [ShapeModel],
        wordIndex: WordIndexModelV2,
        widthMax: Int,
        heightMax: Int,
        scoresMin: [Int],
        rootTreeNodes: [TreeNodeModel]
        
        
        //searchShapes, wordIndex, treeNodes, scoresMin,
    
    
    
    ) async -> [ShapeModel]
    {
        
        let startTime = DateTimeCalculator.now()
        
         
        var bestShape: ShapeModel = rootTreeNodes[0].parentShape
        
        //print(bestShape.ToJson(words: words))
        
        //let requiredShapes = Set(winningShapeIds)
        
        /// We have to find the child nodes of the first tree node and send them
        
        var shapesCreatedCount = 0
        var shapesCreated = 0
        
        var treeNodes = rootTreeNodes
        
        var previousNodes = treeNodes
        
        for cycleId in 0..<maxDepth {
            
            shapesCreatedCount = 0
            treeNodes = await executeAll(
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
                
                print(bestShape.ToJson(words: words))
                let siblingMerges = TreeNodeCalculator.identifySiblingMerges(
                    treeNodes: treeNodes,
                    minCommonShapes: 1,
                    maxCommonShapes: 2)
                
                print("{\"cycle\": \(cycleId), \"shapesCreated\": \(shapesCreatedCount), \"bestScores\": \(bestScores), \"merges\": \(siblingMerges)}")
                
                
                
                
                if bestShape.score >= winningScore {
                    print("HUMAN SCORE \(gameId)")
                    print(DateTimeCalculator.duration(start: startTime))
                    return bestShapes
                    
                } else {
                    print("FAILED \(gameId)")
                    print(DateTimeCalculator.duration(start: startTime))
                    return bestShapes
                }
            }
            
            
           
            print(bestShape.ToJson(words: words))
          
            
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
                
                let siblingMerges:[(Int,Int,[Int])] = []
            
                print("{\"cycle\": \(cycleId), \"shapesCreated\": \(shapesCreatedCount), \"bestScores\": \(bestScores), \"merges\": \(siblingMerges),")
                
            }
        }
        return []
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
        scoresMin: [Int]) async -> ([TreeNodeModel],Int)
    {
        
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
        

        
        let result = TreeNodeCalculator.applyBeamWidth(treeNodes: treeNodes, beamWidth: beamWidth)
        
//        for node in result {
//            print(node.parentShape.Flip().ToJson(words: words))
//            print(node.parentShape.mergeHistory)
//        }
        
        return (result, shapesCreatedCount)
    }
    
    
    public static func executeTreeNode(
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
            
//            if resultForShape.count == 0 {
//                
//                if deadEndCanJump {
//                    //print("deadEndCanJump == true")
//                    resultForShape = await MergeCalculatorV2.ExecuteDifferentShapesAsync(
//                        sourceShapes: [sourceShape],
//                        searchShapes: searchShapes,
//                        searchWordIndex: wordIndex,
//                        sourceMax: 1,
//                        searchMax: searchShapes.count,
//                        words: words,
//                        wordsInt: wordsInt,
//                        scoresMin: scoresMin,
//                        widthMax: widthMax,
//                        heightMax: heightMax)
//                    (resultForShape, _) = RemoveDuplicatesCalculator.execute(shapes: resultForShape)
//                }
//            }
            
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
        
        return result
    }
    
    
    public static func getLeafShapes(
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
    
    
    public static func executeAsync(
        zeroToNine: Int,
        treeNodes: [TreeNodeModel],
        searchShapes: [ShapeModel],
        words: [String],
        wordsInt: [[Int]],
        widthMax: Int,
        heightMax: Int,
        wordIndex: WordIndexModelV2,
        scoresMin: [Int]) -> [TreeNodeModel]
    {
        
        var result:[TreeNodeModel] = []
        
        // The difference is that each cpu works on 0,10,20 .. or 1, 11, 21 and so we divide the task
        for treeNodeId in stride(from: zeroToNine, to:treeNodes.count, by: 10) {
            
            let treeNodes = executeTreeNode(
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
    
    
    public static func getMaxScoreOfTreeNode(
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
    
    
    public static func executeAll(
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
            
            let values = executeTreeNode(
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
    
    
            
    public static func getSearchShapes(
        gameId: Int,
        words: [String]) async -> [ShapeModel]
    {
        var shapes = await WinningShapesAllCalculatorV3Async.execute(
            gameId: gameId,
            words: words)
        
        ShapeCalculator.SortByScoreThenArea(
            shapes: &shapes)
        
        ShapeCalculator.setMergeHistory(
            shapes: &shapes)
        
        return shapes
    }
    
    public static func getWinningShapes(gameId: Int) -> [ShapeModel] {
        var (winningShapes, _, _, _) = WinningShapesCalculatorV1.getShapes(gameId: gameId)
        
        ShapeCalculator.SortByScoreThenArea(shapes: &winningShapes)
        
        return winningShapes
    }
    
    
    
    
    
    
    
}
