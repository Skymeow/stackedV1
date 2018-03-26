//
//  Networking.swift
//  StackedV1
//
//  Created by Sky Xu on 3/25/18.
//  Copyright © 2018 Sky Xu. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class Networking {
    static let instance = Networking()
    
    func analyzeTime(url: String, completion: @escaping(_ success: Bool, _ time: String) -> Void) {
        let urlStr = "https://api.readable.io/api/url/"
        let dateStr = NSDate().timeIntervalSince1970
        let toEncodeStr = "Y2KVO9BR102TFTDE3XN6YLMCVMQXA7O8" + "\(dateStr)"
        let md5Signature = toEncodeStr.md5()!
        let utf8Signature = md5Signature.utf8EncodedString()
        
        let HEADER: HTTPHeaders = [
            "API_REQUEST_TIME": "\(dateStr)",
            "API_SIGNATURE": "\(utf8Signature)",
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]

        let encodedUtf8Str = url.utf8EncodedString()
        let param = ["url": encodedUtf8Str]
       
        Alamofire.request(urlStr, method: .post, parameters: param, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (results) in
            if results.result.error == nil {
                guard let json = results.result.value as? [String: Any] else { return }
                print(json)
            }
        }
        
    }
}
