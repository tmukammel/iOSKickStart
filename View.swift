//
//  UIView+Extension.swift
//  BeWithFriends
//
//  Created by Twaha Mukammel on 5/12/16.
//  Copyright © 2016 Twaha Mukammel. All rights reserved.
//

import UIKit

@objc public protocol TapGestureOnViewDelegate : NSObjectProtocol {
    /// implement when need to get notified of tap gesture on View.
    @objc optional func tapGestureOnView()
}

open class View: UIView {
    weak open var tapGesturedelegate: TapGestureOnViewDelegate?
    
    override public func tappedOnView() {
        super.tappedOnView()
        
        if let delegate = tapGesturedelegate {
            if delegate.responds(to: #selector(TapGestureOnViewDelegate.tapGestureOnView)) {
                delegate.tapGestureOnView?()
            }
        }
    }
}
