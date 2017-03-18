//
//  ViewController.swift
//  Open-Source
//
//  Created by Jack on 18/3/2017.
//  Copyright © 2017 LinkStart. All rights reserved.
//

import UIKit

@IBDesignable class ViewController: LBXScanViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    
    var scannedStrings:[String] = []
    var isScanning = false
    
    override func viewDidLoad() {
        webView.isHidden = true
        webView.layer.cornerRadius = 5
        self.modalPresentationStyle = UIModalPresentationStyle.currentContext
        _ = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: "update", userInfo: nil, repeats: true)
    }
    
    func update() {
        // print("Hello")
    }
    
    override func handleCodeResult(arrayResult: [LBXScanResult]) {
        var strings = arrayResult.map { result in
            return result.strScanned!
        }
        performSegue(withIdentifier: "displayDetail", sender: self)

        if !(scannedStrings == strings) {
            let url = URL(string: strings[0])!
            webView.isHidden = false
            self.view.bringSubview(toFront: webView)
            let req = URLRequest(url: url)
            webView.loadRequest(req)
        }
        
        scannedStrings = strings
        
        scanObj?.start()
    }
    
    
}

