//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 12/7/2023.
//

import Foundation
public class MutationCalculator {
    
    
    
    public static func generateFiles() {
        let gameIds15x10 = [
            8702, 8703, 8705, 8803, 8804, 8805, 8812, 8902, 8908, 8910,
            8911, 9001, 9002, 9003, 9008, 9009, 9010, 9012, 9101, 9103,
            9106, 9110, 9111, 9209, 9302, 9304] //, 9401, 9605]
        
        let gameIds15x13 = [
            9401, 9406, 9605]
        
        MutationCalculator.execute(gameIds: gameIds15x13)
    }
    
    public static func saveGame(gameId: Int, text: String) {
        let url = getDocumentsDirectory().appendingPathComponent("mutationsFor_\(gameId).txt")
        
        do {
            try text.write(to: url, atomically: true, encoding: .utf8)
                    
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public static func scoreSummaryText(scores: [Int]) -> String {
        
        
        let scoresGroupBy = Dictionary(grouping: scores) {$0}
        
        var list: [(Int,Int)] = []
        for item in scoresGroupBy {
            list.append((item.0,item.1.count))
        }
        
        list.sort() { $0.0 > $1.0}

        var result = ""
        for item in list {
            
            result += "\(item.0) = \(item.1)\n"
        }
        
        return result
        
    }
    
    public static func extractScores(text: String) -> [Int] {
        var result: [Int] = []
        let lines = text.split(separator: "\n")
        for line in lines {
            if line.contains(" score=") {
                let spaceArray = line.split(separator: " ")
                let scoreText = spaceArray[1].replacingOccurrences(of: "score=", with: "")
                
                result.append(Int(scoreText) ?? 0)
                
            }
        }
        return result
    }
    
    public static func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        // just send back the first one, which ought to be the only one
        return paths[0]
    }
    
    public static func loadMutations() -> [MutationModel] {
        
        //let jsonText = readFile
        
        let text = readFile(name:"mutations.json")
        let data = text.data(using: .utf8)
        let mutations = loadMutationsFromData(jsonData: data!)
        return mutations
    }
    // read file from disk
    public static func readFile(name: String) -> String {
        let url = getDocumentsDirectory().appendingPathComponent(name)
        
        do {
            let text = try String(contentsOf: url, encoding: .utf8)
            return text
        } catch {
            print(error.localizedDescription)
        }
        return ""
    }
    public static func loadMutationsFromData(jsonData: Data) -> [MutationModel] {
        
        do {
            let decodedData = try JSONDecoder().decode([MutationModel].self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        return []
    }
    public static func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    
    // We will return a collection of grids for each of marks lists
    public static func execute(gameIds: [Int]) {
        let inputDirectory = "/Users/michaelgeurtjens/Downloads/mintarget/"
        //let outputdirectory = "/Users/michaelgeurtjens/Downloads/mintarget/result/"
        
        
        
        //var result: [String] = []
        
        
        /// Load all grids from all files regardless of if they are duplicated or not
        let gridsCollection = ConvertMarksFilesToShapes.extractGridsFromFiles(inputDirectory: inputDirectory, gameIds: gameIds)
        
        /// This is a list of games of grids that have no duplicates within its own list but there are duplicates across lists
        let gridsCollectionNoDuplicates = ConvertMarksFilesToShapes.removeDuplicatesFromGrids(gameIds: gameIds, gridsCollection: gridsCollection)
        
        let michaelsFormatGrids = ConvertMarksFilesToShapes.convertMarkFormatToMichaelFormatAll(gridsArray: gridsCollectionNoDuplicates, gameIds: gameIds)
        
        let mutationsPerGame = MutationCalculator.getMutations(arraysOfGrids: michaelsFormatGrids)

        /// Need these too for later
        let summaryOfAllGrids = ConvertMarksFilesToShapes.removeDuplicates(gridsArray: michaelsFormatGrids)
        /// need this for later
        let mutationsAll = MutationCalculator.getMutations(grids: summaryOfAllGrids)
        
        let mutationsJson = mutationsToJson(mutations: mutationsAll)
        
        saveFile(name:"mutations.json", text:mutationsJson)
        
//        do {
//            
//            let data = try JSONSerialization.data( withJSONObject: mutationsAll, options: [])
//            let jsonString: String? = String(data: data, encoding: .utf8)
//            // Now we just have to save this one file and we have all mutations for all games mark gave and we can use that to generate any word list
//            
//            saveFile(name:"mutations.json", text:jsonString ?? "no data found")
//            
//        } catch {
//            // Handle error
//            print(error.localizedDescription)
//        }
        
        
        
        for i in 0..<gameIds.count {
            
            let gameId = gameIds[i]
            
            let mutations = mutationsPerGame[i]
            
            /// Now we can execute single game
            
            let game = GameList().getGame(gameId: gameId)!
            
            let words = game.words
            
            executeSingleGame(gameId: gameId, mutations: mutations, words: words)
            
            //result.append(textResult)
        }
        //return result
    }
    
    public static func mutationsToJson(mutations:[MutationModel]) -> String {
        var result = ""
        for mutation in mutations {
            if result != "" {
                result += ",\n"
            }
            result += mutation.ToString()
        }
        return "[\n\(result)\n]"
    }
    
    public static func executeSingleGame(gameId:Int, mutations: [MutationModel], words: [String]) {
        
        
        //let grids = ConvertMarksFilesToShapes.extractUniqueGridsFromFile(inputDirectory: inputDirectory, gameId: gameId, words: words)
        
        //let mutations = discoverGrids(grids: grids)
        
        let resultsForGame = executeAllGrids(mutations: mutations, words: words)
        //print("\(resultsForGame.count) grids found")
        let text = convertToText(resultsFromGame: resultsForGame)
        
        let scores = extractScores(text: text)
        let scoresText = scoreSummaryText(scores: scores)
        
        
        let result = scoresText + "\n" + text
        
        saveGame(gameId: gameId, text: result)
        print("\(gameId) has \(resultsForGame.count) grids saved")
        //return textResult
    }
    
    public static func saveFile(name: String, text: String) {
        let url = getDocumentsDirectory().appendingPathComponent(name)
        
        do {
            try text.write(to: url, atomically: true, encoding: .utf8)
                    
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public static func convertToText(resultsFromGame:[String]) -> String {
        var resultsForGame = resultsFromGame
        
        resultsForGame.sort() { $0 > $1 }
        
        var textResult = ""
        for i in 0..<resultsForGame.count {
            let gridText = resultsForGame[i]
            
            textResult += "count=\(i + 1) \(gridText)"
            
        }
        return textResult
    }
    
    public static func executeAllGrids(mutations: [MutationModel], words: [String]) -> [String] {
        var result: [String] = []
        for mutation in mutations {
            let gridTexts = executeGrid(mutation: mutation, words: words)
            result += gridTexts
        }
        return result
    }
    
    public static func getMutations(arraysOfGrids: [[[String]]]) -> [[MutationModel]] {
        
        var result: [[MutationModel]] = []
        for grids in arraysOfGrids {
            let mutations = getMutations(grids: grids)
            result.append(mutations)
        }
        return result
    }
    
    public static func getMutations(grids: [[String]]) -> [MutationModel] {
        var result: [MutationModel] = []
        for grid in grids {
            let mutation = getMutations(grid: grid)
            if mutation != nil {
                result.append(mutation!)
            }
        }
        return result
    }
    
    public static func getMutations(grid: [String]) -> MutationModel? {
        let (wordSequence, constraintArray) = LockBreakerCalculator.getIngredientsForCalculation(grid: grid)
        if let shape = ShapeCalculator.toShape(fromGrid: grid, words: wordSequence) {
            var placements = shape.placements
            placements.sort() { $0.i < $1.i}
            
            //return MutationModel(grid: grid, placements: placements, constraints: constraintArray, wordSequence: wordSequence)
            return MutationModel(placements: placements, constraints: constraintArray)
        } else {
            return nil
        }
    }
    
    public static func executeGrid(mutation: MutationModel, words: [String]) -> [String] {
        var result: [String] = []
        
        // DEBUG CODE
        //let words = mutation.wordSequence
        
       // the word sequences that can be put into the shape
        let foundWordSequences = LockBreakerCalculator.execute(words: words, mutation: mutation)
        
//        if mutation.placements.count == mutation.wordSequence.count {
//            var isCorrect = true
//            for i in 0..<mutation.placements.count {
//                if mutation.placements[i].l != mutation.wordSequence[i].count {
//                    isCorrect = false
//                }
//            }
//            if isCorrect == false {
//                print("not correct")
//            }
//        }
        
        
        for wordSequence in foundWordSequences {
            
            let shape = ShapeCalculator.toShape(fromPlacements: mutation.placements, words: wordSequence)
                
            //if matchingWordSequence(originalSequence: originalWordSequence, wordSequence: wordSequence) == false {
            if shape.height < shape.width {
                let shapeText = shape.ToMarkFormat(words: wordSequence)
                result.append(shapeText)
            } else {
                let shapeText = shape.Flip().ToMarkFormat(words: wordSequence)
                result.append(shapeText)
            }
            // }
            
        }
        return result
    }
    
    public static func matchingWordSequence(originalSequence: [String], wordSequence: [String]) -> Bool {
        if originalSequence.count != wordSequence.count {
            return false
        }
        
        for i in 0..<originalSequence.count {
            if originalSequence[i] != wordSequence[i] {
                return false
            }
        }
        return true
    }
}
