//
//  TrailQRCodeViewController.swift
//  Bio Museum
//
//  Created by Poomchai Taechaprapasrat on 10/13/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit
import RealmSwift

class TrailQRCodeController: QRCodeViewController   {
    let webView = "WebViewController"

    override func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects == nil || metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            // messageLabel.text = "No QR/barcode is detected"
            return
        }
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if supportedCodeTypes.contains(metadataObj.type) {
            // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = barCodeObject!.bounds
            captureSession?.stopRunning();
            
            if metadataObj.stringValue != nil {
                //messageLabel.text = metadataObj.stringValue
                
                //let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let scan = metadataObj.stringValue?.trimmingCharacters(in: .whitespacesAndNewlines)
                let input = ("\(id)")
                if verifyUrl(urlString: scan){
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: webView) as! WebViewController
                    let url = URL(string: scan!)
                    newViewController.request = URLRequest(url: url!)
                    navigationController?.pushViewController(newViewController, animated: true)
                }else{
                    print(input)
                    if let and = scan?.index(after: (scan?.index(of: "&")!)!){
                        if let check = scan?.suffix(from: and){
                            if input.elementsEqual(check) {
                                do {
                                    let targetData = try Realm().objects(Item.self).filter("id = %@" ,id)
                                    for i in targetData{
                                        if i.id == id {
                                            let realm = try! Realm()
                                            try! realm.write {
                                                i.isRevealedTrail = true
                                                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                                let newViewController = storyBoard.instantiateViewController(withIdentifier: "InformationViewController") as! InformationViewController
                                                newViewController.originVC = .trailVC
                                                newViewController.showItem = i
                                                self.navigationController?.pushViewController(newViewController, animated: true)
                                            }
                                        }
                                    }
                                } catch let error as NSError{
                                    createAlert(title: "ERROR", message: "Wrong Target")
                                    
                                }
                            }else{
                                createAlert(title: "ERROR", message: "Wrong Target")
                                //self.navigationController?.popViewController(animated: true)
                            }
                        }
                        
                        
                    }
                    
                }
                
                
            }
        }
    }
    func verifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url  = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
}
