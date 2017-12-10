//
//  SearchViewController.swift
//  Bio Museum
//
//  Created by Poomchai Taechaprapasrat on 9/3/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import UIKit
import AVFoundation
import RealmSwift
class SearchViewController: QRCodeViewController  {
    let webView = "WebViewController"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - AVCaptureMetadataOutputObjectsDelegate Methods
    
    override func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {

        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if supportedCodeTypes.contains(metadataObj.type) {
            // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = barCodeObject!.bounds
            captureSession?.stopRunning();

            if metadataObj.stringValue != nil {
                
                let scan = metadataObj.stringValue?.trimmingCharacters(in: .whitespacesAndNewlines)
                print(verifyUrl(urlString: scan))

                if verifyUrl(urlString: scan){
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: webView) as! WebViewController
                    let url = URL(string: scan!)
                    newViewController.request = URLRequest(url: url!)
                    navigationController?.pushViewController(newViewController, animated: true)
                }else{
                    if let and = scan?.index(after: (scan?.index(of: "&")!)!){
                        let check = scan?.suffix(from: and)

                        do {
                            let item = try Realm().objects(Item.self).filter("id = %@" ,check)
                            if item.count == 0 {
                                createAlert(title: "ERROR", message: "Target not found")
                            }
                            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            let newViewController = storyBoard.instantiateViewController(withIdentifier: "InformationViewController") as! InformationViewController
                            newViewController.originVC = .searchVC
                            newViewController.showItem = item[0]
                            self.navigationController?.pushViewController(newViewController, animated: true)
                        } catch let _ as NSError{
                            createAlert(title: "ERROR", message: "Wrong Target")
                            
                        }
                    }
                    else{
                        createAlert(title: "ERROR", message: "Invalid URL")
                    }
                }
            }
        }
   }
    func verifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url  = NSURL(string: urlString) {
                print("check")
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
}
