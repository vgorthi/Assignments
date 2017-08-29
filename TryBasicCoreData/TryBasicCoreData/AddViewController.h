//
//  AddViewController.h
//  TryCoreData
//
//  Created by pavan krishna on 28/08/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

#import <UIKit/UIKit.h>
//#define MR_SHORTHAND 0
//#import <MagicalRecord/MagicalRecord.h>

@interface AddViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *aprTextField;
@property (weak, nonatomic) IBOutlet UITextField *creditLimitTextField;

- (IBAction)doneButtonPressed:(UIButton *)sender;

@end
