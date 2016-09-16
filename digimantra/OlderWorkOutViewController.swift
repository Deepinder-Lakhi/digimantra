//
//  OlderWorkOutViewController.swift
//  digimantra
//
//  Created by Vishal on 22/08/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class OlderWorkOutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var WorkOutDetailVC = SessionDetailViewController()

    
    private struct customIdentifier {
        static let olderWorkOutCellIdentifier = "OlderWorkoutCell"
    }
    
    override func viewDidLayoutSubviews() {
    }

    @IBOutlet weak var showMoreBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName:customIdentifier.olderWorkOutCellIdentifier, bundle: nil), forCellReuseIdentifier: customIdentifier.olderWorkOutCellIdentifier)
        
        showMoreBtn.layer.cornerRadius = 15
        showMoreBtn.layer.borderWidth = 1
        self.showMoreBtn.layer.borderColor = UIColor(red:222/255.0, green:225/255.0, blue:227/255.0, alpha: 1.0).CGColor
        
        self.setObserverForDismissNotificationVC()
    }
    
    @IBAction func goBackToMyWorkout(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func setObserverForDismissNotificationVC() -> Void {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(DidDismissWorkOutDetailVC), name: "DidDismissWorkOutDetailVC", object: nil)
    }
    
    func DidDismissWorkOutDetailVC() -> Void {
        UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: {
            self.WorkOutDetailVC.view.alpha = 0
            }, completion: nil)
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }
    
    //MARK: - TableView Datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRectMake(0, 0, 300, 30))
        headerView.backgroundColor = UIColor.clearColor()
        let label = UILabel(frame: CGRectMake(15, 10, 300, 20))
        label.text = "Upcoming Workout"
        label.font = UIFont(name: "Helvetica Neue", size: 12)
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(customIdentifier.olderWorkOutCellIdentifier, forIndexPath: indexPath) as! OlderWorkoutCell
        cell.backgroundColor = UIColor.clearColor()
        return cell
    }
    
    //MARK: - TableView Delegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.showDetailOfWorkOutAt(indexPath)
    }
    
    //MARK: - Other's
    
    func showDetailOfWorkOutAt(index: NSIndexPath) {
        WorkOutDetailVC = self.storyboard?.instantiateViewControllerWithIdentifier("SessionDetailViewControllerID") as! SessionDetailViewController
        self.addChildViewController(WorkOutDetailVC)
        self.view.addSubview(WorkOutDetailVC.view)
        WorkOutDetailVC.view.alpha = 0
        
        UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: {
            self.WorkOutDetailVC.view.alpha = 1
            }, completion: nil)
        
    }
    
}
