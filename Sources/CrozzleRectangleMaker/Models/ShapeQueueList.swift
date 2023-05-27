//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 27/5/2023.
//

import Foundation
public struct ShapeQueueList {
    
    let words: [String]
    let wordCount: Int
    var q2: ShapeQueueModel
    var q3: ShapeQueueModel
    var q4: ShapeQueueModel
    var q5: ShapeQueueModel
    var q6: ShapeQueueModel
    var q7: ShapeQueueModel
    var q8: ShapeQueueModel
    var q9: ShapeQueueModel
    var q10: ShapeQueueModel
    var q11: ShapeQueueModel
    var q12: ShapeQueueModel
    var q13: ShapeQueueModel
    var q14: ShapeQueueModel
    var q15: ShapeQueueModel
    var q16: ShapeQueueModel
    var q17: ShapeQueueModel
    var q18: ShapeQueueModel
    var q19: ShapeQueueModel
    var q20: ShapeQueueModel
    var q21: ShapeQueueModel
    var q22: ShapeQueueModel
    var q23: ShapeQueueModel
    var q24: ShapeQueueModel
    var q25: ShapeQueueModel
    var q26: ShapeQueueModel
    var q27: ShapeQueueModel
    var q28: ShapeQueueModel
    var q29: ShapeQueueModel
    var q30: ShapeQueueModel
    var q31: ShapeQueueModel
    var q32: ShapeQueueModel
    var q33: ShapeQueueModel
    var q34: ShapeQueueModel
    var q35: ShapeQueueModel
    var q36: ShapeQueueModel
    var q37: ShapeQueueModel
    var q38: ShapeQueueModel
    var q39: ShapeQueueModel
    var q40: ShapeQueueModel
        
    public init( words: [String]) {
        let wordCount = words.count
        self.words = words
        self.wordCount = wordCount
        
        self.q2 = ShapeQueueModel(wordCount: 2, minScore: 28, totalWords: wordCount)
        self.q3 = ShapeQueueModel(wordCount: 3, minScore: 42, totalWords: wordCount)
        self.q4 = ShapeQueueModel(wordCount: 4, minScore: 52, totalWords: wordCount)
        self.q5 = ShapeQueueModel(wordCount: 5, minScore: 62, totalWords: wordCount)
        self.q6 = ShapeQueueModel(wordCount: 6, minScore: 28, totalWords: wordCount)
        self.q7 = ShapeQueueModel(wordCount: 7, minScore: 42, totalWords: wordCount)
        self.q8 = ShapeQueueModel(wordCount: 8, minScore: 52, totalWords: wordCount)
        self.q9 = ShapeQueueModel(wordCount: 9, minScore: 62, totalWords: wordCount)
        self.q10 = ShapeQueueModel(wordCount: 10, minScore: 62, totalWords: wordCount)
        self.q11 = ShapeQueueModel(wordCount: 11, minScore: 62, totalWords: wordCount)
        self.q12 = ShapeQueueModel(wordCount: 12, minScore: 28, totalWords: wordCount)
        self.q13 = ShapeQueueModel(wordCount: 13, minScore: 42, totalWords: wordCount)
        self.q14 = ShapeQueueModel(wordCount: 14, minScore: 52, totalWords: wordCount)
        self.q15 = ShapeQueueModel(wordCount: 15, minScore: 62, totalWords: wordCount)
        self.q16 = ShapeQueueModel(wordCount: 16, minScore: 28, totalWords: wordCount)
        self.q17 = ShapeQueueModel(wordCount: 17, minScore: 42, totalWords: wordCount)
        self.q18 = ShapeQueueModel(wordCount: 18, minScore: 52, totalWords: wordCount)
        self.q19 = ShapeQueueModel(wordCount: 19, minScore: 62, totalWords: wordCount)
        self.q20 = ShapeQueueModel(wordCount: 20, minScore: 62, totalWords: wordCount)
        self.q21 = ShapeQueueModel(wordCount: 21, minScore: 62, totalWords: wordCount)
        self.q22 = ShapeQueueModel(wordCount: 22, minScore: 28, totalWords: wordCount)
        self.q23 = ShapeQueueModel(wordCount: 23, minScore: 42, totalWords: wordCount)
        self.q24 = ShapeQueueModel(wordCount: 24, minScore: 52, totalWords: wordCount)
        self.q25 = ShapeQueueModel(wordCount: 25, minScore: 62, totalWords: wordCount)
        self.q26 = ShapeQueueModel(wordCount: 26, minScore: 28, totalWords: wordCount)
        self.q27 = ShapeQueueModel(wordCount: 27, minScore: 42, totalWords: wordCount)
        self.q28 = ShapeQueueModel(wordCount: 28, minScore: 52, totalWords: wordCount)
        self.q29 = ShapeQueueModel(wordCount: 29, minScore: 62, totalWords: wordCount)
        self.q30 = ShapeQueueModel(wordCount: 30, minScore: 62, totalWords: wordCount)
        self.q31 = ShapeQueueModel(wordCount: 31, minScore: 62, totalWords: wordCount)
        self.q32 = ShapeQueueModel(wordCount: 32, minScore: 28, totalWords: wordCount)
        self.q33 = ShapeQueueModel(wordCount: 33, minScore: 42, totalWords: wordCount)
        self.q34 = ShapeQueueModel(wordCount: 34, minScore: 52, totalWords: wordCount)
        self.q35 = ShapeQueueModel(wordCount: 35, minScore: 62, totalWords: wordCount)
        self.q36 = ShapeQueueModel(wordCount: 36, minScore: 28, totalWords: wordCount)
        self.q37 = ShapeQueueModel(wordCount: 37, minScore: 42, totalWords: wordCount)
        self.q38 = ShapeQueueModel(wordCount: 38, minScore: 52, totalWords: wordCount)
        self.q39 = ShapeQueueModel(wordCount: 39, minScore: 62, totalWords: wordCount)
        self.q40 = ShapeQueueModel(wordCount: 40, minScore: 62, totalWords: wordCount)

        
    }
}
