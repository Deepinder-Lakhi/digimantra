//
//  ManageProfileViewController.swift
//  digimantra
//
//  Created by DEEPINDERPAL SINGH on 12/09/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class ManageProfileViewController: UIViewController {

    var textField = KUTextViewEffect()
    
    @IBOutlet weak var manageBgShape: UIView!
    
    private struct customIdentifier {
        static let EditAddressCellIdentifier = "AddressCell"
    }
    
    func addressPlaceHolderArray() -> NSMutableArray {
        return ["Full Name", "Primary Address", "Email", "Phone", "Date of Birth", "About me"]
    }
    
    @IBAction func backButtonAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLayoutSubviews() {
        manageBgShape.layer.mask = self.setNewShape(manageBgShape.bounds);
        manageBgShape.clipsToBounds = true
    }
    
    func setNewShape(screenSize: CGRect) -> CAShapeLayer {
        let mask = CAShapeLayer()
        mask.frame = CGRect(x: screenSize.origin.x
            , y: screenSize.origin.x, width: screenSize.size.width, height: screenSize.size.width)
        let width = screenSize.width
        let height = mask.frame.size.height
        
        let path = CGPathCreateMutable()
        
        CGPathMoveToPoint(path, nil, 0, 0)
        
        CGPathAddLineToPoint(path, nil, 0, height)
        CGPathAddLineToPoint(path, nil, width, height - 100)
        CGPathAddLineToPoint(path, nil, width, 0)
        
        mask.path = path
        return mask
    }

    
    //MARK: - TableView Datasource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressPlaceHolderArray().count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(customIdentifier.EditAddressCellIdentifier, forIndexPath: indexPath) as! AddressCell
        cell.backgroundColor = UIColor.clearColor()
        
        cell.addressTextField.placeholder = addressPlaceHolderArray()[indexPath.row] as? String
        
        return cell
    }
    
    //MARK: - TableView Delegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
}
