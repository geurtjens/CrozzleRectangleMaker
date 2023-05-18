//
//  StringProtocolExtension.swift
//  
//
//  Created by Michael Geurtjens on 17/5/2023.
//

import Foundation
extension StringProtocol {
subscript(offset: Int) -> Character {
    self[index(startIndex, offsetBy: offset)]
  }
}
