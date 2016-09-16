//
//  SavedAddressCell.swift
//  digimantra
//
//  Created by Vishal Deep on 12/09/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class SavedAddressCell: UITableViewCell {

    @IBOutlet var addressHeading: UILabel!    
    @IBOutlet var addressContent: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
