//
//  UserDetailsView.swift
//  iOS Assignment
//
//  Created by pavan krishna on 25/06/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

import UIKit

class UserDetailsView: UIView {

    var selectedUser : User?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubViews() {
        
        self.addSubview(self.profileLogo)
        self.addSubview(self.profileNameLabel)
        self.addSubview(self.genderLabel)
        self.addSubview(self.emailLabel)
        self.addSubview(self.cityStateLabel)
        self.addSubview(self.mobileNumberLabel)
        
        setNeedsUpdateConstraints()
    }
    
    override internal func updateConstraints() {
        
        super.updateConstraints()
        
        self.profileLogo.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp.top).offset(LayoutService.height(15))
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(LayoutService.width(44))
            make.height.equalTo(LayoutService.height(24.8))
        }
        
        self.profileNameLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.profileLogo.snp.bottom).offset(LayoutService.height(1))
            make.left.equalTo(self.snp.left).offset(LayoutService.width(2.5))
            make.right.equalTo(self.snp.right).offset(LayoutService.width(-2.5))
            make.height.equalTo(LayoutService.height(6))
        }
        
        self.genderLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.profileNameLabel.snp.bottom).offset(LayoutService.height(1))
            make.left.equalTo(self.snp.left).offset(LayoutService.width(2.5))
            make.right.equalTo(self.snp.right).offset(LayoutService.width(-2.5))
            make.height.equalTo(LayoutService.height(6))
        }
        
        self.emailLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.genderLabel.snp.bottom).offset(LayoutService.height(1))
            make.left.equalTo(self.snp.left).offset(LayoutService.width(2.5))
            make.right.equalTo(self.snp.right).offset(LayoutService.width(-2.5))
            make.height.equalTo(LayoutService.height(6))
        }
        
        self.cityStateLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.emailLabel.snp.bottom).offset(LayoutService.height(1))
            make.left.equalTo(self.snp.left).offset(LayoutService.width(2.5))
            make.right.equalTo(self.snp.right).offset(LayoutService.width(-2.5))
            make.height.equalTo(LayoutService.height(6))
        }
        
        self.mobileNumberLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.cityStateLabel.snp.bottom).offset(LayoutService.height(1))
            make.left.equalTo(self.snp.left).offset(LayoutService.width(2.5))
            make.right.equalTo(self.snp.right).offset(LayoutService.width(-2.5))
            make.height.equalTo(LayoutService.height(6))
        }
    }
    
    //MARK: Lazy Loading
    
    lazy var profileLogo:UIImageView = {
        let profileLogo = UIImageView(image:UIImage.init(named: "no-profile-image"))
        profileLogo.contentMode = .scaleToFill
        profileLogo.layer.cornerRadius = (LayoutService.width(44))/2
        profileLogo.clipsToBounds = true
        return profileLogo
    }()
    
    lazy var profileNameLabel:PaddedLabel = {
        let label = PaddedLabel(text: "Name",
                                font: UIFont.systemFont(ofSize: 18),
                                textColor: UIColor.black,
                                backgroundColor: UIColor.clear,
                                alignment: .center,
                                numberOfLines:0)
        
        return label
    }()
    
    lazy var genderLabel:PaddedLabel = {
        let label = PaddedLabel(text: "Gender",
                                font: UIFont.systemFont(ofSize: 16),
                                textColor: UIColor.black,
                                backgroundColor: UIColor.clear,
                                alignment: .center,
                                numberOfLines:0)
        
        return label
    }()
    
    lazy var emailLabel:PaddedLabel = {
        let label = PaddedLabel(text: "Email",
                                font: UIFont.systemFont(ofSize: 16),
                                textColor: UIColor.black,
                                backgroundColor: UIColor.clear,
                                alignment: .center,
                                numberOfLines:0)
        
        return label
    }()
    
    lazy var cityStateLabel:PaddedLabel = {
        let label = PaddedLabel(text: "City",
                                font: UIFont.systemFont(ofSize: 16),
                                textColor: UIColor.black,
                                backgroundColor: UIColor.clear,
                                alignment: .center,
                                numberOfLines:0)
        
        return label
    }()
    
    lazy var mobileNumberLabel:PaddedLabel = {
        let label = PaddedLabel(text: "Mobile",
                                font: UIFont.systemFont(ofSize: 16),
                                textColor: UIColor.black,
                                backgroundColor: UIColor.clear,
                                alignment: .center,
                                numberOfLines:0)
        
        return label
    }()
}
