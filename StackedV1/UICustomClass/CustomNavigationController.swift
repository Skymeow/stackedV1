//
//  CustomNavigationbar.swift
//  StackedV1
//
//  Created by Sky Xu on 3/26/18.
//  Copyright © 2018 Sky Xu. All rights reserved.
//

import Foundation
import UIKit

class CustomNavigationController: UINavigationController {
    
    let height = CGFloat(250)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.barTintColor = UIColor(red: 252/255, green: 248/255, blue: 249/255, alpha: 1.0)
        self.navigationBar.tintColor = UIColor(red: 241/255, green: 36/255, blue: 120/255, alpha: 1.0)
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor(red: 241/255, green: 36/255, blue: 120/255, alpha: 1.0)]
        self.navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.height)
        self.navigationItem.titleView = setTitle("Stacked", "Share Items")
        
    }
    
    func setTitle(_ title: String, _ subtitle: String) -> UIView {
        let titleViewHeight = self.height - 40
        let titleLabel = UILabel(frame: CGRect(x: 0, y: titleViewHeight - 10, width: 100, height: titleViewHeight * 0.45))
            
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.text = title
        titleLabel.sizeToFit()
        titleLabel.textAlignment = .left
        
        let subtitleLabel = UILabel(frame: CGRect(x: 0, y: (titleViewHeight - 10 - 20), width: 100, height: titleViewHeight * 0.25))
        subtitleLabel.backgroundColor = UIColor.clear
        subtitleLabel.textColor = UIColor.white
        subtitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        subtitleLabel.text = subtitle
        subtitleLabel.sizeToFit()
        subtitleLabel.textAlignment = .left
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: titleViewHeight))
        titleView.addSubview(titleLabel)
        titleView.addSubview(subtitleLabel)
        
        
        return titleView
    }
}
