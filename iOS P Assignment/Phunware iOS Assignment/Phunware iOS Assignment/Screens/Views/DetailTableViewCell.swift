//
//  DetailTableViewCell.swift
//  Phunware iOS Assignment
//
//  Created by pavan krishna on 17/08/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var detailFeedTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
