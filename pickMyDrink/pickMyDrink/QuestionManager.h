//
//  QuestionManager.h
//  pickMyDrink
//
//  Created by Alec Anderson on 4/10/14.
//  Copyright (c) 2014 Philip Deisinger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Drinks.h"
#import "Questions.h"
#import "NSMutableArray+Shuffling.h"
#import "AppDelegate.h"

@interface QuestionManager : NSObject {
    
    NSMutableArray *filteredDrinks;
    NSInteger *pointValue;
    
}
    @property (nonatomic, retain) NSMutableArray *questions;
    @property (nonatomic, retain) NSMutableArray *drinks;
    @property (nonatomic, retain) NSNumber * questionCount;
    
    - (Drinks *) generateDrink;
    - (Questions *) generateQuestion;
    - (void) addPoints:(NSInteger)points;
    + (id)questionManager;
    
@end
