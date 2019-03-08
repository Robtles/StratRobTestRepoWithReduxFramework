//
//  Delayer.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 04/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import Foundation



public struct Delayer {
    
    static public func delay(_ seconds: Double, completion: @escaping () -> ()) {
        let popTime = DispatchTime.now() + Double(Int64(Double(NSEC_PER_SEC) * seconds)) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: popTime) {
            completion()
        }
    }
    
}
