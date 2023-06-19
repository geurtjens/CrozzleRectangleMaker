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
            i: input.top,
            h: true,
            x: UInt8(maxLeft + 1),
            y: UInt8(maxUp),
            l: input.topLength
        )
        
        let bottomPlacement = PlacementModel(
            i: input.bottom,
            h: true,
            x: UInt8(maxLeft - Int(input.bottomLetterPos)),
            y: UInt8(maxUp + Int(input.interlockHeight)),
            l: input.bottomLength)
        
        let leftPlacement = PlacementModel(
            i: input.left,
            h: false,
            x: UInt8(maxLeft + 1),
            y: UInt8(maxUp),
            l: input.leftLength)
        
        let rightPlacement = PlacementModel(
            i: input.right,
            h: false,
            x: UInt8(maxLeft + Int(input.interlockWidth) + 1),
            y: 0,
            l: input.rightLength)
        
        var placements = [topPlacement, bottomPlacement, leftPlacement, rightPlacement]
        
        placements.sort { $0.i < $1.i}
        
        return placements
    }
    
    
    /// converts `topRight` rectangles to placements
    public static func ConvertToPlacements(topRight input: RectangleModel) -> [PlacementModel] {
        
        let maxLeft = Int(max(input.topLetterPos, input.bottomLetterPos))
        
        let maxUp = Int(input.leftLetterPos) + 1
        
        let topPlacement = PlacementModel(
            i: input.top,
            h: true,
            x: UInt8(maxLeft - Int(input.topLetterPos)),
            y: UInt8(maxUp),
            l: input.topLength)
        
        let bottomPlacement = PlacementModel(
            i: input.bottom,
            h: true,
            x: UInt8(maxLeft - Int(input.bottomLetterPos)),
            y: UInt8(maxUp + Int(input.interlockHeight)),
            l: input.bottomLength)
        
        let leftPlacement = PlacementModel(
            i: input.left,
            h: false,
            x: UInt8(maxLeft + 1),
            y: 0,
            l: input.leftLength)
        
        let rightPlacement = PlacementModel(
            i: input.right,
            h: false,
            x: UInt8(maxLeft + Int(input.interlockWidth) + 1),
            y: UInt8(maxUp),
            l: input.rightLength)
        
        var placements = [topPlacement, bottomPlacement, leftPlacement, rightPlacement]
        
        placements.sort { $0.i < $1.i}
        
        return placements
    }
    
    
    /// converts `bottomLeft` rectangles to placements
    public static func ConvertToPlacements(bottomLeft input: RectangleModel) -> [PlacementModel] {
        
        let maxLeft = Int(input.topLetterPos) + 1
        
        let maxUp = Int(max(input.leftLetterPos, input.rightLetterPos))
        
        let topPlacement = PlacementModel(
            i: input.top,
            h: true,
            x: 0, //maxLeft - input.topLetterPos,
            y: UInt8(maxUp + 1),
            l: input.topLength)
        
        let bottomPlacement = PlacementModel(
            i: input.bottom,
            h: true,
            x: UInt8(maxLeft), // - input.bottomLetterPos,
            y: UInt8(maxUp + 1 + Int(input.interlockHeight)),
            l: input.bottomLength)
        
        let leftPlacement = PlacementModel(
            i: input.left,
            h: false,
            x: UInt8(maxLeft),
            y: UInt8(maxUp - Int(input.leftLetterPos)),
            l: input.leftLength)
        
        let rightPlacement = PlacementModel(
            i: input.right,
            h: false,
            x: UInt8(maxLeft + Int(input.interlockWidth)),
            y: UInt8(maxUp - Int(input.rightLetterPos)),
            l: input.rightLength)
        
        var placements = [topPlacement, bottomPlacement, leftPlacement, rightPlacement]
        
        placements.sort { $0.i < $1.i}
        
        return placements

    }
    
    
    /// Converts `rectangles` to placements
    public static func ConvertToPlacements(rectangle input: RectangleModel) -> [PlacementModel] {
        
        let maxLeft = Int(max(input.topLetterPos, input.bottomLetterPos))
        
        let maxUp = Int(max(input.leftLetterPos, input.rightLetterPos))
        
        let topPlacement = PlacementModel(
            i: input.top,
            h: true,
            x: UInt8(maxLeft - Int(input.topLetterPos)),
            y: UInt8(maxUp + 1),
            l: input.topLength)
        
        let bottomPlacement = PlacementModel(
            i: input.bottom,
            h: true,
            x: UInt8(maxLeft - Int(input.bottomLetterPos)),
            y: UInt8(maxUp + 1 + Int(input.interlockHeight)),
            l: input.bottomLength)
        
        let leftPlacement = PlacementModel(
            i: input.left,
            h: false,
            x: UInt8(maxLeft + 1),
            y: UInt8(maxUp - Int(input.leftLetterPos)),
            l: input.leftLength)
        
        let rightPlacement = PlacementModel(
            i: input.right,
            h: false,
            x: UInt8(maxLeft + 1 + Int(input.interlockWidth)),
            y: UInt8(maxUp - Int(input.rightLetterPos)),
            l: input.rightLength)
        
        var placements = [topPlacement, bottomPlacement, leftPlacement, rightPlacement]
        
        placements.sort { $0.i < $1.i}
        
        return placements
    }
    
    
    /// calculates `width` from `placements`
    public static func width(fromPlacements placements: [PlacementModel]) -> UInt8 {
        var maxWidth = 0
        for placement in placements {
            if placement.h {
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
            if placement.h == false {
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
        
        var placements: [PlacementModel] = horizontal + verticalFlipped
        
        
        return (placements, isValidVertical)
    }
    
    public static func flip(placements: [PlacementModel]) -> [PlacementModel] {
        
        var flipped:[PlacementModel] = []
        for p in placements {
            flipped.append(PlacementModel(i: p.i, h: !p.h, x: p.y, y: p.x, l: p.l))
        }
        return flipped
    }
        
        
    public static func fromTextToPlacementsHorizontal(grid: [String], words:[String]) -> ([PlacementModel],Bool) {
        
        var placements: [PlacementModel] = []
        
        let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        
        for y in 1..<grid.count - 1 {
            let line = grid[y]

            var word = ""
            var xPos = 0
            for x in 1..<line.count {
                let current = line[x]

                if word == "" {
                    if line[x - 1] == "." && alphabet.contains(current) && x != line.count - 1 && alphabet.contains(line[x + 1]) {
                        word += String(current)
                        xPos = x
                    }
                } else {
                    if alphabet.contains(current) {
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
                                i: UInt8(wordId),
                                h: true,
                                x: UInt8(xPos),
                                y: UInt8(y),
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
        if placement.h == false {
            horizontal = "false"
        }
        
        return "PlacementModel(i: \(placement.i), h: \(horizontal), x: \(placement.x), y: \(placement.y), l:\(placement.l))"
    }
}
