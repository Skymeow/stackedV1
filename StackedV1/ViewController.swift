//
//  ViewController.swift
//  StackedV1
//
//  Created by Sky Xu on 3/21/18.
//  Copyright © 2018 Sky Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let webUrlStr = "https://medium.com/@ziadtamim/create-parallax-effect-with-uimotioneffect-3a3ae7aa1679"
        Networking.instance.analyzeTime(url: webUrlStr) { (success, resultStr) in
            if success {
                print(resultStr)
            }
        }
    }
    
}

