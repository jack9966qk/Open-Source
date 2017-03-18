//
//  ViewController.swift
//  Open-Source
//
//  Created by Jack on 18/3/2017.
//  Copyright © 2017 LinkStart. All rights reserved.
//

import UIKit

class ViewController: LBXScanViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var popUpView: UIView!
    
    
    override func viewDidLoad() {
        // popUpView.isHidden = true
        // webView.isHidden = true
        webView.alpha = 0
        webView.clipsToBounds = true
        webView.layer.cornerRadius = 10
        self.modalPresentationStyle = UIModalPresentationStyle.currentContext
        self.view.bringSubview(toFront: popUpView)
    }
    
    override func handleCodeResult(arrayResult: [LBXScanResult]) {
        var strings = arrayResult.map { result in
            return result.strScanned!
        }

        let url = URL(string: strings[0])!
        
        self.view.bringSubview(toFront: popUpView)
        let req = URLRequest(url: url)
        webView.loadRequest(req)
        UIView.animate(withDuration: 0.5) {
            self.webView.alpha = 1
        }
    }
    
    @IBAction func dismissWebView(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.webView.alpha = 0
        }
        scanObj?.start()
    }
}

