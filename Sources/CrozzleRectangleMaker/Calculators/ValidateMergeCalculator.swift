//
//  ValidateMergeCalculator.swift
//
//
//  Created by Michael Geurtjens on 6/1/2024.
//

import Foundation
public class ValidateMergeCalculator {

    public static func Execute(
        matchCount: Int,
        sourceShape: ShapeModel,
        sourceShapeId: Int,
        searchShape: ShapeModel,
        searchShapeId:Int) -> MergeInstructionModel?
    {

        // We only have 1 match
        if (matchCount == 1) {
            let match = SingleWordMatch(
                sourceShape: sourceShape,
                sourceShapeId: sourceShapeId,
                searchShape: searchShape,
                searchShapeId: searchShapeId)

            return match

        } else if (matchCount > 1) {

            // We have more than one match
            if (matchCount < sourceShape.placements.count) {

                let multiWordMatch = MultiWordMatch(
                    sourceShape: sourceShape,
                    sourceShapeId: sourceShapeId,
                    searchShape: searchShape,
                    searchShapeId: searchShapeId,
                    matchingWordCount: matchCount)

                return multiWordMatch
            } else {
                return nil
            }
        }
        return nil
    }


    public static func SingleWordMatch(
        sourceShape: ShapeModel,
        sourceShapeId: Int,
        searchShape: ShapeModel,
        searchShapeId: Int) -> MergeInstructionModel?
    {

        for sourcePos in 0..<sourceShape.placements.count {

            /// Tells us the location of the word matching with the current word or else -1
            let searchPos = MatchingPlacementPosition(
                searchShape: searchShape,
                wordId: Int(sourceShape.placements[sourcePos].w))

            if (searchPos != -1) {
                let flipped = sourceShape.placements[sourcePos].z != searchShape.placements[searchPos].z;

                return MergeInstructionModel(
                    sourceShapeId: sourceShapeId,
                    searchShapeId: searchShapeId,
                    matchingWordCount: 1,
                    firstSourcePos: UInt8(sourcePos),
                    firstSearchPos: UInt8(searchPos),
                    flipped: flipped);
            }
        }
        return nil;
    }


    public static func MultiWordMatch(
        sourceShape: ShapeModel,
        sourceShapeId: Int,
        searchShape: ShapeModel,
        searchShapeId: Int,
        matchingWordCount: Int) -> MergeInstructionModel?
    {

        // If we have the smaller and larger the wrong way around then call again but this time making smaller actually smaller

        if IsSubset(
            matchingWordCount: matchingWordCount,
            sourceShape: sourceShape,
            searchShape: searchShape) == true
        {
            // We have found some shape to be a subset of another shape
            return nil
        }

        let (matches, firstSourcePos, firstSearchPos, _) = GetMatches(
            sourceShape: sourceShape,
            searchShape: searchShape)

        let firstIsFlipped = (sourceShape.placements[firstSourcePos].z != searchShape.placements[firstSearchPos].z)

        let sameDirectionIsOk = IsSameDirection(
            firstSourcePos: firstSourcePos,
            firstSearchPos: firstSearchPos,
            matches: matches,
            firstIsFlipped: firstIsFlipped,
            sourceShape: sourceShape,
            searchShape: searchShape)

        if sameDirectionIsOk == false {
            return nil
        }

        let isMatchingDistance = IsSameDistance(
            firstSourcePos: firstSourcePos,
            firstSearchPos: firstSearchPos,
            matches: matches,
            isFlipped: firstIsFlipped,
            sourceShape:sourceShape,
            searchShape:searchShape)

        if isMatchingDistance == false {
            return nil
        } else {

            return MergeInstructionModel(
                sourceShapeId: sourceShapeId,
                searchShapeId: searchShapeId,
                matchingWordCount: UInt8(matchingWordCount),
                firstSourcePos: UInt8(firstSourcePos),
                firstSearchPos: UInt8(firstSearchPos),
                flipped: firstIsFlipped)
        }
    }


    public static func GetMatches(
        sourceShape: ShapeModel,
        searchShape: ShapeModel) -> ([Int],Int,Int,Int)
    {

        var firstSourcePos = -1
        var firstSearchPos = -1
        var matches: [Int] = [];
        var matchingWordCount: Int = 0
        for sourcePos in 0..<sourceShape.placements.count {

            /// Tells us the location of the word matching with the current word or else -1
            let searchPos = MatchingPlacementPosition(
                searchShape: searchShape,
                wordId: Int(sourceShape.placements[sourcePos].w))

            matches.append(searchPos);

            if searchPos != -1 {
                if firstSourcePos == -1 {
                    firstSourcePos = sourcePos
                    firstSearchPos = searchPos
                }
                matchingWordCount += 1
            }
        }
        return (matches, firstSourcePos, firstSearchPos, matchingWordCount)
    }


    /// Is there a placement in the searchShape that has the same word as what we are looking for
    /// if so then what is the word position within the shape
    public static func MatchingPlacementPosition(
        searchShape: ShapeModel,
        wordId: Int) -> Int {

        for i in 0..<searchShape.placements.count {
            if (searchShape.placements[i].w == wordId) {
                return i;
            }
        }
        return -1;
    }


    public static func IsSubset(
        matchingWordCount: Int,
        sourceShape: ShapeModel,
        searchShape: ShapeModel) -> Bool
    {
        if (matchingWordCount == sourceShape.placements.count
            || matchingWordCount == searchShape.placements.count) {
            // We have found some shape to be a subset of another shape
            return true
        }
        else {
            return false
        }
    }


    // While we are here lets see if they are the same orientation
    public static func IsSameDirection(
        firstSourcePos: Int,
        firstSearchPos: Int,
        matches:[Int],
        firstIsFlipped: Bool,
        sourceShape: ShapeModel,
        searchShape: ShapeModel) -> Bool
    {

        for sourcePos in (firstSourcePos + 1)..<matches.count {
            let searchPos = matches[sourcePos]
            if searchPos != -1 {

                let isFlipped = (sourceShape.placements[sourcePos].z != searchShape.placements[searchPos].z)
                if firstIsFlipped != isFlipped {
                    return false
                }
            }
        }
        return true
    }


    public static func IsSameDistance(
        firstSourcePos: Int,
        firstSearchPos: Int,
        matches: [Int],
        isFlipped: Bool,
        sourceShape: ShapeModel,
        searchShape: ShapeModel) -> Bool
    {

        /// How could the first match be the same
        let sourceX = Int(sourceShape.placements[firstSourcePos].x)
        let sourceY = Int(sourceShape.placements[firstSourcePos].y)

        let searchX = Int(searchShape.placements[firstSearchPos].x)
        let searchY = Int(searchShape.placements[firstSearchPos].y)


        for sourcePos in (firstSourcePos+1)..<matches.count {
            //for i in (firstMatch+1)..<matchingWords.count {
            let searchPos = matches[sourcePos]

            if (searchPos != -1) {
                let sourceX_diff = sourceX - Int(sourceShape.placements[sourcePos].x)
                let sourceY_diff = sourceY - Int(sourceShape.placements[sourcePos].y)

                let searchX_diff = searchX - Int(searchShape.placements[searchPos].x)
                let searchY_diff = searchY - Int(searchShape.placements[searchPos].y)

                if (isFlipped) {
                    if (sourceX_diff != searchY_diff || sourceY_diff != searchX_diff) {
                        return false
                    }
                } else {
                    if (sourceX_diff != searchX_diff || sourceY_diff != searchY_diff) {
                        return false
                    }
                }
            }
        }
        // We have passed all the distance checks
        return true
    }
}
