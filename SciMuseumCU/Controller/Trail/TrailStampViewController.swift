 //
//  TrailStampViewController.swift
//  Bio Museum
//
//  Created by Poomchai Taechaprapasrat on 8/31/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import UIKit
import RealmSwift

class TrailStampViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    
    
    @IBOutlet weak var trailCollectionVC: UICollectionView!
    var trailReuseIdentifier = "TrailStampCell"
    var questName = ""
    let headerIdentifier = "HeaderCollectionViewCell"
    var questIntroduction = ""
    var header = [String]()
    var target = [[Target]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trailCollectionVC.register(UINib(nibName: trailReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: trailReuseIdentifier)
        trailCollectionVC.register(UINib(nibName: "TrailTitleViewCell", bundle: nil), forCellWithReuseIdentifier: "TrailTitleViewCell")
        trailCollectionVC.register(UINib(nibName: headerIdentifier, bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        self.navigationController?.navigationItem.title = questName
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.trailCollectionVC.reloadData()
    }
    
    // MARK: - Collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return target[section-1].count
        
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.target.count + 1
    }
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    // make cell more visible in our example project
        switch indexPath.section {
            case 0:
                let cell = trailCollectionVC.dequeueReusableCell(withReuseIdentifier: "TrailTitleViewCell", for: indexPath as IndexPath) as! TrailTitleViewCell
                cell.title.text = questName
                cell.questDescription.text = "\t\(questIntroduction)"
                cell.isUserInteractionEnabled = false
                return cell
            default :
                let cell = trailCollectionVC.dequeueReusableCell(withReuseIdentifier: "TrailStampCell", for: indexPath as IndexPath) as! TrailStampCell
                cell.layer.cornerRadius = 5
                //cell.label.text = target[indexPath.section-1][indexPath.row].item?.id
                if target[indexPath.section-1][indexPath.row].item?.isRevealedTrail == true {
                    cell.img.image = UIImage(named: "Turtle")
                    
                }else{
                    cell.img.image = UIImage(named: "Turtle (blank)")
                }
                return cell
        }
        
    }
    
    // MARK: - Collection layout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.bounds.width
        if indexPath.section == 0 {
            return CGSize(width: size, height: size/3.0)
        }
        
        return CGSize(width: size/5.0, height: size*0.25)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if target[indexPath.section-1][indexPath.row].item?.isRevealedTrail == false {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "IntroductionViewController") as! IntroductionViewController
            newViewController.navigationItem.title = target[indexPath.section-1][indexPath.row].item?.id
            newViewController.targetIntroduction = target[indexPath.section-1][indexPath.row].introduction
            newViewController.name = (target[indexPath.section-1][indexPath.row].item?.nameTH)!
            newViewController.id = (target[indexPath.section-1][indexPath.row].item?.id)!
            navigationController?.pushViewController(newViewController, animated: true)
        }else{
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "InformationViewController") as! InformationViewController
            newViewController.originVC = .trailVC
            let item = target[indexPath.section-1][indexPath.row].item
            newViewController.showItem = item!
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
        
        
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize.zero
            
        }
        return CGSize(width: collectionView.bounds.width, height: 30)
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reusableView: UICollectionReusableView = UICollectionReusableView()
        
        if kind == UICollectionElementKindSectionHeader{
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier, for: indexPath) as? HeaderCollectionViewCell
            headerView?.label.text = header[indexPath.section-1]
            return headerView!
        }
        return reusableView
    }
}
