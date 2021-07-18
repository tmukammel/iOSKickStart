//
//  UINavigationBar+Extension.swift
//  iOSKickStart
//
//  Created by Twaha Mukammel on 18/7/21.
//

import UIKit

@IBDesignable
public extension UINavigationItem {
    // MARK: - Inspectables
    
    @IBInspectable var keyLocalizedTitle: String {
        set (key) {
            title = NSLocalizedString(key, comment: "")
        }
        get { return "" }
    }
    
    @IBInspectable var imageTitle: UIImage? {
        set (titleImg) {
            if let image = titleImg {
                titleView = UIImageView(image: image)
            }
        }
        get {
            return nil
        }
    }
}
