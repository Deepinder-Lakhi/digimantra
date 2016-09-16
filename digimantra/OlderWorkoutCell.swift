//
//  OlderWorkoutCell.swift
//  digimantra
//
//  Created by Vishal on 22/08/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class OlderWorkoutCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.bgView.layer.cornerRadius = 5
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOpacity = 0.7
        self.layer.shadowOffset = CGSizeZero
        self.layer.shadowRadius = 10
        self.backgroundColor = UIColor .clearColor()
        self.selectionStyle = UITableViewCellSelectionStyle.None
    }
    
}
