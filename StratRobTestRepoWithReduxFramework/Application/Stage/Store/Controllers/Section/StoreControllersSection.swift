//
//  StoreControllersSection.swift
//  StratRobTestRepoWithReduxFramework
//
//  Created by Rob on 12/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import ReSwift



public struct StoreControllersSection {

    public var data: [String: StoreControllersSectionContent] = [:]
    
}


public protocol StoreControllersSectionProtocol: StoreProtocol, OldPropsProtocol {
    
    var current: Bool { get }
    
    var identifier: String { get }
    
    var routes: [Route] { get }
    
}

open class StoreControllersSectionContent: StoreControllersSectionProtocol {
    
    public var data: [String : Any?]
    
    public var identifier: String {
        return ""
    }
    
    public var oldProps: [String : Any?]
    
    public required init() {
        self.data = [:]
        self.oldProps = [:]
    }
    
}

extension StoreControllersSectionProtocol {
    
    public var current: Bool {
        get {
            return data["current"] as? Bool ?? false
        }
        set {
            data["current"] = newValue
        }
    }
    
    public var routes: [Route] {
        get {
            return data["routes"] as? [Route] ?? []
        }
        set {
            data["routes"] = newValue
        }
    }
    
    public static func reduce(action: Action, state: Self?) -> Self {
        var state = state ?? Self()
        switch action {
        case let initAction as ControllersSectionInit:
            state.routes = initAction.routes
            state.oldProps = initAction.data
            break
        case is ControllersSectionPop:
            if state.routes.count > 1 {
                state.routes.removeLast()
            }
            break
        case is ControllersSectionPush:
            if let route = (action as? ControllersSectionPush)?.route {
                state.routes.append(route)
            }
            break
        default:
            break
        }
        return state
    }
    
    mutating public func updateOldProps() {
        self.oldProps = self.data
    }
    
}
