//
//  NSNumber+Extension.swift
//  Bruce
//
//  Created by Rob on 26/10/2017.
//  Copyright © 2017 Henrik. All rights reserved.
//

import Foundation

// MARK: NSNumber Extension

extension NSNumber {
    
    open var formatCurrency: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.minimumIntegerDigits = 1
        formatter.locale = Locale(identifier: Locale.current.identifier)
        return formatter.string(from: self) ?? ""
    }
    
}
