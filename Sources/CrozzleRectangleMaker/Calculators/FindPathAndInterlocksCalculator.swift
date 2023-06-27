//
//  FindPathAndInterlocksCalculator.swift
//  
//
//  Created by Michael Geurtjens on 24/6/2023.
//

import Foundation
public class FindPathAndInterlocksCalculator {
    
    
    public static func execute(grid: [String]) -> ([String],[[InterlockModel]]) {
        
        var result:[[InterlockModel]] = []
        
        if grid.count == 0 {
            return ([],[])
        }
        
        var spentWords:[String] = []
        var spentInterlocks: Set<InterlockModel> = []
        var todoList:[InterlockModel] = []
        var futureToDo:[InterlockModel] = [] // Make a copy
        
        var isHorizontal = true
        
        let interlocks = GridCalculator.findInterlocks(grid: grid)
        
        todoList.append(interlocks[0])
         
        while todoList.count > 0 || futureToDo.count > 0 {
            
            for todo in todoList {
                let currentWord = getWord(interlock: todo, isHorizontal: isHorizontal)
               
                if spentWords.contains(currentWord) == false {
                    
                    let matchingInterlocks = FindUnspentInterlocks(word: currentWord, interlocks: interlocks, spentInterlocks: spentInterlocks, spentWords: spentWords)
                    var associatedInterlocks: [InterlockModel] = []
                    
                    
                    for interlock in matchingInterlocks {
                        let word = getWord(interlock: interlock, isHorizontal: !isHorizontal)
                        if spentWords.contains(word) {
                            associatedInterlocks.append(interlock)
                            spentInterlocks.insert(interlock)
                        }
                        futureToDo.append(interlock)
                    }
                    
                    result.append(associatedInterlocks)
                    spentWords.append(currentWord)
                    
                }
            }
            isHorizontal = !isHorizontal
            todoList = futureToDo
            futureToDo = []
        }
        
        return (spentWords, result)
        
    }
    
    
    /// Find interlocks that are not yet spent based on the given word
    public static func FindUnspentInterlocks(word: String, interlocks: [InterlockModel], spentInterlocks: Set<InterlockModel>, spentWords: [String]) -> [InterlockModel] {
        let found = interlocks.filter { $0.horizontalWord == word || $0.verticalWord == word }
        
        var result:[InterlockModel] = []
        for item in found {
            if spentInterlocks.contains(item) == false {
                if spentWords.contains(item.horizontalWord) == false || spentWords.contains(item.verticalWord) == false {
                    result.append(item)
                }
            }
        }
        return result
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    public static func getWord(interlock: InterlockModel, isHorizontal: Bool) -> String {
        if isHorizontal {
            return interlock.horizontalWord
        } else {
            return interlock.verticalWord
        }
    }
  
    
    
}
