//
//  ProposalCell.swift
//  digimantra
//
//  Created by DEEPINDERPAL SINGH on 08/09/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class ProposalCell: UITableViewCell {

    @IBOutlet weak var progressLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        progressLbl.layer.cornerRadius = 20
        progressLbl.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
