//
//  LocalizationExamplesViewController.swift
//  iOSKickStart_Example
//
//  Created by Twaha Mukammel on 10/7/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import iOSKickStart

class LocalizationExamplesViewController: ViewController, UITextFieldDelegate {

    @IBOutlet weak var scrollView: ScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        scrollView.scrollControlRectToVisible(textField)
        
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
