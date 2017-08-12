//
//  TextField.swift
//  BeWithFriends
//
//  Created by Twaha Mukammel on 9/4/16.
//  Copyright © 2016 Twaha Mukammel. All rights reserved.
//

import UIKit

@IBDesignable
open class TextField: UITextField, UITextFieldDelegate {

    private var codeLength: Int?
    private var codePlaceHolder: Character?
    
    @IBInspectable public var codeLengthAndChar: String {
        set {
            if (newValue.characters.count >= 3) {
                codeLength = nil
                codePlaceHolder = nil
                
                let data = newValue.components(separatedBy: ",")
                
                guard data.count == 2 else {
                    return
                }
                
                codeLength = Int(data[0])
                codePlaceHolder = data[1].characters.first;
                
                if let length = codeLength, length > 0, let placeholder = codePlaceHolder {
                    text = String(repeating: String(describing: placeholder), count: length)
                }
            }
        }
        get {
            return ""
        }
    }
    
    
    /// Brings cursor position to begning of text
    ///
    /// - Returns: should begin editing
    open func observeCodeInputDidBegin() {
        selectedTextRange = textRange(from: beginningOfDocument, to: beginningOfDocument)
    }
    
    /// Code input and placeholder replacement. Call this method from textfield shouldChangeCharactersIn range: delegate method.
    ///
    /// - Parameters:
    ///   - range: The range of characters to be replaced.
    ///   - string: The replacement string.
    /// - Returns: should change character.
    open func observeCodeInput(shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        print("Location: \(range.location), Length: \(range.length), String: \(string)");
        
        guard let length = codeLength, let code = codePlaceHolder,
            range.location + string.characters.count <= length else {
            return false
        }
        
        switch range.length {
        case 0:
            text = (text! as NSString).replacingCharacters(in: NSMakeRange(range.location, string.characters.count), with: string)
            
            if let position = position(from: beginningOfDocument, offset: range.location + string.characters.count) {
                selectedTextRange = textRange(from: position, to: position)
            }
            
        default:
            text = (text! as NSString).replacingCharacters(in: NSMakeRange(range.location, range.length), with: String(repeating: String(describing: code), count: range.length))
            
            if let position = position(from: beginningOfDocument, offset: range.location) {
                selectedTextRange = textRange(from: position, to: position)
            }
        }
        
        return false
    }

}
