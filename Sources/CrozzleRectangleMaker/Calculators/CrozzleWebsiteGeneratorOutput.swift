//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 8/9/2023.
//

import Foundation
public class CrozzleWebsiteGeneratorOutput {
    
    public static func execute() throws {
        let path = "/Users/michaelgeurtjens/Developer/CrozzleOrgGenerator/CrozzleWebsiteGenerator/bin/Debug/net7.0/Games/"
        
        let gameList = GameList()
        
        for game in gameList.games {
            
            let filename = path + String(game.gameId) + ".json"
            
            let json = createJson(game: game)
            try json.write(toFile: filename, atomically: true, encoding: String.Encoding.ascii)
        }
    }

    
    public static func createJson(game: GameModel) -> String {
        var text = ""
        text += "{\n"
        if game.title != "" {
            text += "  \"name\": \"\(game.title)\",\n"
        } else {
            text += "  \"name\": \"\(game.gameId)\",\n"
        }
        text += "  \"game\": \(game.gameId),\n"
        text += "  \"score\": \(game.winningScore),\n"
        text += "  \"wordCount\": \(game.words.count),\n"
        text += "  \"grid\": [\n"
        text += gridText(grid: game.winningGame)
        text += "  ],\n"
        text += "  \"availableWords\": [\n"
        text += textList(words: game.words)
        text += "  ]\n"
        text += "}"
        return text
    }
    
    
    public static func gridText(grid: [String]) -> String {
        let lines = ConvertMarksFilesToShapes.removeBoarder(grid: grid)
        
        var result = ""
        for line in lines {
            if result != "" {
                result += ",\n"
            }
            result += "    \"\(line.replacingOccurrences(of: ".", with: " "))\""
        }
        result += "\n"
        
        return result
    }
    
    
    public static func textList(words: [String]) -> String {
        var result = ""
        for word in words {
            if result != "" {
                result += ",\n"
            }
            result += "    \"\(word)\""
        }
        result += "\n"
        return result
    }
}
