//
//  ListViewController.h
//  TryCoreData
//
//  Created by pavan krishna on 28/08/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

#import <UIKit/UIKit.h>
//#define MR_SHORTHAND 0
//#import <MagicalRecord/MagicalRecord.h>

@interface ListViewController : UIViewController

- (IBAction)sortButtonPressed:(UIBarButtonItem *)sender;
- (IBAction)sortByNameButtonPressed:(UIButton *)sender;
- (IBAction)sortByAPRButtonPressed:(UIButton *)sender;
- (IBAction)sortByLimitButtonPressed:(UIButton *)sender;

@end
