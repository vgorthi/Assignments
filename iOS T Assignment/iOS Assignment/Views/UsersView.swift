//
//  UsersView.swift
//  iOS Assignment
//
//  Created by pavan krishna on 22/06/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

import UIKit

protocol UsersViewDelegate {
    func passSelectedRowInfo(_ selectedUser:User)
}

class UsersView: UIView {

    var usersTableView:UITableView?
    var users: [User]?
    var delegate: UsersViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1)
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubViews() {
        self.usersTableView = UITableView()
        self.usersTableView!.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1)
        self.usersTableView!.delegate = self
        self.usersTableView!.dataSource = self
        self.usersTableView!.register(UserInfoTableViewCell.self, forCellReuseIdentifier: "userInfoTableViewCellIdentifier")
        self.usersTableView!.separatorStyle = .none
        self.addSubview(self.usersTableView!)
        
        setNeedsUpdateConstraints()
    }
    
    override internal func updateConstraints() {
        
        super.updateConstraints()

        self.usersTableView!.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
    func downloadImage(url: URL, cell:UserInfoTableViewCell) {
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            DispatchQueue.main.async() { () -> Void in
                cell.profileLogo.image = UIImage(data: data)
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

extension UsersView: UITableViewDataSource {
    
    // MARK: UITableView methods
    internal func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users != nil ? self.users!.count: 0
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "userInfoTableViewCellIdentifier", for: indexPath) as! UserInfoTableViewCell
        cell.profileNameLabel.text = (self.users?[indexPath.row].firstName)!+" "+(self.users?[indexPath.row].lastName)!
        cell.genderLabel.text = self.users?[indexPath.row].gender
        cell.emailLabel.text = self.users?[indexPath.row].email
        cell.cityStateLabel.text = (self.users?[indexPath.row].city)!+" "+(self.users?[indexPath.row].state)!
        cell.mobileNumberLabel.text = self.users?[indexPath.row].mobileNumber
        
        let userImageString = (self.users?[indexPath.row].pictureUrl)!
        
        if let userImageUrl = URL(string: userImageString) {
            cell.profileLogo.contentMode = .scaleAspectFit
            downloadImage(url: userImageUrl,cell: cell)
        }
        return cell
    }
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return LayoutService.height(23.4)
    }
}

extension UsersView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = self.users?[indexPath.row]
        self.delegate?.passSelectedRowInfo(selectedUser!)
    }
}
