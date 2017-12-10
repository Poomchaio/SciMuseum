//
//  SpecialExhibitionViewController.swift
//  SciMuseumCU
//
//  Created by Poomchai Taechaprapasrat on 12/10/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import UIKit

class SpecialExhibitionViewController: UIViewController {
    
    
    @IBOutlet weak var header: UILabel!
    
    @IBOutlet weak var information: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        header.text = "เตรียมพบกับการกลับมาของเทศกาลเทียวชมพิพิธภัณฑ์ยามค่ำคืนปีที่สอง กับพิพิธภัณฑสถานธรรมชาติวิทยาแห่งจุฬาลงกรณ์มหาวิทยาลัย และพิพิธภัณฑ์เทคโนโลยีทางภาพและการพิมพ์ เปิดพิพิธภัณฑ์ให้ชมตั้งแต่เวลาเที่ยงวันถึงสี่ทุ่ม ระหว่างวันที่ 15-17 ธันวาคม 2560"
        information.text = "พิพิธภัณฑ์ของเราร่วมกับมิวเซียมสยาม จัดงานเทศกาลเที่ยวชมพิพิธภัณฑ์ยามค่ำ ในงานท่านจะได้พบกับมุมมองใหม่ในการเที่ยวชมตัวอย่างสัตว์กว่า 5,000 ชนิด ทั้งโครงกระดูก สัตว์สตัฟท์ สัตว์ดอง และพิเศษในปีนี้ พิพิธภัณฑ์ภาพถ่ายได้ร่วมกับเราเปิดพิพิธภัณฑ์ยามค่ำเช่นกัน ท่านจะได้พบกับคลังเก็บกล้องทั้งกล้องโบราณสมัยรัชกาลที่ 4 วิวัฒนาการกล้องถ่ายภาพ ตั้งแต่อดีตจนปัจจุบัน จนถึงห้องแลปเทคโนโลยีภาพถ่าย\n\nวันเวลาเปิด\n\n15 ธันวาคม 2560 เวลา 16.00-22.00 น.\n\n16-17 ธันวาคม 2560 เวลา 12.00-22.00 น.\n\nสถานที่: คณะวิทยาศาสตร์\n\nการเดินทาง ท่านสามารถนำรถส่วนตัวเข้ามาจอดได้ในวันเสาร์อาทิตย์\n\nท่านสามารถชมกิจกรรม night at the museum ของมิวเซียมสยามอื่น ๆ ได้โดยคลิ๊กที่ภาพด้านล่างนี้"
        // Do any additional setup after loading the view.
        header.sizeToFit()
        information.sizeToFit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToPage(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        let url = URL(string: "https:www.museumsiam.org/")
        newViewController.request = URLRequest(url: url!)
        navigationController?.pushViewController(newViewController, animated: true)
    }
    
}
