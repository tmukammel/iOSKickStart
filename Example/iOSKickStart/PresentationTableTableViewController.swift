//
//  PresentationTableTableViewController.swift
//  iOSKickStart_Example
//
//  Created by Twaha Mukammel on 9/7/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

class PresentationCell: UITableViewCell {
    @IBOutlet weak var labelTopic: UILabel!
}

class PresentationTableTableViewController: UITableViewController {
    
    let sections: [String] = [
        "Localization",
        "ScrollView",
        "NavigationController",
        "ViewController",
        "Segue",
        "View",
        "ImageView",
        "Color",
        "Label",
        "TextField",
        "Button",
        "TabBarController",
        "ProgressView",
    ]
    
    let sectionSegues: [String: [String]] = [
        "Localization": ["toLocalizationViewController", "toLocalizationExamplesViewController"],
        "ScrollView": ["toUserInputFormViewController"],
        "NavigationController": ["toLocalizationViewController"],
        "ViewController": ["toLocalizationViewController"],
        "Segue": ["toLocalizationViewController"],
        "View": ["toLocalizationViewController"],
        "ImageView": ["toLocalizationViewController"],
        "Color": ["toLocalizationViewController"],
        "Label": ["toLocalizationViewController"],
        "TextField": ["toLocalizationViewController"],
        "Button": ["toTestViewController"],
        "TabBarController": ["toLocalizationViewController"],
        "ProgressView": ["toLocalizationViewController"],
    ]
    
    let sectionTopics: [String: [String]] = [
        "Localization": ["Set language", "Localization from storyboard"],
        "ScrollView": ["User input form"],
        "NavigationController": ["Custom Segue", "Cross Dissolve", "Reverse push-pop"],
        "ViewController": [],
        "Segue": [],
        "View": [],
        "ImageView": [],
        "Color": [],
        "Label": [],
        "TextField": [],
        "Button": ["Adaptive Button Text"],
        "TabBarController": [],
        "ProgressView": [],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = true
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.sectionTopics[self.sections[section]]?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PresentationCell = tableView.dequeueReusableCell(withIdentifier: "PresentationCell", for: indexPath) as! PresentationCell
        cell.labelTopic.text = self.sectionTopics[self.sections[indexPath.section]]?[indexPath.row]
        
        return cell
    }
     
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        guard let seguesInSection = self.sectionSegues[self.sections[indexPath.section]]
        else { return }
        
        if indexPath.row < seguesInSection.count {
            let segueIdentifier = seguesInSection[indexPath.row]
            performSegue(withIdentifier: segueIdentifier, sender: self)
        }
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
