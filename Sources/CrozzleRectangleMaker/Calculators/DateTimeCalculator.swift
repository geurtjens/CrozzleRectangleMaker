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
                var result = ""
                let seconds = durationSecondsInt % 60
                var minutes = durationSecondsInt / 60
                let hours = minutes / 60
                if hours > 0 {
                    minutes = minutes % 60
                }
                
                if hours > 0 {
                    result += "\(hours) hours "
                }
                
                if minutes > 0 {
                    result += "\(minutes) minutes "
                }
                
                if seconds > 0 {
                    result += "\(seconds) seconds"
                }
                
                return result
                
            } else {
                return "\(durationSecondsInt) seconds"
            }
        } else {
            return "\(durationSeconds) seconds"
        }
    }
}
