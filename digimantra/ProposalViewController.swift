//
//  ProposalViewController.swift
//  digimantra
//
//  Created by DEEPINDERPAL SINGH on 07/09/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class ProposalViewController: UIViewController {

    var bgImage = UIImage()
    @IBOutlet weak var backGroundImage: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    private struct customIdentifier {
        static let cellClassIdentifier = "ProposalCell"
        static let cellReuseIdentifier = "ProposalCell"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting up BackGround Image
        backGroundImage.image = bgImage

        //Loading Table View
        tableView.registerNib(UINib(nibName:customIdentifier.cellClassIdentifier, bundle: nil), forCellReuseIdentifier: customIdentifier.cellReuseIdentifier)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140;
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBarHidden = true
    }
    
    @IBAction func backButtonAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(false)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRectMake(0, 0, 300, 30))
        headerView.backgroundColor = UIColor.clearColor()
        let label = UILabel(frame: CGRectMake(15, 10, 300, 20))
        label.text = "Sort proposals By"
        label.textColor = UIColor(red: 0.470, green: 0.470, blue: 0.470, alpha: 1.0)
        label.font = UIFont(name: "Helvetica Neue", size: 12)
        headerView.addSubview(label)
        return headerView
    }
    
    //MARk :- TableView DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(customIdentifier.cellReuseIdentifier, forIndexPath: indexPath) as! ProposalCell
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 95;
    }
    
    //MARk :- TableView Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }

}
