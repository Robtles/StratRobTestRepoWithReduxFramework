//
//  ControllersSectionPush.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 06/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import Foundation



open class ControllersSectionPush: Input {
    
    // MARK: - Instance Properties
    
    open var data: [String : Any?]
    
    open var route: BaseRoute? {
        get {
            return self.data["route"] as? BaseRoute 
        }
        set {
            self.data["route"] = newValue
        }
    }
    
    open var meta: ControllersSectionPush.Meta = ControllersSectionPush.Meta(.input)
    
    // MARK: - Init Methods
    
    public init() {
        self.data = [:]
    }
    
    required public init(_ data: [String : Any?]) {
        self.data = data
    }
    
    public init(_ route: BaseRoute) {
        self.data = ["route": route]
    }
    
}
