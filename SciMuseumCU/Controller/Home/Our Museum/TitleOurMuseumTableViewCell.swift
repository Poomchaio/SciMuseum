//
//  TitleOurMuseumTableViewCell.swift
//  SciMuseumCU
//
//  Created by Poomchai Taechaprapasrat on 12/10/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import UIKit

class TitleOurMuseumTableViewCell: UITableViewCell {

    
    @IBOutlet weak var information: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
