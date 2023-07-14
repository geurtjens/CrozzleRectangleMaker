//
//  LockBreakerCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 11/7/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class LockBreakerCalculatorTests: XCTestCase {

    func test_execute() throws {
        
        let words9605 = ["USURY", "PRIZE", "ASSIZES", "JURY", "SUIT", "SURTAX", "TESTIMONY", "SUMMONS", "SUE", "USE",
                         "WITNESS", "WRIT", "INSULT", "LAWSUIT", "TESTATOR", "ARREST", "ESCROW", "PRISON", "TREASON", "RENT",
                         "STEAL", "OATH", "LAW", "ACT", "ROB", "ABET", "CASE", "FALSE", "LIEN", "BAR",
                         "BENCH","AVIZANDUM","GUILTY","STATUTE","CRUELTY","PERJURY","BANKRUPTCY","ATTESTATION","MANDATORY","BURGLARY","TRESPASSER","FELONY","INDEMNITY","STIPENDIARY","ESTATE","CONSPIRACY","EXTENUATION","ROBBERY","JUSTICE","WARRANT","ARSON","JUDICIARY","ABSTRACT","INJUNCTION","MAGISTRATE","ACQUITTAL","COLLUSION","SOLICITOR","PRISONER","SUBPOENA","JUDGMENT","CONFESSION","BARRISTER","LITIGANT","VERDICT","PROBATION","ARBITRATION","EXAMINATION","SENTENCE","FORECLOSURE","TRIAL","ATTAINDER","GUARANTEE","LOITERING","ADVOCATE","FORENSIC","REPRIEVE","AWARD","PARDON","ACCUSED","ALIENATION","LICENSING","MAINTENANCE","JUDGE","VALID","PLAINTIFF","CAPITAL","DEFAMATION","PAROLE","REMAND","DEFENDANT","INNOCENCE","CRIME","EVIDENCE","POLICE","APPEAL","IMPEACH","HOMICIDE","DOCK","CHARGE","BLACKMAIL","ILLEGAL","LIBEL","BAIL","DEFENCE","FEE"]
        
        let grid9605 = [
        "   .    . .    ",
        ".CASE.CAPITAL. ",
        "  .USE. R R    ",
        ".ABET.. I E .  ",
        " .A.ASSIZES.L  ",
        ".WRIT.U E P I  ",
        " I..E I . A E  ",
        " T A..TREASON. ",
        " N P  .  .S .F ",
        " E P .FALSE. E ",
        " STEAL...TRIAL.",
        " S A A J A.N O ",
        " ..LAWSUIT.S N ",
        "  R. . R.USURY.",
        ".ROBBERY.T L . ",
        "  B    .RENT.  ",
        "  .      . .   "
        ]
        
        let (wordSequence, _) = FindPathAndInterlocksCalculator.execute(grid: grid9605)
        
        
        // Then we calculate difficulties
//        let values = LockBreakerCalculator.execute(grid: grid9605, words: words9605)
//        for value in values {
//            print(value)
//        }
//
//        // first we test it will go all the way and that happens when we feed it the word sequence that it will calculate for itself
//        let otherValues = LockBreakerCalculator.execute(grid: grid9605, words: wordSequence)
//        for value in otherValues {
//            print(value)
//        }
    }

}
