//
//  UINavigationController+Extension.swift
//  BeWithFriends
//
//  Created by Twaha Mukammel on 12/27/15.
//  Copyright © 2015 Twaha Mukammel. All rights reserved.
//

import UIKit

public extension UINavigationController {
    
    // MARK: - Cross Dissolve
    
    
    /// Pushes a view controller onto the receiver’s stack and updates the display with cross dissolve animation kCATransitionFade.
    ///
    /// - Parameter viewController: The view controller to push onto the stack.
    public func crossDissolveViewController(_ viewController: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionFade
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        self.view.layer.add(transition, forKey: "")
        
        self.pushViewController(viewController, animated: false)
    }
    
    // MARK: - Reverse Navigation
    
    /**
        Pushes a view controller onto the receiver’s stack and updates the display with default animation kCATransitionFromRight.
        - parameters:
            - viewController: The view controller to push onto the stack.
            - animated: Specify true to animate the transition or false if you do not want the transition to be animated.
            - animationType: Specify transition from which side
    */
    public func pushViewController(_ viewController: UIViewController, animated: Bool, animationType: String) {
        if (animated == true) {
            let _animationType = (animationType.isEmpty) ? kCATransitionFromRight : animationType
            
            let transition = CATransition()
            transition.duration = 0.3
            transition.type = kCATransitionPush
            transition.subtype = _animationType
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            
            self.view.layer.add(transition, forKey: "")
        }
        self.pushViewController(viewController, animated: false)
    }

    /**
        Pops the top view controller from the navigation stack and updates the display with default animation kCATransitionFromLeft.
        - parameters:
            - animated: Specify true to animate the transition or false if you do not want the transition to be animated.
            - animationType: Specify transition from which side
     */
    public func popViewControllerAnimated(_ animated: Bool, animationType: String) -> UIViewController? {
        if (animated == true) {
            let _animationType = (animationType.isEmpty) ? kCATransitionFromLeft : animationType
            
            let transition = CATransition()
            transition.duration = 0.3
            transition.type = kCATransitionPush
            transition.subtype = _animationType
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            
            self.view.layer.add(transition, forKey: "")
        }
        return self.popViewController(animated: false)
    }
}
