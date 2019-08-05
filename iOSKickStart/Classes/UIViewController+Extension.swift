//
//  UIViewController+Extension.swift
//  BeWithFriends
//
//  Created by Twaha Mukammel on 9/3/16.
//  Copyright © 2016 Twaha Mukammel. All rights reserved.
//

import UIKit

@IBDesignable
public extension UIViewController {
    
    @IBInspectable var localizedTitleKey: String {
        set (key) {
            title = NSLocalizedString(key, comment: "")
        }
        get {
            return ""
        }
    }
    
    @IBInspectable var titleImage: UIImage? {
        set (titleImg) {
            if let image = titleImg {
                navigationItem.titleView = UIImageView(image: image)
            }
        }
        get {
            return nil
        }
    }
    
}
