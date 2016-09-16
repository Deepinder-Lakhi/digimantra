//
//  BlockListViewController.swift
//  digimantra
//
//  Created by Vishal on 12/09/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class BlockListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    private struct customIdentifier {
        static let cellClassIdentifier = "BlockListCell"
        static let cellReuseIdentifier = "BlockListCell"
    }
    
    @IBAction func backButtonAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Loading Table View
        tableView.registerNib(UINib(nibName:customIdentifier.cellClassIdentifier, bundle: nil), forCellReuseIdentifier: customIdentifier.cellReuseIdentifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140;
        //border radious of segment controller
        segmentController.layer.cornerRadius = 5;
    }
    
    @IBAction func segmentChanged(segcon: UISegmentedControl){
        self.tableView.reloadData()
    }
    
    //MARk :- TableView DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(customIdentifier.cellReuseIdentifier, forIndexPath: indexPath) as! BlockListCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        // even and odd number background color condition
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.whiteColor()
        }else{
          cell.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1.0)
        }
        // changing the image on selected segment controller
        switch segmentController.selectedSegmentIndex {
            case 0:
                cell.coachesImg.image = UIImage(named:"Coaches")
                cell.coachesName.text = "Sam Whitbread"
                cell.coachesCity.text = "Culver City"
                cell.coachesDate.text = "Blocked on June 23,2016"
                break;
            case 1:
                cell.coachesImg.image = UIImage(named:"Places")
                cell.coachesName.text = "Gold's Gym"
                cell.coachesCity.text = "venice,CA"
                cell.coachesDate.text = "Blocked on June 23,2016"
                break;
            default:
                break;
        }
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 140;
    }
    
    //MARk :- TableView Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}
