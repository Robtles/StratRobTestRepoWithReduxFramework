//
//  Int+Extension.swift
//  Bruce
//
//  Created by Rob on 26/10/2017.
//  Copyright © 2017 Henrik. All rights reserved.
//

import Foundation

// MARK: Int Extension

extension Int {
    
    // MARK: Near Methods
    
    public var nearestFive: Int {
        if 0...55 ~= self && self % 5 == 0 {
            return self
        } else {
            if self < 0 {
                return 0
            } else if self > 55 {
                return 55
            } else {
                return self + 5 - (self % 5)
            }
        }
    }
    
}
