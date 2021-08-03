//
//  WKWebView+Extension.swift
//  iOSKickStart
//
//  Created by Twaha Mukammel on 3/8/21.
//

import WebKit

@IBDesignable
public extension WKWebView {
    
    @IBInspectable var strURL: String {
        set (strURL) {
            let url = URL(string: strURL)!
            let request = URLRequest(url: url)
            load(request)
        }
        get {
            return ""
        }
    }
    
}
