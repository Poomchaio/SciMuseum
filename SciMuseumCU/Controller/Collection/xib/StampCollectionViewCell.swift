//
//  StampCollectionViewCell.swift
//  Bio Museum
//
//  Created by Poomchai Taechaprapasrat on 8/11/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import UIKit

class StampCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        img.layer.cornerRadius = 5
    }

}
