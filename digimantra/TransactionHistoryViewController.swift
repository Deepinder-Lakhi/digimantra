//
//  TransactionHistoryViewController.swift
//  digimantra
//
//  Created by Vishal Deep on 16/09/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class TransactionHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    private struct customIdentifier {
        static let cellClassIdentifier = "TransactionHistoryCell"
        static let cellReuseIdentifier = "TransactionHistoryCell"
    }

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName:customIdentifier.cellClassIdentifier, bundle: nil), forCellReuseIdentifier: customIdentifier.cellReuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (section==0)
        {
            return 2
        }
        else{
            return 4
        }
        
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cellHeight = self.tableView(tableView, heightForHeaderInSection: section)
//        print(cellHeight)
        let screenSize = UIScreen .mainScreen().bounds
        let headerView = UIView(frame: CGRectMake(0, 0, screenSize.size.width, cellHeight))
        
        
        if (section==0)
        {
            let noteLbl = UILabel(frame: CGRectMake(80, 0, 300, 30))
            noteLbl.text = "Tap a Transaction Card for Details"
            noteLbl.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
            noteLbl.font = UIFont(name: "Helvetica Neue", size: 17)
            headerView.addSubview(noteLbl)
            
            
            
            let label = UILabel(frame: CGRectMake(15, cellHeight  - 30, 300, 30))
            label.text = "Recent"
            label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
            label.font = UIFont(name: "Helvetica Neue", size: 17)
            headerView.addSubview(label)
        }
        else{
            let label = UILabel(frame: CGRectMake(15, cellHeight  - 30, 300, 30))
            label.text = "July 2016"
            label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
            label.font = UIFont(name: "Helvetica Neue", size: 17)
            headerView.addSubview(label)
        }
        
        
        return headerView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if (section==0)
        {
            return 70
        }
        else{
            return 30
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(customIdentifier.cellReuseIdentifier, forIndexPath: indexPath) as! TransactionHistoryCell
        cell.backgroundColor = UIColor.clearColor()

        return cell
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80;
        
    }

    


}
