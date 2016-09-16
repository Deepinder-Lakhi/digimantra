//
//  SelectOlderWorkoutViewController.swift
//  digimantra
//
//  Created by DEEPINDERPAL SINGH on 25/08/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class SelectOlderWorkoutViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    var WorkOutDetailVC = SessionDetailViewController()
    
    
    private struct customIdentifier {
        static let olderWorkOutCellID = "selectionOlderCell"
    }
    
    
    @IBOutlet weak var showMoreBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName:customIdentifier.olderWorkOutCellID, bundle: nil), forCellReuseIdentifier: customIdentifier.olderWorkOutCellID)
        
        showMoreBtn.layer.cornerRadius = 15
        showMoreBtn.layer.borderWidth = 1
        self.showMoreBtn.layer.borderColor = UIColor(red:222/255.0, green:225/255.0, blue:227/255.0, alpha: 1.0).CGColor
    }
    
    override func viewDidLayoutSubviews() {
    }

    
    @IBAction func cancelSelection() {
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
        //        let header = UIView() as! GradientHeaderView
        //        header.headerTitleLbl.text = "Older Workout"
    }
    
    //MARK:- TableView Delegate/Datasource
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
        let cell = tableView.dequeueReusableCellWithIdentifier(customIdentifier.olderWorkOutCellID, forIndexPath: indexPath) as! selectionOlderCell
        cell.backgroundColor = UIColor.clearColor()
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.showDetailOfWorkOutAt(indexPath)
    }
    
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
