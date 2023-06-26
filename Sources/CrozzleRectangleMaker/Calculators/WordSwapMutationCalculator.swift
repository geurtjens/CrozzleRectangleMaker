//
//  WordSwapMutationCalculator.swift
//  
//
//  Created by Michael Geurtjens on 24/6/2023.
//

import Foundation
public class WordSwapMutationCalculator {
    
    
    public static func wordOrder8612() -> [String] {
        return ["NAZARETH", "NUTS", "ZION", "EVE", "HOLLY", "SING", "BELLS", "JOY", "JELLY", "HAZELNUT", "HYMN", "AZURE", "STAR", "MERRY", "INN", "TURKEY", "PORK", "SAUCE", "TOYS", "TOAST", "TREE", "FAMILY", "WHITE", "SNOW", "CAKE"]
    }
    
    public static func mutate8612(words: [String]) -> [[String]] {
        
        var result:[[String]] = []
        let w = words
        let c = words.count
        let len = WordCalculator.lengths(words: words)
        
        for nazareth in 0..<c {
            if (len[nazareth] == 8) {
                
                for nuts in 0..<c {
                    if (len[nuts] == 4 &&
                        w[nazareth][0] == w[nuts][0]) {
                    
                        for zion in 0..<c {
                            if (len[zion] == 4 &&
                                zion != nuts &&
                                w[zion][0] == w[nazareth][2]) {
                                
                                for eve in 0..<c {
                                    if (len[eve] == 3 &&
                                        w[eve][0] == w[nazareth][5]) {
                                        
                                        for holly in 0..<c {
                                            if (len[holly] == 5 &&
                                                w[holly][0] == w[nazareth][7]) {
                                                
                                                for sing in 0..<c {
                                                    if (len[sing] == 4 &&
                                                        sing != zion &&
                                                        sing != nuts &&
                                                        w[sing][0] == w[nuts][3] &&
                                                        w[sing][2] == w[zion][3]) {
                                                        
                                                        for bells in 0..<c {
                                                            if (len[bells] == 5 &&
                                                                bells != holly &&
                                                                w[bells][1] == w[eve][2] &&
                                                                w[bells][3] == w[holly][2]) {
                                                                
                                                                for joy in 0..<c {
                                                                    if (len[joy] == 3 &&
                                                                        joy != eve &&
                                                                        w[joy][2] == w[holly][4]) {
                                                                        
                                                                        for jelly in 0..<c {
                                                                            if (len[jelly] == 5 &&
                                                                                jelly != holly &&
                                                                                jelly != bells &&
                                                                                w[jelly][0] == w[joy][0]) {
                                                                                
                                                                                for hazelnut in 0..<c {
                                                                                    if (len[hazelnut] == 8 &&
                                                                                        hazelnut != nazareth &&
                                                                                        w[hazelnut][4] == w[jelly][2]) {
                                                                                        
                                                                                        for hymn in 0..<c {
                                                                                            if (len[hymn] == 4 &&
                                                                                                hymn != nuts &&
                                                                                                hymn != zion &&
                                                                                                hymn != sing &&
                                                                                                w[hymn][0] == w[hazelnut][0]) {
                                                                                                
                                                                                                for azure in 0..<c {
                                                                                                    if (len[azure] == 5 &&
                                                                                                        azure != holly &&
                                                                                                        azure != bells &&
                                                                                                        azure != jelly &&
                                                                                                        w[azure][1] == w[hazelnut][2]) {
                                                                                                        
                                                                                                        for star in 0..<c {
                                                                                                            if (len[star] == 4 &&
                                                                                                                star != nuts &&
                                                                                                                star != zion &&
                                                                                                                star != sing &&
                                                                                                                star != hymn &&
                                                                                                                w[star][1] == w[hazelnut][7]) {
                                                                                                                
                                                                                                                for merry in 0..<c {
                                                                                                                    if (len[merry] == 5 &&
                                                                                                                        merry != holly &&
                                                                                                                        merry != bells &&
                                                                                                                        merry != jelly &&
                                                                                                                        merry != azure &&
                                                                                                                        w[merry][0] == w[hymn][2] &&
                                                                                                                        w[merry][2] == w[azure][3] &&
                                                                                                                        w[merry][4] == w[jelly][4]) {
                                                                                                                        
                                                                                                                        for inn in 0..<c {
                                                                                                                            if (len[inn] == 3 &&
                                                                                                                                inn != eve &&
                                                                                                                                inn != joy &&
                                                                                                                                w[inn][2] == w[hymn][3]) {
                                                                                                                                
                                                                                                                                for turkey in 0..<c {
                                                                                                                                    if (len[turkey] == 6 &&
                                                                                                                                        w[turkey][5] == w[hymn][1]) {
                                                                                                                                        
                                                                                                                                        for pork in 0..<c {
                                                                                                                                            if (len[pork] == 4 &&
                                                                                                                                                pork != nuts &&
                                                                                                                                                pork != zion &&
                                                                                                                                                pork != sing &&
                                                                                                                                                pork != hymn &&
                                                                                                                                                pork != star &&
                                                                                                                                                w[pork][3] == w[turkey][3]) {
                                                                                                                                                
                                                                                                                                                for sauce in 0..<c {
                                                                                                                                                    if (len[sauce] == 5 &&
                                                                                                                                                        sauce != holly &&
                                                                                                                                                        sauce != bells &&
                                                                                                                                                        sauce != jelly &&
                                                                                                                                                        sauce != azure &&
                                                                                                                                                        sauce != merry &&
                                                                                                                                                        w[sauce][2] == w[turkey][1]) {
                                                                                                                                                        
                                                                                                                                                        for toys in 0..<c {
                                                                                                                                                            if (len[toys] == 4 &&
                                                                                                                                                                toys != nuts &&
                                                                                                                                                                toys != zion &&
                                                                                                                                                                toys != sing &&
                                                                                                                                                                toys != hymn &&
                                                                                                                                                                toys != star &&
                                                                                                                                                                toys != pork &&
                                                                                                                                                                w[toys][3] == w[sauce][0]) {
                                                                                                                                                                
                                                                                                                                                                for toast in 0..<c {
                                                                                                                                                                    if (len[toast] == 5 &&
                                                                                                                                                                        toast != holly &&
                                                                                                                                                                        toast != bells &&
                                                                                                                                                                        toast != jelly &&
                                                                                                                                                                        toast != azure &&
                                                                                                                                                                        toast != merry &&
                                                                                                                                                                        toast != sauce &&
                                                                                                                                                                        
                                                                                                                                                                        w[toast][0] == w[toys][0]) {
                                                                                                                                                                        
                                                                                                                                                                        for tree in 0..<c {
                                                                                                                                                                            if (len[tree] == 4 &&
                                                                                                                                                                                tree != nuts &&
                                                                                                                                                                                tree != zion &&
                                                                                                                                                                                tree != sing &&
                                                                                                                                                                                tree != hymn &&
                                                                                                                                                                                tree != star &&
                                                                                                                                                                                tree != pork &&
                                                                                                                                                                                tree != toys &&
                                                                                                                                                                                w[tree][0] == w[toast][4] &&
                                                                                                                                                                                w[tree][3] == w[sauce][4]) {
                                                                                                                                                                                
                                                                                                                                                                                for family in 0..<c {
                                                                                                                                                                                    if (len[family] == 6 &&
                                                                                                                                                                                        family != turkey &&
                                                                                                                                                                                        w[family][5] == w[toys][2]) {
                                                                                                                                                                                        
                                                                                                                                                                                        for white in 0..<c {
                                                                                                                                                                                            if (len[white] == 5 &&
                                                                                                                                                                                                white != holly &&
                                                                                                                                                                                                white != bells &&
                                                                                                                                                                                                white != jelly &&
                                                                                                                                                                                                white != azure &&
                                                                                                                                                                                                white != merry &&
                                                                                                                                                                                                white != sauce &&
                                                                                                                                                                                                white != toast &&
                                                                                                                                                                                                
                                                                                                                                                                                                w[white][2] == w[family][3]) {
                                                                                                                                                                                                
                                                                                                                                                                                                for snow in 0..<c {
                                                                                                                                                                                                    if (len[snow] == 4 &&
                                                                                                                                                                                                        snow != nuts &&
                                                                                                                                                                                                        snow != zion &&
                                                                                                                                                                                                        snow != sing &&
                                                                                                                                                                                                        snow != hymn &&
                                                                                                                                                                                                        snow != star &&
                                                                                                                                                                                                        snow != pork &&
                                                                                                                                                                                                        snow != toys &&
                                                                                                                                                                                                        snow != tree &&
                                                                                                                                                                                                        w[snow][3] == w[white][0]) {
                                                                                                                                                                                                        
                                                                                                                                                                                                        for cake in 0..<c {
                                                                                                                                                                                                            if (len[cake] == 4 &&
                                                                                                                                                                                                                cake != nuts &&
                                                                                                                                                                                                                cake != zion &&
                                                                                                                                                                                                                cake != sing &&
                                                                                                                                                                                                                cake != hymn &&
                                                                                                                                                                                                                cake != star &&
                                                                                                                                                                                                                cake != pork &&
                                                                                                                                                                                                                cake != toys &&
                                                                                                                                                                                                                cake != tree &&
                                                                                                                                                                                                                cake != snow &&
                                                                                                                                                                                                                w[cake][3] == w[white][4]) {
                                                                                                                                                                                                                
                                                                                                                                                                                                                let item = [
                                                                                                                                                                                                                    w[nazareth],
                                                                                                                                                                                                                    w[nuts],
                                                                                                                                                                                                                    w[zion],
                                                                                                                                                                                                                    w[eve],
                                                                                                                                                                                                                    w[holly],
                                                                                                                                                                                                                    w[sing],
                                                                                                                                                                                                                    w[bells],
                                                                                                                                                                                                                    w[joy],
                                                                                                                                                                                                                    w[jelly],
                                                                                                                                                                                                                    w[hazelnut],
                                                                                                                                                                                                                    w[hymn],
                                                                                                                                                                                                                    w[azure],
                                                                                                                                                                                                                    w[star],
                                                                                                                                                                                                                    w[merry],
                                                                                                                                                                                                                    w[inn],
                                                                                                                                                                                                                    w[turkey],
                                                                                                                                                                                                                    w[pork],
                                                                                                                                                                                                                    w[sauce],
                                                                                                                                                                                                                    w[toys],
                                                                                                                                                                                                                    w[toast],
                                                                                                                                                                                                                    w[tree],
                                                                                                                                                                                                                    w[family],
                                                                                                                                                                                                                    w[white],
                                                                                                                                                                                                                    w[snow],
                                                                                                                                                                                                                    w[cake]
                                                                                                                                                                                                                    ]
                                                                                                                                                                                                                    
                                                                                                                                                                                                                result.append(item)
  
                                                                                                                                                                                                            }
                                                                                                                                                                                                        }
                                                                                                                                                                                                    }
                                                                                                                                                                                                }
                                                                                                                                                                                            }
                                                                                                                                                                                        }
                                                                                                                                                                                    }
                                                                                                                                                                                }
                                                                                                                                                                            }
                                                                                                                                                                        }
                                                                                                                                                                    }
                                                                                                                                                                }
                                                                                                                                                            }
                                                                                                                                                        }
                                                                                                                                                    }
                                                                                                                                                }
                                                                                                                                            }
                                                                                                                                        }
                                                                                                                                    }
                                                                                                                                }
                                                                                                                            }
                                                                                                                        }
                                                                                                                    }
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return result
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
    
    public static func FindPathAndInterlocks(grid: [String]) -> [(String,[InterlockModel])] {
        
        var result:[(String,[InterlockModel])] = []
        
        if grid.count == 0 {
            return result
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
                    
                    result.append((currentWord, associatedInterlocks))
                    spentWords.append(currentWord)
                    
                }
            }
            isHorizontal = !isHorizontal
            todoList = futureToDo
            futureToDo = []
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
//    public static func FindPathAndInterlocks(grid: [String], words: [String]) -> [(String,[String])] {
//        
//        var (placements, success) = PlacementCalculator.fromTextToPlacements(grid: grid, words: words)
//        
//        if success == false {
//            return []
//        }
//        
//        placements = placements.sorted() {
//            if $0.x == $1.x {
//                return $0.y < $1.y
//            } else {
//                return $0.x < $1.x
//            }
//        }
//         
//        var result:[(String,[String])] = []
//        
//        let horizontal = placements.filter { $0.h }
//        let vertical = placements.filter {$0.h == false }
//        
//        let nazareth = horizontal[0]
//
//        let nazarethWord = words[Int(nazareth.i)]
//
//        result.append((nazarethWord,[]))
//        
//        
//        let filteredV = vertical.filter {
//            $0.x > nazareth.x && $0.x <= nazareth.x + nazareth.l
//            && $0.y <= nazareth.y && $0.y >= nazareth.y }
//        
//        
//        
//        
//    }
    
    
}
