//
//  StoreApplicationCompass.swift
//  StratRobTestRepoWithReduxFramework
//
//  Created by Rob on 12/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import ReSwift



public struct StoreApplicationCompass: StoreProtocol {
    
    public var data: [String : Any?] = [:]
    
    public init() {}
    
    // MARK: Reducer Methods
    
    public static func reduce(action: Action, state: StoreApplicationCompass?) -> StoreApplicationCompass {
        let state = state ?? StoreApplicationCompass()
        return state
    }
    
}
