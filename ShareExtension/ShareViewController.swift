//
//  ShareViewController.swift
//  ShareExtension
//
//  Created by Sky Xu on 3/21/18.
//  Copyright © 2018 Sky Xu. All rights reserved.
//

import UIKit
import Social
import MobileCoreServices


@objc (ShareViewController) class ShareViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let extensionItem = extensionContext?.inputItems.first as! NSExtensionItem
        
        if let itemProvider = extensionItem.attachments?.first as? NSItemProvider {
            if itemProvider.hasItemConformingToTypeIdentifier(kUTTypePlainText as String) {
                itemProvider.loadItem(forTypeIdentifier: kUTTypePlainText as String, options: nil, completionHandler: { (item, error) -> Void in
                    if let string = item as? String {
                        let shareURL = URL(string: string)
                        print (shareURL!.absoluteString)
                    }
                })
            } else if itemProvider.hasItemConformingToTypeIdentifier("public.url") {
                itemProvider.loadItem(forTypeIdentifier: "public.url", options: nil, completionHandler: { (item, error) -> Void in
                    if let url = item as? NSURL {
                        print(url)
                    }
                })
                
            } else if itemProvider.hasItemConformingToTypeIdentifier(String(kUTTypePropertyList)) {
                itemProvider.loadItem(forTypeIdentifier: String(kUTTypePropertyList), options: nil, completionHandler: { (item, error) -> Void in
                    if let dictionary = item as? NSDictionary {
                        OperationQueue.main.addOperation {
                            if let results = dictionary[NSExtensionJavaScriptPreprocessingResultsKey] as? NSDictionary,
                                let urlString = results["URL"] as? String,
                                let url = NSURL(string: urlString) {
                            }
                        }
                    }
                })
                
            }
        }
    }
    
    override func loadView() {
        super.loadView()
        guard let successSaveView = Bundle.main.loadNibNamed("AlertView", owner: self, options: nil)![0] as? AlertView else { return }
        successSaveView.configureView(title: "Saved to Stacked", at: self.view.center)
        self.view.addSubview(successSaveView)
        self.view.removeFromSuperview()
    }
    
   
}
