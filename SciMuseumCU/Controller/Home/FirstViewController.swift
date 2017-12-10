//
//  FirstViewController.swift
//  Bio Museum
//
//  Created by Poomchai Taechaprapasrat on 8/3/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import UIKit
import RealmSwift
import Auk
import WebKit
class FirstViewController: UIViewController,WKUIDelegate,UIGestureRecognizerDelegate, UITableViewDelegate,UITableViewDataSource{ //,UIGestureRecognizerDelegate, UITableViewDelegate,UITableViewDataSource
    
    
    
    var carousel = [#imageLiteral(resourceName: "specialexhibition"),#imageLiteral(resourceName: "mapfront"),#imageLiteral(resourceName: "ourMuseum"),#imageLiteral(resourceName: "genInfo")]
    let carouselViewCell = "CarouselViewCell"
    let webView = "WebViewController"
    var load = [Bool]()
    var request = URLRequest(url: URL(string:
        "http://www.museum.sc.chula.ac.th/app/home.html")!)
    var firstWebView: WKWebView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!


    
    var temp: QueryQuery.Data!
    {
        didSet{
            
            self.store(query: temp)
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
            UIApplication.shared.endIgnoringInteractionEvents()
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UINib(nibName: carouselViewCell, bundle: nil), forCellReuseIdentifier: carouselViewCell)
        for _ in carousel {
            load.append(false)
        }
        tableView.delegate = self
        tableView.dataSource = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.tapCarousel(recognizer:)))
        tableView.addGestureRecognizer(tapGesture)
        tapGesture.delegate = self
        //firstWebView.load(request)
        do {
            let data = try Realm().objects(Collection.self)
            
            if data.count == 0{
                
                activityIndicator.isHidden = false
                let realm = try! Realm()
                
                let total = Total()
                total.currentProgress = 0
                total.totalProgress = 0
                try! realm.write {
                    realm.add(total)
                }
                fetch()
            }else{
                activityIndicator.isHidden = true
            }
            
        } catch let error as NSError {
            print(error)
            let alert = UIAlertController(title: "ERROR", message: "No internet connection", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: {
                (action) in
                self.navigationController?.popViewController(animated: true)
            }))
            
        }
        
        
 
    }
    
    // MARK: - tapCarrousel
    @objc func tapCarousel(recognizer: UITapGestureRecognizer)  {
        if recognizer.state == UIGestureRecognizerState.ended {
            let tapLocation = recognizer.location(in: self.tableView)
            if let tapIndexPath = self.tableView.indexPathForRow(at: tapLocation) {
                if (self.tableView.cellForRow(at: tapIndexPath) as? CarouselViewCell) != nil {
                    //do what you want to cell here
                    
                    switch tapIndexPath.row{
                    case 0:
                        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let newViewController = storyBoard.instantiateViewController(withIdentifier: "SpecialExhibitionViewController") as! SpecialExhibitionViewController
                        
                        navigationController?.pushViewController(newViewController, animated: true)
                    case 1:
                        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MuseumMapViewController") as! MuseumMapViewController
                        navigationController?.pushViewController(newViewController, animated: true)
                    
                    case 2:
                        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let newViewController = storyBoard.instantiateViewController(withIdentifier: "OurMuseumViewController") as! OurMuseumTableViewController
                        navigationController?.pushViewController(newViewController, animated: true)
                    case 3:
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "GeneralInfoViewController") as! GeneralInfoViewController
                    navigationController?.pushViewController(newViewController, animated: true)
                    default:
                        break
                    }
                   
                    
                }
            }
        }
    }
    
// MARK: - Fetch function
    
    func fetch() {
        let query = QueryQuery()
        apollo.fetch(query: query) { result, error in
            if let error = error {
                print(#function, "ERROR | An error occured: \(error)")
                let alert = UIAlertController(title: "Error", message: "No internet connection", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: {
                    (action) in
                    self.activityIndicator.isHidden = true
                    self.activityIndicator.stopAnimating()
                }))
                self.present(alert, animated: true, completion: nil)

                return
            }
            guard let data = result?.data else {
                print(#function, "ERROR | Could not retrieve trainer")
                let alert = UIAlertController(title: "title", message: "message", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Coult not retrieve data", style: .destructive, handler: {
                    (action) in
                    self.navigationController?.popViewController(animated: true)
                }))
                self.present(alert, animated: true, completion: nil)
                return
                
                
                
            }
            self.activityIndicator.startAnimating()
            UIApplication.shared.beginIgnoringInteractionEvents()
            self.temp = data
            
            
        }
    }
    
//MARK: - Store
    
    func store(query :QueryQuery.Data!)  {
        let realm = try! Realm()
        var totalCount = 0
        for collection in query.collections {
        
            let obj = Collection()
            obj.name = collection.name!
            obj.id = collection.id
            obj.totalProgress = collection.items.count
            //obj.item.append(collection.items)
            for item in collection.items{

                totalCount+=1
                let it = Item()
                it.id = item.id
                it.nameEN = (item.name?.en)!
                it.nameTH = (item.name?.th)!
                it.scientificName = item.scientificName!
                for information in item.information{
                    let str = StringObject();
                    str.text = information
                    it.informations.append(str)
                }
                for i in item.figures{
                    let figure = Figure()
                    figure.image = i.image!
                    figure.figureDescription = i.description!
                    figure.reference = i.reference!
                    it.figures.append(figure)
                }
                obj.item.append(it)
            }
            try! realm.write {
                realm.add(obj)
            }
        }
        let total = try! Realm().objects(Total.self)

        if let total = total.first {
            try! realm.write {
                total.totalProgress = totalCount
            }
        }
        

    }
    
}

//MARK:- Table View
extension FirstViewController  {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 //fix value
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carousel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: carouselViewCell, for: indexPath)  as! CarouselViewCell
        if load[indexPath.row] == false{
            cell.carousel.auk.show(image: carousel[indexPath.row])
            load[indexPath.row] = true
        }

        return cell

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (tableView.bounds.height)/2.5
    }
    
    
//    override func loadView() {
//        let webConfiguration = WKWebViewConfiguration()
//        firstWebView = WKWebView(frame: .zero, configuration: webConfiguration)
//        firstWebView.uiDelegate = self
//        view = firstWebView
//    }
    
}


