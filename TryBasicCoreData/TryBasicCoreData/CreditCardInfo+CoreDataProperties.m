//
//  CreditCardInfo+CoreDataProperties.m
//  TryBasicCoreData
//
//  Created by pavan krishna on 28/08/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

#import "CreditCardInfo+CoreDataProperties.h"

@implementation CreditCardInfo (CoreDataProperties)

+ (NSFetchRequest<CreditCardInfo *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CreditCardInfo"];
}

@dynamic apr;
@dynamic credit_max;
@dynamic name;

@end
