//
//  PayMethodsCell.swift
//  digimantra
//
//  Created by Vishal Deep on 12/09/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class PayMethodsCell: UITableViewCell {

    @IBOutlet var cardInfoLbl: UILabel!
    @IBOutlet var defaultLbl: UILabel!
    @IBOutlet var paymentCardPic: UIImageView!
    @IBOutlet var cardOwnerName: UILabel!
    @IBOutlet var cardNumber: UILabel!
    @IBOutlet var cardExpiryDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
