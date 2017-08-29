//
//  CreditCardInfoTableViewCell.h
//  TryCoreData
//
//  Created by pavan krishna on 28/08/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreditCardInfoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *aprLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxLimitLabel;


@end
