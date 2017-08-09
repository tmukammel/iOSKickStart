//
//  TabBarItem.swift
//  BeWithFriends
//
//  Created by Twaha Mukammel on 12/12/15.
//  Copyright © 2015 Twaha Mukammel. All rights reserved.
//

import UIKit

@IBDesignable
open class TabBarItem: UITabBarItem {
    
    @IBInspectable var localizedTitleKey: String = "" {
        didSet {
            self.title = NSLocalizedString(localizedTitleKey, comment: "")
        }
    }
    
}
