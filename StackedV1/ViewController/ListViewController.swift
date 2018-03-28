//
//  ViewController.swift
//  StackedV1
//
//  Created by Sky Xu on 3/21/18.
//  Copyright © 2018 Sky Xu. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.sectionHeaderHeight = 230
        
        
//        self.navigationController?.navigationBar.isHidden = true
        //  FIXME: time analyse for web url currently not working
//        let webUrlStr = "https://medium.com/@ziadtamim/create-parallax-effect-with-uimotioneffect-3a3ae7aa1679"
//        Networking.instance.analyzeTime(url: webUrlStr) { (success, resultStr) in
//            if success {
//                print(resultStr)
//            }
//        }
        
//        let youtubeStr = "https://www.youtube.com/watch?v=Y7ojcTR78qE&spfreload=9"
//        Networking.instance.getYoutubeDetail(youtubeUrl: youtubeStr) { (success, result) in
//            if success {
//                print(result)
//            }
//        }
//       let time =  PodcastDataServer.instance.getPodcastInfo("https://itunes.apple.com/us/podcast/running-into-problems-shared-cross-platform-code-in/id1231805301?i=1000406940185&mt=2")

        
    }
  
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SharedTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: tableView.frame.size.height)
        let customizedHeaderView = CustomHeaderView(frame: frame)
        
        return customizedHeaderView
    }
    
    
}

