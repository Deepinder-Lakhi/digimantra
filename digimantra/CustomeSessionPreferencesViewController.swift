//
//  CustomeSessionPreferencesViewController.swift
//  digimantra
//
//  Created by Vishal on 16/09/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class CustomeSessionPreferencesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    @IBOutlet var tableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName:customIdentifier.cellClassIdentifier, bundle: nil), forCellReuseIdentifier: customIdentifier.cellReuseIdentifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private struct customIdentifier {
        static let cellClassIdentifier = "CustomeSessionPreferencesCell"
        static let cellReuseIdentifier = "CustomeSessionPreferencesCell"
    }
    
    func name() -> NSMutableArray {
        return ["Preferred Time", "Preferred Day", "Preferred Activities", "Difficulty Level", "Session Type", "Preferrd Location"]
    }
    
    func textField() -> NSMutableArray {
        return ["Preferred Time", "Preferred Day", "Preferred Activities", "Difficulty Level", "Session Type", "Preferrd Location"]
    }
    
    //MARK:- TableView Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
     return 3
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cellHeight = self.tableView(tableView, heightForHeaderInSection: section)
        print(cellHeight)
        let headerView = UIView(frame: CGRectMake(0, 0, 300, cellHeight))
        headerView.backgroundColor = UIColor.clearColor()
        let headerTitle = UILabel(frame: CGRectMake(10, 10, 300, 20))
        headerTitle.backgroundColor = UIColor.clearColor()
        headerTitle.textColor = UIColor.grayColor()
        
        let headerSwitch = UISwitch();
        headerSwitch.frame = CGRectMake(10, 40, 0, 0)
        headerSwitch.on = true
        
        let headerDetail = UILabel()
        headerDetail.frame = CGRectMake(100, 35, 300, 40)
        headerDetail.font = headerDetail.font.fontWithSize(12)
        headerDetail.textColor = UIColor.grayColor()
        headerDetail.numberOfLines = 0
        headerDetail.text = "Only show Favorites"
        if section == 0 {
            headerTitle.text = "WORKOUT PREFERENCES"
            headerView.backgroundColor = UIColor.whiteColor()
            headerSwitch.frame = CGRectMake(self.view.frame.size.width - 80, 30, 0, 0)
            headerDetail.frame = CGRectMake(10, 30, 300, 40)
            headerDetail.text = "Use saved preferences to speed up the process of creating custom sessions"
        } else if section == 1 {
            headerTitle.text = "COACH PREFERENCES"
        } else if section == 2 {
            headerTitle.text = "HOST/PLACE PREFERENCES"
        }
        headerView.addSubview(headerTitle)
        headerView.addSubview(headerSwitch)
        headerView.addSubview(headerDetail)
        return headerView
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(customIdentifier.cellClassIdentifier, forIndexPath: indexPath) as!CustomeSessionPreferencesCell
        // Configure the cell...
         cell.selectionStyle = UITableViewCellSelectionStyle.None
        switch (indexPath.section) {
        case 0:
            cell.label.text = name()[indexPath.row] as? String
            cell.textField.text = textField()[indexPath.row] as? String
            break
        default:
            break
        }
        return cell
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    //MARk :- TableView Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    }


}
