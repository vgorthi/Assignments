//
//  CreditCardInfo+CoreDataProperties.h
//  TryBasicCoreData
//
//  Created by pavan krishna on 28/08/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

#import "CreditCardInfo+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CreditCardInfo (CoreDataProperties)

+ (NSFetchRequest<CreditCardInfo *> *)fetchRequest;

@property (nonatomic) double apr;
@property (nonatomic) double credit_max;
@property (nullable, nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
