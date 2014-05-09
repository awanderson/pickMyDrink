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
    NSMutableArray *filteredQuestions;
    Drinks *currentDrink;
    
}
    @property (nonatomic) int pointValue;
    @property (nonatomic, retain) NSMutableArray *questions;
    @property (nonatomic, retain) NSMutableArray *drinks;
        
    - (Drinks *) generateDrink;
    - (Questions *) generateQuestion;
    - (void) addPoints:(NSInteger)points;
    + (id)questionManager;
    - (void) resetQuestionManager;
    - (int) getPoints;
    - (void)setCurrentDrink:(Drinks *)drink;
    - (Drinks *) getCurrentDrink;

@end
