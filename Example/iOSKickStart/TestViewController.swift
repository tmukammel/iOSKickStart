//
//  TestViewController.swift
//  iOSKickStart
//
//  Created by Twaha Mukammel on 8/10/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import iOSKickStart

class TestViewController: ViewController, UITextFieldDelegate {
    @IBOutlet weak var scrollView: ScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        scrollView.parentViewControllerWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        scrollView.parentViewControllerWillDisappear()
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let textFld = (textField as? TextField), let _ = textFld.codeLength {
            textFld.observeCodeInputDidBegin()
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        scrollView.scrollControlRectToVisible(textField)
        
        if let textFld = (textField as? TextField), let _ = textFld.codeLength {
            return textFld.observeCodeInput(shouldChangeCharactersIn: range, replacementString: string)
        }
        
        return true
    }
}
