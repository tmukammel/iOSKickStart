//
//  UINavigationBar+Extension.swift
//  iOSKickStart
//
//  Created by JMC on 16/7/21.
//

@IBDesignable
extension UINavigationBar {
    @IBInspectable public var barBackgroundColor: UIColor? {
        set (value) {
            self.backgroundColor = value
        }

        get {
            return  self.backgroundColor
        }
    }
}
