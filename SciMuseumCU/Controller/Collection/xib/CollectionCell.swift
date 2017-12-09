//
//  CollectionCell.swift
//  Bio Museum
//
//  Created by Poomchai Taechaprapasrat on 8/12/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import UIKit
import LinearProgressBar

class CollectionCell: UICollectionViewCell {
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var progressBar: LinearProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.background.layer.cornerRadius = 10
    }
    

}
