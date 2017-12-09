//
//  SecondViewController.swift
//  Bio Museum
//
//  Created by Poomchai Taechaprapasrat on 8/3/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import UIKit
import AVFoundation
import RealmSwift

class CollectionViewController: UIViewController {

    var collectionID = [String]()
    let collectionTableCell = "CollectionTableCell"
    var currentProgress = [Int]()
    var totalProgress = [Int]()
    var collectionName = [String]()
    let totalCell = "TotalTableViewCell"
    @IBOutlet weak var collectionTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionTable.register(UINib(nibName: collectionTableCell, bundle: nil), forCellReuseIdentifier: collectionTableCell)
        collectionTable.register(UINib(nibName: totalCell, bundle: nil), forCellReuseIdentifier: totalCell)
        let data = try! Realm().objects(Collection.self)
        if data.count == 0 {
            let alert = UIAlertController(title: "Error", message: "Please open an internet an reopen app again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .destructive))
            self.present(alert, animated: true, completion: nil)

        }
        for i in data {
            collectionID.append(i.id)
            collectionName.append(i.name)
            currentProgress.append(i.currentProgress)
            totalProgress.append(i.totalProgress)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CollectionViewController: UITableViewDelegate,UITableViewDataSource{
    override func viewWillAppear(_ animated: Bool) {
        self.collectionTable.reloadData()
    }
    
//MARK: - Collection view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2 //fix value
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return 1;
        default:
            return collectionID.count;
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: totalCell, for: indexPath) as? TotalTableViewCell
            let data = try! Realm().objects(Total.self)
            cell?.title.text = "Total"
            cell?.isUserInteractionEnabled = false
            cell?.totalLabel.text = "\(data[0].currentProgress)/\(data[0].totalProgress)"
            //cell?.img.image = UIImage(named: self.collectionID[indexPath.item])
            cell?.totalProgressBar.progressValue = (CGFloat(data[0].currentProgress)/CGFloat(data[0].totalProgress))*100
            return cell!
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: collectionTableCell, for: indexPath) as? CollectionTableCell
            cell?.background.layer.cornerRadius = 10

            let data = try! Realm().object(ofType: Collection.self, forPrimaryKey: self.collectionID[indexPath.item])
            cell?.label.text = self.collectionName[indexPath.row]
            cell?.progressBarLabel.text! = "\(data!.currentProgress)/\(data!.totalProgress)"
            cell?.progressBar.progressValue = CGFloat(Float(data!.currentProgress)/Float(data!.totalProgress))*100
            cell?.img.image = #imageLiteral(resourceName: "found")
            
            return cell!
        }
        // Configure the cell...
        
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(20)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 50
        default:
            if tableView.bounds.height/8 < 80{
                return 80
            }
            return tableView.bounds.height/8

        }
    }
    
//MARK: - Segues
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "StampViewController") as! StampViewController
        newViewController.collectionName = collectionID[indexPath.row]
        newViewController.navigationController?.title = collectionName[indexPath.row]
        navigationController?.pushViewController(newViewController, animated: true)
        newViewController.collectionTitle = collectionName[indexPath.row]
        
        
    }
    

    
}

