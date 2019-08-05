//
//  UIProgressView+Extension.swift
//  BeWithFriends
//
//  Created by Twaha Mukammel on 5/21/16.
//  Copyright © 2016 Twaha Mukammel. All rights reserved.
//

import UIKit

@IBDesignable
public extension UIProgressView {
    @IBInspectable var trackTintColorKey: String {
        set (colorKey) {
            trackTintColor = ApplicationDesignSpecific.themeColors[colorKey]
        }
        get {
            return ""
        }
    }
}
