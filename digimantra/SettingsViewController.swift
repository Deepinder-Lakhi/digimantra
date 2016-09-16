//
//  SettingsViewController.swift
//  digimantra
//
//  Created by DEEPINDERPAL SINGH on 11/08/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private struct nib {
        static let cellReuseIdentifier = "Setting cell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        let array1 = NSMutableArray(objects: "1", "2")
        var array2 = NSMutableArray()
        array2 = array1.mutableCopy() as! NSMutableArray
        array2.removeObjectAtIndex(0)
        print(array2)
        
        self.title = "Settings"
        tableView.registerNib(UINib(nibName:"CustomSettingCell", bundle: nil), forCellReuseIdentifier: nib.cellReuseIdentifier)
    }
    
    func imageArray() -> NSMutableArray {
        return ["manage-profile", "credit-card", "saved-address", "block-list", "gear"]
    }
    
    func headerTitleArray() -> NSMutableArray {
        return ["Manage Profile", "Payment Methods", "Saved Address", "Block List", "Custom Sessions"]
    }
    
    func DescriptionArray() -> NSMutableArray {
        return ["Edit your profile - email address, phone, your profile picture and more...", "Choose how you'd like to pay for sessions. You need a valid Payment Method on your record before you can book workout sessions online...", "Access relevant workouts, coaches and places based on your saved address(like Home, Office, Club...)", "Block Coaches or Places from showing up in your results, or contacting you in any manner.", "Set defaults for your custom sessions, and choose whether to use auto-pairing to find you the best coaches, sessions, and places."]
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent;
    }
    
    //MARk :- TableView DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray().count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(nib.cellReuseIdentifier, forIndexPath: indexPath) as! CustomSettingCell
        cell.imgView.image = UIImage(named: imageArray()[indexPath.row] as! String)
        cell.headerLbl.text = headerTitleArray()[indexPath.row] as? String
        cell.descriptionLbl.text = DescriptionArray()[indexPath.row] as? String
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    
    //MARk :- TableView Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewControllerWithIdentifier("someViewController") as! UIViewController
//        self.presentViewController(vc, animated: true, completion: nil)
        
        var objVC = UIViewController()
        if indexPath.row == 0 {
            objVC = storyboard.instantiateViewControllerWithIdentifier("ManageProfileViewControllerID")
            
        } else if indexPath.row == 1 {
            objVC = storyboard.instantiateViewControllerWithIdentifier("PayMethodsViewControllerID")
            
        } else if indexPath.row == 2 {
            objVC = storyboard.instantiateViewControllerWithIdentifier("SavedAddressViewControllerID")
            
        } else if indexPath.row == 3 {
            objVC = storyboard.instantiateViewControllerWithIdentifier("BlockListViewControllerID")
            
        } else if indexPath.row == 4 {
//            objVC = storyboard.instantiateViewControllerWithIdentifier("ManageProfileViewControllerID")
        }
        
        self.navigationController?.pushViewController(objVC, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
