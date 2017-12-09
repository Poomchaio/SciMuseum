//
//  TrailTableViewCell.swift
//  Bio Museum
//
//  Created by Poomchai Taechaprapasrat on 8/12/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import UIKit

class TrailTableViewCell: UITableViewCell {

    @IBOutlet weak var background: UIView!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

