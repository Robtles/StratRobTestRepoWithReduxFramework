//
//  EventInput.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 06/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import Foundation


typealias Input = EventInput

/**
 * An input is an event that aims to update a user interface.
 * It is triggered by actions such as clicks and keyboards inputs.
 * It is always considered as synchronous but may be stored as a log in the database.
 */
public protocol EventInput: Event {
    
    /**
     * Contains custom information set by or with the input.
     * This data structure is defined and understood by the controller that triggered the event.
     */
    var data: [String: Any?] { get }
    
    init(_ data: [String: Any?])
    
}
