//
//  StoreControllers.swift
//  StratRobTestRepoWithReduxFramework
//
//  Created by Rob on 12/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import ReSwift



public struct StoreControllers {
    
    public var feature: StoreControllersFeature
    
    public var section: StoreControllersSection
    
    public var utility: StoreControllersUtility
    
    public init() {
        self.feature = StoreControllersFeature()
        self.section = StoreControllersSection()
        self.utility = StoreControllersUtility()
    }
    
    public static func reduce(action: Action, state: StoreControllers?) -> StoreControllers {
        var state = state ?? StoreControllers()
        state.feature.data.forEach { entry in
            let (key, content) = entry
            state.feature.data[key] = type(of: content).reduce(action: action, state: content)
        }
        state.section.data.forEach { entry in
            let (key, content) = entry
            state.section.data[key] = type(of: content).reduce(action: action, state: content)
        }
        state.utility.data.forEach { entry in
            let (key, content) = entry
            state.utility.data[key] = type(of: content).reduce(action: action, state: content)
        }
        return state
    }
    
}

