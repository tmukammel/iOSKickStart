//
//  UITableViewCel+Extension.swift
//  iOSKickStart
//
//  Created by JMC on 16/7/21.
//
import UIKit

@IBDesignable
extension UITableViewCell {
    @IBInspectable public var selectedViewBackgroundColor:UIColor{
        set (color) {
            addCustomSelectionView(withColor: color)
        }

        get {
            return selectedBackgroundView?.backgroundColor ?? UIColor.clear
        }
    }

    public func addCustomSelectionView(withColor color: UIColor?){
        let bgColorView = UIView()
        bgColorView.backgroundColor = color
        selectedBackgroundView = bgColorView
    }
}

