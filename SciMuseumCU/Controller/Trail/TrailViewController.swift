//
//  TrailViewController.swift
//  Bio Museum
//
//  Created by Poomchai Taechaprapasrat on 9/3/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import UIKit
import RealmSwift
import AVFoundation

class TrailViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {
    var captureSession:AVCaptureSession?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    var qrCodeFrameView:UIView?
    var temp: QrCodeQuery.Data.Trail!
    {
        didSet{
            self.store(query: temp)

            for vc in (self.navigationController?.viewControllers)!{

                if vc is TrailTableViewController {
                    let trailVC = vc as! TrailTableViewController
                    let data2 = try! Realm().objects(Quest.self)
                    for i in data2{
                        trailVC.quest.append(i.name)
                        trailVC.introduction.append(i.introduction)
                    }
                    _ = self.navigationController?.popToViewController(vc, animated: true)
                    break

                }

            }
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    let supportedCodeTypes = [AVMetadataObject.ObjectType.upce,
                              AVMetadataObject.ObjectType.code39,
                              AVMetadataObject.ObjectType.code39Mod43,
                              AVMetadataObject.ObjectType.code93,
                              AVMetadataObject.ObjectType.code128,
                              AVMetadataObject.ObjectType.ean8,
                              AVMetadataObject.ObjectType.ean13,
                              AVMetadataObject.ObjectType.aztec,
                              AVMetadataObject.ObjectType.pdf417,
                              AVMetadataObject.ObjectType.qr]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        //genData()
        
            
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)

            do {
                // Get an instance of the AVCaptureDeviceInput class using the previous device object.
                let input = try AVCaptureDeviceInput(device: captureDevice!)
                
                // Initialize the captureSession object.
                captureSession = AVCaptureSession()
                
                // Set the input device on the capture session.
                captureSession?.addInput(input)
                
                // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
                let captureMetadataOutput = AVCaptureMetadataOutput()
                captureSession?.addOutput(captureMetadataOutput)
                
                // Set delegate and use the default dispatch queue to execute the call back
                captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                captureMetadataOutput.metadataObjectTypes = supportedCodeTypes
                
                // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
                videoPreviewLayer?.frame = view.layer.bounds
                view.layer.addSublayer(videoPreviewLayer!)
                
                // Start video capture.
                captureSession?.startRunning()
                
                // Move the message label and top bar to the front
                //view.bringSubview(toFront: messageLabel)
                //            view.bringSubview(toFront: topbar)
                
                // Initialize QR Code Frame to highlight the QR code
                //            qrCodeFrameView = UIView()
                //
                //            if let qrCodeFrameView = qrCodeFrameView {
                //                qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
                //                qrCodeFrameView.layer.borderWidth = 2
                //                view.addSubview(qrCodeFrameView)
                //                view.bringSubview(toFront: qrCodeFrameView)
                //            }
                
            } catch {
                // If any error occurs, simply print it out and don't continue any more.
                print(error)
                return
            }

        //}
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let data = try! Realm().objects(Trail.self)
        if let tabbar = self.tabBarController?.tabBar.items{
            tabbar[3].isEnabled = false
            
        }
        if (captureSession?.isRunning == false && data.count == 0) {
            captureSession?.startRunning();
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let tabbar = self.tabBarController?.tabBar.items{
            tabbar[3].isEnabled = true
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you 
     will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TrailViewController{
    //MARK: - Capture
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        captureSession?.stopRunning()
        print("asdfsdafasdfsadfasdf\n\n")
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let scan = readableObject.stringValue?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            if scan[(scan.startIndex)] == "#"{
                let and = scan.index(after: scan.index(of: "&")!)
                let check = scan.suffix(from: and)
                fetch(trailID: String(describing: check))
            }
                
            else{
                createAlert(title: "ERROR", message: "Wrong Target")
            }
        }
        
        dismiss(animated: true)
    }
    
//    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
//
//        // Check if the metadataObjects array is not nil and it contains at least one object.
//        if metadataObjects == nil || metadataObjects.count == 0 {
//            qrCodeFrameView?.frame = CGRect.zero
//            // messageLabel.text = "No QR/barcode is detected"
//            return
//        }
//
//        // Get the metadata object.
//        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
//
//        if supportedCodeTypes.contains(metadataObj.type) {
//            // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
//            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
//            qrCodeFrameView?.frame = barCodeObject!.bounds
//
//            if metadataObj.stringValue != nil {
//                //messageLabel.text = metadataObj.stringValue
//                captureSession?.stopRunning()
//                let scan = metadataObj.stringValue?.trimmingCharacters(in:     .whitespacesAndNewlines)
//                if scan![(scan?.startIndex)!] == "#"{
//                    let and = scan?.index(after: (scan?.index(of: "#")!)!)
//                    let check = scan?.suffix(from: and!)
//                    fetch(trailID: String(describing: check))
//                }
//
//                else{
//                    createAlert(title: "ERROR", message: "Wrong Target")
//                }
//
//            }
//        }
//    }
    
    //MARK: - Fetch and Store
    
    func store(query :QrCodeQuery.Data.Trail!)  {
            let trail = Trail()
            trail.name = query.name!
            trail.id = query.id
            for quest in query.quests {
                let questObj = Quest()
                questObj.name = quest.name!
                questObj.introduction = quest.introduction!
                questObj.summary = quest.summary!
                for objective in quest.objectives{
                    let objectiveObj = Objective()
                    objectiveObj.name = objective.name!
                    for target in objective.targets{
                        let targetObj = Target()
                        let item = try! Realm().objects(Item.self).filter("id = %@" ,target.item.id)
                        if item.count == 0 {
                            print("nil\n")
                            let targetObj = Target()
                            targetObj.introduction = target.introduction!
                            targetObj.summary = target.summary!
                            targetObj.hint = target.hint!
                            let it = Item()
                            it.id = target.item.id
                            it.nameEN = (target.item.name?.en)!
                            it.nameTH = (target.item.name?.th)!
                            it.scientificName = target.item.scientificName!
                            for information in target.item.information{
                                let str = StringObject();
                                str.text = information
                                it.informations.append(str)
                            }
                            for i in target.item.figures{
                                let figure = Figure()
                                figure.image = i.image!
                                figure.figureDescription = i.description!
                                figure.reference = i.reference!
                                it.figures.append(figure)
                            }
                            targetObj.item = it	
                            objectiveObj.target.append(targetObj)
                            continue
                        }
                        
                        targetObj.introduction = target.introduction!
                        targetObj.summary = target.summary!
                        targetObj.item = item[0]
                        targetObj.hint = target.hint!
                        
                        objectiveObj.target.append(targetObj)
                    }
                    questObj.objective.append(objectiveObj)
                }
                trail.quest.append(questObj)
            }
            let realm = try! Realm()
            try! realm.write {
                realm.add(trail)
            }
        //}
        
        
        
    }
    
    func fetch(trailID: String) {
        let query = QrCodeQuery(id: trailID)
        apollo.fetch(query: query) { result, error in
            if let error = error {
                print(#function, "ERROR | An error occured: \(error)")
                self.createAlert(title: "ERROR", message: "Internal Server Error")
                return
            }
            guard let data = result?.data else {
                print(#function, "ERROR | Could not retrieve trainer")
                self.createAlert(title: "ERROR", message: "Could not retrieve trainer")
                return
                
            }
            if data.trail == nil{
                
            }
            self.temp = data.trail
            
        }
    }
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: {
            (action) in
            self.captureSession?.startRunning()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    func genData (){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "TrailTableViewController") as! TrailTableViewController
        newViewController.navigationItem.hidesBackButton = true
        navigationItem.title = "Trail"
        navigationController?.pushViewController(newViewController, animated: true)
        fetch(trailID: "collection1:ea")

    }
}


