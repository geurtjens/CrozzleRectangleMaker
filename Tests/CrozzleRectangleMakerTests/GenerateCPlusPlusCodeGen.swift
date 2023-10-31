//
//  GenerateCPlusPlusCodeGen.swift
//  
//
//  Created by Michael Geurtjens on 21/8/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class GenerateCPlusPlusCodeGen: XCTestCase {

    
    func testExample() throws {
        let gameList = GameList()
        
        for game in gameList.games {
            print("games.push_back(Game2Model(\(game.gameId), \(game.winningScore), \(game.isValid), \(game.widthMax), \(game.heightMax),")
            print("  {\(commaSeparated(words: game.winningWords))},")
            print("  {\(commaSeparated(words: game.nonWinningWords))},")
            print("  {\(commaSeparated(words: game.winningWords + game.nonWinningWords))},")
            print("  {\(commaSeparated(words: game.tags))},")
            print("  {\n\(winningGame(winningGame: game.winningGame))}));")
            print()
        }
    }

    func winningGame(winningGame:[String]) -> String {
        var result = ""
        for line in winningGame {
            if result != "" {
                result += ",\n"
            }
            result += "   \"" + line + "\""
        }
        return result
    }
    
    func commaSeparated(words: [String]) -> String {
        var result = ""
        
        for word in words{
            if result != "" {
                result += ", "
            }
            result += "\"" + word + "\""
        }
        return result
    }

}
