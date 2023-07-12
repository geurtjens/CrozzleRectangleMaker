//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 28/6/2023.
//

import Foundation
public class MutationCalculatorCodeGen {
    
    public static func execute() -> String {
        let gameList = GameList()
        var result = ""
        for game in gameList.games {
            result += code(grid:game.winningGame, gameId: String(game.gameId))
            
        }
        
        let executor = codeExecutor()
        result += codeWordSequenceSwitch()
        result += codeMutationSwitch()
        
        result = "import Foundation\npublic class MutationCalculator {\n\n\(executor)\n\n\(result)\n}"
        
        return result
    }
    
    
    public static func code(grid: [String], gameId: String) -> String {
        let (wordSequence, interlocks) = FindPathAndInterlocksCalculator.execute(grid: grid)
        
        let codeB = codeWords(words: wordSequence, gameId: gameId)
        
        let code = code(wordSequence: wordSequence, interlocks: interlocks, gameId: gameId)
        let result =  "\n\n" + codeB + "\n\n" + code + "\n\n"
        return result
    }
    
    public static func codeExecutor() -> String {
        let code = """
        
            public static func execute() {
                let gameList = GameList()
        
                for sourceGame in gameList.games {
        
                    let wordSequence = getWordSequence(gameId: sourceGame.gameId)
                    let (placements, _) = PlacementCalculator.fromTextToPlacements(grid: sourceGame.winningGame, words: wordSequence)
                    let shape = placements.toShape(score: 0)
                    var gameCount = 0
        
                    for game in gameList.games {
                        let result = getMutation(gameId: sourceGame.gameId, words: game.words)
                        for wordList in result {
                            let (text, score) = ShapeCalculator.ToText(shape: shape, words: wordList)
                            if text != game.winningText() && score == game.winningScore && sourceGame.gameId == game.gameId {
                                gameCount += 1
                                print(\"\\(gameCount). gameId:\\(game.gameId), score:\\(score), humanScore:\\(game.winningScore)\\n\\(text)\\n\")
                            }
                        }
                    }
                }
            }
        """
        return code
       
    }
    
    public static func codeWordSequenceSwitch() -> String {
        let gameList = GameList()
        var result = ""
        for game in gameList.games {
            result += "        case \(game.gameId):\n"
            result += "            return MutationCalculator.wordSequence_\(game.gameId)()\n"
        }
        
        var code = ""
        code += "    public static func getWordSequence(gameId: Int) -> [String] {\n\n"
        code += "        switch gameId {\n"
        code += result
        code += "        default:\n"
        code += "            return []\n"
        code += "        }\n"
        code += "    }\n\n"
        
        return code
    }
    
    public static func codeWordSequenceSwitch(names: [String]) -> String {
        var result = ""
        for name in names {
            result += "        case \"\(name)\":\n"
            result += "            return MutationCalculator.wordSequence_\(name)()\n"
        }
        
        var code = ""
        code += "    public static func getWordSequence(gameId: String) -> [String] {\n\n"
        code += "        switch gameId {\n"
        code += result
        code += "        default:\n"
        code += "            return []\n"
        code += "        }\n"
        code += "    }\n\n"
        
        return code
    }
    
