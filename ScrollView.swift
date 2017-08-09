//
//  ScrollView.swift
//  BeWithFriends
//
//  Created by Twaha Mukammel on 9/3/16.
//  Copyright © 2016 Twaha Mukammel. All rights reserved.
//

import UIKit

@IBDesignable
open class ScrollView: UIScrollView {
    // MARK: - Public API
    
    @IBInspectable public var actAsInputForm: Bool = false
    
    public weak var customFirstRespnder: UIControl? = nil
    
}
