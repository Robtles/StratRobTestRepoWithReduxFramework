//
//  UIButton+Extension.swift
//  StratRobTestRepoWithReduxFramework
//
//  Created by Rob on 11/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

import UIKit


extension UIButton {
    
    /// START OF CRAZY TRICK FOR UIBUTTON
    // Since Apple does not provide a way to easily update the fonts or corner radius of all the buttons throughout the app,
    // and UILabel.appearance(whenContainedIn: [UIButton.self]).font seems to be broken,
    // so a workaround consists in updating the font in awakeFromNib() and specifying if this button should
    // use the proxy appearance font. And since extensions may not contain stored properties, the
    // way to go consists in using a computed property instead and play around with the pointer address.
    private static var _shouldUseProxyAppearanceCornerRadius = [String: Bool]()
    
    @IBInspectable open var shouldUseProxyAppearanceCornerRadius: Bool {
        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return UIButton._shouldUseProxyAppearanceCornerRadius[tmpAddress] ?? false
        }
        set(newValue) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            UIButton._shouldUseProxyAppearanceCornerRadius[tmpAddress] = newValue
        }
    }
    
    private static var _shouldUseProxyAppearanceFont = [String: Bool]()
    
    @IBInspectable open var shouldUseProxyAppearanceFont: Bool {
        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return UIButton._shouldUseProxyAppearanceFont[tmpAddress] ?? false
        }
        set(newValue) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            UIButton._shouldUseProxyAppearanceFont[tmpAddress] = newValue
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        if let font = Application.Style.Button.font, self.shouldUseProxyAppearanceFont {
            self.titleLabel?.font = font
        }
        if let cornerRadius = Application.Style.Button.cornerRadius, self.shouldUseProxyAppearanceCornerRadius {
            self.layer.cornerRadius = cornerRadius
        }
    }
    /// END OF CRAZY TRICK
    
}
