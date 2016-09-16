//
//  refineListCell.swift
//  digimantra
//
//  Created by Vishal Deep on 07/09/16.
//  Copyright © 2016 Diamonds Infosys Pvt Ltd. All rights reserved.
//

import UIKit

class refineListCell: UITableViewCell {
    
    @IBOutlet var radioBtnOutlet: UIButton!
    @IBOutlet var LblText: UILabel!
    
    @IBAction func radioButton(sender: UIButton) {
        if let image = UIImage(named:"checked-radioBtn.png") {
            sender.setImage(image, forState: .Normal)
        }
}
    

   
}
