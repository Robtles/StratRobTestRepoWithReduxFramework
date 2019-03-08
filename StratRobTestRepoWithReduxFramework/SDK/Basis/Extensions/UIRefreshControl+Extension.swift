//
//  UIRefreshControl+Extension.swift
//  Bruce
//
//  Created by Rob on 14/09/2018.
//  Copyright © 2018 Henrik. All rights reserved.
//

import UIKit

extension UIRefreshControl {
    
    open func endRefreshingWithCheck() {
        if self.isRefreshing {
            self.endRefreshing()
        }
    }
    
}
