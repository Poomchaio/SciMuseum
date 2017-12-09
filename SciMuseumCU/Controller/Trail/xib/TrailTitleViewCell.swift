//
//  TrailTitleViewCell.swift
//  Bio Museum
//
//  Created by Poomchai Taechaprapasrat on 8/31/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import UIKit

class TrailTitleViewCell: UICollectionViewCell {

    @IBOutlet weak var questDescription: UILabel!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        questDescription.sizeToFit()
    }
    

}
