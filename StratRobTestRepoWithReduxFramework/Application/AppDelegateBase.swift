//
//  MainBase.swift
//  StratRobTestRepoWithReduxFramework
//
//  Created by Rob on 08/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import UIKit



open class AppDelegateBase: UIResponder, UIApplicationDelegate, AppDelegateBaseProtocol {
    
    var window: UIWindow?
    
    open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        self.launchOperations()
        //self.window = UIWindow(frame: UIScreen.main.bounds)
        //Compass.shared.updateContent()
        //self.defaultLaunch()
        return true
    }
    
    func launchOperations() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.defaultLaunch()
    }
    
    // MARK: View Methods
    
    open func defaultLaunch() {
        self.replace(with: UIViewController())
        //self.replace(with: Compass.shared)
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


protocol AppDelegateBaseProtocol {
    
    func launchOperations()
    
}
