//
//  UIView+Extension.swift
//  BeWithFriends
//
//  Created by Twaha Mukammel on 5/21/16.
//  Copyright © 2016 Twaha Mukammel. All rights reserved.
//

import UIKit

// MARK: - UIView IBDesignable extension
@IBDesignable
public extension UIView {
    
    @IBInspectable public var bgColorKey: String {
        set (colorKey) {
            if let color = ApplicationDesignSpecific.themeColors[colorKey] {
                backgroundColor =  color
            }
        }
        get {
            return ""
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat {
        set (value) {
            layer.cornerRadius = value
            layer.masksToBounds = value > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable public var applyStandardCornerRadius: Bool {
        set (shouldApply) {
            layer.cornerRadius = shouldApply ? ApplicationDesignSpecific.stadardCornerRadius : 0.0
            layer.masksToBounds = shouldApply
        }
        get {
            return layer.cornerRadius > 0.0 ? true : false
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat {
        set (width) {
            layer.borderWidth = width
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable public var borderColor: UIColor? {
        set (color) {
            layer.borderColor = color!.cgColor
        }
        get {
            return UIColor.init(cgColor: layer.borderColor!)
        }
    }
    
    @IBInspectable public var endEditingOnTap: Bool {
        set {
            if newValue == true {
                prepareKeyboardDismissOnTap()
            }
        }
        get {
            return false
        }
    }
    
    /// Uniform vertical gradient with comma seperated string of dual hex colors
    @IBInspectable public var gradHexColors: String {
        set {
            let colors = newValue.components(separatedBy: ",");
            
            guard colors.count == 2 else {
                return
            }
            
            if let colorOne = UIColor(hexString: colors[0]), let colorTwo = UIColor(hexString: colors[1]) {
                let gradientLayer = CAGradientLayer()
                gradientLayer.frame = bounds
                gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor];
                
                layer.insertSublayer(gradientLayer, at: 0)
            }
        }
        get {
            return ""
        }
    }
}

// MARK: - End editing on tap
public extension UIView {
    final func prepareKeyboardDismissOnTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedOnView))
        self.addGestureRecognizer(tapGesture)
    }
    
    public func tappedOnView() {
        self.endEditing(true)
    }
}
