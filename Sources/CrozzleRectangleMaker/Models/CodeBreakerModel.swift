//
//  CodeBreakerModel.swift
//  
//
//  Created by Michael Geurtjens on 12/7/2023.
//

import Foundation
public struct CodeBreakerModel: Codable {
    /// Letter position within the current word that we will be comparing with
    public let p: Int
    /// Letter position within the search word that we will be comparing with
    public let q: Int
    /// The word position of the searc word we are going to compare against.  Its always a word that is less than our current position of course
    public let w: Int
}
