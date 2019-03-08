//
//  ControllersSectionInit.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 06/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import Foundation



open class ControllersSectionInit: Input {
    
    // MARK: - Instance Properties
    
    open var data: [String : Any?]
    
    open var meta: ControllersSectionInit.Meta = ControllersSectionInit.Meta(.input)
    
    open var routes: [Route] {
        return data["routes"] as? [Route] ?? []
    }
    
    // MARK: - Init Methods
    
    public init() {
        self.data = [:]
    }
    
    required public init(_ data: [String : Any?]) {
        self.data = data
    }
    
    public init(withRoute route: Route) {
        self.data = ["routes": [route]]
    }
    
}
