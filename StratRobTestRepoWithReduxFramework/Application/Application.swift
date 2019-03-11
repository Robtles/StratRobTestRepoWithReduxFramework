//
//  Application.swift
//  StratRobTestRepoWithReduxFramework
//
//  Created by Rob on 11/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import UIKit


open class Application: NSObject {
    
    open class Delegate: UIResponder, UIApplicationDelegate {
        
        open var window: UIWindow?
        
        open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.launchOperations()
            return true
        }
        
        open func launchOperations() {}
        
        // MARK: View Methods
        
        open func defaultLaunch() {
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

    public struct Style {
        
        public struct ActivityIndicator {
            
            public static var color: UIColor? {
                didSet {
                    UIActivityIndicatorView.appearance().tintColor = color
                }
            }
            
        }
        
        public struct Button {
            
            public static var backgroundColor: UIColor? {
                didSet {
                    UIButton.appearance().backgroundColor = backgroundColor
                }
            }
            
            public static var cornerRadius: CGFloat?
            
            public static var font: UIFont?
            
            public static var textColor: UIColor? {
                didSet {
                    UIButton.appearance().setTitleColor(textColor, for: .normal)
                }
            }
            
        }
        
        public struct NavigationBar {
            
            public static var backgroundColor: UIColor? {
                didSet {
                    UINavigationBar.appearance().barTintColor = backgroundColor
                }
            }
            
            public static var font: UIFont? {
                didSet {
                    if let font = font {
                        var previousAttributes = UINavigationBar.appearance().titleTextAttributes ?? [:]
                        previousAttributes[.font] = font
                        UINavigationBar.appearance().titleTextAttributes = previousAttributes
                    }
                }
            }
            
            public static var textColor: UIColor? {
                didSet {
                    if let textColor = textColor {
                        var previousAttributes = UINavigationBar.appearance().titleTextAttributes ?? [:]
                        previousAttributes[.foregroundColor] = textColor
                        UINavigationBar.appearance().titleTextAttributes = previousAttributes
                    }
                }
            }
            
        }
        
        public struct PageControl {
            
            public static var backgroundColor: UIColor? {
                didSet {
                    UIPageControl.appearance().backgroundColor = backgroundColor
                }
            }
            
            public static var currentPageIndicatorTintColor: UIColor? {
                didSet {
                    UIPageControl.appearance().currentPageIndicatorTintColor = currentPageIndicatorTintColor
                }
            }
            
            public static var pageIndicatorTintColor: UIColor? {
                didSet {
                    UIPageControl.appearance().pageIndicatorTintColor = pageIndicatorTintColor
                }
            }
            
        }
        
        public struct TabBar {
            
            public static var backgroundColor: UIColor? {
                didSet {
                    UITabBar.appearance().barTintColor = backgroundColor
                }
            }
            
        }
        
        public struct TextField {
            
            public static var borderStyle: UITextField.BorderStyle? {
                didSet {
                    UITextField.appearance().borderStyle = borderStyle ?? .line
                }
            }
            
            public static var font: UIFont? {
                didSet {
                    UITextField.appearance().font = font
                }
            }
            
            public static var textColor: UIColor? {
                didSet {
                    UITextField.appearance().textColor = textColor
                    UITextField.appearance().tintColor = textColor
                }
            }
            
        }
        
        public struct TextView {
            
            public static var font: UIFont? {
                didSet {
                    UITextView.appearance().font = font
                }
            }
            
            public static var textColor: UIColor? {
                didSet {
                    UITextView.appearance().textColor = textColor
                    UITextView.appearance().tintColor = textColor
                }
            }
            
        }
        
    }
    
}
