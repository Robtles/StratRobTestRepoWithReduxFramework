//
//  ControllersFeatureDelete.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 06/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import Foundation



open class ControllersFeatureDelete: Input {
    
    // MARK: - Instance Properties
    
    open var data: [String : Any?]
    
    open var meta: ControllersFeatureDelete.Meta
    
    // MARK: - Init Methods
    
    public init() {
        self.data = [:]
        self.meta = ControllersFeatureDelete.Meta(.input)
    }
    
    required public init(_ data: [String : Any?]) {
        self.data = data
        self.meta = ControllersFeatureDelete.Meta(.input)
    }
    
}
