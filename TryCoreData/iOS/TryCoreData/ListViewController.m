//
//  ListViewController.m
//  TryCoreData
//
//  Created by pavan krishna on 28/08/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

#import "ListViewController.h"
#import "CreditCard+CoreDataClass.h"
#import "CreditCardInfoTableViewCell.h"

@interface ListViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *allCreditCards;
@property (weak, nonatomic) IBOutlet UITableView *creditCardsTableView;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
}

-(void)viewWillAppear:(BOOL)animated;
{
    [super viewWillAppear:animated];
    
    self.allCreditCards = [CreditCard MR_findAll];

    [self.creditCardsTableView reloadData];
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.allCreditCards.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    CreditCardInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listCellIdentifier" forIndexPath:indexPath];
    CreditCard *creditCard = [self.allCreditCards objectAtIndex:indexPath.row];
    cell.nameLabel.text = creditCard.name;
    cell.aprLabel.text = [NSString stringWithFormat:@"%0.2f",creditCard.apr];
    cell.maxLimitLabel.text = [NSString stringWithFormat:@"%0.2f",creditCard.credit_max];
    return cell;
}


- (IBAction)sortButtonPressed:(UIBarButtonItem *)sender {
    
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//    
//    NSEntityDescription *creditEntity = [NSEntityDescription entityForName:@"CreditCard" inManagedObjectContext:[NSManagedObjectContext MR_defaultContext]];
//    
//    [fetchRequest setEntity:creditEntity];
//    
//    NSSortDescriptor *aprSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"apr" ascending:YES];
//    
//    [fetchRequest setSortDescriptors:@[aprSortDescriptor]];
//    
//    NSError *error = nil;
//    
//    NSArray *sortedCreditCards = [[NSManagedObjectContext MR_defaultContext] executeRequest:fetchRequest error:&error];
    
    NSArray *sortedCreditCards = [CreditCard MR_findAllSortedBy:@"name" ascending:YES];
    
    self.allCreditCards = sortedCreditCards;
    
    [[self creditCardsTableView] reloadData];
}

- (IBAction)sortByNameButtonPressed:(UIButton *)sender {
    NSArray *sortedCreditCards = [CreditCard MR_findAllSortedBy:@"name" ascending:YES];
    
    self.allCreditCards = sortedCreditCards;
    
    [[self creditCardsTableView] reloadData];
}

- (IBAction)sortByAPRButtonPressed:(UIButton *)sender {
    NSArray *sortedCreditCards = [CreditCard MR_findAllSortedBy:@"apr" ascending:YES];
    
    self.allCreditCards = sortedCreditCards;
    
    [[self creditCardsTableView] reloadData];
}

- (IBAction)sortByLimitButtonPressed:(UIButton *)sender {
    
//    NSArray *sortedCreditCards = [CreditCard MR_findByAttribute:@"apr" withValue:[NSNumber numberWithDouble:6]];

    NSArray *sortedCreditCards = [CreditCard MR_findAllWithPredicate:[NSPredicate predicateWithFormat:@"credit_max > %@ AND apr > %@", [NSNumber numberWithDouble:7000], [NSNumber numberWithDouble:5]]
];

    
//    NSArray *sortedCreditCards = [CreditCard MR_findAllSortedBy:@"credit_max" ascending:YES];
    
    self.allCreditCards = sortedCreditCards;
    
    [[self creditCardsTableView] reloadData];
}
@end
