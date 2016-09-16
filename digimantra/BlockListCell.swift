//
//  BlockListCell.swift
//  digimantra
//
//  Created by Vishal on 12/09/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class BlockListCell: UITableViewCell {
    
    @IBOutlet weak var coachesImg: UIImageView!
    @IBOutlet weak var coachesName: UILabel!
    @IBOutlet weak var coachesCity: UILabel!
    @IBOutlet weak var coachesDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
