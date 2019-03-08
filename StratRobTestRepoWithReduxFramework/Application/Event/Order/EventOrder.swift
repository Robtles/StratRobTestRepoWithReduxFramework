//
//  EventOrder.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 06/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import Foundation


typealias Order = EventOrder

/**
 * An order is an event that aims to update a database.
 * It is passed through a succession of computations grouped into stages
 * one of which will protect the database integrity by checking user rights.
 */
public protocol EventOrder: Event {
    
    /**
     * Contains information about the input and the scope of the event.
     * Some of this data is set by the client side and is not reliable.
     */
    var data: [String: Any?] { get }
    
    /**
     * Contains any input that is required to perform operations.
     * This may gather new values to write into the database.
     * This cannot be altered.
     */
    var input: [String: [String: Any?]] { get }
    
    /**
     * Contains classes to define the event scope.
     * This is used to validate user permissions.
     * This cannot be altered.
     */
    var scope: [String: [String: Any?]] { get }
    
    init(_ data: [String: Any?])
    
}
