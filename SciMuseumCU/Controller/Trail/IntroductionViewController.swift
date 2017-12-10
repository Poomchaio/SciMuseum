//
//  IntroductionViewController.swift
//  Bio Museum
//
//  Created by Poomchai Taechaprapasrat on 12/7/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        intro.text = targetIntroduction
        self.navigationItem.title = name
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var intro: UILabel!
    var targetIntroduction = ""
    var id = ""
    var name = ""
    @IBAction func nextPage(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "TrailQRCodeController") as! TrailQRCodeController
        newViewController.navigationItem.title = name
        newViewController.id = id
        self.navigationController?.pushViewController(newViewController, animated: true)
    }

}