    public static func codeMutationSwitch() -> String {
        let gameList = GameList()
        var result = ""
        for game in gameList.games {
            result += "        case \(game.gameId):\n"
            result += "            return MutationCalculator.mutation_\(game.gameId)(words: words)\n"
        }
        
        var code = ""
        code += "    public static func getMutation(gameId: Int, words: [String]) -> [[String]] {\n\n"
        code += "        switch gameId {\n"
        code += result
        code += "        default:\n"
        code += "            return []\n"
        code += "        }\n"
        code += "    }\n\n"
        
        return code
    }
    
    
    public static func codeMutationSwitch(names: [String]) -> String {
        
        var result = ""
        for name in names {
            result += "        case \"\(name)\":\n"
            result += "            return MutationCalculator.mutation_\(name)(words: words)\n"
        }
        
        var code = ""
        code += "    public static func getMutation(gameId: String, words: [String]) -> [[String]] {\n\n"
        code += "        switch gameId {\n"
        code += result
        code += "        default:\n"
        code += "            return []\n"
        code += "        }\n"
        code += "    }\n\n"
        
        return code
    }
    public static func codeWords(words: [String], gameId: String) -> String {
        
        var codeHeader = ""
        codeHeader += "    public static func wordSequence_\(gameId)() -> [String] {\n"
        codeHeader += "      return ["
         
        var code = ""
        for word in words {
            if code != "" {
                code += ", "
            }
            code += "\"\(word)\""
        }
        return codeHeader + code + "]\n    }"
         
    }
    public static func findWordsAboveOfSize(words:[String], size: Int, endingPosition: Int) -> [String] {
        
        if endingPosition == -1 {
            return []
        }
        
        var result:[String] = []
        for i in 0..<endingPosition {
            if words[i].count == size {
                result.append(words[i])
            }
        }
        return result
    }
    public static func code(wordSequence: [String], interlocks:[[InterlockModel]], gameId: String) -> String {
        
       
        
        let words = WordCalculator.lowercase(words: wordSequence)
        
        var code = ""
        var indent = "      "
        for i in 0..<words.count {
            let wordsAbove = findWordsAboveOfSize(words: words, size: words[i].count, endingPosition: i)

            code += codeRule(indent: indent, word: words[i], interlocks: interlocks[i], wordsAbove: wordsAbove)
            
            indent += "    "
            
        }
        
        // then we do the big one
        
        var itemsCode = "" //let item = [\n"
        for word in words {
            if itemsCode != "" {
                itemsCode += ",\n"
            }
            itemsCode += indent + "  w[\(word)]"
        }
        itemsCode = "\(indent)let item = [\n\(itemsCode)\n\(indent)]\n\(indent)result.append(item)\n"
        code += itemsCode
        
        let functionHeader = codeFunctionHeader(name: "mutation_\(gameId)")
        let closingBrackets = codeClosingBrackets(bracketCount: words.count * 2) + "\n      return result\n    }"
        return functionHeader + code + closingBrackets
    }
    
    public static func codeClosingBrackets(bracketCount: Int) -> String {
        var result = "    "
        for _ in 0..<bracketCount {
            result += "}"
        }
        return result
    }
    public static func codeFunctionHeader(name: String) -> String {
        
        var code = ""
        code += "    public static func \(name)(words w: [String]) -> [[String]] {\n\n"
             
        code += "      let c = w.count\n"
        code += "      let len = WordCalculator.lengths(words: w)\n\n"
             
        code += "      var result:[[String]] = []\n\n"
            
        return code
         
    }
    
    public static func codeWordsAbove(indent: String, word: String, wordsAbove: [String]) -> String {
        var code = ""
        for wordAbove in wordsAbove {
            code += " &&\n"
            
            code +=  "      \(indent)\(word) != \(wordAbove)"
        }
        return code
    }
    
    public static func codeOtherWord(word: String, interlock: InterlockModel) -> String {
        if interlock.horizontalWord == word {
            return "w[\(interlock.horizontalWord.lowercased())_][\(interlock.horizontalPos)] == w[\(interlock.verticalWord.lowercased())_][\(interlock.verticalPos)]"
        } else {
            return "w[\(interlock.verticalWord.lowercased())_][\(interlock.verticalPos)] == w[\(interlock.horizontalWord.lowercased())_][\(interlock.horizontalPos)]"
        }
    }
    public static func codeInterlocks(indent: String, word: String, interlocks:[InterlockModel]) -> String {
        var result = ""
        for interlock in interlocks {
            result += " &&\n"
            result += "\(indent)      \(codeOtherWord(word: word, interlock:interlock))"
        }
        return result
    }
    public static func codeRule(indent: String, word: String, interlocks: [InterlockModel], wordsAbove: [String]) -> String {
        var code = ""
        
        code += "\(indent)for \(word) in 0..<c {\n"
        code += "\(indent)  if (len[\(word)] == \(word.count - 1)"
        if wordsAbove.count > 0 {
            code += codeWordsAbove(indent: indent, word: word, wordsAbove: wordsAbove)
        }
        if interlocks.count > 0 {
            code += codeInterlocks(indent: indent, word: word, interlocks: interlocks)
        }
        
        code += ") {\n\n"
        return code
    }
}
