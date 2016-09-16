//
//  GradientView.swift
//  digimantra
//
//  Created by DEEPINDERPAL SINGH on 11/08/16.
//  Copyright © 2016 Logiciel solutions. All rights reserved.
//

import UIKit

@IBDesignable class GradientHeaderView: UIView {
    
    var view: UIView!
    
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "GradientHeaderView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view;
    }

    func setup()
    {
        view = loadViewFromNib()
        
        view.frame = bounds
        
        view.backgroundColor = UIColor.whiteColor()
        
        view.clipsToBounds = true
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        view.layer.insertSublayer(self.setGradientLayer(screenSize), atIndex:0)
        view.layer.mask = self.setNewShape(screenSize);
        addSubview(view)
    }
    
    func setGradientLayer(screenSize: CGRect) -> CAGradientLayer {
        //Purple color
        let leftColor = UIColor(red: 60/255, green: 0/255, blue: 156/255, alpha: 1);
        //Pink color
        let rightColor = UIColor(red: 155/255, green: 44/255, blue: 115/255, alpha: 1);
        
        let gradientColors:[CGColor] = [leftColor.CGColor, rightColor.CGColor]
        let gradientLocations:[Float] = [0.25 , 0.75]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        gradientLayer.frame = CGRect(x: screenSize.origin.x
            , y: screenSize.origin.x, width: screenSize.size.width, height: 100)
        
        gradientLayer.startPoint = CGPointMake(0,0.5)
        gradientLayer.endPoint = CGPointMake(1,0.5)
        
        return gradientLayer
    }
    
    func setNewShape(screenSize: CGRect) -> CAShapeLayer {
        let mask = CAShapeLayer()
        mask.frame = CGRect(x: screenSize.origin.x
            , y: screenSize.origin.x, width: screenSize.size.width, height: 100)
        let width = screenSize.width
        let height = mask.frame.size.height
        
        let path = CGPathCreateMutable()
        
        CGPathMoveToPoint(path, nil, 0, 0)
        CGPathAddLineToPoint(path, nil, 0, height)
        CGPathAddLineToPoint(path, nil, width, 64)
        CGPathAddLineToPoint(path, nil, width, 0)
        
        mask.path = path
        return mask
    }
    
    
}
