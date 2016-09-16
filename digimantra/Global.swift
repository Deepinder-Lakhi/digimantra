//
//  Global.swift
//  VideoGoTele
//
//  Created by Gurjit Singh on 2016-08-26.
//  Copyright © 2016 Gurjit Singh Ghangura. All rights reserved.
//

import Foundation
import UIKit

class Global: NSObject {
    class var sharedInstance: Global {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: Global? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = Global()
        }
        return Static.instance!
    }
    
    func setGradientLayer(screenSize: CGRect) -> CAGradientLayer {
        let leftColor = UIColor(red: 60/255, green: 0/255, blue: 156/255, alpha: 1);
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
    
}
