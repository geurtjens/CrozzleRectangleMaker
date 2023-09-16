//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 16/9/2023.
//

/// We have `expanded a shape` to get a lot of new shapes.  All these shapes come from the same `parent shape` and so are `sibling shapes`.
/// We know that they all can expand the parent and in fact are `different choices for expanding the parent`.
/// So can these different choices also `expand the sibling`
/// Now if `sibling A can expand sibling B` then it follows that `sibling B will expand sibling A` and create a duplicate


import Foundation
public class SiblingMergeCalculator {
    
    public static func execute(parent: ShapeModel, siblings: [ShapeModel], searchShapes: [ShapeModel], words: [String], wordsInt: [[Int]], widthMax: Int, heightMax: Int, wordIndex: WordIndexModelV2, scoresMin: [Int]) -> [[ShapeModel]] {
        
        var result: [[ShapeModel]] = []
    
        // These are the shapes that all the siblings have added to become unique siblings
        let leafShapesAddedToBecomeSiblings = getSiblingLastShape(siblings: siblings)
        
        // These are the extra words that the siblings have added
        let wordDifferenceBetweenParentAndSibling = getWordDifferences(parent: parent, siblings: siblings)
        
        
        // So now we can add the siblings to each other and see if they merge
        // We can check the added words are not the same
        
        var processedQueue: Set<String> = []
        for siblingId in 0..<siblings.count {
            
            var resultForShape: [ShapeModel] = []
            
            let sourceShapeId = leafShapesAddedToBecomeSiblings[siblingId]
            let sourceShape = siblings[siblingId]
            let siblingWords = wordDifferenceBetweenParentAndSibling[siblingId]
            
            
            
            // We want to find all the siblings that have different words added than this older sibling (closer to top of list)
            
            
            
            for matchingSiblingId in 0..<siblings.count {
                
                let searchShapeId = leafShapesAddedToBecomeSiblings[matchingSiblingId]
                let wordsInMatchingSibling = wordDifferenceBetweenParentAndSibling[matchingSiblingId]
                
                let searchForDuplicates = "\(searchShapeId),\(sourceShapeId)"
                
                
                if (matchingSiblingId != siblingId &&
                    processedQueue.contains(searchForDuplicates) == false &&
                    siblingWords.intersection(wordsInMatchingSibling).count != 0) {
                    

                    processedQueue.insert("\(sourceShapeId),\(searchShapeId)")
                        
                    // This means that they have different words and so a merge is possible

                        
                    if let mergedShape = MergeCalculatorV2.mergeTwoShapes(sourceShape: sourceShape, searchShape: searchShapes[searchShapeId], words: words, widthMax: widthMax, heightMax: heightMax) {
                        
                        resultForShape.append(mergedShape)
                    }
                   
                }
            }
            
            
            // Find matches that only link to the new words that this has added
            let instructions = wordIndex.findMatches(containingWords: Array(siblingWords),
                                                     shapesToExclude: leafShapesAddedToBecomeSiblings,
                                                     sourceShape: sourceShape, sourceShapeId: sourceShapeId, searchShapes: searchShapes)
            
            // ScoresMin is flawed if we want to merge larger shapes together eventually
            // it is the score starting from the beginning not score inbetween or increments to score
            
            
            let extraShapes = MergeCalculatorV2.GetShapesFromInstructions(
                instructions: instructions,
                sourceShape: sourceShape,
                searchShapes: searchShapes,
                words: words,
                wordsInt: wordsInt,
                scoresMin: scoresMin,
                widthMax: widthMax,
                heightMax: heightMax)
            
            resultForShape += extraShapes
            
            
            
            
            result.append(resultForShape)
        }
        
        
        
        return result
    }
    
    public static func getSiblingLastShape(siblings: [ShapeModel]) -> [Int] {
        var result: [Int] = []
        for sibling in siblings {
            result.append(sibling.mergeHistory.last!)
        }
        return result
    }
    public static func getWordDifferences(parent: ShapeModel, siblings: [ShapeModel]) -> [Set<Int>] {
        var result: [Set<Int>] = []
        
        let parentWords = getWordsFromShape(shape: parent)
        
        for sibling in siblings {
            let siblingWords = getWordsFromShape(shape: sibling)
            
            let missingWords = findExtraWords(parent: parentWords, sibling: siblingWords)
            result.append(missingWords)
        }
        return result
    }
    
    public static func findExtraWords(parent: Set<Int>, sibling: Set<Int>) -> Set<Int> {
        let missingWords = sibling.subtracting(parent)
        return missingWords
    }
    
    public static func getWordsFromShape(shape: ShapeModel) -> Set<Int> {
        var result: Set<Int> = []
        for placement in shape.placements {
            result.insert(Int(placement.w))
        }
        return result
    }
    
    
}
