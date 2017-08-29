//
//  DataRequest.swift
//  iOS Assignment
//
//  Created by pavan krishna on 22/06/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

open class DataRequest: NSObject {
 
    func getUserDetailsFromServer(completion: @escaping (_ users: [User]) -> Void){
        
        Alamofire.request(
            URL(string: "https://randomuser.me/api/?results=5000")!,
            method: .get,
            parameters: nil)
            .validate()
            .responseJSON { (response) -> Void in
                guard response.result.isSuccess else {
                    print("Error while fetching remote users: \(String(describing: response.result.error))")
                    completion([User]())
                    return
                }
                
                guard let responseJSON = response.result.value as? [String: Any],
                    let results = responseJSON["results"] as? [[String: Any]]
                    else {
                        print("Invalid user information received")
                        completion([User]())
                        return
                }
                
                let allUsers = results.flatMap({ (dict) -> User? in
                    guard
                        
                        let nameDict = dict["name"] as? [String: Any],
                        let firstname = nameDict["first"] as? String,
                        let lastname = nameDict["last"] as? String,
                        
                        let picDict = dict["picture"] as? [String: Any],
                        let picture = picDict["large"] as? String,
                        
                        let locDict = dict["location"] as? [String: Any],
                        let locationCity = locDict["city"] as? String,
                        let locationState = locDict["state"] as? String,

                        let gender = dict["gender"] as? String,
                        let email = dict["email"] as? String,
                        let cell = dict["cell"] as? String
                    
                        else {
                            print("Invalid user parsing information received")
                            return nil
                    }
                    
                    return User(firstName: firstname, lastName: lastname, pictureUrl: picture, gender: gender, city:locationCity,state:locationState, email:email, mobileNumber:cell)
                })
                
                completion(allUsers)
        }
    }
}
