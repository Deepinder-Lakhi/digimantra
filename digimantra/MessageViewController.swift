//
//  MessageViewController.swift
//  digimantra
//
//  Created by DEEPINDERPAL SINGH on 19/08/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    var bgImage = UIImage()
    @IBOutlet weak var backGroundImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    private struct customIdentifier {
        static let cellClassIdentifier = "MessageCell"
        static let cellReuseIdentifier = "MessageCell"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setting up BackGround Image
        backGroundImage.image = bgImage
        
        //Loading Table View
        tableView.registerNib(UINib(nibName:customIdentifier.cellClassIdentifier, bundle: nil), forCellReuseIdentifier: customIdentifier.cellReuseIdentifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140;
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBarHidden = true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(false)
    }
    
    //MARk :- TableView DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(customIdentifier.cellReuseIdentifier, forIndexPath: indexPath) as! MessageCell
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 290;
    }
    
    //MARk :- TableView Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }

}
