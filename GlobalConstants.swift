//
//  GlobalConstants.swift
//  BeWithFriends
//
//  Created by Twaha Mukammel on 5/4/16.
//  Copyright © 2016 Twaha Mukammel. All rights reserved.
//

import UIKit

let APPDELEGATE = UIApplication.shared.delegate as! AppDelegate

public struct KeyConstants {
    public static let isFirstLogin = "isFirstLogin"
}

public struct ApplicationSpecific {
    public struct LoginHistory {
        public static var isFirstLogin: Bool {
            get {
                return UserDefaults.standard.bool(forKey: KeyConstants.isFirstLogin)
            }
            set {
                UserDefaults.standard.set(isFirstLogin, forKey: KeyConstants.isFirstLogin)
            }
        }
    }
}

public struct ApplicationDesignSpecific {
    
//    1BB3CE - close to toretan
    
//    1BB39A - close to ejabberd
//    15917C - dark close to ejabberd
//    179E87 - dark light close to ejabberd
//    51C1AF - light close to ejabberd
    
    public static let themeColors: [String: UIColor] = [
        //main Theme Color
        "MainThemeColor"        : UIColor.init(hex: 0x1BB39A),
        //main Navigation bar Color
//        UIColor.init(red: 27.0/255.0, green: 179.0/255.0, blue: 154.0/255.0, alpha: 0.0)
        "MainNavBarColor"       : UIColor.init(hex: 0x1BB39A),
        //main Button Color
        "MainButtonColor"       : UIColor.init(hex: 0x51C1AF),
        //Main Text Color
        "MainTextColor"         : UIColor.white,
        //Main Text Color
        "DisabledTextColor"     : UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.5),
        //facebook Color
        "FacebookColor"         : UIColor.init(hex: 0x3b5998),
        //google Color
        "GoogleColor"           : UIColor.init(hex: 0xdb3236),
        //twitter Color
        "TwitterColor"          : UIColor.init(hex: 0x00aced),
        //white Transparent Color
        "WhiteTransparentColor" : UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.25),
        //Text field bg color
        "TextFieldBGColor"      : UIColor.white
    ]
    
    public static let stadardCornerRadius: CGFloat = 7.0
}

public struct UserSpecific {
    public static let minPasswordLength: Int = 6
}
