//
//  CollectionTableCell.swift
//  Bio Museum
//
//  Created by Poomchai Taechaprapasrat on 8/10/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import UIKit
import LinearProgressBar

class CollectionTableCell: UITableViewCell {

   
    @IBOutlet weak var progressBar: LinearProgressView!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var progressBarLabel: UILabel!
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
