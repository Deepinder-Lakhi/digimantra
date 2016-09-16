//
//  WorkoutFinancialViewController.swift
//  digimantra
//
//  Created by DEEPINDERPAL SINGH on 31/08/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class WorkoutFinancialViewController: UIViewController {

    
    @IBOutlet weak var containerWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var containerHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var containerleadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var myCustomView: UIView!

    @IBOutlet weak var tableView: UITableView!
    
    var loadViewForFristTime = Bool()
    
    var viewFrames = CGRect()

    
    private struct customIdentifier {
        static let financialCellIdentifier = "FinancialCell"
    }
    
    func updateNewFrame(frame:CGRect) {
        print(frame);
        viewFrames = frame
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clearColor()
        if loadViewForFristTime == true {
            tableView.registerNib(UINib(nibName:"FinancialCell", bundle: nil), forCellReuseIdentifier: "FinancialCell")
            loadViewForFristTime = false
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view.backgroundColor = UIColor.whiteColor()
        containerleadingConstraint.constant = 0
        containerWidthConstraint.constant = viewFrames.size.width
        containerHeightConstraint.constant = viewFrames.size.height
        myCustomView.backgroundColor = UIColor.clearColor()
    }
    
    @IBAction func closeWorkOutDetailVC(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("DidDismissWorkOutFinancailVC", object: nil)
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
    
    override func viewWillDisappear(animated: Bool) {
        tableView.delegate = nil
        tableView.dataSource = nil
    }


}


