//
//  CreditCard+CoreDataProperties.m
//  
//
//  Created by pavan krishna on 28/08/17.
//
//

#import "CreditCard+CoreDataProperties.h"

@implementation CreditCard (CoreDataProperties)

+ (NSFetchRequest<CreditCard *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CreditCard"];
}

@dynamic apr;
@dynamic credit_max;
@dynamic name;

@end
