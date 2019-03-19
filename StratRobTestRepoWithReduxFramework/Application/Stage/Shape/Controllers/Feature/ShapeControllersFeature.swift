//
//  ShapeControllersFeature.swift
//  StratRobTestRepoWithReduxFramework
//
//  Created by Rob on 08/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import ReSwift; import UIKit



open class ShapeControllersFeature: UIViewController, ShapeControllersFeatureProtocol {
    
    open var correspondingStore: StoreControllersFeatureContent {
        return StoreControllersFeatureContent()
    }
    
    public static var featureIdentifier: String {
        let prefix = self is ShapeControllersUtilityBase.Type ? "ShapeControllersUtility" : "ShapeControllersFeature"
        guard "\(self)".hasPrefix(prefix) else {
            return "\(self)"
        }
        return String("\(self)".dropFirst(prefix.count)).firstLetterLowercased()
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        store.state.controllers.feature.data[type(of: self).featureIdentifier] = correspondingStore
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isBeingDismissed || self.isMovingFromParent {
            store.dispatch(ControllersSectionPop())
        }
    }
    
    // MARK: Store Methods
    
    open func newState(state: Store) {}
    
}


protocol ShapeControllersFeatureProtocol: StoreSubscriber {
    
    var correspondingStore: StoreControllersFeatureContent { get }
    
    static var featureIdentifier: String { get }
    
}

