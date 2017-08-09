//
//  UIColor+Extension.swift
//  BeWithFriends
//
//  Created by Twaha Mukammel on 5/12/16.
//  Copyright © 2016 Twaha Mukammel. All rights reserved.
//

import UIKit

public extension UIColor {
    
    public convenience init(hex:Int) {
        self.init(hex:hex, alpha:1.0)
    }
    
    public convenience init(hex:Int, alpha:CGFloat) {
        let red   = CGFloat((0xff0000 & hex) >> 16) / 255.0
        let green = CGFloat((0xff00   & hex) >> 8)  / 255.0
        let blue  = CGFloat(0xff      & hex)        / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
