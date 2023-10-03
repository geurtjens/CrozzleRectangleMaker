//
//  BranchAndBoundStrategyV3Tests.swift
//  
//
//  Created by Michael Geurtjens on 21/9/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class BranchAndBoundV3Tests: XCTestCase {


    
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
        let result = await BranchAndBoundV3.execute(
            gameId: gameId,
            words: words,
            lookaheadDepth: 3,
            beamWidth: 200,
            maxDepth:30,
            rootWidth: 1,
            winningScore: winningScore,
            useGuidedScores: false)
        print(result.ToText(words: words))
    }
    
    public func test_Execute8612() async {
        let gameId = 8612
        
        let game = GameList().getGame(gameId:gameId)!
        let winningScore = game.winningScore
        let words = game.winningWords
        
        
        let result = await BranchAndBoundV3.execute(
            gameId: gameId,
            words: words,
            lookaheadDepth: 3,
            beamWidth: 3,
            maxDepth: 20,
            rootWidth: 3,
            winningScore: winningScore,
            useGuidedScores: true)
        
        XCTAssertEqual(winningScore, Int(result.score))
    }
    
    public func test_Execute8802() async {
        let gameId = 8802
        
        let game = GameList().getGame(gameId:gameId)!
        let winningScore = game.winningScore
        let words = game.winningWords
        
        
        let result = await BranchAndBoundV3.execute(
            gameId: gameId,
            words: words,
            lookaheadDepth: 3,
            beamWidth: 1,
            maxDepth: 30,
            rootWidth: 1,
            winningScore: winningScore,
            useGuidedScores: true)
        
        XCTAssertEqual(winningScore, Int(result.score))
    }
    
    
    
    public func test_Execute8703() async {
        let gameId = 8703
        
        let game = GameList().getGame(gameId:gameId)!
        let winningScore = game.winningScore
        let words = game.winningWords
        
        
        let result = await BranchAndBoundV3.execute(
            gameId: gameId,
            words: words,
            lookaheadDepth: 3,
            beamWidth: 1,
            maxDepth: 30,
            rootWidth: 1,
            winningScore: winningScore,
            useGuidedScores: true)
        
        XCTAssertEqual(winningScore, Int(result.score))
    }
    
    public func test_ExecuteGames8612() async {
        
        let games = [8612]
        
        let result = await BranchAndBoundV3.executeGames(
            games: games,
            lookaheadDepth: 3,
            beamWidth: 2,
            maxDepth: 30,
            rootWidth: 18,
            useGuidedScores: false)
        
        XCTAssertEqual(1, result.count)
    }
    
    public func test_execute8803() async {
        
        /// The order of execution should be
        /// 1. `[QuItO, zUrICH], [SuEz, tOrONTO]`
        /// 2. `[toKYO, LAGos], [TORONto, osLO]`
        /// 3. `TOKyO:yORK`
        /// 4. `[BoNn, LaGos], [oSaKA, TOROnTo]`
        /// 5. `[LaGOs, CaIRo], [OSaKa, OsLo]`
        /// 6.  `rOME:YOrK`
        /// 7. `ZURICh:OMAhA`
        /// 8. `BoGOTA:oMAHA`
        /// 9. `BOGOtA:tOLEDO`
        /// 10. `[DeLhI, BoMbAY], [TOLeDo, hObART]`
        /// 11. `[DELhi, omsK, BOMbay], [hobART, Lima, syDNEY]`
        /// 12. `[oMsK, aYR], [HoBART, sYDNEy]`
        /// 13. `[rEnO, AyR], [HOBArT, SYDnEy]`
        /// 14. `OMSk:CORk`
        
        
        let gameId = 8803
        
        let game = GameList().getGame(gameId:gameId)!
        let winningScore = game.winningScore
        let words = game.winningWords
        
        
        let result = await BranchAndBoundV3.execute(
            gameId: gameId,
            words: words,
            lookaheadDepth: 3,
            beamWidth: 10,
            maxDepth: 30,
            rootWidth: 1,
            winningScore: winningScore,
            useGuidedScores: true)
        
        XCTAssertEqual(winningScore, Int(result.score))
    }
    
}
