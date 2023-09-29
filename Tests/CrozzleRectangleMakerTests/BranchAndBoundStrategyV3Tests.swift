//
//  BranchAndBoundStrategyV3Tests.swift
//  
//
//  Created by Michael Geurtjens on 21/9/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class BranchAndBoundStrategyV3Tests: XCTestCase {


    
    public func test_Again() async {
        
        /*
         .    .  .
         S ..BOGOTA.
       .QUITO.M  O  .
         E O  A  L .L
        .ZURICH.DELHI.
         . O  A  D.OMSK.
       .BONN. ..BOMBAY.
         S.TOKYO.. A.D
       .LAGOS.O   .RENO.
         K .L.ROME.T E
         A.CORK.   .AYR.
         .  . .      .
         
         
         .CORK. is where .CAIRO. should be.
         
         */
        
        let gameId = 8803
        let game = GameList().getGame(gameId: 8803)!
        let words = game.winningWords
        let winningScore = game.winningScore
        let result = await BranchAndBoundStrategyV3.execute(
            gameId: gameId,
            words: words,
            lookaheadDepth: 3,
            beamWidth: 200,
            maxDepth:30,
            rootWidth: 1,
            winningScore: winningScore)
        print(result.ToText(words: words))
    }
    
    public func test_Execute8612() async {
        let gameId = 8612
        
        let game = GameList().getGame(gameId:gameId)!
        let winningScore = game.winningScore
        let words = game.winningWords
        
        
        let result = await BranchAndBoundStrategyV3.execute(
            gameId: gameId,
            words: words,
            lookaheadDepth: 3,
            beamWidth: 1,
            maxDepth: 20,
            rootWidth: 1,
            winningScore: winningScore)
        
        XCTAssertEqual(winningScore, Int(result.score))
    }
    
    public func test_Execute8802() async {
        let gameId = 8802
        
        let game = GameList().getGame(gameId:gameId)!
        let winningScore = game.winningScore
        let words = game.winningWords
        
        
        let result = await BranchAndBoundStrategyV3.execute(
            gameId: gameId,
            words: words,
            lookaheadDepth: 3,
            beamWidth: 1,
            maxDepth: 30,
            rootWidth: 1,
            winningScore: winningScore)
        
        XCTAssertEqual(winningScore, Int(result.score))
    }
    
    
    
    public func test_Execute8703() async {
        let gameId = 8703
        
        let game = GameList().getGame(gameId:gameId)!
        let winningScore = game.winningScore
        let words = game.winningWords
        
        
        let result = await BranchAndBoundStrategyV3.execute(
            gameId: gameId,
            words: words,
            lookaheadDepth: 3,
            beamWidth: 1,
            maxDepth: 30,
            rootWidth: 1,
            winningScore: winningScore)
        
        XCTAssertEqual(winningScore, Int(result.score))
    }
    
    public func test_ExecuteGames8612() async {
        
        let games = [8612]
        
        let result = await BranchAndBoundStrategyV3.executeGames(
            games: games,
            lookaheadDepth: 3,
            beamWidth: 2,
            maxDepth: 30,
            rootWidth: 1)
        
        XCTAssertEqual(1, result.count)
    }
    
    public func test_Execute8803() async {
        
        let gameId = 8803
        
        let game = GameList().getGame(gameId:gameId)!
        let winningScore = game.winningScore
        let words = game.winningWords
        
        
        let result = await BranchAndBoundStrategyV3.execute(
            gameId: gameId,
            words: words,
            lookaheadDepth: 3,
            beamWidth: 500,
            maxDepth: 20,
            rootWidth: 1,
            winningScore: winningScore)
        
        XCTAssertEqual(winningScore, Int(result.score))
    }
    
}
