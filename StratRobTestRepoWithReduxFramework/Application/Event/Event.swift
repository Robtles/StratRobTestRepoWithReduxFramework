//
//  Event.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 06/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import ReSwift


/**
 * An event represents a transaction that occurred after a network or a user input.
 * It is passed through a succession of computations grouped into stages
 * that may change an application state, update a database or trigger another event.
 */
public protocol Event: Action {
    
    typealias Meta = EventMeta
    
    /**
     * Contains information about the event itself.
     */
    var meta: Meta { get }
    
    /**
     * Returns the type of the event.
     * This defines and drives the event to specific operations.
     */
    var type: String { get }
    
}

public extension Event {
    
    public var type: String {
        return String(describing: Self.self)
    }
    
    public static var type: String {
        return String(describing: Self.self)
    }
    
}

open class EventMeta: EventMetaProtocol {
    
    open var group: EventMeta.Group
    
    required public init(_ group: EventMeta.Group) {
        self.group = group
    }
    
}

/**
 * The event category. An input is a UI-related event (tap, touch, swipe...),
 * an order is an event to update the database and a query is an event to fetch
 * data from the database.
 */
public enum EventMetaGroup {
    case input
    case order
    case query
}

/**
 * Contains information about the event itself.
 * This is set by the client side and is not reliable.
 */
public protocol EventMetaProtocol {
    
    typealias Group = EventMetaGroup
    
    /**
     * Indicates the version of code the event is built for.
     */
    var build: Int { get }
    
    /**
     * Indicates the category of event.
     */
    var group: Group { get }
    
    init(_ group: Group)
    
}

public extension EventMetaProtocol {
    
    public var build: Int {
        return 1
    }
    
}
