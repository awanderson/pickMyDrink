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
#import "Challenges.h"

@interface QuestionManager : NSObject {
    
    NSMutableArray *filteredDrinks;
    NSMutableArray *filteredQuestions;
    Drinks *currentDrink;
    Challenges *currentChallenge;
    
}
    @property (nonatomic) int pointValue;
    @property (nonatomic, retain) NSMutableArray *questions;
    @property (nonatomic, retain) NSMutableArray *drinks;
    @property (nonatomic, retain) NSMutableArray *challenges;
    @property (nonatomic, retain) NSMutableArray *unchallengedDrinks;


    - (Drinks *) generateDrink;
    - (Questions *) generateQuestion;
    - (void) addPoints:(NSInteger)points;
    + (id)questionManager;
    - (void) resetQuestionManager;
    - (int) getPoints;
    - (void)setCurrentDrink:(Drinks *)drink;
    - (Drinks *) getCurrentDrink;
    - (void)setCurrentChallenge:(Challenges *)challenge;
    - (Challenges *) getCurrentChallenge;
@end
