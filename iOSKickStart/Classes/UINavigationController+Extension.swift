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
    func crossDissolveViewController(_ viewController: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.fade
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        
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
    func pushViewController(_ viewController: UIViewController, animated: Bool, animationType: String) {
        if (animated == true) {
            let _animationType = (animationType.isEmpty) ? CATransitionSubtype.fromRight.rawValue : animationType
            
            let transition = CATransition()
            transition.duration = 0.3
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype(rawValue: _animationType)
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
            
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
    func popViewControllerAnimated(_ animated: Bool, animationType: String) -> UIViewController? {
        if (animated == true) {
            let _animationType = (animationType.isEmpty) ? CATransitionSubtype.fromLeft.rawValue : animationType
            
            let transition = CATransition()
            transition.duration = 0.3
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype(rawValue: _animationType)
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
            
            self.view.layer.add(transition, forKey: "")
        }
        return self.popViewController(animated: false)
    }
}
