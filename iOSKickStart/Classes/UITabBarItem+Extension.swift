//
//  UITabBarItem+Extension.swift
//  iOSKickStart
//
//  Created by Twaha Mukammel on 18/7/21.
//

import UIKit

@IBDesignable
public extension UITabBarItem {
    // MARK: - Inspectables
    
    @IBInspectable var localizedTitleKey: String {
        set (key) {
            title = NSLocalizedString(key, comment: "")
        }
        get { return "" }
    }
}
