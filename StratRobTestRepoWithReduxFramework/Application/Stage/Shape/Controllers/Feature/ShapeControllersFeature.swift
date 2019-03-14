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
    
    open var featureIdentifier: String {
        let prefix = self is ShapeControllersUtilityBase ? "ShapeControllersUtility" : "ShapeControllersFeature"
        guard String(describing: type(of: self)).hasPrefix(prefix) else {
            return String(describing: type(of: self))
        }
        return String(String(describing: type(of: self)).dropFirst(prefix.count)).firstLetterLowercased()
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
        store.state.controllers.feature.data[self.featureIdentifier] = correspondingStore
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
    
    var featureIdentifier: String { get }
    
}

