//
//  UIButton+Extension.swift
//  BeWithFriends
//
//  Created by Twaha Mukammel on 5/21/16.
//  Copyright © 2016 Twaha Mukammel. All rights reserved.
//

import UIKit

@IBDesignable
public extension UIButton {
    @IBInspectable public var localizedTitleKey: String {
        set (key) {
            setTitle(NSLocalizedString(key, comment: ""), for: UIControlState())
        }
        get {
            return ""
        }
    }
    
    @IBInspectable public var keyNormalTxtColor: String {
        set (colorKey) {
            if let color = ApplicationDesignSpecific.themeColors[colorKey] {
                setTitleColor(color, for: .normal)
            }
        }
        get {
            return ""
        }
    }
    
    @IBInspectable public var keyDisabledTxtColor: String {
        set (colorKey) {
            if let color = ApplicationDesignSpecific.themeColors[colorKey] {
                setTitleColor(color, for: .disabled)
            }
        }
        get {
            return ""
        }
    }
    
    @IBInspectable public var fontToHeightRatio: CGFloat {
        set {
            if (newValue > 0 && newValue <= 1) {
                titleLabel?.font = titleLabel?.font.withSize(frame.height * newValue)
            }
        }
        get {
            return 0
        }
    }
    
    @IBInspectable public var numberOfLines: Int {
        set {
            if (newValue >= 0) {
                titleLabel?.numberOfLines = newValue
            }
        }
        get {
            return 0
        }
    }
    
    @IBInspectable public var adjustFontSize: Bool {
        set {
            titleLabel?.adjustsFontSizeToFitWidth = newValue
        }
        get {
            return false
        }
    }
}
