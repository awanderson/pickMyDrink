//
//  Challenges.h
//  pickMyDrink
//
//  Created by Alec Anderson on 5/10/14.
//  Copyright (c) 2014 Philip Deisinger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Drinks;

@interface Challenges : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSOrderedSet *drinks;
@end

@interface Challenges (CoreDataGeneratedAccessors)

- (void)insertObject:(Drinks *)value inDrinksAtIndex:(NSUInteger)idx;
- (void)removeObjectFromDrinksAtIndex:(NSUInteger)idx;
- (void)insertDrinks:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeDrinksAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInDrinksAtIndex:(NSUInteger)idx withObject:(Drinks *)value;
- (void)replaceDrinksAtIndexes:(NSIndexSet *)indexes withDrinks:(NSArray *)values;
- (void)addDrinksObject:(Drinks *)value;
- (void)removeDrinksObject:(Drinks *)value;
- (void)addDrinks:(NSOrderedSet *)values;
- (void)removeDrinks:(NSOrderedSet *)values;
@end
