//
//  File.swift
//  
//
//  Created by Michael Geurtjens on 22/6/2023.
//

import Foundation
public class DateTimeCalculator {
    public static func now() -> DispatchTime {
        return DispatchTime.now()
    }
    
    public static func seconds(start: DispatchTime, finish: DispatchTime) -> Double {
        let durationNano = finish.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
        let durationSeconds = Double(durationNano) / 1_000_000_000
        return durationSeconds
    }
    
    public static func duration(start: DispatchTime, finish: DispatchTime) -> String {
    
        let durationSeconds = seconds(start: start, finish:finish)
        if durationSeconds > 10 {
            let durationSecondsInt = Int(durationSeconds)
            
            if durationSecondsInt > 60 {
                let minutes = durationSecondsInt / 60
                let seconds = durationSecondsInt % 60
                if seconds == 0 {
                    return "\(minutes) minutes"
                } else {
                    return "\(minutes) minutes and \(seconds) seconds"
                }
            } else {
                return "\(durationSecondsInt) seconds"
            }
        } else {
            return "\(durationSeconds) seconds"
        }
    }
}
