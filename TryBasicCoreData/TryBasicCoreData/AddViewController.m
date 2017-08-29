//
//  AddViewController.m
//  TryCoreData
//
//  Created by pavan krishna on 28/08/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

#import "AddViewController.h"
#import "CreditCardInfo+CoreDataClass.h"
#import "AppDelegate.h"

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

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(persistentContainer)]) {
        context = [[delegate persistentContainer] viewContext];
    }
    return context;
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
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSManagedObject *newCreditCard = [NSEntityDescription insertNewObjectForEntityForName:@"CreditCardInfo" inManagedObjectContext:context];

    [newCreditCard setValue:[[self nameTextField] text] forKey:@"name"];
    [newCreditCard setValue:[NSNumber numberWithInteger:[[[self aprTextField] text] integerValue]] forKey:@"apr"];
    [newCreditCard setValue:[NSNumber numberWithInteger:[[[self creditLimitTextField] text] integerValue]] forKey:@"credit_max"];
    
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Cant save");
    }
    [[self navigationController] popViewControllerAnimated:YES];
}


@end
