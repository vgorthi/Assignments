//
//  UsersListViewController.swift
//  iOS Assignment
//
//  Created by pavan krishna on 25/06/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

import UIKit
import MBProgressHUD

class UsersListViewController: UIViewController,UsersViewDelegate {
    
    var usersListView:UsersView?
    var users: [User]?
    var selectedUserInfo : User?
    
    //MARK:InitMethods
    internal override func loadView() {
        
        self.usersListView = UsersView()
        self.view = self.usersListView!
    }
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "RANDOM USERS"
        self.usersListView!.setupSubViews()
        self.usersListView?.delegate = self
        self.view.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1)
        
        let loadingNotification = MBProgressHUD.showAdded(to: self.view, animated: true)
        loadingNotification.mode = MBProgressHUDMode.indeterminate
        loadingNotification.label.text = "Loading"
        
        DataRequest().getUserDetailsFromServer() { allusers in
            self.usersListView?.users = allusers
            self.usersListView?.usersTableView?.reloadData()
            loadingNotification.hide(animated: true)
        }
    }
    
    internal override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func passSelectedRowInfo(_ selectedUser: User) {
        selectedUserInfo = selectedUser
        self.performSegue(withIdentifier: "gotoUserDetailsScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "gotoUserDetailsScreen" {
            (segue.destination as! UserDetailsViewController).selectedUser = selectedUserInfo
        }
    }
}

