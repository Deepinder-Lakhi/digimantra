//
//  SavedAddressViewController.swift
//  digimantra
//
//  Created by Vishal Deep on 12/09/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class SavedAddressViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backButtonAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    private struct customIdentifier {
        static let savedAdressCellIdentifier = "savedAddressCell"
    }
    
    //MARK:- TableView Delegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.refineTitleArray().count
        return 4
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 80;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(customIdentifier.savedAdressCellIdentifier, forIndexPath: indexPath) as!SavedAddressCell
        cell.backgroundColor = UIColor.clearColor()        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.whiteColor()
        }else{
            cell.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1.0)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: .Normal, title: " Edit  ") { (rowAction:UITableViewRowAction, indexPath:NSIndexPath) -> Void in
            
            //TODO: edit the row at indexPath here
            
            return 2
            
        }
        editAction.backgroundColor = UIColor.cyanColor()
        
        
        let deleteAction = UITableViewRowAction(style: .Normal, title: "Delete") { (rowAction:UITableViewRowAction, indexPath:NSIndexPath) -> Void in
            //TODO: Delete the row at indexPath here
            
            return 2
        }
        deleteAction.backgroundColor = UIColor.redColor()
        
        return [deleteAction, editAction]
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let addressVC = self.storyboard?.instantiateViewControllerWithIdentifier("AddAdressViewControllerID") as! AddAdressViewController
        addressVC.isEditingRequired = true
        self.navigationController?.pushViewController(addressVC, animated: true)
        
    }
}
