//
//  MuseumMapViewController.swift
//  SciMuseumCU
//
//  Created by Poomchai Taechaprapasrat on 12/10/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import UIKit

class MuseumMapViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "map_Museum-1")
        img.frame = CGRect(x: 0, y: 0, width: scrollView.frame.height*1.42, height: UIScreen.main.bounds.height)
        scrollView.contentSize.width = scrollView.frame.height*1.42
        
        scrollView.addSubview(img)
        
    }

    

}
