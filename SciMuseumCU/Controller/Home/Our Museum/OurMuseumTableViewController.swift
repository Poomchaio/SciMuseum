//
//  OurMuseumTableViewController.swift
//  SciMuseumCU
//
//  Created by Poomchai Taechaprapasrat on 12/10/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import UIKit

class OurMuseumTableViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    let pic = [#imageLiteral(resourceName: "ourMuseum"),#imageLiteral(resourceName: "ourmuseum1"),#imageLiteral(resourceName: "ourmuseum2"),#imageLiteral(resourceName: "ourmuseum3"),#imageLiteral(resourceName: "ourmuseum4")]
    let cellIdentifier = "OurMuseumTableViewCell"
    let cellTitle = "TitleOurMuseumTableViewCell"
    var name: [String] = ["","พิพิธภัณฑสถานธรรมชาติวิทยา","พิพิธภัณฑ์เทคโนโลยีทางภาพ","พิพิธภัณฑ์พืช ศาสตราจารย์กสิน สุวตะพันธุ์","พิพิธภัณฑสถานธรณีวิทยา"]
    var information:[String] = ["พิพิธภัณฑ์ในคณะวิทยาศาสตร์ จุฬาลงกรณ์มหาวิทยาลัย ประกอบด้วย","พิพิธภัณฑ์แห่งนี้อยู่ภายใต้การดูแลของภาควิชาชีววิทยา คณะวิทยาศาสตร์ ตั้งอยู่ ณ ตึก ชีววิทยา ๑ ชั้น ๒ มีวัตถุประสงค์เพื่อรวบรวมตัวอย่างสิ่งมีชีวิตและทรัพยากรธรรมชาติที่สะสมมาแต่เดิมรวมทั้งที่มีการวิจัยและค้นพบใหม่เพื่อเป็นแหล่งค้นคว้าอ้างอิงทางวิชาการและการอนุรักษ์ ภายในพิพิธภัณฑ์จัดแสดงตัวอย่าง สิ่งมีชีวิตและทรัพยากรธรรมชาติ อาทิ โครงกระดูกของสิ่งมีชีวิต ตัวอย่างเปลือกหอยต่างๆ ของไทย ซากดึกดำบรรพ์ที่พบในประเทศไทย ชีววิทยาของผึ้ง ตัวอย่างปลาในวรรณคดี ตัวอย่างตะพาบ ม่านลาย ซึ่งพบในประเทศไทยแห่งเดียวในโลกเป็นต้น นับว่าเป็นพิพิธภัณฑ์ทางธรรมชาติแห่งแรกของประเทศไทย","ตั้งอยู่ ณ ตึกพิพิธภัณฑ์เทคโนโลยีทางภาพ ภาควิชาวิทยาศาสตร์ทางภาพถ่ายและเทคโนโลยีทางการพิมพ์ คณะวิทยาศาสตร์ เริ่มดำเนินการสร้างอาคารตั้งแต่ปลาย ปี พ.ศ.๒๕๓๑ ต่อมา สมเด็จพระเทพรัตนราชสุดาฯ สยามบรมราชกุมารี เสด็จเปิดอย่างเป็นทางการเมื่อวันที่ ๑๙ กรกฎาคม พ.ศ.๒๕๓๔ ภายในพิพิธภัณฑ์จัดแสดงวิวัฒนาการของกล้องถ่ายภาพอุปกรณ์การถ่ายภาพต่างๆ และภาพถ่ายตั้งแต่อดีตถึงปัจจุบันรวมทั้งวิวัฒนาการความก้าวหน้าด้านเทคโนโลยีการพิมพ์และวัตถุพิมพ์ ถือเป็นพิพิธภัณฑ์แห่งแรกของประเทศไทยที่จัดแสดงกล้องถ่ายภาพภาพถ่ายสีเชิงศิลปะ วิทยาศาสตร์การพิมพ์และเทคโนโลยีทางภาพฯ อื่นๆ เป็นการเฉพาะและครบวงจร","ตั้งอยู่ ณ ตึกพฤกษศาสตร์ชั้น ๔ ภาควิชาพฤกษศาสตร์คณะวิทยาศาสตร์ จัดตั้งเมื่อ พ.ศ.๒๕๒๕ เพื่อเป็นที่ระลึกถึงศาสตราจารย์กสิน สุวตะพันธุ์ ผู้เชี่ยวชาญด้านอนุกรมวิธานพืช มีวัตถุประสงค์ที่จะเป็นแหล่งข้อมูลต่างๆ เกี่ยวกับพืชเพื่อใช้เป็นฐานข้อมูลเกี่ยวกับพืชของประเทศไทยรวมทั้งเป็นสถานที่ปฏิบัติงานวิจัยของนิสิตและคณาจารย์ในภาควิชา นอกจากการจัดให้มีนิทรรศการประจำในห้องนิทรรศการเพื่อให้ความรู้เกี่ยวกับความหลากหลายของพืชแล้ว ยังมีการจัดนิทรรศการหมุนเวียนเพื่อนำเสนอความรู้เกี่ยวกับพืชในแง่มุมซึ่งกำลังเป็นที่สนใจและเหมาะสมกับเหตุการณ์ด้วย","พิพิธภัณฑสถานธรณีวิทยา ตั้งอยู่ ณ ตึกธรณีวิทยา ชั้นล่างภาควิชาธรณีวิทยา คณะวิทยาศาสตร์ ก่อตั้งขึ้นพร้อมกับตึกธรณีวิทยาตั้งแต่ พ.ศ.๒๕๑๐ เป็นพิพิธภัณฑสถานเกี่ยวกับวัฏจักรของหิน แร่ การแสดงกลุ่มหินชุดต่าง ๆ ของประเทศตามตารางธรณี ซากดึกดำบรรพ์ต่างๆ รวมทั้งไดโนเสาร์ และทรัพยากรเชื้อเพลิงธรรมชาติของประเทศ นอกจากส่วนจัดแสดงถาวรแล้วยังมีการจัดนิทรรศการหมุนเวียนเพื่อแสดงผลงานวิจัยและการประยุกต์ใช้วิชาธรณีวิทยาด้วย"]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellTitle, for: indexPath)  as! TitleOurMuseumTableViewCell
            cell.img.image = pic[indexPath.section]
            cell.information.text = information[indexPath.section]
            cell.isUserInteractionEnabled = false
            return cell
            
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)  as! OurMuseumTableViewCell
        cell.header.text = name[indexPath.section]
        cell.img.image = pic[indexPath.section]
        cell.information.text = information[indexPath.section]
        cell.isUserInteractionEnabled = false
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.register(UINib(nibName: cellTitle, bundle: nil), forCellReuseIdentifier: cellTitle)
    }


    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return pic.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

}
