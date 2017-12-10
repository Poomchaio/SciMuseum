//
//  StampViewController.swift
//  Bio Museum
//
//  Created by Poomchai Taechaprapasrat on 8/11/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import UIKit
import RealmSwift
class StampViewController: UIViewController {
    var stamp = [Item]()
    let collectionReuseIdentifier = "CollectionCell"
    let stampReuseIdentifier = "StampCollectionViewCell"
    let headerIdentifier = "HeaderCollectionViewCell"
    var collectionName = ""
    var progressValue:Double = 0
    var progressLabel = ""
    var collectionTitle = ""
    var revealed = 0
    var total = 0
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: collectionReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: collectionReuseIdentifier)
        collectionView.register(UINib(nibName: stampReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: stampReuseIdentifier)
        collectionView.register(UINib(nibName: headerIdentifier, bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        // Do any additional setup after loading the view.
        fetch()
        self.navigationItem.title = collectionTitle
        self.collectionView.reloadData()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension StampViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate{
    override func viewWillAppear(_ animated: Bool) {
        revealed = 0
        for i in stamp {
            if i.isRevealedCollection == true {
                revealed += 1
            }
        }
        
        total = stamp.count
        progressValue = Double(CGFloat(revealed)/CGFloat(total))*100
        self.collectionView.reloadData()
        
    }
// MARK: - Collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return stamp.count

    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionReuseIdentifier, for: indexPath as IndexPath) as! CollectionCell
            
            cell.title.text = collectionTitle
            cell.progressLabel.text = "\(revealed)/\(total)"
            cell.layer.cornerRadius = 5
            cell.img.image = #imageLiteral(resourceName: "found")
            //cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
            cell.progressBar.progressValue = CGFloat(progressValue)
            cell.isUserInteractionEnabled = false
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: stampReuseIdentifier, for: indexPath as IndexPath) as?StampCollectionViewCell
        if stamp[indexPath.row].isRevealedCollection == true {
            cell?.img.image = #imageLiteral(resourceName: "found")

        }else{
            cell?.img.image = #imageLiteral(resourceName: "notfound")
            
        }
        
        cell?.layer.cornerRadius = 5
        //cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
        
        return cell!
    }
    
    
// MARK: - Collection layout
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 10.0, left: 1.0, bottom: 1.0, right: 1.0)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let size = collectionView.bounds.width
    if indexPath.section == 0 {
        if collectionView.bounds.height/7 < 80 {
            return CGSize(width: size, height: 80)

        }
        return CGSize(width: size, height: collectionView.bounds.height/7)
    }
    
    return CGSize(width: size/5.0, height: size/5.0)
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        
//        
//        return UIEdgeInsetsMake(20,5,20,5)
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width, height: 20)

    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reusableView: UICollectionReusableView = UICollectionReusableView()
        
        if kind == UICollectionElementKindSectionHeader{
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier, for: indexPath)
            return headerView;
        }
        return reusableView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch section {
        case 0:
            return UIEdgeInsetsMake(0, 0, 0, 0)
        default:
            return UIEdgeInsetsMake(10 , 10 , 10 , 10)
        }
    }
// MARK: - Segues
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if stamp[indexPath.row].isRevealedCollection == false {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "CollectionQRCodeController") as! CollectionQRCodeController
            newViewController.navigationItem.title = stamp[indexPath.row].id
            //newViewController.navigationController?.navigationBar.backItem?.title = "Baddddck"
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            navigationItem.backBarButtonItem = backItem
            newViewController.collection = collectionName
            newViewController.id = stamp[indexPath.row].id
            newViewController.item = stamp[indexPath.row].id
            newViewController.navigationItem.title = stamp[indexPath.row].nameTH
            navigationController?.pushViewController(newViewController, animated: true)
        }else{
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "InformationViewController") as! InformationViewController
            newViewController.originVC = .collectionVC
            newViewController.showItem = stamp[indexPath.row]
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
        
        
    }
    
// MARK: - fetch
    func fetch(){
        let stampData = try! Realm().objects(Collection.self).filter("id = %@",collectionName)
        for i in stampData{
            for j in i.item{
                let item = j
                stamp.append(item)
            }
        }
    }
}


