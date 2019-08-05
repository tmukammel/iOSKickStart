//
//  UIColor+Extension.swift
//  BeWithFriends
//
//  Created by Twaha Mukammel on 5/12/16.
//  Copyright © 2016 Twaha Mukammel. All rights reserved.
//

import UIKit

public extension UIColor {
    
    convenience init?(hexString: String) {
        var hexSanitized = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgba: UInt32 = 0
        
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        
        let length = hexSanitized.count
        
        guard Scanner(string: hexSanitized).scanHexInt32(&rgba) else {
            return nil
        }
        
        if length == 6 {
            r = CGFloat((rgba & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgba & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgba & 0x0000FF) / 255.0
            
        } else if length == 8 {
            r = CGFloat((rgba & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgba & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgba & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgba & 0x000000FF) / 255.0
            
        } else {
            return nil
        }
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    convenience init(hex:Int) {
        self.init(hex:hex, alpha:1.0)
    }
    
    convenience init(hex:Int, alpha:CGFloat) {
        let red   = CGFloat((0xff0000 & hex) >> 16) / 255.0
        let green = CGFloat((0xff00   & hex) >> 8)  / 255.0
        let blue  = CGFloat(0xff      & hex)        / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
