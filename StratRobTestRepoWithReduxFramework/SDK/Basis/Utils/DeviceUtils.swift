//
//  DeviceUtils.swift
//  StratRobTestRepoWithRedux
//
//  Created by Rob on 07/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import UIKit



public struct DeviceUtils {
    
    // This data is prone to change with Apple releasing new iPhone X variants!
    private static let iPhoneXHeights: [CGFloat] = [1792, 2436, 2688]
    
    private static let iPhoneXIdentifiers = ["iPhone10,3", "iPhone10,6", "iPhone11,2", "iPhone11,4", "iPhone11,6", "iPhone11,8"]
    
    private static let simulatorArchs = ["i386", "x86_64"]
    
    private static var identifier: String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let mirror = Mirror(reflecting: systemInfo.machine)
        let identifier = mirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }()
    
    /*** Check if the device is an iPhone X (or XR, XS...)  ***/
    static public var isiPhoneX: Bool {
        guard !DeviceUtils.simulatorArchs.contains(DeviceUtils.identifier) else {
            // Simulator detected. Cannot do better than test screen height here.
            return iPhoneXHeights.contains(UIScreen.main.nativeBounds.height)
        }
        return DeviceUtils.iPhoneXIdentifiers.contains(DeviceUtils.identifier)
    }
    
    static public var isSimulator: Bool {
        return DeviceUtils.simulatorArchs.contains(DeviceUtils.identifier)
    }
    
    static public var isPortraitOrientation: Bool {
        return [.portrait, .portraitUpsideDown].contains(UIApplication.shared.statusBarOrientation)
    }
    
}
