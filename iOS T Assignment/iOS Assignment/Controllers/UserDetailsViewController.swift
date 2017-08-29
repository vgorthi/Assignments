//
//  UserDetailsViewController.swift
//  iOS Assignment
//
//  Created by pavan krishna on 20/06/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {

    var userDetailsView:UserDetailsView?
    var selectedUser : User?
    
    //MARK:InitMethods
    internal override func loadView() {
        
        self.userDetailsView = UserDetailsView()
        self.view = self.userDetailsView!
    }
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1)
        self.userDetailsView!.setupSubViews()
    }
    
    internal override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = (selectedUser?.firstName)!+" "+(selectedUser?.lastName)!
        self.userDetailsView?.selectedUser = selectedUser
        self.userDetailsView?.profileNameLabel.text = selectedUser?.firstName
        self.userDetailsView?.genderLabel.text = selectedUser?.gender
        self.userDetailsView?.emailLabel.text = selectedUser?.email
        self.userDetailsView?.cityStateLabel.text = (selectedUser?.city)!+" "+(selectedUser?.state)!
        self.userDetailsView?.mobileNumberLabel.text = selectedUser?.mobileNumber
        
        let userImageString = (selectedUser?.pictureUrl)!
        
        if let userImageUrl = URL(string: userImageString) {
            self.userDetailsView?.profileLogo.contentMode = .scaleAspectFit
            downloadImage(url: userImageUrl)
        }
    }
    
    func downloadImage(url: URL) {
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            DispatchQueue.main.async() { () -> Void in
                self.userDetailsView?.profileLogo.image = UIImage(data: data)
            }
        }
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }

}
