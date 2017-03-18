//
//  ViewController.swift
//  Open-Source
//
//  Created by Jack on 18/3/2017.
//  Copyright © 2017 LinkStart. All rights reserved.
//

import UIKit

@IBDesignable class ViewController: LBXScanViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var qrCodes:[LBXScanResult] = []
    var isScanning = false
    
    override func viewDidLoad() {
        _ = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: "update", userInfo: nil, repeats: true)
    }
    
    func update() {
        // print("Hello")
    }
    
    override func handleCodeResult(arrayResult: [LBXScanResult]) {
        var text:[String] = []
        for result in arrayResult {
            print(result.strScanned!)
            text.append(result.strScanned!)
        }
        label.text? = text.joined(separator: "\n")
        scanObj?.start()
    }
    
    
}

