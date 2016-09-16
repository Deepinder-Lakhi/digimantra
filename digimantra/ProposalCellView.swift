//
//  ProposalCellView.swift
//  digimantra
//
//  Created by DEEPINDERPAL SINGH on 07/09/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class ProposalCellView: UIView {

    var view: UIView = UIView()
    
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
        let nib = UINib(nibName: "ProposalCellView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view;
    }
    
    func setup()
    {
        view = loadViewFromNib()
        
        self.addSubview(view)
    }


}
