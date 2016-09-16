//
//  ViewController.swift
//  digimantra
//
//  Created by DEEPINDERPAL SINGH on 11/08/16.
//  Copyright © 2016 Logiciel solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var bgImage = UIImage()
    var notificationVC = NotificationViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setObserverForDismissNotificationVC()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        bgImage = self.screenShotMethod()
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }

    @IBAction func showNotifications(sender: AnyObject) {
        notificationVC = self.storyboard?.instantiateViewControllerWithIdentifier("NotificationViewControllerID") as! NotificationViewController
        self.addChildViewController(notificationVC)
        self.view.addSubview(notificationVC.view)
        notificationVC.view.alpha = 0
        
        notificationVC.bgImage = bgImage
        
        UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: {
            self.notificationVC.view.alpha = 1
            }, completion: nil)
        
    }
    
    func screenShotMethod() -> UIImage{
        //Create the UIImage
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //Save it to the camera roll
        //    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        return image
    }

    
    
    // MARK: - Handle Observer
//    ///*** To Dismiss view that was added on Self
//    -(void)setObserverForDismissLogin {
//    [[NSNotificationCenter defaultCenter] addObserver:self
//    selector:@selector(didDismissLogin)
//    name:@"didDismissLogin"
//    object:nil];
//    }
    
    func DidDismissNotificationVC() -> Void {
        UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: {
            self.notificationVC.view.alpha = 0
            self.bgImage = self.screenShotMethod()
            }, completion: nil)
    }
    
    func setObserverForDismissNotificationVC() -> Void {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(DidDismissNotificationVC), name: "DidDismissNotificationVC", object: nil)
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
