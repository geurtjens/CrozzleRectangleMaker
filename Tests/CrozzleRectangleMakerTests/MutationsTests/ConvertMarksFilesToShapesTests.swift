//
//  ParseMarksFilesTests.swift
//  
//
//  Created by Michael Geurtjens on 9/7/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class ConvertMarksFilesToShapesTests: XCTestCase {

    
    
    let words =
    ["USURY","PRIZE","ASSIZES","JURY","SUIT","SURTAX","TESTIMONY","SUMMONS","SUE","USE","WITNESS","WRIT","INSULT","LAWSUIT","TESTATOR","ARREST","ESCROW","PRISON","TREASON","RENT","STEAL","OATH","LAW","ACT","ROB","ABET","CASE","FALSE","LIEN","BAR","BENCH",
     "AVIZANDUM","GUILTY","STATUTE","CRUELTY","PERJURY","BANKRUPTCY","ATTESTATION","MANDATORY","BURGLARY","TRESPASSER","FELONY","INDEMNITY","STIPENDIARY","ESTATE","CONSPIRACY","EXTENUATION","ROBBERY","JUSTICE","WARRANT","ARSON","JUDICIARY","ABSTRACT","INJUNCTION","MAGISTRATE","ACQUITTAL","COLLUSION","SOLICITOR","PRISONER","SUBPOENA","JUDGMENT","CONFESSION","BARRISTER","LITIGANT","VERDICT","PROBATION","ARBITRATION","EXAMINATION","SENTENCE","FORECLOSURE","TRIAL","ATTAINDER","GUARANTEE","LOITERING","ADVOCATE","FORENSIC","REPRIEVE","AWARD","PARDON","ACCUSED","ALIENATION","LICENSING","MAINTENANCE","JUDGE","VALID","PLAINTIFF","CAPITAL","DEFAMATION","PAROLE","REMAND","DEFENDANT","INNOCENCE","CRIME","EVIDENCE","POLICE","APPEAL","IMPEACH","HOMICIDE","DOCK","CHARGE","BLACKMAIL","ILLEGAL","LIBEL","BAIL","DEFENCE","FEE"]
  
    
//    func test_extractGrids() {
//
//        let grids = ConvertMarksFilesToShapes.extractGrids(path: filename)
//
//        // We should rotate the grids if they are not as width as they are height
//
//        XCTAssertEqual(1640,grids.count)
//    }
    
    
    func test_duplicates() {
        let inputDirectory = "/Users/michaelgeurtjens/Downloads/mintarget/"
        let gameIds = [
            8702, 8703, 8705, 8803, 8804, 8805, 8812, 8902, 8908, 8910,
            8911, 9001, 9002, 9003, 9008, 9009, 9010, 9012, 9101, 9103,
            9106, 9110, 9111, 9209, 9302, 9304, 9401, 9605]
        
        
    }
    
    
//    func test_code() {
//        let inputDirectory = "/Users/michaelgeurtjens/Downloads/mintarget/"
//        //let outputdirectory = "/Users/michaelgeurtjens/Downloads/mintarget/result/"
//        
//        let gameList = GameList()
//        
//        let gameIds = [
//            8702, 8703, 8705, 8803, 8804, 8805, 8812, 8902, 8908, 8910,
//            8911, 9001, 9002, 9003, 9008, 9009, 9010, 9012, 9101, 9103,
//            9106, 9110, 9111, 9209, 9302, 9304] //, 9401, 9605]
//        
//        var result: [[[String]]] = []
//        for gameId in gameIds {
//            
//            let game = gameList.getGame(gameId: gameId)!
//            
//            let words = game.words
//            
//            let grids = ConvertMarksFilesToShapes.extractUniqueGridsFromFile(inputDirectory: inputDirectory, gameId: gameId, words: words)
//            
//            result.append(grids)
//        }
//        
//        let sumOfShapes = ConvertMarksFilesToShapes.removeDuplicates(gridsArray: result)
//        
//        // How many grids do we have in total?
//        let totalGrids = countTotalGrids(gridsArray: result)
//        
//        let duplicates = totalGrids - sumOfShapes.count
//        
//        print("Out of \(totalGrids) grids, we found \(duplicates) duplicates, leaving \(sumOfShapes.count) unique shapes")
//        
//    }
   
    
    public func countTotalGrids(gridsArray:[[[String]]]) -> Int {
        var totalGrids = 0
        for grids in gridsArray {
            totalGrids += grids.count
        }
        return totalGrids
    }
    

    
    func test_CreateAllWinningShapes() {
         //execute(words: words)
    }
    
    
//    public func execute(words: [String])  {
//
//
//
//
//        //let winningScore = 840
//        let name = "9506"
//        let filename = "/Users/michaelgeurtjens/Downloads/mintarget/9605.txt"
//        let grids = ConvertMarksFilesToShapes.execute(path: filename, words: words)
//
//        let count = grids.count
//        let gameList = GameList()
//        for i in 0..<count {
//            let gameId = name + "_" + String(i)
//
//            let wordSequence = MarksShapes9506.getWordSequence(gameId: gameId)
//
//
//            let (placements, _) = PlacementCalculator.fromTextToPlacements(grid: grids[i], words: wordSequence)
//            let shape = placements.toShape(score: 0)
//
//            for game in gameList.games {
//                var result:[String] = []
//                if game.gameId >= 9401 {
//
//                    let wordsToTry = game.words
//
//
//                    let winningScore = game.winningScore
//
//                    let mutations = MarksShapes9506.getMutation(gameId: gameId, words: wordsToTry)
//                    for wordList in mutations {
//                        let (text, score) = ShapeCalculator.ToText(shape: shape, words: wordList)
//
//                        //if score >= winningScore {
//                            let marksFormat = GridCalculator.markAmabileFormat(text: text)
//
//                            let code = "score:\(score), humanScore:\(winningScore)\n\(marksFormat)\n"
//
//                            result.append(code)
//
//                        //}
//
//                    }
//                    result.sort()
//                    if result.count > 0 {
//                        print("Game: \(game.gameId), winningScore: \(winningScore)")
//                        for i in 0..<result.count {
//                            let text = result[i]
//                            print("\(i). \(text)")
//                        }
//                    }
//                }
//            }
//        }
//    }
    
    
    
//    func test_Execute() {
//        let filename = "/Users/michaelgeurtjens/Downloads/9605-r5/9605.txt.mintargetdump.txt"
//
//
//
//        var grids = ConvertMarksFilesToShapes.execute(path: filename, words: words)
//
//        // We should rotate the grids if they are not as width as they are height
//
//        XCTAssertEqual(1640,grids.count)
//    }
}
