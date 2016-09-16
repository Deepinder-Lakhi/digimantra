//
//  SessionDetailView.swift
//  digimantra
//
//  Created by Vishal on 23/08/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

@IBDesignable class SessionDetailView: UIView {
    
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
        let nib = UINib(nibName:"SessionDetailView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view;
    }

    func setup() {
        view = loadViewFromNib()
        view.frame = bounds
        addSubview(view)
    }

}
