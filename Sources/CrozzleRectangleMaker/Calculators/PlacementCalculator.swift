//
//  ShapeCalculator.swift
//  
//
//  Created by Michael Geurtjens on 18/5/2023.
//

import Foundation

/// Placements that are derived from rectangles.  Placements will be sorted with lowest wordId first
public class PlacementCalculator {
    
    /// converts `topLeft` rectangles to placements
    public static func ConvertToPlacements(topLeft input: RectangleModel) -> [PlacementModel] {
        
        let maxLeft = Int(input.bottomLetterPos)
        
        let maxUp = Int(input.rightLetterPos) + 1
        
        let topPlacement = PlacementModel(
            w: input.top,
            x: UInt8(maxLeft + 1),
            y: UInt8(maxUp),
            z: true,
            l: input.topLength
        )
        
        let bottomPlacement = PlacementModel(
            w: input.bottom,
            x: UInt8(maxLeft - Int(input.bottomLetterPos)),
            y: UInt8(maxUp + Int(input.interlockHeight)),
            z: true,
            l: input.bottomLength)
        
        let leftPlacement = PlacementModel(
            w: input.left,
            x: UInt8(maxLeft + 1),
            y: UInt8(maxUp),
            z: false,
            l: input.leftLength)
        
        let rightPlacement = PlacementModel(
            w: input.right,
            x: UInt8(maxLeft + Int(input.interlockWidth) + 1),
            y: 0,
            z: false,
            l: input.rightLength)
        
        var placements = [topPlacement, bottomPlacement, leftPlacement, rightPlacement]
        
        placements.sort { $0.w < $1.w }
        
        return placements
    }
    
    
    /// converts `topRight` rectangles to placements
    public static func ConvertToPlacements(topRight input: RectangleModel) -> [PlacementModel] {
        
        let maxLeft = Int(max(input.topLetterPos, input.bottomLetterPos))
        
        let maxUp = Int(input.leftLetterPos) + 1
        
        let topPlacement = PlacementModel(
            w: input.top,
            x: UInt8(maxLeft - Int(input.topLetterPos)),
            y: UInt8(maxUp),
            z: true,
            l: input.topLength)
        
        let bottomPlacement = PlacementModel(
            w: input.bottom,
            x: UInt8(maxLeft - Int(input.bottomLetterPos)),
            y: UInt8(maxUp + Int(input.interlockHeight)),
            z: true,
            l: input.bottomLength)
        
        let leftPlacement = PlacementModel(
            w: input.left,
            x: UInt8(maxLeft + 1),
            y: 0,
            z: false,
            l: input.leftLength)
        
        let rightPlacement = PlacementModel(
            w: input.right,
            
            x: UInt8(maxLeft + Int(input.interlockWidth) + 1),
            y: UInt8(maxUp),
            z: false,
            l: input.rightLength)
        
        var placements = [topPlacement, bottomPlacement, leftPlacement, rightPlacement]
        
        placements.sort { $0.w < $1.w }
        
        return placements
    }
    
    
    /// converts `bottomLeft` rectangles to placements
    public static func ConvertToPlacements(bottomLeft input: RectangleModel) -> [PlacementModel] {
        
        let maxLeft = Int(input.topLetterPos) + 1
        
        let maxUp = Int(max(input.leftLetterPos, input.rightLetterPos))
        
        let topPlacement = PlacementModel(
            w: input.top,
            x: 0,
            y: UInt8(maxUp + 1),
            z: true,
            l: input.topLength)
        
        let bottomPlacement = PlacementModel(
            w: input.bottom,
            x: UInt8(maxLeft),
            y: UInt8(maxUp + 1 + Int(input.interlockHeight)),
            z: true,
            l: input.bottomLength)
        
        let leftPlacement = PlacementModel(
            w: input.left,
            x: UInt8(maxLeft),
            y: UInt8(maxUp - Int(input.leftLetterPos)),
            z: false,
            l: input.leftLength)
        
        let rightPlacement = PlacementModel(
            w: input.right,
            x: UInt8(maxLeft + Int(input.interlockWidth)),
            y: UInt8(maxUp - Int(input.rightLetterPos)),
            z: false,
            l: input.rightLength)
        
        var placements = [topPlacement, bottomPlacement, leftPlacement, rightPlacement]
        
        placements.sort { $0.w < $1.w }
        
        return placements

    }
    
    
    /// Converts `rectangles` to placements
    public static func ConvertToPlacements(rectangle input: RectangleModel) -> [PlacementModel] {
        
        let maxLeft = Int(max(input.topLetterPos, input.bottomLetterPos))
        
        let maxUp = Int(max(input.leftLetterPos, input.rightLetterPos))
        
        let topPlacement = PlacementModel(
            w: input.top,
            x: UInt8(maxLeft - Int(input.topLetterPos)),
            y: UInt8(maxUp + 1),
            z: true,
            l: input.topLength)
        
        let bottomPlacement = PlacementModel(
            w: input.bottom,
            x: UInt8(maxLeft - Int(input.bottomLetterPos)),
            y: UInt8(maxUp + 1 + Int(input.interlockHeight)),
            z: true,
            l: input.bottomLength)
        
        let leftPlacement = PlacementModel(
            w: input.left,
            x: UInt8(maxLeft + 1),
            y: UInt8(maxUp - Int(input.leftLetterPos)),
            z: false,
            l: input.leftLength)
        
        let rightPlacement = PlacementModel(
            w: input.right,
            x: UInt8(maxLeft + 1 + Int(input.interlockWidth)),
            y: UInt8(maxUp - Int(input.rightLetterPos)),
            z: false,
            l: input.rightLength)
        
        var placements = [topPlacement, bottomPlacement, leftPlacement, rightPlacement]
        
        placements.sort { $0.w < $1.w }
        
        return placements
    }
    
    
    /// calculates `width` from `placements`
    public static func width(fromPlacements placements: [PlacementModel]) -> UInt8 {
        var maxWidth = 0
        for placement in placements {
            if placement.z {
                let end = Int(placement.x + placement.l)
                if maxWidth < end {
                    maxWidth = end
                }
            } else {
                let end = Int(placement.x)
                if maxWidth < end {
                    maxWidth = end
                }
            }
        }
        return UInt8(maxWidth + 2)
    }
    
    
    /// calculates `height` from `placements`
    public static func height(fromPlacements placements: [PlacementModel]) -> UInt8 {
        var maxHeight = 0
        for placement in placements {
            if placement.z == false {
                let end = Int(placement.y + placement.l)
                if maxHeight < end {
                    maxHeight = end
                }
            } else {
                let end = Int(placement.y)
                if maxHeight < end {
                    maxHeight = end
                }
            }
        }
        return UInt8(maxHeight + 2)
    }
    
