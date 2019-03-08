//
//  Store.swift
//  StratRobTestRepoWithReduxFramework
//
//  Created by Rob on 08/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import ReSwift


public let store: ReSwift.Store<Store> = ReSwift.Store(reducer: Store.reduce, state: nil)


open class Store: StateType {
    
    // MARK: - Store Methods
    
    public static func reduce(action: Action, state: Store?) -> Store {
        return Store()
    }
    
}


/**
 * Every sub-store must conform to this protocol.
 * It includes both the state (as key-values in data), and the reducer function.
 */
public protocol StoreProtocol {
    
    var data: [String: Any?] { get set }
    
    init()
    
    static func reduce(action: Action, state: Self?) -> Self
    
}

/**
 * Sometimes we need to access the old state to compare it with the new one.
 * Those objects will have to conform to this protocol.
 */
public protocol OldPropsProtocol {
    
    var oldProps: [String: Any?] { get set }
    
    mutating func updateOldProps()
    
}

/**
 * Extended the protocol to provide a default implementation of the reducer
 * so that every feature-related sub-store doesn't have to re-define the same.
 */
public extension StoreProtocol {
    
    public static func reduce(action: Action, state: Self?) -> Self {
        var state = state ?? Self()
        switch action {
        case let input as Input:
            switch input {
            case is ControllersFeatureDelete:
                state.data = [:]
                break
            case is ControllersFeatureUpdate:
                input.data.forEach { (arguments) in
                    let (key, value) = arguments
                    state.data[key] = value
                }
                break
            default:
                break
            }
            break
        case let order as Order:
            print(order)
            break
        case let query as Query:
            print(query)
            break
        default:
            break
        }
        return state
    }
    
}
