//
//  ControllersSectionPop.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 06/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import Foundation



open class ControllersSectionPop: Input {
    
    // MARK: - Instance Properties
    
    open var data: [String : Any?]
    
    open var meta: ControllersSectionPop.Meta = ControllersSectionPop.Meta(.input)
    
    // MARK: - Init Methods
    
    public init() {
        self.data = [:]
    }
    
    required public init(_ data: [String : Any?]) {
        self.data = data
    }
    
}