    public static func fromTextToPlacements(grid: [String], words: [String]) -> ([PlacementModel],Bool) {
        let (horizontal, isValid) = fromTextToPlacementsHorizontal(grid: grid, words: words)
        
        if isValid == false {
            return (horizontal, isValid)
        }
     
        let flippedGrid = GridCalculator.rotate(grid: grid)
        
        // The vertical has not yet been rotated so cannot use in basic form
        let (vertical, isValidVertical) = fromTextToPlacementsHorizontal(grid: flippedGrid, words: words)
        
        let verticalFlipped = flip(placements: vertical)
        
        let placements: [PlacementModel] = horizontal + verticalFlipped
        
        
        return (placements, isValidVertical)
    }
    
    public static func flip(placements: [PlacementModel]) -> [PlacementModel] {
        
        var flipped:[PlacementModel] = []
        for p in placements {
            flipped.append(PlacementModel(w: p.w, x: p.y, y: p.x, z: !p.z, l: p.l))
        }
        return flipped
    }
    
    public static func findCommonPlacement(sourcePlacements: [PlacementModel], searchPlacements:[PlacementModel]) -> [Int] {
        var commonPlacements:[Int] = []
        for source in sourcePlacements {
            for search in searchPlacements {
                if source.w == search.w {
                   commonPlacements.append(Int(source.w))
                }
            }
        }
        return commonPlacements
    }
        
    public static func hasCommonPlacement(sourcePlacements: [PlacementModel], searchPlacements:[PlacementModel]) -> Bool {
        var commonPlacements:[PlacementModel] = []
        for source in sourcePlacements {
            for search in searchPlacements {
                if source.w == search.w {
                    if source.z == search.z && source.x == search.x && source.y == search.y && source.l == search.l {
                        commonPlacements.append(source)
                    } else {
                        return false
                    }
                }
            }
        }
        return commonPlacements.count > 0
    }
    public static func fromTextToPlacementsHorizontal(grid: [String], words:[String]) -> ([PlacementModel],Bool) {
        
        var placements: [PlacementModel] = []
        
        for y in 1..<grid.count - 1 {
            let line = grid[y]

            var word = ""
            var xPos = 0
            for x in 1..<line.count {
                let current = line[x]

                if word == "" {
                    if line[x - 1] == "." && ShapeCalculator.IsAlphabet(current) && x != line.count - 1 && ShapeCalculator.IsAlphabet(line[x + 1]) {
                        word += String(current)
                        xPos = x
                    }
                } else {
                    if ShapeCalculator.IsAlphabet(current) {
                        word += String(current)
                    } else if current == "." {
                        // We have finished the word
                        let wordId = WordCalculator.extractWordId(search: word, words: words)
                        if wordId == -1 {
                            print("\(word) not found in wordlist")
                            // It is invalid as we cannot find this word
                            return (placements, false)
                        } else {
                            
                            placements.append(PlacementModel(
                                w: UInt8(wordId),
                                x: UInt8(xPos - 1),
                                y: UInt8(y),
                                z: true,
                                l: UInt8(word.count)))
                            word = ""
                        }
                        
                        
                    } else if current == "." {
                        // this is invalid as a word cannot end in a space
                        return (placements, false)
                    }
                }
            }
        }
        
        
        return (placements,true)
        
    }
    
    
    public static func ToCode(fromPlacements placements: [PlacementModel]) -> String {
        var code = ""
        
        for placement in placements {
            if code != "" {
                code += ",\n"
            }
            code += "        " + ToCode(fromPlacement: placement)
        }
        
        let result = "let placements = [\n\(code)\n    ]"
        return result
    }
    
    public static func ToCode(fromPlacement placement: PlacementModel) -> String {
        var horizontal = "true"
        if placement.z == false {
            horizontal = "false"
        }
        
        return "PlacementModel(w: \(placement.w), x: \(placement.x), y: \(placement.y), z: \(horizontal), l:\(placement.l))"
    }
}
