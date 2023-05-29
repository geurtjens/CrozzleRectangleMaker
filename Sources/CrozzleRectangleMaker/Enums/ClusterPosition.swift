//
//  ClusterPosition.swift
//  
//
//  Created by Michael Geurtjens on 21/5/2023.
//

import Foundation
/// the way a partcular word in a cluster sticks out to the left or right
public enum ClusterPosition {
    /// word sticks out to the left of the cluster
    case leading
    /// word sticks out to the right of the cluster
    case trailing
    /// the entire word is within the cluster block and doesnt stick out
    case middle
    /// sticks out on both sides of the cluster.  Not implemented in this version
    case outer
}
