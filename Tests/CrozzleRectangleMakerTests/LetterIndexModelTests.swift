//
//  LetterIndexCalculatorTests.swift
//  
//
//  Created by Michael Geurtjens on 14/8/2023.
//

import XCTest
@testable import CrozzleRectangleMaker
final class LetterIndexModelTests: XCTestCase {

    func test_execute() throws {
        
        /// GIVEN the input words of `AND` and `AGAIN`
        let words = ["AND", "AGAIN"]
        
        /// WHEN we calculate the letter index
        let sut = LetterIndexModel(words: words)
        
        /// THEN there should be an entry for each of the 26 letters of the alphabet
        XCTAssertEqual(26,sut.index.count)
        
        let A = sut.find("A")
        let B = sut.find("B")
        let C = sut.find("C")
        let D = sut.find("D")
        let E = sut.find("E")
        let F = sut.find("F")
        let G = sut.find("G")
        let H = sut.find("H")
        let I = sut.find("I")
        let J = sut.find("J")
        let K = sut.find("K")
        let L = sut.find("L")
        let M = sut.find("M")
        
        let N = sut.find("N")
        let O = sut.find("O")
        let P = sut.find("P")
        let Q = sut.find("Q")
        let R = sut.find("R")
        let S = sut.find("S")
        let T = sut.find("T")
        let U = sut.find("U")
        let V = sut.find("V")
        let W = sut.find("W")
        let X = sut.find("X")
        let Y = sut.find("Y")
        let Z = sut.find("Z")
        
        /// AND letter `A` appears `3` time
        XCTAssertEqual(3, A.count)
        
        /// AND letter `D` appears `1` times
        XCTAssertEqual(1, D.count)
        
        ///AND letter `G` appears `1` times
        XCTAssertEqual(1, G.count)
        
        /// AND letter `N` appears `2` times
        XCTAssertEqual(2, N.count) // N
        
        /// AND `total` number of letters in the index is `8`
        let letterCount = A.count + D.count + G.count + I.count + N.count
        XCTAssertEqual(8,letterCount)
        
        /// AND letters that are not in the input will not be in the output index
        XCTAssertEqual(0, B.count)
        XCTAssertEqual(0, C.count)
        XCTAssertEqual(0, E.count)
        XCTAssertEqual(0, F.count)
        XCTAssertEqual(0, H.count)
        XCTAssertEqual(0, J.count)
        XCTAssertEqual(0, K.count)
        XCTAssertEqual(0, L.count)
        XCTAssertEqual(0, M.count)
        XCTAssertEqual(0, O.count)
        XCTAssertEqual(0, P.count)
        XCTAssertEqual(0, Q.count)
        XCTAssertEqual(0, R.count)
        XCTAssertEqual(0, S.count)
        XCTAssertEqual(0, T.count)
        XCTAssertEqual(0, U.count)
        XCTAssertEqual(0, V.count)
        XCTAssertEqual(0, W.count)
        XCTAssertEqual(0, X.count)
        XCTAssertEqual(0, Y.count)
        XCTAssertEqual(0, Z.count)
        
        /// AND letter `A` in `aND` is from word `0`, at position `0` from start and `2` from end
        let A0 = A[0]
        XCTAssertEqual(0, A0.id)
        XCTAssertEqual(0, A0.start)
        XCTAssertEqual(2, A0.end)
        
        /// AND letter `N` in `AnD` is from word `0`, at position `1` from start and `1` from end
        let N0 = N[0]
        XCTAssertEqual(0, N0.id)
        XCTAssertEqual(1, N0.start)
        XCTAssertEqual(1, N0.end)
        
        /// AND letter `D` in `ANd` is from word `0`, at position `1` from start and `0` from  end
        let D0 = D[0]
        XCTAssertEqual(0, D0.id)
        XCTAssertEqual(2, D0.start)
        XCTAssertEqual(0, D0.end)
        
        /// AND letter `A` in `aGAIN` is from word `1`, at position `0` from start and `4` from end
        let A1 = A[1]
        XCTAssertEqual(1, A1.id)
        XCTAssertEqual(0, A1.start)
        XCTAssertEqual(4, A1.end)
        
        /// AND letter `G` in `AgAIN` is from word 1, at position 0 and from the end is position
        let G0 = G[0]
        XCTAssertEqual(1, G0.id)
        XCTAssertEqual(1, G0.start)
        XCTAssertEqual(3, G0.end)
        
        /// AND letter `A` in `AGaIN` is from word `1`, at postion `2` from start and `2` from end
        let A2 = A[2]
        XCTAssertEqual(1, A2.id)
        XCTAssertEqual(2, A2.start)
        XCTAssertEqual(2, A2.end)
        
        /// AND letter `I` in `AGAiN` is from word 1, at position 0 and from the end is position
        let I0 = I[0]
        XCTAssertEqual(1, I0.id)
        XCTAssertEqual(3, I0.start)
        XCTAssertEqual(1, I0.end)

        /// AND letter `N` in `AGAIn` is from word 1, at position 4 from the start and 0 from the end
        let N1 = N[1]
        XCTAssertEqual(1, N1.id)
        XCTAssertEqual(4, N1.start)
        XCTAssertEqual(0, N1.end)
    }
}
