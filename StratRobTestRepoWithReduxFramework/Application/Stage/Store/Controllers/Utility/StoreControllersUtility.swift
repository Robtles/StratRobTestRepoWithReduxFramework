//
//  StoreControllersUtility.swift
//  StratRobTestRepoWithReduxFramework
//
//  Created by Rob on 12/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import Foundation



public struct StoreControllersUtility {
    
    public var data: [String: StoreControllersUtilityContent] = [:]
    
}


protocol StoreControllersUtilityProtocol: StoreProtocol, OldPropsProtocol {
    
    var opened: Bool { get }
    
    var shouldPerformCompletion: Bool { get }
    
    var wasOpened: Bool { get }
    
}

open class StoreControllersUtilityContent: StoreControllersUtilityProtocol {
    
    public var data: [String : Any?]
    
    public var oldProps: [String : Any?]
    
    public required init() {
        self.data = [:]
        self.oldProps = [:]
    }
    
}

extension StoreControllersUtilityProtocol {
    
    public var opened: Bool {
        return self.data["opened"] as? Bool ?? false
    }
    
    public var shouldPerformCompletion: Bool {
        return self.data["perform_completion"] as? Bool ?? false
    }
    
    public var wasOpened: Bool {
        return self.oldProps["opened"] as? Bool ?? false
    }
    
    mutating public func updateOldProps() {
        self.oldProps = self.data
    }
    
}
