//
//  UIScrollView+Extension.swift
//  BeWithFriends
//
//  Created by Twaha Mukammel on 10/13/16.
//  Copyright © 2016 Twaha Mukammel. All rights reserved.
//

import UIKit

public extension UIScrollView {
    
}


// MARK: - Solve keyboard hides input field
public extension ScrollView {
    
    // MARK: - Public API
    
    public func parentViewControllerWillAppear() {
        if actAsInputForm == true {
            registerForKeyboardNotifications(true);
        }
    }
    
    public func parentViewControllerWillDisappear() {
        if actAsInputForm == true {
            registerForKeyboardNotifications(false)
        }
    }
    
    /// Checks and scrolls the active control to visible screen
    ///
    /// - Parameter control: the control to check if visible
    public func scrollControlRectToVisible(_ control: UIControl) {
        var rect = bounds
        rect.size.height -= (contentInset.bottom + contentInset.top)
        
        let responderFrame = convert(control.frame, from: control.superview)
        let intersects = rect.contains(responderFrame)
        
        if (intersects == false) {
            scrollRectToVisible(responderFrame, animated: true)
        }
    }
    
    // MARK: - Private functions
    
    private func registerForKeyboardNotifications(_ register: Bool) {
        switch register {
        case true:
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
            
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
            
        case false:
            NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
            NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
        }
    }
    
    final func keyboardWillShow(notification: Notification) {
        var userInfo = notification.userInfo!
        var keyboardFrame: CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.convert(keyboardFrame, from: nil)
        
        let screenSize = UIScreen.main.bounds
        
        var contentInset = self.contentInset
        contentInset.bottom = keyboardFrame.size.height - (screenSize.height - (frame.origin.y + frame.size.height))
        self.contentInset = contentInset
        scrollIndicatorInsets = contentInset
        
        if let responder = customFirstRespnder {
            scrollControlRectToVisible(responder)
        }
        
        flashScrollIndicators()
    }
    
    final func keyboardWillHide(notification: Notification) {
        let contentInset:UIEdgeInsets = .zero
        self.contentInset = contentInset
        scrollIndicatorInsets = contentInset
    }
}
