//
//  NotificationViewController.swift
//  digimantra
//
//  Created by DEEPINDERPAL SINGH on 16/08/16.
//  Copyright © 2016 Logiciel solutions. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var bgImage = UIImage()
    @IBOutlet weak var tableView: UITableView!
    
    private struct customIdentifier {
        static let proposalCellClassIdentifier = "NewProposalCell"
        static let proposalCellReuseIdentifier = "NewProposalCell"
        static let alertCellClassIdentifier = "AlertCell"
        static let alertCellReuseIdentifier = "AlertCell"
        static let messgaeCellClassIdentifier = "MessageCell"
        static let messgaeCellReuseIdentifier = "MessageCell"
        static let alertClassIdentifier = "AlertViewControllerID"
        static let messageClassIdentifier = "MessageViewControllerID"
        static let proposalListCellClassIdentifier = "ProposalViewControllerID"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName:customIdentifier.proposalCellClassIdentifier, bundle: nil), forCellReuseIdentifier: customIdentifier.proposalCellReuseIdentifier)
        
        tableView.registerNib(UINib(nibName:customIdentifier.alertCellClassIdentifier, bundle: nil), forCellReuseIdentifier: customIdentifier.alertCellReuseIdentifier)
        
        tableView.registerNib(UINib(nibName:customIdentifier.messgaeCellClassIdentifier, bundle: nil), forCellReuseIdentifier: customIdentifier.messgaeCellReuseIdentifier)
        
//        tableView.rowHeight = UITableViewAutomaticDimension
//        tableView.estimatedRowHeight = 140;
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBarHidden = true
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeNotificationVC(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("DidDismissNotificationVC", object: nil)
    }
    
    //MARk :- TableView DataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCellWithIdentifier(customIdentifier.proposalCellReuseIdentifier, forIndexPath: indexPath) as! NewProposalCell
            cell.contentView.backgroundColor = UIColor.clearColor()
        } else if indexPath.section == 1 {
            cell = tableView.dequeueReusableCellWithIdentifier(customIdentifier.alertCellReuseIdentifier, forIndexPath: indexPath) as! AlertCell
        }
        else  {
            cell = tableView.dequeueReusableCellWithIdentifier(customIdentifier.messgaeCellReuseIdentifier, forIndexPath: indexPath) as! MessageCell
        }
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 220;
        } else if indexPath.section == 1 {
            return 188;
        } else {
            return 290;
        }
    }
    
    //MARk :- TableView Delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            let proposalObj = self.storyboard?.instantiateViewControllerWithIdentifier(customIdentifier.proposalListCellClassIdentifier) as! ProposalViewController
            proposalObj.bgImage = bgImage
            self.navigationController?.pushViewController(proposalObj, animated: false)
        } else if indexPath.section == 1 {
            let alertObj = self.storyboard?.instantiateViewControllerWithIdentifier(customIdentifier.alertClassIdentifier) as! AlertViewController
            alertObj.bgImage = bgImage
            self.navigationController?.pushViewController(alertObj, animated: false)
        } else {
            let messageObj = self.storyboard?.instantiateViewControllerWithIdentifier(customIdentifier.messageClassIdentifier) as! MessageViewController
            messageObj.bgImage = bgImage
            self.navigationController?.pushViewController(messageObj, animated: false)
        }
    }
}
