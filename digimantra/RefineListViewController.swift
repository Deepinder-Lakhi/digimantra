//
//  RefineListViewController.swift
//  digimantra
//
//  Created by Vishal Deep on 07/09/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class RefineListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private struct customIdentifier {
        static let refineListCellIdentifier = "RefineListCell"
    }
    
    func refineTitleArray() -> NSMutableArray {
        return ["Date Received", "Distance", "Price Per Session", "Total Price", "Positive Rating"]
    }
    
    @IBAction func backButtonAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(false)
    }
    
    
    //MARK:- TableView Delegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRectMake(0, 0, 300, 30))
        headerView.backgroundColor = UIColor.clearColor()
        let label = UILabel(frame: CGRectMake(15, 0, 300, 30))
        label.text = "Sort proposals By"
        label.textColor = UIColor(red: 0.470, green: 0.470, blue: 0.470, alpha: 1.0)
        label.font = UIFont(name: "Helvetica Neue", size: 12)
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.refineTitleArray().count
    }
    func segment(sender : UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            print("segment 0 is selected")
        } else if sender.selectedSegmentIndex == 1 {
            print("segment 1 is selected")
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(customIdentifier.refineListCellIdentifier, forIndexPath: indexPath) as!refineListCell
        cell.backgroundColor = UIColor.clearColor()
        print(self.refineTitleArray()[indexPath.row])
        
        
        cell.LblText.text = refineTitleArray()[indexPath.row] as? String
        
        
        if indexPath.row == 1 {
            
            let locationImage = "mile-icon-gray.png"
            let imageName = UIImage(named: locationImage)
            let imageView = UIImageView(frame: CGRectMake(195, 22, 15, 20))
            imageView.image = imageName
            cell.addSubview(imageView)
            
            let currentLocLbl = UILabel(frame: CGRectMake(220, 7, 200, 50))
            currentLocLbl.text = "Current Location"
            currentLocLbl.textColor = UIColor(red: 0.501, green: 0.501, blue: 0.501, alpha: 1.0)
            cell.contentView.addSubview(currentLocLbl)
        }
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 2 {
            return 120;
        } else {
            return 60;
        }
    }

}
