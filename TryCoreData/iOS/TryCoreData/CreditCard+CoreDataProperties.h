//
//  CreditCard+CoreDataProperties.h
//  
//
//  Created by pavan krishna on 28/08/17.
//
//

#import "CreditCard+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CreditCard (CoreDataProperties)

+ (NSFetchRequest<CreditCard *> *)fetchRequest;

@property (nonatomic) double apr;
@property (nonatomic) double credit_max;
@property (nullable, nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
