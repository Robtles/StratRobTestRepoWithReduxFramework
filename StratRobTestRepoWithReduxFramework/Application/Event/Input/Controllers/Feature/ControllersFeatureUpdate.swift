//
//  ControllersFeatureUpdate.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 06/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import Foundation



open class ControllersFeatureUpdate: Input {
    
    // MARK: - Instance Properties
    
    open var data: [String : Any?]
    
    open var meta: ControllersFeatureUpdate.Meta
    
    // MARK: - Init Methods
    
    required public init(_ data: [String : Any?]) {
        self.data = data
        self.meta = ControllersFeatureUpdate.Meta(.input)
    }
    
}
