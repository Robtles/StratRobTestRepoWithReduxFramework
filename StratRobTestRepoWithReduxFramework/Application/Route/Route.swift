//
//  Route.swift
//  StratRobTestRepoWithReduxFramework
//
//  Created by Rob on 21/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import Foundation


public typealias Route = RouteProtocol

public protocol RouteProtocol {
    
    var feature: ShapeControllersFeature? { get }
    
    var params: [String: Any?] { get }
    
}


public protocol RouteProviderProtocol: AnyObject {

    func feature(for route: RouteProtocol) -> ShapeControllersFeature?

}


open class RouteProvider<Route: RouteProtocol>: RouteProviderProtocol {

    public init() {}
    
    public func feature(for route: RouteProtocol) -> ShapeControllersFeature? {
        return route.feature
    }
    
}
