//
//  DataRequest.swift
//  iOS Nike Code Test
//
//  Created by pavan krishna on 10/08/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

import UIKit
import Foundation

open class DataRequest: NSObject {
    
    func fetchJSONAsStringFromMainBundleWithFileName(filename: String) -> Data{
        let path = Bundle.main.path(forResource: filename, ofType: "txt")
        
        if path == nil {
            return Data()
        }
        let url = URL(fileURLWithPath: path!)
        
        let data = try! Data(contentsOf: url)
        return data
    }
    
    func testGetProductDetailsFromTextFile(completion: (_ products: [Product]) -> Void){
        
        guard let path = Bundle.main.path(forResource: Defines.fileName, ofType: "txt") else { return }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            let dataContents = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: dataContents, options: .mutableContainers)
            
            let jsonDict = json as? [String: Any]
            
            guard let jsonArray = jsonDict?["results"] as? [Any] else { return }
            
            let productsDict = jsonArray[0] as? [String: Any]
            
            guard let productsArray = productsDict?["products"] as? [Any] else { return }
            let allProducts = productsArray.flatMap({ (product) -> Product? in
                guard
                    
                    let productDict = product as? [String:Any],
                    
                    let productName = productDict["name1"] as? String,
                    
                    let imagesArray = productDict["images"] as? [Any],
                    
                    let productThumbImagesDict = imagesArray[1] as? [String: Any],
                    let productThumbImageUrl = productThumbImagesDict["path"] as? String,
                    
                    let productPrimaryImagesDict = imagesArray[0] as? [String: Any],
                    let productPrimaryImageUrl = productPrimaryImagesDict["path"] as? String,
                    
                    let productPriceDict = productDict["prices"] as? [String:Any],
                    let productPrice = productPriceDict["list"] as? String,
                    
                    let productColor = productDict["colorCode"] as? String
                    
                    else {
                        print("Invalid product parsing information received")
                        return nil
                }
                
                return Product(productName: productName, productPrice: productPrice, productThumbImageUrl: productThumbImageUrl, productPrimaryImageUrl: productPrimaryImageUrl, productColor: productColor)
            })
            
            completion(allProducts)
        }
        catch {
            print(error)
        }
    }
    
    func getProductDetailsFromTextFile(completion: @escaping (_ products: [Product]) -> Void){
        
        guard let path = Bundle.main.path(forResource: Defines.fileName, ofType: "txt") else { return }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            let dataContents = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: dataContents, options: .mutableContainers)
            
            let jsonDict = json as? [String: Any]
            
            guard let jsonArray = jsonDict?["results"] as? [Any] else { return }
            
            let productsDict = jsonArray[0] as? [String: Any]
            
            guard let productsArray = productsDict?["products"] as? [Any] else { return }
            let allProducts = productsArray.flatMap({ (product) -> Product? in
                guard
                    
                let productDict = product as? [String:Any],
                    
                let productName = productDict["name1"] as? String,
                
                let imagesArray = productDict["images"] as? [Any],
                
                let productThumbImagesDict = imagesArray[1] as? [String: Any],
                let productThumbImageUrl = productThumbImagesDict["path"] as? String,
                    
                let productPrimaryImagesDict = imagesArray[0] as? [String: Any],
                let productPrimaryImageUrl = productPrimaryImagesDict["path"] as? String,

                let productPriceDict = productDict["prices"] as? [String:Any],
                let productPrice = productPriceDict["list"] as? String,
                
                let productColor = productDict["colorCode"] as? String
                
                else {
                        print("Invalid product parsing information received")
                        return nil
                }
                
                return Product(productName: productName, productPrice: productPrice, productThumbImageUrl: productThumbImageUrl, productPrimaryImageUrl: productPrimaryImageUrl, productColor: productColor)
            })
            
            completion(allProducts)
        }
        catch {
                print(error)
        }
    }
}
