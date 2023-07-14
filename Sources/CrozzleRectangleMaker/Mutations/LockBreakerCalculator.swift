//
//  File 2.swift
//  
//
//  Created by Michael Geurtjens on 11/7/2023.
//

import Foundation
public class LockBreakerCalculator {
    
    
//    public static func execute(grid: [String], words: [String]) -> [[String]] {
//        let (wordSequence, constraintArray) = getIngredientsForCalculation(words: words, grid: grid)
//
//
//        return execute(words: words, wordSequence: wordSequence, constraintArray: constraintArray)
//    }
    
    public static func execute(words: [String], mutation: MutationModel) -> [[String]] {
               
        let wordsPerPosition = setLockParameters(words: words, placements: mutation.placements)
        
        if wordsPerPosition.count == 0 {
            return []
        }
        
        
        let wordCount = mutation.placements.count
        
        var nextPosition: [Int] = Array(repeating: 0, count: wordCount)
        
        var currentWords: [String] = Array(repeating: "", count: wordCount)
        
        let wordCountOfFirstWordPosition = wordsPerPosition[0].count
        
        
        var i = 0
        
        var result:[[String]] = []
        
        /// if we cannot increase the first word then we have finished processing
        while nextPosition[0] < wordCountOfFirstWordPosition {

            let wordPos = nextPosition[i]
            
            let lastValidWordPosition = wordsPerPosition[i].count - 1
            
            if wordPos <= lastValidWordPosition {
                
                let wordToTry = wordsPerPosition[i][wordPos]
                
                currentWords[i] = wordToTry // We can also use this for future interlock constraint checks
                
                let constraints = mutation.constraints[i]
                if wordsHaveDuplicates(existingWords:currentWords, lastPos: i) {
                    // move on to the next word
                    nextPosition[i] += 1
                } else if passesContraint(word: wordToTry, existingWords: currentWords, constraints: constraints) {
                    optionalPrint(currentWords)
                    
                    if i < wordCount - 1 {
                        // All constraints are passed but we havent reached the end so we are moving forward one
                        nextPosition[i] += 1
                        i += 1
                        
                    } else {
                        
                        // We have succeeded.  Does this copy or does this give a reference, hopefully a copy else we have to do something and copy
                        result.append(currentWords)
                        // Lets try the next word now
                        nextPosition[i] += 1
                        
                    }
                } else {
                    // We did not match the criteria so move on to the next word
                    nextPosition[i] += 1
                    optionalPrint(currentWords)
                }
            } else {
                /// Means we have run out of words in this lane so we must go backwards
                nextPosition[i] = 0
                currentWords[i] = ""
                i -= 1
                optionalPrint(currentWords)
            }
        }
        
        return result
    }
    
    
    public static func optionalPrint(_ text: [String]) {
        //print(text)
    }
    
    
    public static func wordsHaveDuplicates(existingWords: [String], lastPos: Int) -> Bool {
        
        if lastPos == 0 { // This means only one word actually
            return false
        }
        
        var wordSet: Set<String> = []
        
        for i in 0..<(lastPos+1) {
            let word = existingWords[i]
            if wordSet.contains(word) {
                return true
            }
            wordSet.insert(word)
        }
        return false
    }
    
    public static func passesContraint(word: String, existingWords: [String], constraints: [CodeBreakerModel]) -> Bool {
        for constraint in constraints {
            
            //let (letterPos, matchingWordLetterPos, matchingWordId) = findContraint(word: word, interlock: interlock)
            
            let letter = word[constraint.p]
            let matchingWord = existingWords[constraint.w]
            let matchingLetter = matchingWord[constraint.q]
            
            if letter != matchingLetter {
                return false
            }
        }
        return true
    }
    
    
    public static func findContraint(word: String, interlock: InterlockModel) -> CodeBreakerModel? {
        if word == interlock.horizontalWord {
            return CodeBreakerModel(p: interlock.horizontalPos, q: interlock.verticalPos, w:interlock.verticalWordId)
            
        } else if word == interlock.verticalWord {
            return CodeBreakerModel(p: interlock.verticalPos, q: interlock.horizontalPos, w:interlock.horizontalWordId)
            
        } else {
            
            print("This should not happen")
            return nil
        }
    }
    public static func findWordIdInInterlocks(interlocksArray: [[InterlockModel]], wordSequence: [String]) -> [[InterlockModel]] {
        var result: [[InterlockModel]] = []
        for interlocks in interlocksArray {
            let interlocksWithId = findWordIdInInterlocks(interlocks: interlocks, wordSequence: wordSequence)
            result.append(interlocksWithId)
        }
        return result
    }
    
