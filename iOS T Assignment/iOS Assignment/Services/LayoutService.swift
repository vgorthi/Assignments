//
//  LayoutService.swift
//  iOS Assignment
//
//  Created by pavan krishna on 22/06/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

import UIKit

open class LayoutService: NSObject {
    static func screenBounds() -> CGRect {
        return UIScreen.main.bounds
    }
    
    static func width(_ widthPercentage:CGFloat) -> CGFloat {
        return self.screenBounds().size.width * widthPercentage/100
    }
    
    static func height(_ heightPercentage:CGFloat) -> CGFloat {
        return self.screenBounds().size.height * heightPercentage/100
    }
    
    static func width(_ widthPercentage:CGFloat, baseView:UIView) -> CGFloat {
        return baseView.frame.size.width * widthPercentage/100
    }
    
    static func height(_ heightPercentage:CGFloat, baseView:UIView) -> CGFloat {
        return baseView.frame.size.height * heightPercentage/100
    }
}
