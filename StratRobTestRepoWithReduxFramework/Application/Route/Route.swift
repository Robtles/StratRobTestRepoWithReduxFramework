//
//  Route.swift
//  StratRobTestRepoWithReduxFramework
//
//  Created by Rob on 08/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import Foundation



open class Route {
    
    open var actionId: String
    
    open var data: [String]
    
    public init(action: String = "", data: [String] = []) {
        self.actionId = action
        self.data = data
    }
    
}
