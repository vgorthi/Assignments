//
//  DataRequest.swift
//  Phunware iOS Assignment
//
//  Created by pavan krishna on 17/08/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

open class DataRequest: NSObject {
    
    func getFeedDetailsFromServer(completion: @escaping (_ feeds: [Feed]) -> Void){
        
        Alamofire.request(
            URL(string: "https://raw.githubusercontent.com/phunware-services/dev-interview-homework/master/feed.json")!,
            method: .get,
            parameters: nil)
            .validate()
            .responseJSON { (response) -> Void in
                guard response.result.isSuccess else {
                    print("Error while fetching remote feed: \(String(describing: response.result.error))")
                    completion([Feed]())
                    return
                }
                guard let responseJSON = response.result.value,
                    let results = responseJSON as? [[String: Any]]
                    else {
                        print("Invalid feed information received")
                        completion([Feed]())
                        return
                }

                let allFeeds = results.flatMap({ (dict) -> Feed? in
                    
                    guard
                        
                        let feedDict = dict as? [String:Any],
                        
                        let locationline2 = feedDict["locationline2"] as? String,
                        
                        let id = feedDict["id"] as? Int,
                        
                        let image = feedDict["image"] as? String,
                        
                        let description = feedDict["description"] as? String,
                        
                        let title = feedDict["title"] as? String,
                        
                        let locationline1 = feedDict["locationline1"] as? String,
                        
                        let timestamp = feedDict["timestamp"] as? String,

                        let date = feedDict["date"] as? String
                        
                        else {
                            print("Invalid feed parsing information received")
                            return nil
                    }
                    
                    return Feed(id: id, description: description, title: title, timestamp: timestamp, image: image, date: date, locationline1: locationline1, locationline2: locationline2)
                })
                
                completion(allFeeds)
        }
    }
}


