//
//  CreditCardTableViewCell.swift
//  TryBasicCoreDataSwift
//
//  Created by pavan krishna on 29/08/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

import UIKit

class CreditCardTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var aprLabel: UILabel!
    
    @IBOutlet weak var creditMaxLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
