//
//  Drinks.h
//  pickMyDrink
//
//  Created by Alec Anderson on 5/9/14.
//  Copyright (c) 2014 Philip Deisinger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Drinks : NSManagedObject

@property (nonatomic, retain) NSString * directions;
@property (nonatomic, retain) NSString * ingredients;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * pointValue;
@property (nonatomic, retain) NSSet *alcohols;
@property (nonatomic, retain) NSSet *mixers;
@property (nonatomic, retain) NSManagedObject *challenges;
@end

@interface Drinks (CoreDataGeneratedAccessors)

- (void)addAlcoholsObject:(NSManagedObject *)value;
- (void)removeAlcoholsObject:(NSManagedObject *)value;
- (void)addAlcohols:(NSSet *)values;
- (void)removeAlcohols:(NSSet *)values;

- (void)addMixersObject:(NSManagedObject *)value;
- (void)removeMixersObject:(NSManagedObject *)value;
- (void)addMixers:(NSSet *)values;
- (void)removeMixers:(NSSet *)values;

@end
