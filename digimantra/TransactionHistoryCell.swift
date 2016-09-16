//
//  TransactionHistoryCell.swift
//  digimantra
//
//  Created by Vishal Deep on 16/09/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class TransactionHistoryCell: UITableViewCell {

    @IBOutlet var chargesLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var cardEndingLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clearColor()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
