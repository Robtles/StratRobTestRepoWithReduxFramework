//
//  Route.swift
//  StratRobTestRepoWithReduxFramework
//
//  Created by Rob on 21/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import Foundation

/****************************************************************
 *
 * -- NOTE ON HOW TO USE ROUTES:
 *
 * 1. Create an enum in the app using the framework, with the cases
 * being the different routes:
 *
 *     enum Route {
 *         case toMainView
 *         case toSpecificView(params: [String: Any?])
 *     }
 *
 * 2. Add an extension to this enum with a required
 * conformance to protocol RouteProtocol, and declare
 * the expected feature:
 *
 *     extension Route: RouteProtocol {
 *         var feature: ShapeControllersFeature? {
 *             switch self {
 *                 case .toMainView:
 *                     return MainViewFeature()
 *                 case .toSpecificView(let params):
 *                     return SpecificViewFeature(params)
 *             }
 *         }
 *     }
 *
 * 3. Now assuming you have an instance s of ShapeControllersSection:
 *
 *     let s = ControllersFeatureSection()
 *
 * You should just call the route instead of directly a feature:
 *
 *     s.push(route: .toMainView)
 *
 ****************************************************************/

public typealias BaseRoute = RouteProtocol

public protocol RouteProtocol {
    
    var feature: ShapeControllersFeature? { get }
    
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
