//
//  MainBase.swift
//  StratRobTestRepoWithReduxFramework
//
//  Created by Rob on 08/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import UIKit



open class AppDelegateBase: UIResponder, UIApplicationDelegate {
    
    open var window: UIWindow?
    
    open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        /*Compass.shared.updateContent()
         self.defaultLaunch()*/
        self.launchOperations()
        return true
    }
    
    open func launchOperations() {}
    
    // MARK: View Methods
    
    open func defaultLaunch() {
        //self.replace(with: Compass.shared)
        self.replace(with: UIViewController())
    }
    
    open func replace(with viewController: UIViewController) {
        defer {
            window?.makeKeyAndVisible()
        }
        if Thread.isMainThread {
            window?.rootViewController = viewController
        } else {
            DispatchQueue.main.async {
                self.window?.rootViewController = viewController
            }
        }
    }
    
}
