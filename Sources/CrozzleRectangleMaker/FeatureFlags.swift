//
//  FeatureFlags.swift
//  
//
//  Created by Michael Geurtjens on 6/7/2023.
//

import Foundation
public struct FeatureFlags {
    public static var verbose = false
    
    // Can either be 1 for the old way or 2 for the new way
    public static var mergeMethod: MergeMethod = .async_objectOfArrays
    
    public static var findMatchesType: Int = 0
}
