//
//  CarouselViewCell.swift
//  Bio Museum
//
//  Created by Poomchai Taechaprapasrat on 11/12/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import UIKit
class CarouselViewCell: UITableViewCell {

   
    @IBOutlet weak var carousel: UIScrollView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        carousel.auk.settings.contentMode = .scaleAspectFill
       

    }
    
  
    
    
}


