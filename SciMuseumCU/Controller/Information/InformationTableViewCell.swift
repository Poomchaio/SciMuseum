//
//  InformationTableViewCell.swift
//  Bio Museum
//
//  Created by Poomchai Taechaprapasrat on 11/20/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import UIKit

class InformationTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var reference: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        content.sizeToFit()
//        reference.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
