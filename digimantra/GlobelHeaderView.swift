//
//  GlobelHeaderView.swift
//  digimantra
//
//  Created by DEEPINDERPAL SINGH on 24/08/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class GlobelHeaderView: UIView {
    
    var view: UIView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup()
    {
        let screenSize = UIScreen.mainScreen().bounds

        let viewSize: CGRect = CGRectMake(0, 0, screenSize.width, 100)
            
        view.frame = viewSize
        
        view.backgroundColor = UIColor.redColor()
        
        view.layer.insertSublayer(self.setGradientLayer(viewSize), atIndex:0)
        self.addSubview(view)
    }
    
    func setGradientLayer(screenSize: CGRect) -> CAGradientLayer {
        let leftColor = UIColor(red: 60/255, green: 0/255, blue: 156/255, alpha: 1);
        let rightColor = UIColor(red: 155/255, green: 44/255, blue: 115/255, alpha: 1);
        
        let gradientColors:[CGColor] = [leftColor.CGColor, rightColor.CGColor]
        let gradientLocations:[Float] = [0.25 , 0.75]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        gradientLayer.frame = screenSize
        
        gradientLayer.startPoint = CGPointMake(0,0.5)
        gradientLayer.endPoint = CGPointMake(1,0.5)
        
        return gradientLayer
    }
}
