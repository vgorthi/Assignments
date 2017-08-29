//
//  UserInfoTableViewCell.swift
//  iOS Assignment
//
//  Created by pavan krishna on 22/06/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

import UIKit
import SnapKit

class UserInfoTableViewCell: UITableViewCell {

    var bgView:UIView?

    //MARK: - Init
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1)
        self.contentView.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1)
        
        self.selectionStyle = .none
        self.setupSubViews()
        self.setNeedsUpdateConstraints()
    }
    
    func setupSubViews() {
        
        self.bgView = UIView()
        self.bgView!.layer.shadowColor = UIColor(red:0.07, green:0.07, blue:0.07, alpha:1).cgColor
        self.bgView!.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.bgView!.layer.shadowOpacity = 0.8
        self.bgView!.layer.shadowRadius = 1
        
        self.bgView!.backgroundColor = UIColor.white
        self.addSubview(self.bgView!)

        self.bgView!.addSubview(self.profileLogo)
        self.bgView!.addSubview(self.profileNameLabel)
        self.bgView!.addSubview(self.genderLabel)
        self.bgView!.addSubview(self.emailLabel)
        self.bgView!.addSubview(self.cityStateLabel)
        self.bgView!.addSubview(self.mobileNumberLabel)
    }
    
    override open func updateConstraints() {
        super.updateConstraints()
        
        self.bgView!.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp.top).offset(5)
            make.left.equalTo(self.snp.left).offset(LayoutService.width(2.5))
            make.right.equalTo(self.snp.right).offset(LayoutService.width(-2.5))
            make.height.equalTo(LayoutService.height(21.4))
        }
        
        self.profileLogo.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.bgView!.snp.top).offset(LayoutService.height(1))
            make.left.equalTo(LayoutService.width(1.6))
            make.width.equalTo(LayoutService.width(22))
            make.height.equalTo(LayoutService.height(12.4))
        }

        self.profileNameLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.bgView!.snp.top).offset(LayoutService.height(1))
            make.left.equalTo(self.profileLogo.snp.right).offset(LayoutService.width(1))
            make.right.equalTo(self.bgView!.snp.right).offset(LayoutService.width(-2.5))
            make.height.equalTo(LayoutService.height(3))
        }
        
        self.genderLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.profileNameLabel.snp.bottom).offset(LayoutService.height(1))
            make.left.equalTo(self.profileNameLabel.snp.left)
            make.right.equalTo(self.snp.right).offset(LayoutService.width(-2.5))
            make.height.equalTo(LayoutService.height(3))
        }
        
        self.emailLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.genderLabel.snp.bottom).offset(LayoutService.height(1))
            make.left.equalTo(self.genderLabel.snp.left)
            make.right.equalTo(self.bgView!.snp.right).offset(LayoutService.width(-2.5))
            make.height.equalTo(LayoutService.height(3))
        }

        self.cityStateLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.emailLabel.snp.bottom).offset(LayoutService.height(1))
            make.left.equalTo(self.emailLabel.snp.left)
            make.right.equalTo(self.snp.right).offset(LayoutService.width(-2.5))
            make.height.equalTo(LayoutService.height(3))
        }
        
        self.mobileNumberLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.cityStateLabel.snp.bottom).offset(LayoutService.height(1))
            make.left.equalTo(self.cityStateLabel.snp.left)
            make.right.equalTo(self.bgView!.snp.right).offset(LayoutService.width(-2.5))
            make.height.equalTo(LayoutService.height(3))
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Lazy Loading
    
    lazy var profileLogo:UIImageView = {
        let profileLogo = UIImageView(image:UIImage.init(named: "no-profile-image"))
        profileLogo.contentMode = .scaleToFill
        profileLogo.layer.cornerRadius = (LayoutService.width(22))/2
        profileLogo.clipsToBounds = true
        return profileLogo
    }()
    
    lazy var profileNameLabel:PaddedLabel = {
        let label = PaddedLabel(text: "Name",
                                font: UIFont.systemFont(ofSize: 12),
                                textColor: UIColor(red:0.07, green:0.07, blue:0.07, alpha:1),
                                backgroundColor: UIColor.clear,
                                alignment: .left,
                                numberOfLines:0)

        return label
    }()
    
    lazy var genderLabel:PaddedLabel = {
        let label = PaddedLabel(text: "Gender",
                                font: UIFont.systemFont(ofSize: 12),
                                textColor: UIColor(red:0.07, green:0.07, blue:0.07, alpha:1),
                                backgroundColor: UIColor.clear,
                                alignment: .left,
                                numberOfLines:0)

        return label
    }()
    
    lazy var emailLabel:PaddedLabel = {
        let label = PaddedLabel(text: "Email",
                                font: UIFont.systemFont(ofSize: 12),
                                textColor: UIColor(red:0.07, green:0.07, blue:0.07, alpha:1),
                                backgroundColor: UIColor.clear,
                                alignment: .left,
                                numberOfLines:0)

        return label
    }()
    
    lazy var cityStateLabel:PaddedLabel = {
        let label = PaddedLabel(text: "City",
                                font: UIFont.systemFont(ofSize: 12),
                                textColor: UIColor(red:0.07, green:0.07, blue:0.07, alpha:1),
                                backgroundColor: UIColor.clear,
                                alignment: .left,
                                numberOfLines:0)

        return label
    }()
        
    lazy var mobileNumberLabel:PaddedLabel = {
        let label = PaddedLabel(text: "Mobile",
                                font: UIFont.systemFont(ofSize: 12),
                                textColor: UIColor(red:0.07, green:0.07, blue:0.07, alpha:1),
                                backgroundColor: UIColor.clear,
                                alignment: .left,
                                numberOfLines:0)

        return label
    }()
}
