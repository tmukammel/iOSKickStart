//
//  LocalizationViewController.swift
//  iOSKickStart_Example
//
//  Created by Twaha Mukammel on 9/7/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import iOSKickStart

class LocalizationViewController: ViewController {
    
    @IBOutlet weak var languageControl: UISegmentedControl!
    
    @IBAction func selectLanguage(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            Bundle.setLanguage("en")
        case 1:
            Bundle.setLanguage("bn")
        default:
            Bundle.setLanguage("en")
        }
    }
    
    @IBAction func forceReload(_ sender: Button) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let destVC = storyBoard.instantiateViewController(withIdentifier: "LocalizationViewController") as! LocalizationViewController
        let navC = self.navigationController;
        navC?.popToRootViewController(animated: true)
        navC?.pushViewController(destVC, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let currentLanguage = Bundle.getLanguage() else {
            return languageControl.selectedSegmentIndex = 0
        }
        languageControl.selectedSegmentIndex = currentLanguage == "bn" ? 1 : 0
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
