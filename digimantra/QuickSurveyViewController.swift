//
//  QuickSurveyViewController.swift
//  digimantra
//
//  Created by DEEPINDERPAL SINGH on 07/09/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class QuickSurveyViewController: UIViewController {

    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var newShapeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        bgView.layer.cornerRadius = 10
        bgView.clipsToBounds = true
        print(newShapeView.bounds);
        newShapeView.layer.mask = self.setNewShape(newShapeView.bounds);
    }
    
    func setNewShape(screenSize: CGRect) -> CAShapeLayer {
        let mask = CAShapeLayer()
        mask.frame = CGRect(x: screenSize.origin.x
            , y: screenSize.origin.x, width: screenSize.size.width, height: screenSize.size.width)
        let width = screenSize.width
        let height = mask.frame.size.height
        
        let path = CGPathCreateMutable()
        
        CGPathMoveToPoint(path, nil, 0, 0)
        
//        CGPathAddLineToPoint(path, nil, 40, height)
        CGPathAddLineToPoint(path, nil, 0, height)
        CGPathAddLineToPoint(path, nil, width, height - 100)
        CGPathAddLineToPoint(path, nil, width, 0)
        
        mask.path = path
        return mask
    }


}
