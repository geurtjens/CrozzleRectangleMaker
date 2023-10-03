//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 3/10/2023.
//

import Foundation
public class NetworkXCalculator {
    public static func execute() -> String {
        let gameList = GameList()
        var result = ""
        result += "# pip install networkx\n\n"
        result += "import networkx as nx\n\n"
        for game in gameList.games {
            result += execute(game: game)
        }
        return result
    }
    
    public static func execute(game: GameModel) -> String {
        let grid = game.winningGame
        
        var result = ""
        
        
        result += "G_\(game.gameId) = nx.Graph()\n\n"
        
        let interlocks = GridCalculator.findInterlocks(grid: grid)
        
        for interlock in interlocks {
            let letter = grid[interlock.y][interlock.x]
            
            let score = ScoreCalculator.score(forLetter: letter)
            
            result += "G_\(game.gameId).add_edge(\"\(interlock.horizontalWord)\", \"\(interlock.verticalWord)\", weight=\(score), letter=\"\(letter)\")\n"
        }
        
        result += "\nnx.draw_spring(G_\(game.gameId), with_labels = True)\n"
        result += "\n\n"
        return result
    }
    
    
    
}
