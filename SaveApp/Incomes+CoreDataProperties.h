//
//  Incomes+CoreDataProperties.h
//  SaveApp
//
//  Created by Aitor Pagán on 25/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Incomes.h"

NS_ASSUME_NONNULL_BEGIN

@interface Incomes (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *concept;
@property (nullable, nonatomic, retain) NSNumber *quantity;
@property (nullable, nonatomic, retain) NSDate *dateIncome;

@end

NS_ASSUME_NONNULL_END
