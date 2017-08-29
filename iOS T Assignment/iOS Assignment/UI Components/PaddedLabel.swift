//
//  PaddedLabel.swift
//  iOS Assignment
//
//  Created by pavan krishna on 22/06/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

import UIKit
import Foundation

open class PaddedLabel: UILabel {

    init(text:String, font:UIFont, textColor:UIColor, backgroundColor:UIColor, alignment:NSTextAlignment, numberOfLines:NSInteger) {
        super.init(frame: CGRect.zero)
        
        self.text = text
        self.font = font
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.textAlignment = alignment
        self.numberOfLines = numberOfLines
    }
    
    open override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(0, 5, 0, 0)))
    }
    
    func setPreferredWidth(_ width:CGFloat) {
        self.preferredMaxLayoutWidth = width
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
