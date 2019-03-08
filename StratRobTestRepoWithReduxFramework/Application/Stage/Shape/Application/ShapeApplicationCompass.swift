//
//  ShapeApplicationCompass.swift
//  StratRobTestRepoWithReduxFramework
//
//  Created by Rob on 08/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import UIKit


// MARK: Typealias

public typealias Compass = ShapeApplicationCompass

// MARK: - Type

open class ShapeApplicationCompass: UITabBarController, UINavigationControllerDelegate, UITabBarControllerDelegate, CompassProtocol {//, StoreSubscriber {
    
    // MARK: - Init Methods
    
    deinit {
        //store.unsubscribe(self)
    }
    
    private init() {
        super.init(nibName: nil, bundle: nil)
        //store.subscribe(self)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not intended to be used")
    }
    
    // MARK: Life Methods
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.setNeedsStatusBarAppearanceUpdate()
        self.delegate = self
        self.updateContent()
    }
    
    // MARK: Navigation Methods
    
    open func push(_ route: Route, in section: String = "current") {
        guard let currentSection = self.selectedViewController as? ShapeControllersSection else {
            return
        }
        if currentSection.sectionType != "current" {
            (self.viewControllers as? [ShapeControllersSection])?.enumerated().forEach({ index, tabBarSection in
                if section == tabBarSection.sectionType {
                    self.selectedIndex = index
                }
            })
        }
        store.dispatch(ControllersSectionPush(route))
    }
    
    // MARK: Store Methods
    
    /*public func newState(state: Store) {
     
     }*/
    
    // MARK: Tab Bar Methods
    
    open func updateContent() {
        DispatchQueue.main.async {
            self.tabBarSections.forEach { section in
                section.delegate = self
            }
            self.tabBar.isHidden = self.tabBarShouldBeHidden
            self.setViewControllers(self.tabBarSections, animated: false)
            self.tabBar.items?.enumerated().forEach({ index, tabBarItem in
                tabBarItem.image = self.tabBarSectionImages[index].withRenderingMode(.alwaysOriginal)
                tabBarItem.selectedImage = self.tabBarSectionSelectedImages[index].withRenderingMode(.alwaysOriginal)
                tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
                tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .selected)
                tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .normal)
            })
        }
    }
    
}



public protocol CompassProtocol {
    
    var tabBarSections: [ShapeControllersSection] { get }
    
    var tabBarSectionImages: [UIImage] { get }
    
    var tabBarSectionSelectedImages: [UIImage] { get }
    
    var tabBarShouldBeHidden: Bool { get }
    
}

extension CompassProtocol {
    
    public var tabBarSections: [ShapeControllersSection] {
        return []
    }
    
    public var tabBarSectionImages: [UIImage] {
        return []
    }
    
    public var tabBarSectionSelectedImages: [UIImage] {
        return []
    }
    
    public var tabBarShouldBeHidden: Bool {
        return false
    }
    
}

