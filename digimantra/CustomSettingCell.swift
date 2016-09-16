//
//  CustomSettingCell.swift
//  digimantra
//
//  Created by DEEPINDERPAL SINGH on 11/08/16.
//  Copyright © 2016 Logiciel solutions. All rights reserved.
//

import UIKit

class CustomSettingCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var headerLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