    public static func findWordIdInInterlocks(interlocks: [InterlockModel], wordSequence: [String]) -> [InterlockModel] {
        var result: [InterlockModel] = []
        
        for interlock in interlocks {
            var interlock = interlock
            interlock.horizontalWordId =  WordCalculator.extractWordId(search: interlock.horizontalWord, words: wordSequence)
            interlock.verticalWordId = WordCalculator.extractWordId(search: interlock.verticalWord, words: wordSequence)
            result.append(interlock)
        }
        return result
    }
    
    public static func findCodeBreakersInInterlocks(interlocksArray: [[InterlockModel]], wordSequence: [String]) -> [[CodeBreakerModel]] {
        var result: [[CodeBreakerModel]] = []
        for i in 0..<wordSequence.count {
            let word = wordSequence[i]
            let interlocks = interlocksArray[i]
            
            let codeBreakers = findCodeBreakersInInterlocks(interlocks: interlocks, word: word)
            result.append(codeBreakers)
        }
        return result
    }
    public static func findCodeBreakersInInterlocks(interlocks: [InterlockModel], word: String) -> [CodeBreakerModel] {
        var result: [CodeBreakerModel] = []
        
        for interlock in interlocks {
            
            let codeBreakerModel = findContraint(word: word, interlock: interlock)
            if codeBreakerModel != nil {
                result.append(codeBreakerModel!)
            }
        }
        
        return result
    }
    
    /// If our word list doesnt have a word with the length we need then the whole thing is invalid and we can give up
    public static func wordsPerPositionAreValid(wordsPerPosition list: [[String]]) -> Bool {
        for item in list {
            if item.count == 0 {
                return false
            }
        }
        return true
    }
    
    //
    
    
    
    public static func getIngredientsForCalculation(grid: [String]) -> ([String], [[CodeBreakerModel]]) {
        
        /// word sequences and the interlocks for the word sequence at that point which are really constraints to obey
        let (wordSequence, interlocksArray) = FindPathAndInterlocksCalculator.execute(grid: grid)
        
        let interlocksWithWordIdArray = findWordIdInInterlocks(interlocksArray: interlocksArray, wordSequence: wordSequence)
        
        let codeBreakers = findCodeBreakersInInterlocks(interlocksArray: interlocksWithWordIdArray, wordSequence: wordSequence)
        
        return (wordSequence, codeBreakers)
 
    }
    
    public static func convertInterlocksToXY(interlocksArray: [[InterlockModel]]) -> [(Int, Int)] {
        var result: [(Int,Int)] = []
        for interlocks in interlocksArray {
            for interlock in interlocks {
                result.append((interlock.x, interlock.y))
            }
        }
        
        // sort by x and then by y
        result.sort() {
            if $0.0 == $1.0 {
                return $0.1 < $1.1
            } else {
                return $0.0 < $1.0
            }
        }
        
        
        
        
        return result
    }
    /// Provides us with the list of words that can be in each position in the sequence
    public static func setLockParameters(words: [String], wordSequence sequences: [String]) -> [[String]] {
        var result: [[String]] = []
        for sequence in sequences {
            let length = sequence.count
            
            let qualifyingWords = words.filter { $0.count == length}
            if qualifyingWords.count > 0 {
                result.append(qualifyingWords)
            } else {
                return [] // meaning we cannot do this
            }
        }
        return result
    }
    
    public static func setLockParameters(words: [String], placements: [PlacementModel]) -> [[String]] {
        var result: [[String]] = []
        for placement in placements {
            let length = placement.l
            
            let qualifyingWords = words.filter { $0.count == length}
            if qualifyingWords.count > 0 {
                result.append(qualifyingWords)
            } else {
                return [] // meaning we cannot do this
            }
        }
        return result
    }
}
