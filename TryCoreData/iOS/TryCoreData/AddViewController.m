//
//  AddViewController.m
//  TryCoreData
//
//  Created by pavan krishna on 28/08/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

#import "AddViewController.h"
#import "CreditCard+CoreDataClass.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)doneButtonPressed:(UIButton *)sender {
    
    
    
    CreditCard *creditCardContext = [CreditCard MR_createEntity];
    creditCardContext.name = [[self nameTextField] text];
    creditCardContext.apr = [[[self aprTextField] text] doubleValue];
    creditCardContext.credit_max = [[[self creditLimitTextField] text] doubleValue];
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL contextDidSave, NSError * _Nullable error) {
        [[self navigationController] popViewControllerAnimated:YES];
    }];
    
}
@end
