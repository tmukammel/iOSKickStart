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
    
    func parentViewControllerWillAppear() {
        if actAsInputForm == true {
            registerForKeyboardNotifications(true);
        }
    }
    
    func parentViewControllerWillDisappear() {
        if actAsInputForm == true {
            registerForKeyboardNotifications(false)
        }
    }
    
    /// Checks and scrolls the active control to visible screen
    ///
    /// - Parameter control: the control to check if visible
    func scrollControlRectToVisible(_ control: UIControl) {
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
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
            
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
            
        case false:
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    }
    
    @objc final func keyboardWillShow(notification: Notification) {
        let userInfo = notification.userInfo!
        var keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.convert(keyboardFrame, from: nil)
        
        // Considering superview as the UIViewController.contentView
        guard let screenSize = self.superview?.bounds else {
            return
        }
        
        var contentInset = self.contentInset
        contentInset.bottom = keyboardFrame.size.height - (screenSize.height - (frame.origin.y + frame.size.height))
        self.contentInset = contentInset
        scrollIndicatorInsets = contentInset
        
        if let responder = customFirstRespnder {
            scrollControlRectToVisible(responder)
        }
        
        flashScrollIndicators()
    }
    
    @objc final func keyboardWillHide(notification: Notification) {
        let contentInset: UIEdgeInsets = .zero
        self.contentInset = contentInset
        scrollIndicatorInsets = contentInset
    }
}
