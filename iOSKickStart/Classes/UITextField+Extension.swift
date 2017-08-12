//
//  UITextField+Extension.swift
//  BeWithFriends
//
//  Created by Twaha Mukammel on 9/7/16.
//  Copyright © 2016 Twaha Mukammel. All rights reserved.
//

import UIKit

private enum TextFieldKeyboardConfig: String {
    case email
    case name
    case password
    case comment
}

@IBDesignable
public extension UITextField {
    
    // MARK: - Inspectables
    
    @IBInspectable public var localizedPlaceholderKey: String {
        get { return "" }
        set (key) {
            placeholder = NSLocalizedString(key, comment: "")
        }
    }
    
    @IBInspectable public var keyTextColor: String {
        set (colorKey) {
            if let color = ApplicationDesignSpecific.themeColors[colorKey] {
                textColor = color
            }
        }
        get {
            return ""
        }
    }
    
    @IBInspectable public var keyboardConfig: String {
        set (newValue) {
            if let config = TextFieldKeyboardConfig(rawValue: newValue) {
                prepareWithConfiguration(config)
            }
        }
        get {
            return ""
        }
    }
    
    // MARK: - Private functions
    
    private func prepareWithConfiguration(_ config: TextFieldKeyboardConfig) {
        switch config {
        case .email:
            autocapitalizationType = .none
            autocorrectionType = .no
            spellCheckingType = .no
            keyboardType = .emailAddress
            keyboardAppearance = .default
            returnKeyType = .next
            enablesReturnKeyAutomatically = true
            isSecureTextEntry = false
            
        case .name:
            autocapitalizationType = .words
            autocorrectionType = .no
            spellCheckingType = .no
            keyboardType = .default
            keyboardAppearance = .default
            returnKeyType = .next
            enablesReturnKeyAutomatically = true
            isSecureTextEntry = false
            
        case .password:
            autocapitalizationType = .none
            autocorrectionType = .no
            spellCheckingType = .no
            keyboardType = .default
            keyboardAppearance = .default
            returnKeyType = .go
            enablesReturnKeyAutomatically = true
            isSecureTextEntry = true
            
        case .comment:
            autocapitalizationType = .sentences
            autocorrectionType = .default
            spellCheckingType = .yes
            keyboardType = .default
            keyboardAppearance = .default
            returnKeyType = .default
            enablesReturnKeyAutomatically = true
            isSecureTextEntry = false
        }
    }
    
    @IBInspectable public var leftPadding: CGFloat {
        set {
            if (newValue > 0) {
                let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: 1))
                leftView = paddingView;
                leftViewMode = .always
            }
        }
        get {
            return 0.0
        }
    }
    
    @IBInspectable public var rightPadding: CGFloat {
        set {
            if (newValue > 0) {
                let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: 1))
                rightView = paddingView;
                rightViewMode = .always
            }
        }
        get {
            return 0.0
        }
    }
    
}
