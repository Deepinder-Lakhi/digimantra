//
//  EditAddressViewController.swift
//  digimantra
//
//  Created by DEEPINDERPAL SINGH on 12/09/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class AddAdressViewController: UIViewController, UITextFieldDelegate{
    
    var isEditingRequired = Bool()
    
    var textField = KUTextViewEffect()
    
    @IBOutlet weak var headeLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if  isEditingRequired == true {
            headeLbl.text = "Edit Address"
        }
        
    }
    
    @IBAction func backButtonAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    func addToolBar(textField: UITextField){
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        toolBar.tintColor = UIColor(red: 155/255, green: 44/255, blue: 115/255, alpha: 1)
        let spaceButtonLeft = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Cancel Edits", style: UIBarButtonItemStyle.Done, target: self, action: #selector(AddAdressViewController.donePressed))
        let spaceButtonRight = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButtonLeft, doneButton , spaceButtonRight], animated: false)
        toolBar.userInteractionEnabled = true
        toolBar.sizeToFit()
        
        textField.delegate = self
        textField.inputAccessoryView = toolBar
    }
    func donePressed(){
        view.endEditing(true)
    }
    

    private struct customIdentifier {
        static let EditAddressCellIdentifier = "AddressCell"
    }
    
    func addressPlaceHolderArray() -> NSMutableArray {
        return ["Address 1", "Address 2", "City", "State", "Zip"]
    }
    
    
    //MARK: - TextField Delegates
    
    func textFieldDidBeginEditing(textField: UITextField) {    //delegate method
        addToolBar(textField)
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {  //delegate method
        return false
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        
        return true
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
