//
//  NewPayMethodViewController.swift
//  digimantra
//
//  Created by Vishal Deep on 13/09/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class NewPayMethodViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backButtonAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    private struct customIdentifier {
        static let NewPaymentMethodCellIdentifier = "NewPaymentMethodCell"
    }
    
    func paymentInfoArray() -> NSMutableArray {
        return ["Mode", "Credit Card number", "Expiry", "Give this payment method a friendly name (optional)"]
    }
    func billingAddressArray() -> NSMutableArray {
        return ["Address 1", "Address 2", "City", "State", "Zip"]
    }
    //MARK: - TableView Datasource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if (section == 0)
//        {
//            return 0
//        } else {
//            return 30
//        }
        return 0
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        if (section == 1) {
            headerView.frame = CGRectMake(0, 30, 300, 30)
            headerView.backgroundColor = UIColor.clearColor()
            let label = UILabel(frame: CGRectMake(15, 0, 300, 30))
            label.text = "Billing Address"
            label.textColor = UIColor.blackColor()
            label.font = UIFont(name: "Helvetica Neue-Bold", size: 12)
            headerView.addSubview(label)

        }

        return headerView
    }

    
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if (section == 1) {
//            return "Billing Address"
//        }
//        return ""
//    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (section==0)
        {
            return paymentInfoArray().count
        }
        else{
            return billingAddressArray().count
        }
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(customIdentifier.NewPaymentMethodCellIdentifier, forIndexPath: indexPath) as! NewPaymentMethodCell
        cell.backgroundColor = UIColor.clearColor()
        
         if (indexPath.section == 0)
        {
            cell.payMethodInfotxtField.placeholder = paymentInfoArray()[indexPath.row] as? String
        }
        else{
            cell.payMethodInfotxtField.placeholder = billingAddressArray()[indexPath.row] as? String
        }
        
        return cell
    }
    
    //MARK: - TableView Delegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60;
    }
}
