//
//  AddToBlokListViewController.swift
//  digimantra
//
//  Created by Vishal on 12/09/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class AddToBlokListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var segmentController: UISegmentedControl!

    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var textfieldView: UIView!
    
    var statusArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //border radious of segment controller
        searchField.layer.cornerRadius = 8;
        //Adding the  padding in text field
        let paddingView : UIView = UIView(frame: CGRectMake(0, 0, 10, 10))
        searchField.leftView = paddingView
        searchField.leftViewMode = UITextFieldViewMode.Always
        textfieldView.layer.cornerRadius = 10;
        statusArray = createSelectedStatusArray(5)
        segmentController.layer.cornerRadius = 5;

    }
    
    @IBAction func backButtonAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    private struct customIdentifier {
        static let AddToBlokListCellIdentifier = "AddToBlokListCellIdentifier"
    }
    
    //MARK:- TableView Delegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func createSelectedStatusArray(count:NSInteger) -> NSMutableArray {
        let statusArray = NSMutableArray()
        for _ in 1...count {
            statusArray.addObject("0")
        }
        return statusArray
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(customIdentifier.AddToBlokListCellIdentifier, forIndexPath: indexPath) as!AddToBlockCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        let status:NSInteger = getStatusFor(indexPath)
        if status == 0 {
            cell.backgroundColor = UIColor.clearColor()
          cell.radioImg.image = UIImage(named: "radio-btn-unchecked")
            
        } else {
            cell.backgroundColor = UIColor(red: 253/255, green: 228/255, blue: 231/255, alpha:1)
            cell.radioImg.image = UIImage(named: "red-mark-icon")
        }
        return cell
    }
    
    func getStatusFor(index:NSIndexPath) -> NSInteger {
        var status = NSInteger()
        status = statusArray[index.row].integerValue
        return status
    }
    
    //MARk :- TableView Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let status:NSInteger = getStatusFor(indexPath)
        if status == 0 {
            statusArray.replaceObjectAtIndex(indexPath.row, withObject: "1")
        } else {
            statusArray.replaceObjectAtIndex(indexPath.row, withObject: "0")
        }
        tableView.beginUpdates()
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
        tableView.endUpdates()
    }
    
}
