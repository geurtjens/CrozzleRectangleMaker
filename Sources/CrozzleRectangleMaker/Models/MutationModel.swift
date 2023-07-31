//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 13/7/2023.
//

import Foundation
public struct MutationModel : Codable {
    //public let grid: [String]
    public let placements: [PlacementModel]
    public let constraints: [[CodeBreakerModel]]
    //public let wordSequence: [String]
    public func ToString() -> String {
        
        var result = ""
        result += "{\n"
        //result += "  grid:" + gridToString() + ",\n"
        //result += "  wordSequence: \(wordSequence),\n"
        result += "  \"placements\":\(placementsToString()),\n"
        result += "  \"constraints\":\(constraintsToString())\n}"
        
        return result
    }
    
//    private func gridToString() -> String {
//        var result = ""
//        for line in grid {
//            if result != "" {
//                result += ",\n"
//            }
//            result += "    \"\(line)\""
//        }
//        return " [\n" + result + "]"
//    }
    private func placementsToString() -> String {
        var result = ""
        for placement in placements {
            if result != "" {
                result += ",\n"
            }
            result += "    {\"w\":\(placement.w), \"x\":\(placement.x), \"y\":\(placement.y), \"l\":\(placement.l), \"h\":\(placement.z)}"
        }
        return " [\n" + result + "]"
    }
    
    private func constraintsToString() -> String {
        var result = ""
        for constraintItem in constraints {
            
            if result != "" {
                result += ",\n"
            }
            result += constraintForWord(constraintItem)
        }
        return " [\n" + result + "]"
    }
    
    private func constraintForWord(_ constraints: [CodeBreakerModel]) -> String {
        var result = ""
        for constraint in constraints {
            if result != "" {
                result += ","
            }
            result += "{\"p\":\(constraint.p), \"q\":\(constraint.q), \"w\":\(constraint.w)}"
        }
        return "    [" + result + "]"
    }
    
}
