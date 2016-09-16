//
//  WorkOutDetailViewController.swift
//  digimantra
//
//  Created by DEEPINDERPAL SINGH on 30/08/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class WorkOutDetailViewController: UIViewController {

    @IBOutlet weak var containerWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var containerHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var containerTrailingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var myCustomView: UIView!
    
    var viewFrames = CGRect()
    
    var WorkOutFinancialVC = WorkoutFinancialViewController()
    
    func updateNewFrame(frame:CGRect) {
        viewFrames = frame
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setObserverForDismissNotificationVC()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view.backgroundColor = UIColor.whiteColor()
        containerTrailingConstraint.constant = 26
        containerWidthConstraint.constant = viewFrames.size.width
        containerHeightConstraint.constant = viewFrames.size.height
        myCustomView.backgroundColor = UIColor.clearColor()
    }
    
    @IBAction func loadFinancialView() {
        //Adding Detail view programmatically
        WorkOutFinancialVC = self.storyboard?.instantiateViewControllerWithIdentifier("WorkoutFinancialViewControllerID") as! WorkoutFinancialViewController
        WorkOutFinancialVC.updateNewFrame(viewFrames)
        WorkOutFinancialVC.loadViewForFristTime = true
        self.addChildViewController(WorkOutFinancialVC)
        self.view.addSubview(WorkOutFinancialVC.view)
        WorkOutFinancialVC.view.alpha = 1
        
        UIView.transitionFromView(self.view, toView: WorkOutFinancialVC.view, duration: 1.0, options:UIViewAnimationOptions.TransitionFlipFromLeft,
            completion: nil)
        
    }
    
    func setObserverForDismissNotificationVC() -> Void {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(DidDismissWorkOutFinancailVC), name: "DidDismissWorkOutFinancailVC", object: nil)
    }
    
    func DidDismissWorkOutFinancailVC() -> Void {
        
        UIView.transitionFromView(WorkOutFinancialVC.view, toView: self.view, duration: 1.0, options:UIViewAnimationOptions.TransitionFlipFromLeft,
                                  completion: nil)
    }
    
    @IBAction func closeFinancialVC(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("DidDismissWorkOutDetailVC", object: nil)
    }
    
}
