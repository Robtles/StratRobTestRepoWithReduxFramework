//
//  ShapeControllersSection.swift
//  StratRobTestRepoWithReduxFramework
//
//  Created by Rob on 08/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import ReSwift; import UIKit;



open class ShapeControllersSection: UINavigationController, UINavigationControllerDelegate, StoreSubscriber {
    
    // MARK: - Instance Properties
    
    open var correspondingStore: StoreControllersSectionContent {
        return StoreControllersSectionContent()
    }
    
    open var identifier: String {
        guard String(describing: type(of: self)).hasPrefix("ShapeControllersSection") else {
            return String(describing: type(of: self))
        }
        return String(String(describing: type(of: self)).dropFirst("ShapeControllersSection".count)).firstLetterLowercased()
    }
    
    open var sectionType: String {
        return String(describing: type(of: self))
    }
    
    open var shouldShowNavigationBar: Bool {
        return true
    }
    
    // MARK: - Init Methods
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not intended to be used")
    }
    
    public override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        self.commonInit()
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.commonInit()
    }
    
    private func commonInit() {
        if store.state.controllers.section.data[self.identifier] == nil {
            store.state.controllers.section.data[self.identifier] = correspondingStore
            store.dispatch(ControllersSectionInit())
        }
    }
    
    // MARK: Life Methods
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationBar.isHidden = !self.shouldShowNavigationBar
        store.subscribe(self)
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }
    
    // MARK: Section Methods
    
    @objc open func pop() {
        if Thread.isMainThread {
            self.popViewController(animated: true)
            
        } else {
            DispatchQueue.main.async {
                self.popViewController(animated: true)
            }
        }
    }
    
    open func push(_ feature: ShapeControllersFeature) {
        if Thread.isMainThread {
            self.pushViewController(feature, animated: true)
        } else {
            DispatchQueue.main.async {
                self.pushViewController(feature, animated: true)
            }
        }
    }

    open func push(route: Route) {
        self.push(route.feature, withParams: route.params)
    }
    
    open func push(routes: [Route]) {
        routes.forEach { route in
            self.push(route: route)
        }
    }
    
    #warning("what to do with params?")
    /// This function handles the push
    private func push(_ feature: ShapeControllersFeature?, withParams params: [String: Any?] = [:]) {
        if let feature = feature {
            self.push(feature)
        }
    }

    // MARK: Store Methods
    
    open func newState(state: Store) {
        if let routes = store.state.controllers.section.data[self.identifier]?.routes {
            let oldRoutesCount = (store.state.controllers.section.data[self.identifier]?.oldProps["routes"] as? [Route])?.count ?? routes.count
            if routes.count < oldRoutesCount {
                self.pop()
                store.state.controllers.section.data[self.identifier]?.updateOldProps()
            } else if routes.count > oldRoutesCount {
                self.push(routes: Array(routes[routes.count-(routes.count - oldRoutesCount)..<routes.count]))
                store.state.controllers.section.data[self.identifier]?.updateOldProps()
            }
        }
    }
    
}
