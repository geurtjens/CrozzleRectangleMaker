//
//  ExtendChar.swift
//  
//
//  Created by Michael Geurtjens on 26/6/2023.
//

import Foundation
extension Character {
    
    func isAlphabet() -> Bool {
        
        if self != " " && self != "." && self != "#" {
            return true
        } else {
            return false
        }
    }
}
