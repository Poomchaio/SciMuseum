//
//  CollectionQRCodeController.swift
//  Bio Museum
//
//  Created by Poomchai Taechaprapasrat on 9/3/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit
import RealmSwift

class CollectionQRCodeController: QRCodeViewController   {
    var collection = ""
    var item = ""
    
    override func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
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
                let check = metadataObj.stringValue?.trimmingCharacters(in: .whitespacesAndNewlines)
                let input = ("\(collection)&\(item)")
                
                if  input == check{
                    let stampData = try! Realm().objects(Collection.self).filter("id = %@" ,collection)
                    //let itemName = stampData.filter("id = %@",item)
                    for i in stampData{
                        for j in i.item{
                            if j.id == item {
                                let realm = try! Realm()
                                try! realm.write {
                                    j.isRevealedCollection = true
                                    i.currentProgress+=1
                                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "InformationViewController") as! InformationViewController
                                    let total = try! Realm().objects(Total.self)
                                    total[0].currentProgress+=1
                                    newViewController.showItem = j
                                    newViewController.originVC = .collectionVC
                                    newViewController.navigationController?.title = j.nameTH
                                    self.navigationController?.pushViewController(newViewController, animated: true)
                                }
                            }
                        }
                    }
                }else{
                    createAlert(title: "ERROR", message: "Wrong Target")
                }
                
            }
        }
    }

}
