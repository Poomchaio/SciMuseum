//
//  GeneralInfoViewController.swift
//  SciMuseumCU
//
//  Created by Poomchai Taechaprapasrat on 12/10/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import UIKit

class GeneralInfoViewController: UIViewController {
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var information: UILabel!
    
    @IBAction func goToMap(_ sender: Any) {
        //var location = "@13.7375577,100.5305376,19z"
        var location = "Chulalongkorn+University+Museum+of+Natural+History"
        //UIApplication.shared.openURL(URL(string:"https://www.google.com/maps/place/Chulalongkorn+University+Museum+of+Natural+History/@13.7375577,100.5305376,19z")!)
        UIApplication.shared.open(URL(string:"comgooglemaps://?center=\(location),\(location)&zoom=14&views=traffic&q=\(location),\(location)")!, options: [:], completionHandler: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        information.text = "อีเมลล์ติดต่อ\n\n\tcentre.cumnh@gmail.com\n\nเฟสบุค\n\n\twww.facebook.com/CUMZFanpage\n\nเวลาเปิดปิด\n\n\tพิพิธภัณฑสถานธรรมชาติวิทยาฯ เปิดตามเวลาราชการ 09.00-16.00 น.\n\n\tพิพิธภัณฑ์ภาพถ่าย พิพิธภัณฑ์ธรณีวิทยา และพิพิธภัณฑ์พืช โปรดติดต่อเพื่อเข้าชม\n\n\tเข้าชมเป็นหมู่คณะ โปรดติดต่อล่วงหน้าเพื่อจัดเตรียมวิทธยากร\n\nการเดินทาง\n\n\tรถโดยสารประจำทาง สาย 16 21 25 29 34 36 40 50 93 113 163 159 502 529\n\n\tรถไฟฟ้าบีทีเอส โดยลงที่ สถานีสยาม\n\n\tรถไฟฟ้าใต้ดิน โดยลงที่ สถานีสามย่าน\n\nที่จอดรถ\n\n\tโปรดจอดรถได้ที่อาคารจอดรถของจุฬาลงกรณ์มหาวิทยาลัย หรือ จามจุรีสแควร์"
        information.sizeToFit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
