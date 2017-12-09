//
//  TotalTableViewCell.swift
//  Bio Museum
//
//  Created by Poomchai Taechaprapasrat on 11/10/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import UIKit
import LinearProgressBar
class TotalTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var totalProgressBar: LinearProgressView!
    @IBOutlet weak var totalLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
