//
//  TabBarController.swift
//  BeWithFriends
//
//  Created by Twaha Mukammel on 12/27/15.
//  Copyright © 2015 Twaha Mukammel. All rights reserved.
//

import UIKit

open class TabBarController: UITabBarController {

    override open func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - ViewController
    
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
