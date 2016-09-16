//
//  ReportIssueViewController.swift
//  digimantra
//
//  Created by Vishal on 19/08/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class ReportIssueViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var textViews: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textViews.becomeFirstResponder()
        addToolBar(textViews)
        resizingtextview()
    }
    // Adjusting the UITextview when keyboard appear
    func resizingtextview() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            self.view.frame.origin.y -= keyboardSize.height
        }
    }
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            self.view.frame.origin.y += keyboardSize.height
        }
    }
    
    //    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange,replacemenText text: String) -> Bool {
    //        if text == "\n" {
    //            textViews.resignFirstResponder()
    //            return false
    //        }
    //        textViews.resignFirstResponder()
    //        return true
    //    }
    //
    //    func textViewShouldReturn(textView: UITextView!) -> Bool {
    //        self.view.endEditing(true);
    //        return true;
    //    }
    
    // This is for disappearing the keyboard touching anywhere on the screen
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        textViews.resignFirstResponder()
    }
    
    // this Function  for adding the toolbar on keyboard with Done and  Cancel Buttons
    func addToolBar(textView: UITextView) {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        toolBar.tintColor = UIColor(red: 31/255, green: 153/255, blue: 155/255, alpha: 1)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: #selector(self.donePressed))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(self.cancelPressed))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        toolBar.sizeToFit()
        
        textView.delegate = self
        textView.inputAccessoryView = toolBar
    }
    func donePressed() {
        view.endEditing(true)
    }
    func cancelPressed() {
        view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}