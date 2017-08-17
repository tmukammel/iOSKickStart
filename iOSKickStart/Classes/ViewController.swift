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
    
    @IBInspectable public var isNavBarHidden: Bool = false {
        didSet {
            navigationController?.setNavigationBarHidden(isNavBarHidden, animated: true);
        }
    }
    
    @IBInspectable public var shouldRemoveFormStackOnDisapper: Bool = false
    
    // MARK:- Superclass Override
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(isNavBarHidden, animated: true);
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
