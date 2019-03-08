//
//  CLPlacemark+Extension.swift
//  Bruce
//
//  Created by Rob on 13/06/2018.
//  Copyright © 2018 Henrik. All rights reserved.
//

import CoreLocation; import Foundation

// MARK: CLPlacemark Extension

extension CLPlacemark {
    
    open var compactAddress: String? {
        var result = ""
        if let street = thoroughfare {
            result += "\(street)"
        }
        if let city = locality {
            result += "\(!result.isEmpty ? ", " : "")\(city)"
        }
        if let country = country {
            result += "\(!result.isEmpty ? ", " : "")\(country)"
        }
        return result
    }
    
}
