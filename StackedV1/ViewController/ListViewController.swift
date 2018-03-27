//
//  ViewController.swift
//  StackedV1
//
//  Created by Sky Xu on 3/21/18.
//  Copyright © 2018 Sky Xu. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.isHidden = true
        //  FIXME: time analyse for web url currently not working
//        let webUrlStr = "https://medium.com/@ziadtamim/create-parallax-effect-with-uimotioneffect-3a3ae7aa1679"
//        Networking.instance.analyzeTime(url: webUrlStr) { (success, resultStr) in
//            if success {
//                print(resultStr)
//            }
//        }
        
        let youtubeStr = "https://www.youtube.com/watch?v=Y7ojcTR78qE&spfreload=9"
        Networking.instance.getYoutubeDetail(youtubeUrl: youtubeStr) { (success, result) in
            if success {
                print(result)
            }
        }
    }
    
}

