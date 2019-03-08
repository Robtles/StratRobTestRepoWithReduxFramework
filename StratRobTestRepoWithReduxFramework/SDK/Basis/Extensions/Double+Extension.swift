//
//  Double+Extension.swift
//  Bruce
//
//  Created by Rob on 26/10/2017.
//  Copyright © 2017 Henrik. All rights reserved.
//

import Foundation

// MARK: Double Extension

extension Double {
    
    public var secondsToHours: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumIntegerDigits = 2
        numberFormatter.maximumIntegerDigits = 2
        return "\(Int(self/3600))h\(numberFormatter.string(from: NSNumber(value: ((self.truncatingRemainder(dividingBy: 3600))/3600)*60)) ?? "00")"
    }
    
}
