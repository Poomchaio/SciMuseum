//
//  TrailTableViewController.swift
//  Bio Museum
//
//  Created by Poomchai Taechaprapasrat on 8/12/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import UIKit
import RealmSwift



class TrailTableViewController: UIViewController {

    @IBOutlet weak var trailTable: UITableView!
    let trailReuseIdentifier = "TrailTableViewCell"
//    var containerViewController: Container?
    var trailName = ""
    var quest = [String]()
    
    var introduction = [String]()

   
    override func viewDidLoad() {
        super.viewDidLoad()
        trailTable.register(UINib(nibName: trailReuseIdentifier, bundle: nil), forCellReuseIdentifier: trailReuseIdentifier)
        
        let data = try! Realm().objects(Trail.self)
        if data.count == 0 {
            if let tabbar = self.tabBarController?.tabBar.items{
                tabbar[3].isEnabled = false
            }
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "TrailViewController") as! TrailViewController
            newViewController.navigationItem.hidesBackButton = true
            navigationItem.title = "Trail"
            navigationController?.pushViewController(newViewController, animated: false)
            
        }else{
            let data2 = try! Realm().objects(Quest.self)
            for i in data2{
                quest.append(i.name)
                introduction.append(i.introduction)
            }
        }
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Trail"
        trailTable.separatorStyle = .none
       
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.trailTable.reloadData()
    }

    
}

extension TrailTableViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return quest.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: trailReuseIdentifier, for: indexPath) as? TrailTableViewCell
            cell?.contentView.backgroundColor = UIColor.clear
            
            
            cell?.label.text = quest[indexPath.row]
            cell?.background.layer.cornerRadius = 10
            return cell!
        
        
        // Configure the cell...
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return CGFloat(integerLiteral: 5)
//    }
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return CGFloat(integerLiteral: 5)
//    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "TrailStampViewController") as! TrailStampViewController
        newViewController.questName = quest[indexPath.row]
        newViewController.questIntroduction = "\(introduction[indexPath.row])"
        let data = try! Realm().objects(Quest.self).filter("name = %@",quest[indexPath.row])
        for i in data{
            for j in i.objective{
                var temp = [Target]()
                for k in j.target{
                    
                    temp.append(k)
                }
                
                    
                
                newViewController.target.append(temp);
            }
        }
        navigationController?.pushViewController(newViewController, animated: true)
    }
    
}
