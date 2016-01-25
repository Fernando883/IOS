//
//  Outgoes+CoreDataProperties.h
//  SaveApp
//
//  Created by Aitor Pagán on 25/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Outgoes.h"

NS_ASSUME_NONNULL_BEGIN

@interface Outgoes (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *concept;
@property (nullable, nonatomic, retain) NSNumber *quantity;
@property (nullable, nonatomic, retain) NSDate *dateOutgo;
@property (nullable, nonatomic, retain) NSString *type;

@end

NS_ASSUME_NONNULL_END
