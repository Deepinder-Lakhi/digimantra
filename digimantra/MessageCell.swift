//
//  MessageCell.swift
//  digimantra
//
//  Created by DEEPINDERPAL SINGH on 19/08/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var customAccesoryView: UIView!
    
    var cellUpdate:UITableViewCell? {
        didSet {
            //            updateCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor .clearColor()
        self.bgView.layer.cornerRadius = 5
        self.customAccesoryView.layer.cornerRadius = 5
        self.bgView = self.getShadowView(self.bgView)
        self.customAccesoryView = self.getShadowView(self.customAccesoryView)
        self.bringSubviewToFront(bgView)
        self.selectionStyle = UITableViewCellSelectionStyle.None
        // Initialization code
    }
    
    func getShadowView(view:UIView) -> UIView{
        view.layer.shadowColor = UIColor.blackColor().CGColor
        view.layer.shadowOpacity = 0.7
        view.layer.shadowOffset = CGSizeZero
        view.layer.shadowRadius = 5
        return view
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
