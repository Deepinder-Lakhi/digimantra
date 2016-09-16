//
//  SessionDetailViewController.swift
//  digimantra
//
//  Created by Vishal on 23/08/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class SessionDetailViewController: UIViewController {
    
    private struct customIdentifier {
        static let financialCellIdentifier = "FinancialCell"
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clearColor()

        tableView.registerNib(UINib(nibName:"FinancialCell", bundle: nil), forCellReuseIdentifier: "FinancialCell")
    }

    @IBAction func closeWorkOutDetailVC(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("DidDismissWorkOutDetailVC", object: nil)
    }

    //MARK:- TableView Delegate/Datasource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(customIdentifier.financialCellIdentifier, forIndexPath: indexPath) as! FinancialCell
        cell.backgroundColor = UIColor.clearColor()
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }


}
