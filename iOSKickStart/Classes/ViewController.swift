//
//  BWFViewController.swift
//  BeWithFriends
//
//  Created by Twaha Mukammel on 11/30/15.
//  Copyright © 2015 Twaha Mukammel. All rights reserved.
//

import UIKit

@IBDesignable
open class ViewController: UIViewController {
    
    // MARK:- Public API
    
    @IBInspectable public var localizedTitleKey: String = "" {
        didSet {
            title = NSLocalizedString(localizedTitleKey, comment: "")
        }
    }

    @IBInspectable public var isNavBarHidden: Bool = false {
        didSet {
            self.navigationController?.setNavigationBarHidden(isNavBarHidden, animated: true);
        }
    }
    
    @IBInspectable public var shouldRemoveFormStackOnDisapper: Bool = false
    
    @IBInspectable public var navigationBarColorKey: String = "" {
        didSet {
            setNavigationBarColor();
        }
    }
    
    @IBInspectable public var hideNavBarHairLineShadow: Bool = false
    
    // MARK:- Private
    
    private weak var navBarHairLineShadowImage: UIView?
    
    private func setNavigationBarColor() {
        if navigationBarColorKey == "none" {
            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController?.navigationBar.shadowImage = UIImage()
            navigationController?.navigationBar.isTranslucent = true
            navigationController?.navigationBar.backgroundColor = UIColor.clear
        }
        else if navigationBarColorKey != "" {
            if let color = ApplicationDesignSpecific.themeColors[navigationBarColorKey] {
                navigationController?.navigationBar.barTintColor =  color
            }
            
        }
    }
    
    private func setNavBarHairLineShadowVisibility() {
        if let shadowImage = navBarHairLineShadowImage {
            shadowImage.isHidden = hideNavBarHairLineShadow
        }
        else if let navController = self.navigationController {
            for parent in navController.navigationBar.subviews {
                for childView in parent.subviews {
                    if(childView is UIImageView) {
                        navBarHairLineShadowImage = childView
                        childView.isHidden = hideNavBarHairLineShadow
                    }
                }
            }
        }
    }
    
    // MARK:- Superclass Override
    
    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = NSLocalizedString(localizedTitleKey, comment: "")
        
        navigationController?.setNavigationBarHidden(isNavBarHidden, animated: true);
        
        setNavigationBarColor()
        
        setNavBarHairLineShadowVisibility()
        
        navigationController?.navigationBar.tintColor = UIColor.white
        let attributes = [
            NSForegroundColorAttributeName : UIColor.white
//            NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)
        ]
        navigationController?.navigationBar.titleTextAttributes = attributes
    }
    
    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if let navigationController = self.navigationController , shouldRemoveFormStackOnDisapper == true {
            let viewControllers = navigationController.viewControllers
            let viewControllersCount = navigationController.viewControllers.count
            
            if viewControllers[viewControllersCount - 2] == self {
                self.navigationController?.viewControllers.remove(at: viewControllersCount - 2)
            }
        }
    }
}
