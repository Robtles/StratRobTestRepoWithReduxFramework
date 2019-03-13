//
//  ControllersUtilityInput.swift
//  StratRobTestRepoWithReduxFramework
//
//  Created by Rob on 13/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import ReSwift



struct ControllersUtilityInput: Input {
    
    // MARK: Instance Properties
    
    var buttonAction: () -> () {
        set {
            self.data["button_action"] = buttonAction
        }
        get {
            return self.data["button_action"] as? (() -> ()) ?? {
                print("atog")
            }
        }
    }
    
    var buttonTitle: String {
        return self.data["button_title"] as? String ?? ""
    }
    
    var data: [String : Any?]
    
    var meta: ControllersUtilityInput.Meta = ControllersUtilityInput.Meta(.input)
    
    var opened: Bool {
        return self.data["opened"] as? Bool ?? false
    }
    
    var title: String {
        return self.data["title"] as? String ?? ""
    }
    
    var type: String {
        return self.data["type"] as? String ?? "basic"
    }
    
    // MARK: Init Methods
    
    init(_ data: [String : Any?]) {
        self.data = data
    }
    
    private init(shouldShow show: Bool, andShouldShowCompletion shouldShowCompletion: Bool = false, withType type: String = "basic", title: String = "", buttonTitle: String = "", action: @escaping (() -> ()) = {}) {
        self.init(["opened": show, "type": type, "title": title, "button_title": buttonTitle, "button_action": action, "perform_completion": shouldShowCompletion])
    }
    
    static func hide(ofType type: String, showingCompletion: Bool) -> ControllersUtilityInput {
        return ControllersUtilityInput(shouldShow: false, andShouldShowCompletion: showingCompletion, withType: type)
    }
    
    static func show(withType type: String = "basic", title: String = "", buttonTitle: String = "", action: @escaping (() -> ()) = {}) -> ControllersUtilityInput {
        return ControllersUtilityInput(shouldShow: true, withType: type, title: title, buttonTitle: buttonTitle, action: action)
    }
    
}

