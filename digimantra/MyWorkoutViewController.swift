//
//  MyWorkoutViewController.swift
//  digimantra
//
//  Created by Vishal on 23/08/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class MyWorkoutViewController: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var myWorkoutScrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        self.setupWorkoutFormView()
    }
    
    func setupWorkoutFormView() {
        //Adding ScrollView to controller
        
        let scrollWidth = CGFloat(myWorkoutScrollView.frame.size.width) as CGFloat
        let scrollHeight = CGFloat(myWorkoutScrollView.frame.size.height) as CGFloat

        myWorkoutScrollView.contentSize = CGSizeMake(scrollWidth * 3, scrollHeight)
        myWorkoutScrollView.pagingEnabled = true
        myWorkoutScrollView.scrollEnabled = true
        myWorkoutScrollView.bounces = false
        myWorkoutScrollView.delegate = self
        myWorkoutScrollView.showsHorizontalScrollIndicator = false
        myWorkoutScrollView.showsVerticalScrollIndicator = false
        myWorkoutScrollView.backgroundColor = UIColor.clearColor()
        
        for  i in 0...2 {
            //Getting New geometry
            var val = CGFloat(i) * scrollWidth as CGFloat
            val += 5
            
            let workoutDetailView : UIView = UIView(frame: CGRect(x: val, y: 0, width: scrollWidth - 10, height: myWorkoutScrollView.frame.size.height))
            print(workoutDetailView.bounds)
            workoutDetailView.clipsToBounds = true
            workoutDetailView.layer.cornerRadius = 5
            
            //Adding Detail view programmatically
            let WorkOutDetailVC = self.storyboard?.instantiateViewControllerWithIdentifier("WorkOutDetailViewControllerID") as! WorkOutDetailViewController
            WorkOutDetailVC.updateNewFrame(workoutDetailView.bounds)
            self.addChildViewController(WorkOutDetailVC)
            workoutDetailView.addSubview(WorkOutDetailVC.view)
            WorkOutDetailVC.view.alpha = 1
            myWorkoutScrollView.addSubview(workoutDetailView)
        }
        pageController.addTarget(self, action: #selector(self.changePage(_:)), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        self.pageController.numberOfPages = 3
        self.pageController.currentPage = 0
        self.pageController.tintColor = UIColor.redColor()
        self.pageController.pageIndicatorTintColor = UIColor.blackColor()
        self.pageController.currentPageIndicatorTintColor = UIColor.greenColor()
        self.view.addSubview(pageController)
        
    }
    
    // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageController.currentPage) * myWorkoutScrollView.frame.size.width
        myWorkoutScrollView.setContentOffset(CGPointMake(x, 0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageController.currentPage = Int(pageNumber)
    }

    
    /*
 
 func setupWorkoutFormView() {
 //Adding ScrollView to controller
 
 let scrollWidth = CGFloat(myWorkoutScrollView.frame.size.width) as CGFloat
 let scrollHeight = CGFloat(myWorkoutScrollView.frame.size.height) as CGFloat
 
 myWorkoutScrollView.contentSize = CGSizeMake(scrollWidth * 3, scrollHeight)
 myWorkoutScrollView.pagingEnabled = true
 myWorkoutScrollView.scrollEnabled = true
 myWorkoutScrollView.bounces = false
 myWorkoutScrollView.delegate = self
 myWorkoutScrollView.showsHorizontalScrollIndicator = false
 myWorkoutScrollView.showsVerticalScrollIndicator = false
 myWorkoutScrollView.backgroundColor = UIColor.clearColor()
 
 for  i in 0...2 {
 //Getting New geometry
 var val = CGFloat(i) * scrollWidth as CGFloat
 val += 5
 
 let workoutDetailView : UIView = UIView(frame: CGRect(x: val, y: 0, width: scrollWidth - 10, height: myWorkoutScrollView.frame.size.height))
 print(workoutDetailView.frame)
 workoutDetailView.clipsToBounds = true
 workoutDetailView.layer.cornerRadius = 5
 workoutDetailView.backgroundColor = UIColor.whiteColor()
 
 //Adding Detail view programmatically
 //            let WorkOutDetailVC = self.storyboard?.instantiateViewControllerWithIdentifier("WorkOutDetailViewControllerID") as! WorkOutDetailViewController
 let WorkOutDetailVC = self.storyboard?.instantiateViewControllerWithIdentifier("WorkOutDetailViewControllerID")
 as! WorkOutDetailViewController
 
 
 let x = UIScrollView(frame: CGRect(x: -10, y: 0, width: workoutDetailView.frame.size.width, height: workoutDetailView.frame.size.height))
 
 x.contentSize = CGSizeMake(workoutDetailView.frame.size.width, WorkOutDetailVC.view.frame.size.height);
 
 x.scrollEnabled = true
 x.userInteractionEnabled = true
 
 self.addChildViewController(WorkOutDetailVC)
 //            WorkOutDetailVC.view.frame = workoutDetailView.frame
 x.addSubview(WorkOutDetailVC.view)
 workoutDetailView.addSubview(x)
 WorkOutDetailVC.view.alpha = 1
 myWorkoutScrollView.addSubview(workoutDetailView)
 myWorkoutScrollView.delegate = self
 x.delegate = self
 
 }
 }
 */
}
