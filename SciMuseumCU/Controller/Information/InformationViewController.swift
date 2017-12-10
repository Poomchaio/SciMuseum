//
//  InformationViewController.swift
//  Bio Museum
//
//  Created by Poomchai Taechaprapasrat on 11/20/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import UIKit
import SDWebImage
class InformationViewController: UIViewController {
    
    @IBOutlet weak var informationTable: UITableView!
    var showItem = Item()
    var originVC = OriginVC.none
    var titleCell = "TitleTableViewCell"
    var informationCell = "InformationTableViewCell"
    enum OriginVC {
        case collectionVC
        case searchVC
        case trailVC
        case none
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        switch originVC {
        case .searchVC:break
        default:
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.stop, target: self, action:     #selector(self.backToInitial(sender:)))
            self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        }
        informationTable.allowsSelection = false
        informationTable.estimatedRowHeight = 300
        informationTable.rowHeight = UITableViewAutomaticDimension
        informationTable.register(UINib(nibName: informationCell, bundle: nil), forCellReuseIdentifier: informationCell)
        informationTable.register(UINib(nibName: titleCell, bundle: nil), forCellReuseIdentifier: titleCell)
        self.navigationItem.title = showItem.nameTH
        // Do any additional setup after loading the view.
    }


}

extension InformationViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showItem.figures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        if row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: titleCell, for: indexPath) as? TitleTableViewCell
            
            
            var myMutableString = NSMutableAttributedString()
            myMutableString = NSMutableAttributedString(string: "ชื่อ: \(showItem.nameTH) (\(showItem.nameEN))" as String, attributes: [NSAttributedStringKey.font:UIFont(name: "HelveticaNeue-Light", size: 18.0)!])
            
            myMutableString.addAttribute(NSAttributedStringKey.font, value: UIFont(name: "HelveticaNeue-Bold", size: 18.0)!, range: NSRange(location:0,length:5))
            cell?.name.attributedText = myMutableString
            
            let scientificName = String(showItem.scientificName)

            var myMutableString2 = NSMutableAttributedString()

            myMutableString2 = NSMutableAttributedString(string: "ชื่อวิทยาศาสตร์: \(scientificName)" as String, attributes: [NSAttributedStringKey.font:UIFont(name: "HelveticaNeue-LightItalic", size: 18.0)!])
            myMutableString2.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.black, range: NSRange(location:18,length:scientificName.count-1))
                myMutableString2.addAttribute(NSAttributedStringKey.font, value: UIFont(name: "HelveticaNeue-Bold", size: 18.0)!, range: NSRange(location:0,length: 17))
                cell?.scientificName.attributedText = myMutableString2
            
            
            var str = ""
            for i in 0...showItem.informations.count-1{
                str += "\t\(showItem.informations[i].text)\n"
            }
            cell?.information.text = str//.trimmingCharacters(in: .whitespacesAndNewlines)
            if let url = URL(string: "\(showItem.figures[row].image)") {
                //cell?.img.sd_setImage(with: url)
                
                
                cell?.img.sd_setImage(with: url, completed: {
                    (image, error, cacheType, url) in
                    // do your custom logic here
                    
                    if image == nil{
                        cell?.img.image = #imageLiteral(resourceName: "image-not-found-4a963b95bf081c3ea02923dceaeb3f8085e1a654fc54840aac61a57a60903fef")
                    }
                    
                })
                
            }
            return cell!
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: informationCell, for: indexPath) as? InformationTableViewCell
            cell?.activityIndicator.startAnimating()
            cell?.activityIndicator.isHidden = false
        if let url = URL(string: "\(showItem.figures[row].image)") {
            //cell?.img.sd_setImage(with: url)

           
            cell?.img.sd_setImage(with: url, completed: {
                (image, error, cacheType, url) in
                // do your custom logic here
                cell?.activityIndicator.stopAnimating()
                cell?.activityIndicator.isHidden = true
                if image == nil{
                    cell?.img.image = #imageLiteral(resourceName: "image-not-found-4a963b95bf081c3ea02923dceaeb3f8085e1a654fc54840aac61a57a60903fef")
                }
                
            })

        }
        
        cell?.content.text = "\t\(showItem.figures[row].figureDescription)"
        
        cell?.reference.text = showItem.figures[row].reference
       
        
        return cell!
    }
    
    
    @objc func backToInitial(sender: AnyObject) {
        for vc in (self.navigationController?.viewControllers)!{
            switch originVC{
            case .collectionVC:
                if vc is StampViewController {
                    _ = self.navigationController?.popToViewController(vc, animated: true)
                    break
                }
            case .trailVC:
                
                if vc is TrailStampViewController {
                    _ = self.navigationController?.popToViewController(vc, animated: true)
                    break

                }
            default: break
            }
        }
        
        
    }
    
}
