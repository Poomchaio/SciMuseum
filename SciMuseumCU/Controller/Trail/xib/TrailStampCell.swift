//
//  trailStampCell.swift
//  Bio Museum
//
//  Created by Poomchai Taechaprapasrat on 8/31/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import UIKit

class TrailStampCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        img.layer.cornerRadius = 5.0
    }
}
