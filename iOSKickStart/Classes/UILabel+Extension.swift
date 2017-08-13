//
//  UILabel+Extension.swift
//  BeWithFriends
//
//  Created by Twaha Mukammel on 5/21/16.
//  Copyright © 2016 Twaha Mukammel. All rights reserved.
//

import UIKit

@IBDesignable
public extension UILabel {
    @IBInspectable public var localizedTextKey: String {
        get { return "" }
        set (key) {
//            #if TARGET_INTERFACE_BUILDER
//                var bundle = NSBundle(forClass: self)
//                self.text = bundle.localizedStringForKey(key, value:"", table: nil)
//            #else
//                self.text = NSLocalizedString(key, comment:"");
//            #endif
            self.text = NSLocalizedString(key, comment: "")
        }
    }
    
    @IBInspectable public var keyTextColor: String {
        set (colorKey) {
            if let color = ApplicationDesignSpecific.themeColors[colorKey] {
                textColor = color
            }
        }
        get {
            return ""
        }
    }
    
    @IBInspectable public var fontToHeightRatio: CGFloat {
        set {
            if (newValue > 0 && newValue <= 1) {
                font = font.withSize(frame.height * newValue)
            }
        }
        get {
            return 0
        }
    }
}
